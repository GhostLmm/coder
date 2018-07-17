package com.ghostlmm.dig
{
	import flash.display.DisplayObject;
	
	import ui.widget.Button;
	import ui.widget.MyRichText;
	
	import util.Util;

	public class DigGuideTip
	{
		private var mc:WindowWakuangDialog;
		private var tf:MyRichText;
		public var btn_start:Button;
		public function DigGuideTip()
		{
			mc=new WindowWakuangDialog();
			tf=new MyRichText(mc.fnt_dialog);
			btn_start=new Button(mc.kaishiwakuang);
			btn_start.visible=false;
//			btn_start.addEventListener(TqtEvent.BUTTON_CLICK,onStartClick);
		}
		
		
		
		public function get display():DisplayObject{
			return mc;
		}
		
		public function showEffect():void{
//			tf.effectCom_SN.add(onCom);
//			tf.setHtml(EmbedData.getDigGuideDescXml());
//			tf.showEffect();
			trace("showstart");
			tf.setText(Util.getLanguage("挖矿初始信息提示"));
			tf.showMoveText();
			tf.showMoveCom_SN.add(onCom);
		}
		private function onCom():void{
			btn_start.visible=true;
		}
		
		public function destory():void{
			
			if(tf) {tf.destory(); tf=null;}
			if(btn_start) {btn_start.destory(); btn_start=null;}
			if(mc){
				if(mc.parent){
					mc.parent.removeChild(mc);
				}
				mc=null;
			}
		}
	}
}