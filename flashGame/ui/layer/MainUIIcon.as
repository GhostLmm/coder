package ui.layer
{
	import com.fish.modules.core.gameVO.BaseVo;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.VipModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import ui.chongzhi.ChongzhiWindow;
	import ui.vip.VipWindow;
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.window.huodong.HuodongNewWindow;
	
	import util.SwitchManager;
	import util.Util;
	
	import view.CommonControlFun;

	public class MainUIIcon
	{
		private var mc:McMainItem;
		protected var _listenerProxy:ListenerAddProxy;
//		private var _mc_vip:MovieClip;
		private var _pos_vip:Position;
		private var _mc_qiangqian:Button;
		private var _mc_chognzhi:Button;
		private var _mc_huodong:Button;
		
		private var _btn_vip:Button;
		
		private var vipModel:VipModel;
		private var userModel:UserModel;
		
		
		public function MainUIIcon()
		{
			_listenerProxy=new ListenerAddProxy();
			mc=new McMainItem();
//			_mc_vip=mc.mc_vip;
			_pos_vip=new Position(mc.mc_vip_main.mc_vip);
			_mc_qiangqian=new Button(mc.mc_qiangqian);
			_mc_chognzhi=new Button(mc.mc_chognzhi);
			_mc_huodong=new Button(mc.mc_huodong);
			_btn_vip=new Button(mc.mc_vip_main);
			
			
			
		}
		
		public function get display():DisplayObject{
			return mc;
		}
		private function updateVip():void{
			_pos_vip.fillWithBitmapByClassName("vip"+userModel.userVo.vipLevel);
			
		}
		public function init():void{
			vipModel=Context.getInjectInstance(VipModel);
			userModel=Context.getInjectInstance(UserModel);
			userModel.userVo.changAttr_SN.add(onChangeAttr);
			_listenerProxy.addListener(_mc_chognzhi,TqtEvent.BUTTON_CLICK,openChongzhi);
			_listenerProxy.addListener(_mc_huodong,TqtEvent.BUTTON_CLICK,openHuodong);
			_listenerProxy.addListener(_mc_qiangqian,TqtEvent.BUTTON_CLICK,openJinkuang);
			_listenerProxy.addListener(_btn_vip,TqtEvent.BUTTON_CLICK,openVip);
			
//			if(AppstoreVerify.inVerify){
//				_mc_huodong.visible=false;
//				_btn_vip.visible=false;
//				_mc_qiangqian.visible=false;
//			}
			
			_btn_vip.visible=SwitchManager.getInstance().Switch_VIP_Icon;
			_mc_qiangqian.visible=SwitchManager.getInstance().Switch_Jinkuang;
			_mc_huodong.visible=SwitchManager.getInstance().Switch_Huodong;
			
			
			updateVip();
//			vipModel.
		}
		
		private function openChongzhi(evt:Event):void{
			WindowManager.openOnlyWinodw(ChongzhiWindow);
		}
		private function openHuodong(evt:Event):void{
			WindowManager.openOnlyWinodw(HuodongNewWindow);
		}
		private function openVip(evt:Event):void{
			WindowManager.openOnlyWinodw(VipWindow);
		}
		private function openJinkuang(evt:Event):void{
			CommonControlFun.gotoJinkuang();
		}
		private function onChangeAttr(attr:String,newValue:int,oldValue:int,vo:BaseVo):void{
			if(attr=="vipLevel"){
				updateVip();
			}
		}
		
		public function destory():void{
			if(_listenerProxy){
				_listenerProxy.clear();
				_listenerProxy=null;
			}
			if(userModel){
				userModel.userVo.changAttr_SN.remove(onChangeAttr);
				userModel=null;
			}
			mc=null;
//			_mc_vip=null;
			if(_btn_vip) {_btn_vip.destory(); _btn_vip=null;}
			if(_pos_vip) {_pos_vip.destory(); _pos_vip=null;}
			if(_mc_qiangqian) {_mc_qiangqian.destory(); _mc_qiangqian=null;}
			if(_mc_chognzhi) {_mc_chognzhi.destory(); _mc_chognzhi=null;}
			if(_mc_huodong) {_mc_huodong.destory(); _mc_huodong=null;}
		}
		
	}
}