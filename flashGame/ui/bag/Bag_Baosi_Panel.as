package ui.bag
{
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.BaoshiModel;
	import com.ghostlmm.lightMVC.Context;
	
	import view.Panel_Base;
	
	public class Bag_Baosi_Panel extends BagPanel
	{
		public function Bag_Baosi_Panel()
		{
			super();
		}
		
		protected override function initMoulde():void{
			_scroll.initClass(BagItem);
			var baoshiModel:BaoshiModel=Context.getInjectInstance(BaoshiModel);
			baoshiModel.modelUpdata_SN.add(setShow);
		}
		protected override function setShow():void{
			_scroll.setData( (Context.getInjectInstance(BagModel) as BagModel).createBaoshiDatas(),0,true );
		}
		
		public override function clear():void{
			var baoshiModel:BaoshiModel=Context.getInjectInstance(BaoshiModel);
			baoshiModel.modelUpdata_SN.remove(setShow);
			super.clear();
		}
	}
}