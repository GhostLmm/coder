package ui.equip
{
	import com.fish.modules.core.models.tempData.EquipData;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import org.osflash.signals.Signal;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	
	import util.Util;

	public class EquipNBMC
	{
		private var mc:MovieClip;
		private var _btn_nb:Button;
		private var _btn_tunshi:Button;
		private var _fnt_title:FontField;
		private var _fntDescArray:Array;
		
		public var onClick_SN:Signal;
		private var data:EquipData;
		
		public var needShow:Boolean;
		
		public function EquipNBMC($mc:MovieClip)
		{
			onClick_SN=new Signal();
			mc=$mc;
			_btn_nb=new Button(mc.btn_nb);
			_btn_tunshi=new Button(mc.btn_tunshi);
			_fntDescArray=[];
			for (var index:int=1; index<=2; index++){
				var ft:FontField=new FontField(mc["fnt_shuxing"+index]);
				_fntDescArray.push(ft);
			}
			_fnt_title=new FontField(mc.fnt_titel);
		}
		
		public function loadData($data:EquipData):void{
			data=$data;
			
			if(data && data.hasShenzhuang()){
				mc.visible=true;
				_btn_nb.addEventListener(TqtEvent.BUTTON_CLICK,onClickNb);
				_btn_tunshi.addEventListener(TqtEvent.BUTTON_CLICK,onClickTunshi);
				
				_fnt_title.text=Util.getLanguage("特殊装备",data.shenzhuangLv);
				
				for(var index:int=0; index<2; index++){
					if(data.shenzhuangAddAttrs.length>index){
						_fntDescArray[index].visible=true;
						_fntDescArray[index].text=Util.getLanguage("战斗属性增加提示_"+data.shenzhuangAddAttrs[index],
							Math.round(data.shenzhuanAddValues[index]*100) );
					}else{
						_fntDescArray[index].visible=false;
					}
				}
				needShow=true;
			}else{
				mc.visible=false;
				needShow=false;
			}
		}
		
		private function onClickNb(evt:Event):void{
			WindowManager.openOnlyWinodw(ChuanchengWindow,data);
			onClick_SN.dispatch();
		}
		private function onClickTunshi(evt:Event):void{
			WindowManager.openOnlyWinodw(ShenzhuangTunshiWindow,data);
			onClick_SN.dispatch();
		}
		
		public function destory():void{
			mc=null;
			if(_fnt_title) {_fnt_title.destory();_fnt_title=null;}
			if(_btn_nb) {_btn_nb.removeEventListener(TqtEvent.BUTTON_CLICK,onClickNb);_btn_nb.destory(); _btn_nb=null;}
			if(_btn_tunshi) {_btn_tunshi.removeEventListener(TqtEvent.BUTTON_CLICK,onClickTunshi);_btn_tunshi.destory(); _btn_tunshi=null;}
			if(_fntDescArray){
				for each(var ft:FontField in _fntDescArray){
					ft.destory();
				}
				_fntDescArray=null;
			}
			onClick_SN.removeAll();
		}
	}
}