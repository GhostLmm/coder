package Tool.account
{
	import com.fish.GLBaseData;
	import com.ghostlmm.tool.HttpRequest;
	import com.ghostlmm.xmldata.Node_hero;
	import com.ghostlmm.xmldata.Node_monster_type;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import Tool.platform.PlatformManager;
	
	import org.osflash.signals.Signal;
	
	import util.Util;
	
	import view.commontools.ServerListManager;

	public class AccountControl
	{
		
		public static const   HERO_IDS:String = "heroIds";
		public static const   MOVIE_FRAME:String = "movieFrame";
		public static const   COLORS:String = "colors";
		public static const   IMAGEID:String = "imageId";
		public static const   USER_NAME:String="un";
		public static const   USER_ZONE:String="sid";
		public static const   IP:String="ip";
		public static const   ACCOUNT_ID:String = "aid";
		
		private static var _instance:AccountControl;
		public static function getInstance():AccountControl
		{
			if(_instance==null) _instance=new AccountControl();
			return _instance;
		}
				
		
		public var accountLogin_SN:Signal;
		public var gameLogin_SN:Signal;

		public var loginStep_SN:Signal;
		
		public static const USER_NAME_CONFLICT:int = -1005;
		
		public static const Login_Step_Account_Complete:String="Login_Step_Account_Complete";
		public static const Login_Step_Account_Error:String="Login_Step_Account_Error";
		public static const Login_Step_Name_Complete:String="Login_Step_Name_Complete";	
		public static const Login_Step_Name_Error:String="Login_Step_Name_Error";
		public static const Login_Step_Role_Complete:String="Login_Step_Role_Complete";
		public static const Login_Step_ChooseServer:String="Login_Step_ChooseServer";
		
		public function AccountControl()
		{
			accountLogin_SN=new Signal(Boolean,Object);
			gameLogin_SN=new Signal(Boolean,Object);
			loginStep_SN=new Signal(String);			
		}		
		public function nameGame(_name:String):void
		{
			var postObj:Object={};
			postObj["op"]="registeruser";
			postObj["aid"]=GLBaseData.accountId;;
			postObj["sid"]=GLBaseData.serverId;
			postObj["un"]=encodeURI(_name);
			HttpRequest.getInstance().postRequest(UrlConfig.accountServerUrl,postObj,onNameCallBack,60000,false,"text",true);	
		}
		private function onNameCallBack(_data:String):void
		{
			var tempData:Object=JSON.parse(_data);
			var resultCode:int=int(tempData["result"]);
			if(resultCode>0)
			{
				GLBaseData.userName=tempData["un"];
				var authorKey:String=tempData["ak"];
				GLBaseData.author=authorKey;
				loginStep_SN.dispatch(Login_Step_Name_Complete);
			}
			else
			{
				Util.flow("命名出错，请重新命名");
			}
		}
		public function chooseHero(_node:Node_hero):void
		{
			var postObj:Object={};
			postObj["op"]="inituser";
			postObj["aid"]=GLBaseData.accountId;
			postObj["sid"]=GLBaseData.serverId;
			postObj["un"]=encodeURI(GLBaseData.userName);
			postObj["heroIds"]=_node.id;
			var typeNode:Node_monster_type=XMLDataManager.getMonster_typeById(_node.imageType);
			postObj["movieFrame"]=typeNode.movie_frame;
			postObj["colors"]=typeNode.colors;
			HttpRequest.getInstance().postRequest(UrlConfig.accountServerUrl,postObj,onChooseCardCallBack,60000,false,"text",true);
		}
		
		public function createPlayer(name:String,node:Node_hero):void{
			var postObj:Object={};
			postObj["op"]="create";
			postObj["aid"]=GLBaseData.accountId;
			postObj["sid"]=GLBaseData.serverId;
			postObj["un"]=encodeURI(name);
			postObj["heroIds"]=node.id;
			var typeNode:Node_monster_type=XMLDataManager.getMonster_typeById(node.imageType);
			postObj["movieFrame"]=typeNode.movie_frame;
			postObj["colors"]=typeNode.colors;
			postObj["imageId"]=node.id;
			HttpRequest.getInstance().postRequest(UrlConfig.accountServerUrl,postObj,onCreatePlayerCom,60000,false,"text",true);
		}
		
		private function onCreatePlayerCom(_data:String):void{
			var tempData:Object=JSON.parse(_data);
			var resultCode:int=int(tempData["result"]);
			if(!tempData.hasOwnProperty("result")){
				Util.flow("网络连接错误，请检查网络连接是否正常");
				return ;
			}
			if(resultCode>0)
			{
				GLBaseData.userName=tempData["un"];
				var authorKey:String=tempData["ak"];
				GLBaseData.userId=tempData["id"];
				var authorKey:String=tempData["ak"];
				loginStep_SN.dispatch(Login_Step_Role_Complete);
				try{
					//					(userId:String,userName:String,zoneId:String,zoneName:String)
					
					(PlatformManager.getInstance().platformObj as Object).logCreateRole(GLBaseData.userId,GLBaseData.userName,
						GLBaseData.serverId,ServerListManager.getInstance().getServerDataById(int(GLBaseData.serverId)).zoneName);
				}catch(e:Error){}
			}else{
				if(resultCode==USER_NAME_CONFLICT){
					Util.flow("命名出错，请重新命名");
				}else{
					Util.flow("选择英雄出错");
				}
			}
		}
		
		
		private function onChooseCardCallBack(_data:String):void
		{
			var tempData:Object=JSON.parse(_data);
			var resultCode:int=int(tempData["result"]);
			if(resultCode>0)
			{
				GLBaseData.userId=tempData["id"];
				var authorKey:String=tempData["ak"];
				GLBaseData.author=authorKey;
				
				try{
//					(userId:String,userName:String,zoneId:String,zoneName:String)
					
					(PlatformManager.getInstance().platformObj as Object).logCreateRole(GLBaseData.userId,GLBaseData.userName,
						GLBaseData.serverId,ServerListManager.getInstance().getServerDataById(int(GLBaseData.serverId)).zoneName);
				}catch(e:Error){}
				
				loginStep_SN.dispatch(Login_Step_Role_Complete);
			}
			else
			{
				Util.flow("选择卡牌出错");
			}
		}
		public function setServerId(_serverId:int):void
		{
			GLBaseData.serverId=_serverId.toString();
			loginStep_SN.dispatch(Login_Step_ChooseServer);
		}
	}
}