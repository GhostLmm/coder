package ui.bag
{
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.BaoshiModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.HeroModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import core.event.TqtEvent;
	
	public class MDI_Bag extends Mediator
	{
		[Inject]
		public var wm:BagWindow;
		
		[Inject]
		public var bagModel:BagModel;
		[Inject]
		public var heroModel:HeroModel;
		[Inject]
		public var equipModel:EquipModel;
		[Inject]
		public var baoshiModel:BaoshiModel;
		
		
		
		
		public function MDI_Bag()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			wm.tweenCom_SN.add(onTweenCom);
			showHeroModule();
		}
		
		private function onTweenCom():void{
			wm.labelSwitch.changeShowPanel(Bag_Equip_Panel);
			
			
			
			equipModel.modelUpdata_SN.add(showHeroModule);
			baoshiModel.modelUpdata_SN.add(showHeroModule);
		}
		
		private function showHeroModule():void{
			wm._heroModule.loadData();
		}
		
		/*private function onChangeLabel(label:String):void{
			
			var shape:MovieClip=new MovieClip();
			shape.graphics.drawRect(0,0,wm.
			
			var bagDatas:Array=bagModel.getBagdatas(label);
			wm._scroll_bag.setData(bagDatas);
		}*/
		
		
		public override function destroy():void
		{
			// todo
//			wm.changeLabel_SN.remove(onChangeLabel);
			wm.tweenCom_SN.remove(onTweenCom);
			equipModel.modelUpdata_SN.remove(showHeroModule);
			baoshiModel.modelUpdata_SN.remove(showHeroModule);
			super.destroy();
		}
		
	}
}