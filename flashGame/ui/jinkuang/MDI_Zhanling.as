package ui.jinkuang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.XitongkuangpersonVO;
	import com.fish.modules.core.models.JinkuangModel;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_jinkuang;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.window.CommonRewardWindow;
	import ui.window.JinggaoWindow;
	
	import util.GameTime;
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_Zhanling extends Mediator
	{
		[Inject]
		public var window:ZhanlingWindow;
		private var timerModel:TimerModel;
		
		public function MDI_Zhanling()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
			setShow();
		}
		private var optCode:int;
		private var jinkuangNode:Node_jinkuang;
		private var tempVo:XitongkuangpersonVO;
		private function initModule():void
		{
			tempVo=GameVOManager.getInstance().xitongkuangperson;
			jinkuangNode=XMLDataManager.Node_jinkuangDic[tempVo.kuangId];
			optCode=int(window._params);
			timerModel=Context.getInjectInstance(TimerModel);
		}
		private function onTick():void
		{
			if(null==tempVo)
			{
				return;
			}
			var time:GameTime=new GameTime(timerModel.serverTime-tempVo.occupiedTime);
			window._fnt_time_mcShouhuo.text=time.toString3();
			window._fnt_shouhuo_mcShouhuo.text=JinkuangModel.computeShouhuoMoney(int(time.miliSecond/1000),jinkuangNode.chanliang).toString();
		}
		private function registerEvent():void
		{
			timerModel.secondTimer_SN.add(onTick);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_qugan,TqtEvent.BUTTON_CLICK,onQuganClicked);
			addViewListener(window._btn_lveduo,TqtEvent.BUTTON_CLICK,onLveduoClicked);
			addViewListener(window._btn_chetui,TqtEvent.BUTTON_CLICK,onChetuiClicked);
			addViewListener(window._btn_shouhuo,TqtEvent.BUTTON_CLICK,onShouhuoClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_RetreatKuangHandler)
			{
				if(_code==1)
				{
					var money:int=GameVOManager.getInstance().extrdata.xitongkuangMoney;
					if(money>0)
					{
						var param:RewardsPackData=new RewardsPackData();
						param.bonus_money=Math.abs(money);
						WindowManager.openOnlyWinodw(CommonRewardWindow,param);
					}
					else
					{
						Util.flow("撤退金矿成功",money);
					}
					window.close();
				}
				else if(_code==JinkuangModel.NOT_YOUR_KUANG)
				{
					Util.flow("已经不是你的矿了，不用撤退");
					window.close();
				}
			}
			else if(_msgType==C2SEmitter.REQ_GainKuangHandler)
			{
				if(_code==1)
				{
					var money:int=GameVOManager.getInstance().extrdata.xitongkuangMoney;
					if(money>0)
					{
						var param:RewardsPackData=new RewardsPackData();
						param.bonus_money=Math.abs(money);
						WindowManager.openOnlyWinodw(CommonRewardWindow,param);
					}
					else
					{
						Util.flow("收获金矿成功",money);
					}
					window.close();
				}
				else if(_code==JinkuangModel.NOT_YOUR_KUANG)
				{
					Util.flow("不是你的矿，不能收获");
					window.close();
				}
			}
			else if(_msgType==C2SEmitter.REQ_KuangLveduoPreHandler)
			{
				if(_code==JinkuangModel.LVEDUO_MASTER_FIRST)
				{
					Util.flow("不能进行掠夺，请先掠夺大哥。");
				}
			}
		}
		private function onShouhuoClicked(evt:Event):void
		{
			if(null==jinkuangNode)
			{
				return;
			}
			C2SEmitter.shouhuoKuang(jinkuangNode.id,jinkuangNode.type);
		}
		private function onChetuiClicked(evt:Event):void
		{
			if(null==jinkuangNode)
			{
				return;
			}
			C2SEmitter.chetuiKuang(jinkuangNode.id,jinkuangNode.type);
		}
		private function onLveduoClicked(evt:Event):void
		{
			if(null==jinkuangNode)
			{
				return;
			}
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.vipLevel<jinkuangNode.vip_limit)
			{
				Util.flow("需要vip等级",jinkuangNode.vip_limit);
				return;
			}	
			if(!checkLingqueTime())
			{
				return;
			}
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			if(jinkuangModel.checkIfIhaveKuang())
			{
				JinkuangModel.isMyKuangDo(confirmLvduo);
			}
			else
			{
				confirmLvduo();
			}
		}
		private function confirmLvduo():void
		{
			if(JinkuangModel.checkIfIsMyFushuKuang(tempVo))
			{
				var alert:JinggaoWindow;
				alert = new JinggaoWindow({data:{msg:Util.getLanguage("您确定要这么做吗？以后没有人敢附属你了")}});
				alert.addEventListener(TqtEvent.ALERT_OK,sendLveduoMessage,false,0,true);
				alert.open();
			}
			else
			{
				if(tempVo.mainUserId>0)
				{
					Util.flow("不能进行掠夺，请先掠夺大哥。");
				}
				else
				{
					sendLveduoMessage();
				}
			}
		}
		private function sendLveduoMessage(evt:Event=null):void
		{
			JinkuangModel.cacheJinkuangXid=jinkuangNode.id;
			C2SEmitter.lveduoKuangPre(jinkuangNode.id,jinkuangNode.type);
		}
		private function onQuganClicked(evt:Event):void
		{
			if(null==jinkuangNode)
			{
				return;
			}var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.vipLevel<jinkuangNode.vip_limit)
			{
				Util.flow("需要vip等级",jinkuangNode.vip_limit);
				return;
			}
			
			if(!checkLingqueTime())
			{
				return;
			}
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			if(jinkuangModel.checkIfIhaveKuang())
			{
				JinkuangModel.isMyKuangDo(confirmQugan);
			}
			else
			{
				confirmQugan();
			}

		}
		private function confirmQugan():void
		{
			if(JinkuangModel.checkIfIsMyFushuKuang(tempVo))
			{
				var alert:JinggaoWindow;
				alert = new JinggaoWindow({data:{msg:Util.getLanguage("您确定要这么做吗？以后没有人敢附属你了")}});
				alert.addEventListener(TqtEvent.ALERT_OK,sendQuganMessage,false,0,true);
				alert.open();
			}
			else
			{
				if(tempVo.mainUserId>0)
				{
					Util.flow("不能进行驱赶，请先驱赶大哥。");
				}
				else
				{
					sendQuganMessage();
				}
			}
		}
		private function checkLingqueTime():Boolean
		{
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			var lengque:*=jinkuangModel.getLengqueTime();
			if(lengque is int)
			{
				return true;
			}
			else if(lengque is String)
			{
				Util.flow("金矿操作正在冷却中",lengque);
				return false;
			}
			return true;
		}
		private function sendQuganMessage(evt:Event=null):void
		{
			JinkuangModel.cacheJinkuangXid=jinkuangNode.id;
			C2SEmitter.occupyKuangPre(jinkuangNode.id,jinkuangNode.type);
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			switch(optCode)
			{
				case JinkuangModel.Success:
					setSuccessShow();
					break;					
				default:
					break;
			}
		}
		private function setSuccessShow():void
		{
			if(null!=jinkuangNode)
			{
				window._fnt_name.text=jinkuangNode.name;
				
				window._fnt_chanliang_mcLveduo.text=jinkuangNode.chanliang.toString();
					
				window._fnt_chanliang_mcShouhuo.text=jinkuangNode.chanliang.toString();	
			}
			if(null!=tempVo)
			{
				window._fnt_user_name.text=tempVo.userName;
				window._fnt_lv.text=tempVo.userLevel.toString();
				
				window._fnt_lveduo_mcLveduo.text=JinkuangModel.computeLveduoMoney(tempVo.moneyTotalProduct).toString();
								
				window._fnt_shouhuo_mcShouhuo.text=tempVo.moneyTotalProduct.toString();
				window._fnt_zhanli.text=tempVo.fightPoint.toString();
				window._pos_item.fillWithBitmapByClassName(Util.getUserImageNameByImageId(tempVo.userImage));
			}
			if(CommonControlFun.checkIfMySelf(tempVo.uid))
			{
				window._mc_shouhuo.visible=true;
				window._mc_luvduo.visible=false;
			}
			else
			{
				window._mc_shouhuo.visible=false;
				window._mc_luvduo.visible=true;
			}
			setCardsShow();
			onTick();
		}
		private function setCardsShow():void
		{
			
		}
		public override function destroy():void
		{
			timerModel.secondTimer_SN.remove(onTick);
			timerModel=null;
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			tempVo=null;
			jinkuangNode=null;
			super.destroy();
		}
	}
}