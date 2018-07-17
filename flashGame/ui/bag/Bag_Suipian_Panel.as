package ui.bag
{
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.MapModel;
	import com.ghostlmm.lightMVC.Context;
	
	import view.Panel_Base;
	
	public class Bag_Suipian_Panel extends BagPanel
	{
		public function Bag_Suipian_Panel()
		{
			super();
		}
		
		protected override function initMoulde():void{
			_scroll.initClass(BagItem);
		}
		protected override function setShow():void{ 
			
			_scroll.setData((Context.getInjectInstance(BagModel) as BagModel).createSuipianDatas(),0,true);
		}
	}
}