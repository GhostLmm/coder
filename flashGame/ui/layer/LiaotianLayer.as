package ui.layer
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	import core.LayerController;
	
	import ui.liaotian.LiaotianMC;
	import ui.liaotian.LiaotianWindow;
	import ui.widget.TwoMoveMc;
	
	public class LiaotianLayer extends Sprite
	{
		private var liaotianTwoMC:TwoMoveMc;
		private var liaotianMC:LiaotianMC;
		
		private var contianer:Sprite;
		private var liaotianType:String;
		public function LiaotianLayer()
		{
			super();
			initModule();
		}
		
		private function initModule():void{
			contianer=new Sprite();
			liaotianTwoMC=new TwoMoveMc(BtnLiaotianClose);
			contianer.addChild(liaotianTwoMC.display);
		}
		
		public function hasShowLiaotian():Boolean{
			return liaotianMC!=null;
		}
		
		public function init($visibel:Boolean):void{
			liaotianTwoMC.setVisible($visibel);
			liaotianTwoMC.init(TwoMoveMc.DIR_Left);
			liaotianTwoMC.changeState_SN.add(onLiaoTwoChange);
			liaotianTwoMC.needChangeState_SN.add(onNeedLiaotianChange);
			LayerController.instance.uiLayer.scene.addChild(contianer);
		}
		
		public function openLiaotian(type:String=null,isInUi:Boolean=true):void{
			liaotianType=type;
			if(liaotianMC!=null && liaotianType!=null){
				liaotianMC.show(type);
			}else{
				
				clearLiatianMC();
//				liaotianTwoMC.sho
				liaotianTwoMC.foceShowClose();
				onNeedLiaotianChange(TwoMoveMc.ST_close2open);
			}
			if(isInUi){
				LayerController.instance.uiLayer.scene.addChild(contianer);
			}else{
				this.addChild(contianer);
			}
		}
		
		private function clearLiatianMC():void{
			if(liaotianMC){
				liaotianMC.destory();
				liaotianMC=null;
			}
		}
		private function onNeedLiaotianChange(state:int):void{
			if(state==TwoMoveMc.ST_close2open){
				clearLiatianMC();
				liaotianMC=new LiaotianMC();
//				liaotianWindow.open();
				liaotianTwoMC.showCloseToOpen(liaotianMC.display);
				contianer.graphics.clear();
				var graphics:Graphics = contianer.graphics;
				graphics.lineStyle(0, 0x000000, 0.5);
				graphics.beginFill(0x000000, 0.7);
				graphics.drawRect(0,0,GlobalRef.width,GlobalRef.height);
				graphics.endFill();
				
				return ;
			}
			if(state==TwoMoveMc.ST_open2close){
				liaotianTwoMC.showOpenToClose();
			}
		}
		private function onLiaoTwoChange(state:int):void{
			if(state==TwoMoveMc.ST_close){
				clearLiatianMC();
				contianer.graphics.clear();
				if(LayerController.instance.uiLayer) LayerController.instance.uiLayer.scene.addChild(contianer);
			}
			if(state==TwoMoveMc.ST_open){
				liaotianMC.show(liaotianType);
			}
		}
		public function destory():void{
			clearLiatianMC();
			contianer.removeChildren();
			if(liaotianTwoMC) {liaotianTwoMC.destory(); liaotianTwoMC=null;}
		}
	}
}