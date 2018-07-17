package ui.jinkuang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.XitongkuangpersonVO;
	import com.fish.modules.core.models.FriendModel;
	import com.fish.modules.core.models.JinkuangModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_jinkuang;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_JinkuangNoOccupied extends Mediator
	{
		[Inject]
		public var window:JinkuangNoOccupiedWindow;
		
		public function MDI_JinkuangNoOccupied()
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
		private var jinkuangNode:Node_jinkuang;
		private var tempVo:XitongkuangpersonVO;
		private function initModule():void
		{
			tempVo=GameVOManager.getInstance().xitongkuangperson;
			jinkuangNode=XMLDataManager.Node_jinkuangDic[tempVo.kuangId];
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_fushu,TqtEvent.BUTTON_CLICK,onFushuClicked);
			addViewListener(window._btn_haoyou,TqtEvent.BUTTON_CLICK,onHaoyouClicked);
			addViewListener(window._btn_zhanling,TqtEvent.BUTTON_CLICK,onZhanlingClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_AddFriendHandler)
			{
				if(_code>0)
				{
					Util.flow("添加好友成功");
					setShow();
				}
			}
			else if(_msgType==C2SEmitter.REQ_FushuKuangHandler)
			{
				if(_code==JinkuangModel.MASTER_NOT_YOUR_FRIEND)
				{
					Util.flow("矿主不是你的好友，不能附属");
				}
				else if(_code==JinkuangModel.YOUR_NOT_MASTER_FRIEND)
				{
					Util.flow("你不是矿主的好友，不能附属");
				}
				else if(_code==1)
				{
					Util.flow("附属成功");
					window.close();
				}
				else if(_code==JinkuangModel.SELF_CANNT_FUSHU)
				{
					Util.flow("不能附属自己");
					window.close();
				}
				else if(_code==JinkuangModel.MASTER_KUANG_NO_PEPOLE)
				{
					Util.flow("主矿没人，不能附属");
				}
				else if(_code==JinkuangModel.SLAVE_KUANG_HAS_PEPOLE)
				{
					Util.flow("附属已经有人了,不能附属");
				}
			}
		}
		private function onFushuClicked(evt:Event):void
		{ 
			if(null==jinkuangNode)
			{
				return;
			}
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			if(jinkuangModel.checkIfIhaveKuang())
			{
				JinkuangModel.isMyKuangDo(confirmFushu);
			}
			else
			{
				confirmFushu();
			}
		}
		private function confirmFushu():void
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.vipLevel>=jinkuangNode.vip_limit)
			{
				C2SEmitter.fushuKuang(jinkuangNode.id,jinkuangNode.type);
			}
			else
			{
				Util.flow("需要vip等级",jinkuangNode.vip_limit);
			}
		}
		private function onHaoyouClicked(evt:Event):void
		{
			if(null==tempVo)
			{
				return;
			}
			if((null!=tempVo.mainUserName)&&(tempVo.mainUserName!=""))
			{
				CommonControlFun.addFriend(tempVo.mainUserName);
			}
		}
		private function onZhanlingClicked(evt:Event):void
		{
			if(null==jinkuangNode)
			{
				return;
			}
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			if(jinkuangModel.checkIfIhaveKuang())
			{
				JinkuangModel.isMyKuangDo(confirmZhanling);
			}
			else
			{
				confirmZhanling();
			}
		
		}
		private function confirmZhanling():void
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.vipLevel>=jinkuangNode.vip_limit)
			{
				JinkuangModel.occupyJinkuang(jinkuangNode.id,jinkuangNode.type);
			}
			else
			{
				Util.flow("需要vip等级",jinkuangNode.vip_limit);
			}	
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			if(null!=jinkuangNode)
			{
				window._fnt_name.text=jinkuangNode.name;
				window._fnt_chanliang.text=jinkuangNode.chanliang.toString();
				window._fnt_vip_limit.text=jinkuangNode.vip_limit.toString();
				if(jinkuangNode.vip_limit>0)
				{
					window._mc_vip.visible=true;
				}
				else
				{
					window._mc_vip.visible=false;
				}
			}
			if(null!=tempVo)
			{
				if(tempVo.mainUserId>0)
				{
					window._fnt_mainUserName.text=tempVo.mainUserName;
					var friendModel:FriendModel=Context.getInjectInstance(FriendModel);
					if(friendModel.checkIfisFriend(tempVo.mainUserName)||(CommonControlFun.checkIfMySelf(tempVo.mainUserId)))
					{
						window._btn_haoyou.visible=false;
					}
					else
					{
						window._btn_haoyou.visible=true;
					}
				}
				else
				{
					window._fnt_mainUserName.text=Util.getLanguage("无人占领");
					window._btn_haoyou.visible=false;
				}
			}
			if(JinkuangModel.checkIfIsAssistJinkuang(jinkuangNode.id))
			{
				if(tempVo.mainUserId>0)
				{
					window._mc_user.visible=true;
				}
				else
				{
					window._mc_user.visible=false;
				}					
				window._btn_fushu.visible=true;
				window._btn_zhanling.visible=false;
			}
			else
			{
				window._mc_user.visible=false;
				window._btn_fushu.visible=false;
				window._btn_zhanling.visible=true;
			}
			
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			tempVo=null;
			jinkuangNode=null;
			super.destroy();
		}
	}
}