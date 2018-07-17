package ui.bag
{
	import com.fish.modules.core.models.BaoshiModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.HeroModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import core.event.TqtEvent;
	
	public class MDI_HeroDetail extends Mediator
	{
		[Inject]
		public var wm:HeroDetailWidow;
		[Inject]
		public var heroModel:HeroModel;
		[Inject]
		public var equipModel:EquipModel;
		[Inject]
		public var baoshiModel:BaoshiModel;
		
		public function MDI_HeroDetail()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			equipModel.modelUpdata_SN.add(update);
			baoshiModel.modelUpdata_SN.add(update);
			update();
			
			addViewListener(wm._btn_guanbi,TqtEvent.BUTTON_CLICK,wm.close);
			
		}
		
		private function update():void{
			wm._heroModule.loadData();
			wm._heroAttr.loadData(null);
		}
		
		
		public override function destroy():void
		{
			// todo
			equipModel.modelUpdata_SN.remove(update);
			baoshiModel.modelUpdata_SN.remove(update);
			super.destroy();
		}
	}
}