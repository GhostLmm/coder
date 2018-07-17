package ui.layer
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.gameVO.BaseVo;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.VipModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.tool.ListenerAddProxy;
	import com.ghostlmm.xmldata.Node_level;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import ui.AddMoneyWindow;
	import ui.bag.HeroDetailWidow;
	import ui.chongzhi.ChongzhiWindow;
	import ui.digWindow.RenwuWindow;
	import ui.fuben.TiliGoumaiWindow;
	import ui.vip.VipWindow;
	import ui.widget.FontField;
	import ui.widget.NumFontScroll;
	import ui.widget.NumFontStatic;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	import ui.widget.ProgressManagerMax;
	
	import view.CommonControlFun;

	public class UserInfoBar
	{
		private var mc:MovieClip;
		private var _userBar:MovieClip;
		private var _moneyBar:MovieClip;
		private var _cashBar:MovieClip;
		private var _tiliBar:MovieClip;
		
		public var tiliMC:DisplayObject;
		
		
		protected var _listenerProxy:ListenerAddProxy;
		
//		public var _fnt_name:FontField;
//		public var _mc_vip:MovieClip;
//		public var _pos_vip:Position;
		public var _pos_touxiang:Position;
//		public var _prg_tili:ProgressManager;
		
		private var _scn_tili:NumFontStatic;
		private var _prg_tili:ProgressManagerMax;
		
		public var _prg_exp:ProgressManagerMax;
		private var _num_exp:NumFontStatic;
		public var _num_lv:NumFontScroll;
		
		public var _mc_money:MovieClip;
		public var _scn_money:NumFontScroll;
		
		
		public var _mc_cash:MovieClip;
		public var _scn_cash:NumFontScroll;
		
		
		public var _mc_exp:DisplayObject;
		private var userModel:UserModel;
		private var vipModel:VipModel;
		
		public function UserInfoBar()
		{
			mc=new (AssetManager.getAssetClass("McTouxiang") as Class)();
			_listenerProxy=new ListenerAddProxy();

			_userBar=mc.mc_touxiang;
			_moneyBar=mc.mc_money;
			_cashBar=mc.mc_cash;
			_tiliBar=mc.mc_tili;
			tiliMC=_tiliBar.mc_tili;
//			_fnt_name=new FontField(_userBar.fnt_name);
			
			
//			_mc_vip=_userBar.mc_vip;
//			_pos_vip=new Position(_mc_vip.pos_vip_image);
			_pos_touxiang=new Position(_userBar.pos_touxiang);
			_scn_tili=new NumFontStatic(_tiliBar.scn_money);
			_prg_tili=new ProgressManagerMax(_tiliBar,_scn_tili);
			
//			_prg_tili=new ProgressManager(_tiliBar.prg_tili,_num_tili);
			
			_num_exp=new NumFontStatic(_userBar.num_exp);
			_prg_exp=new ProgressManagerMax(_userBar.prg_exp,_num_exp);
			_num_lv=new NumFontScroll(_userBar.num_lv);
			
			_mc_exp=_userBar.num_exp;
			
			
			_mc_money=_moneyBar.mc_money;
			_scn_money=new NumFontScroll(_moneyBar.scn_money);
			
			_mc_cash=_cashBar.mc_cash;
			_scn_cash=new NumFontScroll(_cashBar.scn_cash);
		}
		
		private function onDebug(type:String,args:Array):void{
			
		}
		
		public function init():void{
			
			userModel=Context.getInjectInstance(UserModel);
			vipModel=Context.getInjectInstance(VipModel);
			userModel.userVo.changAttr_SN.add(onChangeAttr);
//			_listenerProxy.addListener(mc,TQTTouchEvent.TOUCH_TAP,openRenwu);
			
			for each(var node:Node_level in XMLDataManager.Node_levelArray){
				_prg_exp.push(node.id.toString(),node.exp);
			}
			
			_listenerProxy.addListener(_moneyBar,TQTTouchEvent.TOUCH_TAP,onAddMoney);
			_listenerProxy.addListener(_tiliBar,TQTTouchEvent.TOUCH_TAP,onAddTip);
			_listenerProxy.addListener(_cashBar,TQTTouchEvent.TOUCH_TAP,onAddCash);
//			_listenerProxy.addListener(_pos_vip,TqtEvent.TOUCH_TAP,onVipTap);
			_listenerProxy.addListener(_userBar,TQTTouchEvent.TOUCH_TAP,onOpenHeroDetail);
			updateShow();
		}
		
		private function onOpenHeroDetail(evt:Event):void{
			WindowManager.openOnlyWinodw(HeroDetailWidow);
		}
		
		private function onAddMoney(evt:Event):void{
			WindowManager.openOnlyWinodw(AddMoneyWindow);
		}
		private function onAddTip(evt:Event):void{
			WindowManager.openOnlyWinodw(TiliGoumaiWindow);
		}
		
		private function onAddCash(evt:Event):void{
			WindowManager.openOnlyWinodw(ChongzhiWindow);
		}
		
		private function onVipTap(evt:Event):void{
			WindowManager.openOnlyWinodw(VipWindow);
		}
		
		public function updateShow():void{
			_prg_exp.tweenSet("1",0,0);
			setUserBaseShow();
			updateMoney();
			updateExp();
			updateTili();
			updateMoney();
			updateCash();
			updateVip();
		}
		private function updateVip():void{
//			_pos_vip.fillWithBitmapByClassName("vip"+userModel.userVo.vipLevel);
			
		}
		
		private function onChangeAttr(attr:String,newValue:int,oldValue:int,vo:BaseVo):void{
			
			var fnMap:Object={
				"userExp":updateExp,"userMoney":updateMoney,"userCash":updateCash,"userLevel":setUserBaseShow,"currentTili":updateTili,"vipLevel":updateVip
			};
			var fn:Function=fnMap[attr];
			if(fn!=null){
				fn();
			}
				
		}
		
		public function setUserBaseShow():void{
//			_fnt_name.text=GLBaseData.userName;
			_num_lv.num=userModel.userVo.userLevel;
		}
		
		public function updateExp():void{
			var node:Node_level=XMLDataManager.getLevelById(userModel.userVo.userLevel);
			_prg_exp.tweenSet(userModel.userVo.userLevel.toString(),userModel.userVo.userExp);
		}
		
		public function updateTili():void{
			_prg_tili.devider=userModel.userVo.tiliLimit;
			_prg_tili.progress=userModel.userVo.currentTili;
//			_scn_tili.num=userModel.userVo.currentTili;
		}
		
		public function updateMoney():void{
			_scn_money.num=userModel.userVo.userMoney;
		}
		
		public function updateCash():void{
			_scn_cash.num=userModel.userVo.userCash;
		}
		
		private function openRenwu(evt:Event):void{
			WindowManager.openOnlyWinodw(RenwuWindow);
		}
		public function destory():void{
			
			
			_userBar=null;
			
			
			_moneyBar=null;
			_cashBar=null;
			
			if(userModel) {
				userModel.userVo.changAttr_SN.remove(onChangeAttr);
				userModel=null;
			}
			tiliMC=null;
//			if(_fnt_name){_fnt_name.destory();_fnt_name=null;}
//			_mc_vip=null;
//			if(_pos_vip){_pos_vip.destory();_pos_vip=null;}
			if(_pos_touxiang){_pos_touxiang.destory();_pos_touxiang=null;}
			if(_prg_tili){_prg_tili.destory();_prg_tili=null;}
			if(_scn_tili){_scn_tili.destory();_scn_tili=null;}
			if(_prg_exp){_prg_exp.destory();_prg_exp=null;}
			if(_num_lv){_num_lv.destory();_num_lv=null;}
			if(_num_exp) {_num_exp.destory();_num_exp=null;}
			if(_scn_money) {_scn_money.destory();_scn_money=null;}
			if(_scn_cash) {_scn_cash.destory();_scn_cash=null;}
			if(_scn_money) {_scn_money.destory();_scn_money=null;}
			_mc_money=null;
			
			_mc_cash=null;
			
			if(_listenerProxy){
				_listenerProxy.clear();
				_listenerProxy=null;
			}
		}
		public function get display():DisplayObject
		{
			return mc;
		}
		
	}
}


