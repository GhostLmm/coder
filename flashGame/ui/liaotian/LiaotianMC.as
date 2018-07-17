package ui.liaotian
{
	import com.fish.modules.core.models.ChatModel;
	import com.fish.modules.core.models.ItemModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.DisplayObject;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.module.LabelSwitch;

	public class LiaotianMC
	{
		private var mc:WindowLiaotian;
		
		private var _btn_shijie:Button;
		private var _btn_banghui:Button;
		private var _pos_item:Position;
		private var _fnt_num:FontField;
		
		private var labelSwitch:LabelSwitch;
		
		private var itemModel:ItemModel;
		private var chatModel:ChatModel;
		
		public static const TP_Shijie:String="shijie";
		public static const TP_Gonghui:String="gonghui";
		
		public function LiaotianMC()
		{
			initModule();
			registerEvent();
		}
		
		
		private function initModule():void{
			chatModel=Context.getInjectInstance(ChatModel);
			itemModel=Context.getInjectInstance(ItemModel);
			
			mc=AssetManager.createMCForText(WindowLiaotian) as WindowLiaotian;
			_btn_shijie=new Button(mc.btn_shijieliaotian);
			_btn_banghui=new Button(mc.btn_gonghuiliaotian);
			
			_pos_item=new Position(mc.pos_item);
			
			_fnt_num=new FontField(mc.fnt_num);
			_fnt_num.text="";
			labelSwitch=new LabelSwitch(_pos_item,[_btn_shijie,_btn_banghui],[Panel_Shijie_LiaotianWindow,Panel_Gonghui_LiaotianWindow],[null,checkCouldBanghuiLiaotian]);
		}
		
		public function show(type:String=TP_Shijie):void{
			if(type==null) type=TP_Shijie;
			if(type==TP_Gonghui){
				labelSwitch.changeShowPanel(Panel_Gonghui_LiaotianWindow);
			}
			if(type==TP_Shijie){
				labelSwitch.changeShowPanel(Panel_Shijie_LiaotianWindow);
			}
			updateItemNum();
		}
		
		
		private function registerEvent():void
		{
			itemModel.modelUpdata_SN.add(updateItemNum);
		}
		private function updateItemNum():void
		{
			_fnt_num.text="x"+itemModel.getItemNumById(chatModel.ChatCostItemId);
		}
		private function checkCouldBanghuiLiaotian():Boolean
		{
			if(Util.checkCouldBanghuiLiaotian())
			{
				return true;
			}
			Util.flow("帮会功能尚未开启");
			_btn_banghui.isSelected=false;
			_btn_shijie.isSelected=true;
			return false;
		}
		
		public function destory():void{
			destoryMc();
			itemModel.modelUpdata_SN.remove(updateItemNum);
		}
		private function destoryMc():void
		{
			if(labelSwitch) {labelSwitch.destory(); labelSwitch=null;}
			if(_btn_shijie){_btn_shijie.destory();_btn_shijie=null;};
			if(_btn_banghui){_btn_banghui.destory();_btn_banghui=null;};
			if(_pos_item){_pos_item.destory();_pos_item=null;};
			if(_fnt_num){_fnt_num.destory();_fnt_num=null;};
		}
		
		public function get display():DisplayObject{
			return mc;
		}
	}
}