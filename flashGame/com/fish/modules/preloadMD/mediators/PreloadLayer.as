package com.fish.modules.preloadMD.mediators
{
	
	import com.ghostlmm.lightMVC.impl.ViewAssemble;
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import core.LayerController;
	
	import org.osflash.signals.Signal;
	
	import ui.widget.Button;
	import ui.widget.ButtonMax;
	import ui.widget.FontField;
	import ui.widget.ProgressManager;
	
	import util.Util;
	
	import view.CommonControlFun;

	public class PreloadLayer
	{
		public static const McName_Loading:String="loading";
		public static const McName_Server:String="server";
		public static const McName_Account:String="account";
		public static const MCName_PreLogin:String="login";
		
		private var scLoader:flash.display.MovieClip; 
		private var mcDic:Dictionary=new Dictionary();
		
		public var _btn_login_denglu:Button;
		
		public var _btn_denglu_denglu:Button;
		public var _btn_denglu_jinru:Button;
		public var _btn_denglu_xuanqu:Button;
		public var _btn_denglu_zhuce:Button;
		public var _fnt_denglu_xuanqu:FontField;
		
		public var _btn_jinru_jinru:Button;
		public var _btn_jinru_xuanqu:ButtonMax;
		public var _btn_jinru_zhanghao:Button;
//		public var _fnt_jinru_xuanqu:FontField;
		public var _fnt_jinru_zhanghao:FontField;
		
		public var _fnt_version:FontField;
		
		public var _fnt_prg_loading:FontField;
		public var _prg_loading:ProgressManager;
		
//		public var _mc_anim:MovieClip;
		
		public var changState_SN:Signal;
		
		public function PreloadLayer()
		{
			super();
			changState_SN=new Signal(String);
		}
		
		public function destory():void
		{
			destoryMc();
			
			changState_SN.removeAll();
			changState_SN=null;
		}
		
		public function show():void
		{
			scLoader=new (AssetManager.getAssetClass("SceneLoading") as Class)();			scLoader.x=GlobalRef.width/2;
			scLoader.y=GlobalRef.height/2;
			LayerController.instance.waitLayer.addChild(scLoader);
			
			mcDic=new Dictionary();
			mcDic["account"]=scLoader.mc_jinru;
			mcDic["server"]=scLoader.mc_btn;
			mcDic["loading"]=scLoader.mc_loading;
			mcDic[MCName_PreLogin]=scLoader.btn_denglu;
			
			if(SwitchConfig.ST_UserUnionAccount){
				showMC(MCName_PreLogin);
			}else{
				showMC("loading");
			}
			
			
			var _mc_denglu:MovieClip = scLoader.mc_btn;
			var _mc_jinru:MovieClip  = scLoader.mc_jinru;
			var _mc_loading:MovieClip  = scLoader.mc_loading;
			
			_fnt_prg_loading = new FontField(_mc_loading.fnt_prg_loading);
			_prg_loading = new ProgressManager(_mc_loading.prg_loading,_fnt_prg_loading,ProgressManager.NORMAL,ProgressManager.percentText);
			
			_btn_login_denglu=new Button(scLoader.btn_denglu);
			
			_btn_denglu_denglu = new Button(_mc_denglu.btn_denglu);
			_btn_denglu_jinru = new Button(_mc_denglu.btn_jinru);
			_btn_denglu_xuanqu = new Button(_mc_denglu.btn_xuanqu);
			_btn_denglu_zhuce = new Button(_mc_denglu.btn_zhuce);
			_fnt_denglu_xuanqu = new FontField(_mc_denglu.fnt_xuanqu);
			
			_btn_jinru_jinru = new Button(_mc_jinru.btn_jinru);
			
			var tmp:Point=Util.getRelativePostion(scLoader,_mc_jinru.btn_xuanqu.parent,new Point(GlobalRef.width/2,0));
			_mc_jinru.btn_xuanqu.x=tmp.x-_mc_jinru.btn_xuanqu.width+10;
			
			_btn_jinru_xuanqu = new ButtonMax(_mc_jinru.btn_xuanqu);
			_btn_jinru_zhanghao = new Button(_mc_jinru.btn_zhanghao);
//			_fnt_jinru_xuanqu = new FontField(_mc_jinru.fnt_xuanqu);
			_fnt_jinru_zhanghao = new FontField(_mc_jinru.fnt_zhanghao);
			
			scLoader.fnt_version.x=-GlobalRef.width/2;
			scLoader.fnt_version.y=-GlobalRef.height/2;
			_fnt_version=new FontField(scLoader.fnt_version);
			
//			_mc_anim=scLoader.mc_anim;
						
			ViewAssemble.bindMediator(this);
		}
		private function destoryMc():void
		{
			if(_fnt_prg_loading){_fnt_prg_loading.destory();_fnt_prg_loading=null;};
			if(_prg_loading){_prg_loading.destory();_prg_loading=null;};
			if(_btn_denglu_denglu){_btn_denglu_denglu.destory();_btn_denglu_denglu=null;};
			if(_btn_denglu_jinru){_btn_denglu_jinru.destory();_btn_denglu_jinru=null;};
			if(_btn_denglu_xuanqu){_btn_denglu_xuanqu.destory();_btn_denglu_xuanqu=null;};
			if(_btn_denglu_zhuce){_btn_denglu_zhuce.destory();_btn_denglu_zhuce=null;};
			if(_fnt_denglu_xuanqu){_fnt_denglu_xuanqu.destory();_fnt_denglu_xuanqu=null;};
			
			if(_btn_jinru_jinru){_btn_jinru_jinru.destory();_btn_jinru_jinru=null;};
			if(_btn_jinru_xuanqu){_btn_jinru_xuanqu.destory();_btn_jinru_xuanqu=null;};
//			if(_fnt_jinru_xuanqu){_fnt_jinru_xuanqu.destory();_fnt_jinru_xuanqu=null;};
			if(_fnt_jinru_zhanghao){_fnt_jinru_zhanghao.destory();_fnt_jinru_zhanghao=null;};
			
			if(_fnt_version) {_fnt_version.destory();_fnt_version=null;}
			
			if(_btn_login_denglu) {_btn_login_denglu.destory(); _btn_login_denglu=null;}
			
//			scLoader=null;
			if(scLoader){
				Util.removeAllChildren(scLoader);
				Util.stopAllMovie(scLoader);
				CommonControlFun.clearMaterial(scLoader);
				scLoader=null;
			}
			
//			_mc_anim=null;
			mcDic=null;
		}
		public function remove():void
		{
			if(scLoader && LayerController.instance.waitLayer && LayerController.instance.waitLayer.contains(scLoader))
			{
				LayerController.instance.waitLayer.removeChild(scLoader);
			}
			ViewAssemble.unBindMediator(this);
			destory();
		}
		
		public function showMC(mcName:String):void
		{
			changState_SN.dispatch(mcName);
			for(var key:String in mcDic)
			{
				mcDic[key].visible=(key==mcName);
			}
			
			if(mcName==McName_Account){
				/*if(PlatformManager.getInstance().supportPlatAccount()){
					_fnt_jinru_zhanghao.visible=false;
					_btn_jinru_zhanghao.visible=false;
				}else{
					
					_fnt_jinru_zhanghao.visible=true;
					_btn_jinru_zhanghao.visible=true;
				}*/
				/*if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin)){
					if( (PlatformManager.getInstance().platformObj as Object).isFastLoginAccount()){
						_fnt_jinru_zhanghao.visible=false;
						_btn_jinru_zhanghao.visible=false;
					}else{
						_fnt_jinru_zhanghao.visible=true;
						_btn_jinru_zhanghao.visible=true;
						_fnt_jinru_zhanghao.text=PlatformManager.getInstance().platformObj.openId;
					}
					trace("登录情况： \t"+(PlatformManager.getInstance().platformObj as Object).isFastLoginAccount()+"/"+PlatformManager.getInstance().platformObj.openId);
//					_fnt_jinru_zhanghao.visible=true;
//					_btn_jinru_zhanghao.visible=true;
				}else{
					_fnt_jinru_zhanghao.visible=false;
					_btn_jinru_zhanghao.visible=false;
				}*/
				_fnt_jinru_zhanghao.visible=false;
				_btn_jinru_zhanghao.visible=false;
			}
			
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin)){
				scLoader.btn_denglu.visible=false;
			}
		}
		
		
	}
}
