package ui.bag
{
	
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.tempData.BagSetData;
	import com.ghostlmm.lightMVC.Context;
	
	import view.Panel_Base;
	
	public class Bag_Tool_Panel extends BagPanel
	{
		public function Bag_Tool_Panel()
		{
			super();
		}
		protected override function initMoulde():void{
//			_scroll.initClass(ItemMc);
			_scroll.initClass(BagItem);
		}
		protected override function setShow():void{
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			_scroll.setData(bagModel.createDaojuBagDatas(),0,true);
		}
	}
}