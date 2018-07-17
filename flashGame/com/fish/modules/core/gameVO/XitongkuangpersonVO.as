package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class XitongkuangpersonVO extends BaseVo
	{
		/**  主矿占领者
		**/
		private var _mainUserName:String;
		/**  主矿占领者
		**/
		public function get mainUserName():String
	 	{
	 		return _mainUserName;
	 	}
		/**  主矿占领者
		**/
		public function set mainUserName(value:String):void
		{
			if(initFlag){
				if(_mainUserName!=value){
					var old:String=_mainUserName;
					_mainUserName=value;
					onChangeAttr("mainUserName",_mainUserName,old);
				}
			}else{
				_mainUserName=value;
			}
		}
		/**  主矿占领者
		**/
		private var _mainUserId:int;
		/**  主矿占领者
		**/
		public function get mainUserId():int
	 	{
	 		return _mainUserId;
	 	}
		/**  主矿占领者
		**/
		public function set mainUserId(value:int):void
		{
			if(initFlag){
				if(_mainUserId!=value){
					var old:int=_mainUserId;
					_mainUserId=value;
					onChangeAttr("mainUserId",_mainUserId,old);
				}
			}else{
				_mainUserId=value;
			}
		}
		/**  占领时间
		**/
		private var _occupiedTime:Number;
		/**  占领时间
		**/
		public function get occupiedTime():Number
	 	{
	 		return _occupiedTime;
	 	}
		/**  占领时间
		**/
		public function set occupiedTime(value:Number):void
		{
			if(initFlag){
				if(_occupiedTime!=value){
					var old:Number=_occupiedTime;
					_occupiedTime=value;
					onChangeAttr("occupiedTime",_occupiedTime,old);
				}
			}else{
				_occupiedTime=value;
			}
		}
		/**  铜币生成总量
		**/
		private var _moneyTotalProduct:int;
		/**  铜币生成总量
		**/
		public function get moneyTotalProduct():int
	 	{
	 		return _moneyTotalProduct;
	 	}
		/**  铜币生成总量
		**/
		public function set moneyTotalProduct(value:int):void
		{
			if(initFlag){
				if(_moneyTotalProduct!=value){
					var old:int=_moneyTotalProduct;
					_moneyTotalProduct=value;
					onChangeAttr("moneyTotalProduct",_moneyTotalProduct,old);
				}
			}else{
				_moneyTotalProduct=value;
			}
		}
		/**  用户uid
		**/
		private var _uid:int;
		/**  用户uid
		**/
		public function get uid():int
	 	{
	 		return _uid;
	 	}
		/**  用户uid
		**/
		public function set uid(value:int):void
		{
			if(initFlag){
				if(_uid!=value){
					var old:int=_uid;
					_uid=value;
					onChangeAttr("uid",_uid,old);
				}
			}else{
				_uid=value;
			}
		}
		/**  用户名
		**/
		private var _userName:String;
		/**  用户名
		**/
		public function get userName():String
	 	{
	 		return _userName;
	 	}
		/**  用户名
		**/
		public function set userName(value:String):void
		{
			if(initFlag){
				if(_userName!=value){
					var old:String=_userName;
					_userName=value;
					onChangeAttr("userName",_userName,old);
				}
			}else{
				_userName=value;
			}
		}
		/**  用户等级
		**/
		private var _userLevel:int;
		/**  用户等级
		**/
		public function get userLevel():int
	 	{
	 		return _userLevel;
	 	}
		/**  用户等级
		**/
		public function set userLevel(value:int):void
		{
			if(initFlag){
				if(_userLevel!=value){
					var old:int=_userLevel;
					_userLevel=value;
					onChangeAttr("userLevel",_userLevel,old);
				}
			}else{
				_userLevel=value;
			}
		}
		/**  矿的id
		**/
		private var _kuangId:int;
		/**  矿的id
		**/
		public function get kuangId():int
	 	{
	 		return _kuangId;
	 	}
		/**  矿的id
		**/
		public function set kuangId(value:int):void
		{
			if(initFlag){
				if(_kuangId!=value){
					var old:int=_kuangId;
					_kuangId=value;
					onChangeAttr("kuangId",_kuangId,old);
				}
			}else{
				_kuangId=value;
			}
		}
		/**  用户枪id
		**/
		private var _userGunId:int;
		/**  用户枪id
		**/
		public function get userGunId():int
	 	{
	 		return _userGunId;
	 	}
		/**  用户枪id
		**/
		public function set userGunId(value:int):void
		{
			if(initFlag){
				if(_userGunId!=value){
					var old:int=_userGunId;
					_userGunId=value;
					onChangeAttr("userGunId",_userGunId,old);
				}
			}else{
				_userGunId=value;
			}
		}
		/**  用户形象id
		**/
		private var _userImage:int;
		/**  用户形象id
		**/
		public function get userImage():int
	 	{
	 		return _userImage;
	 	}
		/**  用户形象id
		**/
		public function set userImage(value:int):void
		{
			if(initFlag){
				if(_userImage!=value){
					var old:int=_userImage;
					_userImage=value;
					onChangeAttr("userImage",_userImage,old);
				}
			}else{
				_userImage=value;
			}
		}
		/**  用户形象帧
		**/
		private var _userMovieFrame:String;
		/**  用户形象帧
		**/
		public function get userMovieFrame():String
	 	{
	 		return _userMovieFrame;
	 	}
		/**  用户形象帧
		**/
		public function set userMovieFrame(value:String):void
		{
			if(initFlag){
				if(_userMovieFrame!=value){
					var old:String=_userMovieFrame;
					_userMovieFrame=value;
					onChangeAttr("userMovieFrame",_userMovieFrame,old);
				}
			}else{
				_userMovieFrame=value;
			}
		}
		/**  用户形象color
		**/
		private var _userColors:String;
		/**  用户形象color
		**/
		public function get userColors():String
	 	{
	 		return _userColors;
	 	}
		/**  用户形象color
		**/
		public function set userColors(value:String):void
		{
			if(initFlag){
				if(_userColors!=value){
					var old:String=_userColors;
					_userColors=value;
					onChangeAttr("userColors",_userColors,old);
				}
			}else{
				_userColors=value;
			}
		}
		/**  用户战斗力
		**/
		private var _fightPoint:int;
		/**  用户战斗力
		**/
		public function get fightPoint():int
	 	{
	 		return _fightPoint;
	 	}
		/**  用户战斗力
		**/
		public function set fightPoint(value:int):void
		{
			if(initFlag){
				if(_fightPoint!=value){
					var old:int=_fightPoint;
					_fightPoint=value;
					onChangeAttr("fightPoint",_fightPoint,old);
				}
			}else{
				_fightPoint=value;
			}
		}
		public static const Attributes:Array=["mainUserName","mainUserId","occupiedTime","moneyTotalProduct","uid","userName","userLevel","kuangId","userGunId","userImage","userMovieFrame","userColors","fightPoint"];
	}
}