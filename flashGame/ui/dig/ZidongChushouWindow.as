package ui.dig
{
	import com.fish.modules.core.models.tempData.EquipPingzhi;
	
	import ui.widget.Button;
	import ui.window._WindowBase;
	
	public class ZidongChushouWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _sellItems:Array;
		public var _btn_baocun:Button;
		public function ZidongChushouWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowZidongChushou);
			var mc:WindowZidongChushou=_scene;
			
			_btn_close=new Button(mc.btn_close);
			
			_sellItems=[];
			
			for(var index:int=1; index<=4; index++){
				var sellItem:DigAutoSellItem=new DigAutoSellItem(mc["mc_"+index]);
				_sellItems.push(sellItem);
			}
			
			_btn_baocun=new Button(mc.btn_baocun);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory();_btn_close=null;}
			if(_sellItems){
				for each(var sellItem:DigAutoSellItem in  _sellItems){
					sellItem.destory();
				}
				_sellItems=null;
			}
			
			if(_btn_baocun) {_btn_baocun.destory(); _btn_baocun=null;}
			
			super.destory();
		}
	}
}