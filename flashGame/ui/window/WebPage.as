package ui.window
{
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	
	import core.LayerController;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	
	public class WebPage extends Sprite
	{
		
		private var webBrowser:StageWebView;
		private var _btn_queding:Button;
		private var _pos_gonggao:Position;
		private var _scene:MovieClip;
		private var _fnt_title:FontField;
		public function WebPage(noHide:Boolean=false,needBlock:Boolean=false)
		{
			super();
			_scene=new (getMaterialClass())();
			this.addChild(_scene);
			//			this.addChild(_scene);
			if(_scene.btn_queding){
				_btn_queding=new Button(_scene.btn_queding);
				_btn_queding.addEventListener(TqtEvent.BUTTON_CLICK,onClickQueding);
			}
			_pos_gonggao=new Position(_scene.pos_gonggao);
			
			if(_scene.hasOwnProperty("fnt_title")){
				_fnt_title=new FontField(_scene.fnt_title);
			}
			
			
//			setShow();
			showWait();
			//			TweenLite.delayedCall(1,showWait);
			if(noHide){
				if(_btn_queding) _btn_queding.visible=false;
			}else{
				TweenLite.delayedCall(10,hideWait);
			}
			if(needBlock){
				this.graphics.beginFill(0,0.5);
				this.graphics.drawRect(0,0,GlobalRef.width,GlobalRef.height);
				this.graphics.endFill();
			}
		}
		
		protected  function getMaterialClass():Class{
			return null;
		}
		protected  function getPageUrl():String{
			return null;
		}
		
		private function showWait():void
		{
			LayerController.instance.webWaiterLayer && LayerController.instance.webWaiterLayer.showWait();
		}
		
		private function hideWait():void
		{
			LayerController.instance.webWaiterLayer && LayerController.instance.webWaiterLayer.hideWait();
		}
		
		private function onClickQueding(evt:Event):void
		{
			close();
		}
		
		public function close():void{
			
			destory();
			if(parent) {parent.removeChild(this);}
		}
		
		public function destory():void
		{
			hideWait();
			TweenLite.killDelayedCallsTo(hideWait);
			TweenLite.killDelayedCallsTo(showWait);
			ExitGameControl.setCouldExit(true);
			if(_fnt_title) {_fnt_title.destory();_fnt_title=null;}
			// trace("关闭web")
			
			if(_btn_queding) {_btn_queding.removeEventListener(TqtEvent.BUTTON_CLICK,onClickQueding);_btn_queding.destory(); _btn_queding=null};
			if(_pos_gonggao) {_pos_gonggao.destory(); _pos_gonggao=null};
			// trace("执行0");
			if(webBrowser){
				// trace("执行1");
				webBrowser.removeEventListener(Event.COMPLETE, loadComplete);
				webBrowser.removeEventListener(ErrorEvent.ERROR,onError);
				// trace("执行2");
				webBrowser.stop();
				// trace("执行3");
				webBrowser.stage = null;
				// trace("执行4");
				webBrowser.dispose();
				// trace("执行5");
				webBrowser = null;
				// trace("执行6");
			}
			// trace("执行7");
		}
		
		private var _random:String;
		protected function getRandomPix():String
		{
			if(_random==null)
				_random=(new Date()).time.toString()+int(Math.random()*int.MAX_VALUE);
			return _random;
		}
		
		public function setShow(container:Sprite,windwName:String=null):void
		{			
			ExitGameControl.setCouldExit(false);
			var shape:Shape=new Shape();
			
			if(_fnt_title && windwName){
				_fnt_title.text=windwName;
			}
			container.addChild(this);
			if(webBrowser == null)
			{
				// trace("初始化web1")
				webBrowser = new StageWebView();
				// trace("初始化web2")
				var initPoint:Point=_pos_gonggao.localToGlobal(new Point(_pos_gonggao.rect.x,_pos_gonggao.rect.y));
				// trace("初始化web3")
				var endPoint:Point=_pos_gonggao.localToGlobal(new Point(_pos_gonggao.rect.right,_pos_gonggao.rect.bottom));
				// trace("初始化web4")
				initPoint=shape.globalToLocal(initPoint);
				// trace("初始化web5")
				endPoint=shape.globalToLocal(endPoint);
				// trace("初始化web6")
				webBrowser.viewPort = new Rectangle(initPoint.x,initPoint.y,endPoint.x-initPoint.x,endPoint.y-initPoint.y);
				
			}
			// trace("初始化web7");
			webBrowser.addEventListener(Event.COMPLETE, loadComplete);
			webBrowser.addEventListener(ErrorEvent.ERROR,onError);
			// trace("初始化web8");
			webBrowser.loadURL(getPageUrl());//http://www.baidu.com/index.php?tn=monline_5_dg
			//			webBrowser.loadURL("http://www.baidu.com/index.php?tn=monline_5_dg");
			// trace("初始化web9");
		}
		private function onError(evt:Event):void
		{
			
		}
		private function loadComplete(evt:Event):void
		{
			showWait();
			TweenLite.killTweensOf(hideWait);
			TweenLite.delayedCall(1,hideWait);
			// trace("执行添加到舞台1");
			webBrowser.stage=GlobalRef.stage;
			// trace("执行添加到舞台2");
			//			webBrowser.stage=this.stage;
		}
	}
}