package view.login
{
	import com.fish.GLBaseData;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import Tool.login.LoginUIControl;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.widget.ScrollerControllerMatrix;
	
	import view.Base_Mc;
	import view.item.Item_Xuanqu_Login;

	public class MC_XuanquWindow extends Base_Mc
	{
		private var _pos_scroll_v_xuanqu:Position;
		private var _pos_zuijin_xuanqu:Position;
		private var _scrollController:ScrollerControllerMatrix;
		private var _btn_close:Button;
		
		public function MC_XuanquWindow()
		{
			super();
			
		}
		protected override function initModule():void
		{
			x=GlobalRef.width/2;
			y=GlobalRef.height/2;
			_pos_scroll_v_xuanqu = new Position(mcMaterial.pos_scroll_v_xuanqu);
			_scrollController = new ScrollerControllerMatrix(_pos_scroll_v_xuanqu);
//			_pos_scroll_v_xuanqu.removeChildren();
//			_pos_scroll_v_xuanqu.addChild(_scrollController);
			_pos_zuijin_xuanqu = new Position(mcMaterial.pos_zuijin_xuanqu);
			_scrollController.initClass(MC_Server);
			_btn_close=new Button(mcMaterial.btn_close);
		}
		
		
		
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			setShow();
		}
		private function onCloseClicked(evt:Event):void
		{
			LoginUIControl.getInstance().uiMessage_SN.dispatch(LoginUIControl.UI_MSG_CloseXuanqu);
		}
		private function destoryMc():void
		{
			if(_pos_scroll_v_xuanqu){_pos_scroll_v_xuanqu.destory();_pos_scroll_v_xuanqu=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			if(_pos_zuijin_xuanqu){_pos_zuijin_xuanqu.destory();_pos_zuijin_xuanqu=null;};
			if(_btn_close){_btn_close.destory();_btn_close=null;};
		}

		protected override function setShow():void
		{
			setServersShow();
			setRecentServersShow();
		}
		private static const PerRowNum:int=2;
		private function setServersShow():void
		{
			var serverArray:Array=GLBaseData.serverList;
			var itemDataArray:Array=[];
			var serverNum:int=serverArray.length;
			var index:int;
			for(index=0;index<Math.ceil(serverNum/PerRowNum);index++)
			{
				var itemData:Object={};
				if(index*PerRowNum<serverNum)
				{
					var serverInfo1:Object=serverArray[index*PerRowNum];
					itemData["1"]=serverInfo1;
					
				}
				if(index*PerRowNum+1<serverNum)
				{
					var serverInfo2:Object=serverArray[index*PerRowNum+1];
					itemData["2"]=serverInfo2;
				}
				
			}
			_scrollController.setData(serverArray);
		}
		private var recentServer:MC_Server;;
		private function setRecentServersShow():void
		{
			if((GLBaseData.LastServerId)&&(0!=int(GLBaseData.LastServerId)))
			{trace(GLBaseData.LastServerId);
				var recentServerInfo:Object;
				var serverArray:Array=GLBaseData.serverList;
				var index:int;
				for (index=0;index<serverArray.length;index++)
				{
					var serverInfo:Object=serverArray[index];
					if(serverInfo.zoneId==GLBaseData.LastServerId)
					{
						recentServerInfo=serverInfo;
						break;
					}
				}
				if(null!=recentServerInfo)
				{
//					var param:Object={};
//					param["1"]=recentServerInfo;
//					recentServer=new Item_Xuanqu_Login();
//					recentServer.loadData(param);
					recentServer=new MC_Server();
					recentServer.loadData(recentServerInfo);
					_pos_zuijin_xuanqu.fillWithObject(recentServer,false);
				}
			}		
		}
		public override function destory():void
		{
			if(_scrollController){
				_scrollController.destory();
				_scrollController=null;
			}
			
			if(recentServer)
			{
				recentServer.destory();
				recentServer=null;
			}
			destoryMc();
			super.destory();
		}
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("SceneXuanqu") as Class); 
		}
		private function get mcMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		protected override function isNeedBlock():Boolean
		{
			return true;
		}
		protected override function isBlockMiddle():Boolean{
			return true;
		}
	}
}
