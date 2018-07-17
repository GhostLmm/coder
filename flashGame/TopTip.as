package
{
import com.fish.GLBaseData;
import com.greensock.TweenLite;

import flash.desktop.NativeApplication;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import core.event.TqtEvent;

import ui.widget.Button;
import ui.widget.ButtonMax;
import ui.widget.FontField;

import util.Util;

	public class TopTip
	{
		public function TopTip()
		{
		}
		
		private static var _jingao:flash.display.MovieClip;  
		
		private static var _layer:Sprite;
		private static var _stage:Stage;
		
		private static var _okFn:Function;
		private static var _cancleFn:Function;
		
		private static var _btn_queding:ButtonMax;
		private static var _btn_quxiao:ButtonMax;
		private static var _fnt_desc:FontField;
		
		private static var _mask:Sprite;
		
		public static var hasShow:Boolean=false;
		
		public static function setLayer($layer:Sprite,$stage:Stage):void
		{
			_layer=$layer;
			_stage=$stage;
//			_stage.addEventListener(n
//			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN,handleKeyDown);
		}
		
	/*	private static var _exitQuite:Boolean=true;
		public static function setExitQuite($exitQuite:Boolean):void
		{
			_exitQuite=$exitQuite;
		}*/
		
		
		/*private static function handleKeyDown(evt:KeyboardEvent):void
		{		
			if(evt.keyCode == Keyboard.BACK)
			{
				if(_exitQuite)
				{
					NativeApplication.nativeApplication.exit();
				}
				else
				{
					evt.preventDefault();
//					showExitAlert();
					showExitTip();
				}
			}
		}*/
		private static var battleWait:MovieClip;
		public static function showBattleWait():void{
			TweenLite.killTweensOf(realyHideBattle);
			if(battleWait==null){
				battleWait=new loading_qiehuan();
				battleWait.x=GlobalRef.width/2;
				battleWait.y=GlobalRef.height/2;
			}
			_layer.addChild(battleWait);
		}
		public static function hideBattleWait():void{
			TweenLite.delayedCall(0.1,realyHideBattle);
		}
		
		private static function realyHideBattle():void{
			if(battleWait && _layer.contains(battleWait)){
				_layer.removeChild(battleWait);
			}
			battleWait.stop();
			//			battleWait.stopAllMovieClips();
			battleWait=null;
		}
		
		
		private static var btX1:Number;
		private static var btX2:Number;
		
		public static function showExitTip(desc:String,okFn:Function=null,cancleFn:Function=null,
				cacleEnable:Boolean=true,okDesc:String=null,cancleDesc:String=null,showCancle:Boolean=true):void
		{
			hasShow=true;
			if(_jingao==null){
				_jingao=new (AssetManager.getAssetClass("WindowJinggao") as Class)(); 
				
				_mask=new Sprite();
				_mask.graphics.beginFill(0,0.5);
				_mask.graphics.drawRect(0,0,GlobalRef.width,GlobalRef.height);
				_mask.graphics.endFill();
				_btn_queding = new ButtonMax(_jingao.btn_queding);
				_btn_quxiao = new ButtonMax(_jingao.btn_quxiao);
				_fnt_desc = new FontField(_jingao.fnt_desc);
				
				btX1=_btn_queding.x;
				btX2=_btn_quxiao.x;
				_btn_queding.addEventListener(TqtEvent.BUTTON_CLICK,onExitQueding);
				_btn_quxiao.addEventListener(TqtEvent.BUTTON_CLICK,onExitQuexiao);
				_btn_quxiao.addEventListener(TqtEvent.BUTTON_CLICK_DISABLE,onCancleDisable);
				
//				_fnt_desc.text=Util.getLanguage("退出提示");
//				var _fnt_desc.text = params.data.msg;
			}
			if(okDesc==null){
				okDesc=Util.getLanguage("确定");
			}
			if(okDesc){
				_btn_queding.setText(okDesc);
			}
			if(cancleDesc==null){
				cancleDesc=Util.getLanguage("取消");
			}
			if(cancleDesc){
				_btn_quxiao.setText(cancleDesc);
			}
			_btn_quxiao.isEnabled=cacleEnable;
			_okFn=okFn;
			_cancleFn=cancleFn;
			
			_fnt_desc.text=desc;
			_layer.addChild(_mask);
			_jingao.x=GlobalRef.width/2;
			_jingao.y=GlobalRef.height/2;
			_layer.addChild(_jingao);
			
			if(showCancle){
				_btn_quxiao.visible=true;
				_btn_queding.x=btX1;
				_btn_quxiao.x=btX2;
			}else{
				_btn_quxiao.visible=false;
				_btn_queding.x=(btX1+btX2)/2;
			}
			
		}
		
		private static function clearFn():void
		{
			_cancleFn=null;
			_okFn=null;
		}
		
		private static function onExitQueding(evt:Event):void{
//			NativeApplication.nativeApplication.exit();
			if(_okFn!=null){
				_okFn();
			}
			clearFn();
			hideExitTip();
		}
		
		public static function excuteCancle():void{
			if(_cancleFn!=null)
			{
				_cancleFn();
			}
			clearFn();
			hideExitTip();
		}
		
		private static function onExitQuexiao(evt:Event):void{
//			hideExitTip();
			excuteCancle();
		}
		private static function onCancleDisable(evt:Event):void{
			if(_okFn!=null)
			{
				_okFn();
			}
			clearFn();
			hideExitTip();
		}
		
		public static function hideExitTip():void
		{
			if(_layer && _jingao && _layer.contains(_jingao)){
				_layer.removeChild(_jingao);
			}
			if(_layer && _mask && _layer.contains(_mask)){
				_layer.removeChild(_mask);
			}
			clearFn();
			hasShow=false;
		}
	}
}
