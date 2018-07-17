package ui.equip
{
	import com.fish.modules.core.models.tempData.EquipAttrAttach;
	
	import flash.display.MovieClip;
	
	import ui.widget.FontField;
	
	import util.Util;

	public class EquipShuxingBar
	{
		private var mc:MovieClip;
		private var _fnt_shuxing:FontField;
		private var _fnt_shuxing_num:FontField;
		
		private var _mc_down:MovieClip;
		private var _mc_up:MovieClip;
		
		private var _fnt_down:FontField;
		private var _fnt_up:FontField;
		
		
		public function EquipShuxingBar($mc:MovieClip)
		{
			mc=$mc;
			_fnt_shuxing=new FontField(mc.fnt_shuxing);
			_fnt_shuxing_num=new FontField(mc.fnt_shuxing_num);
			
			_mc_down = mc.mc_down;
			_mc_up=mc.mc_up;
			_fnt_down=new FontField(_mc_down.fnt_num);
			_fnt_up=new FontField(_mc_up.fnt_num);
		}
		public function destory():void{
			if(_fnt_shuxing) {_fnt_shuxing.destory();_fnt_shuxing=null;}
			if(_fnt_shuxing_num) {_fnt_shuxing_num.destory();_fnt_shuxing_num=null;}
			if(_fnt_down) {_fnt_down.destory();_fnt_down=null;}
			if(_fnt_up) {_fnt_up.destory();_fnt_up=null;}
			_mc_down=null;
			_mc_up=null;
			mc=null;
		}
		
		public function setVisible(visible:Boolean):void{
			mc.visible=visible;
		}
		
		public function loadData(attr:String,value:int,offsetValue:int=0):void{
			_fnt_shuxing.text=Util.getLanguage(attr);
			_fnt_shuxing_num.text=value.toString();
			if(offsetValue>0){
				_mc_down.visible=false;
				_fnt_down.visible=false;
				_mc_up.visible=true;
//				_fnt_up.visible=true;
				_fnt_up.text=Math.abs(offsetValue)+"";
			}else if(offsetValue<0){
				_mc_down.visible=true;
				_fnt_down.visible=true;
				_mc_up.visible=false;
//				_fnt_up.visible=false;
				_fnt_down.text=Math.abs(offsetValue)+"";
			}else{
				_mc_down.visible=false;
				_fnt_down.visible=false;
				_mc_up.visible=false;
			}
		}
		
		
	}
}