package com.fish.modules.core.gameVO
{

	/** 战斗力排行榜数据
	**/
	public class ZhanlirankVO extends BaseVo
	{
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
		/**  排名
		**/
		private var _rank:int;
		/**  排名
		**/
		public function get rank():int
	 	{
	 		return _rank;
	 	}
		/**  排名
		**/
		public function set rank(value:int):void
		{
			if(initFlag){
				if(_rank!=value){
					var old:int=_rank;
					_rank=value;
					onChangeAttr("rank",_rank,old);
				}
			}else{
				_rank=value;
			}
		}
		/**  崇拜次数
		**/
		private var _chongbaiCount:int;
		/**  崇拜次数
		**/
		public function get chongbaiCount():int
	 	{
	 		return _chongbaiCount;
	 	}
		/**  崇拜次数
		**/
		public function set chongbaiCount(value:int):void
		{
			if(initFlag){
				if(_chongbaiCount!=value){
					var old:int=_chongbaiCount;
					_chongbaiCount=value;
					onChangeAttr("chongbaiCount",_chongbaiCount,old);
				}
			}else{
				_chongbaiCount=value;
			}
		}
		/**  战斗力
		**/
		private var _zhandouli:int;
		/**  战斗力
		**/
		public function get zhandouli():int
	 	{
	 		return _zhandouli;
	 	}
		/**  战斗力
		**/
		public function set zhandouli(value:int):void
		{
			if(initFlag){
				if(_zhandouli!=value){
					var old:int=_zhandouli;
					_zhandouli=value;
					onChangeAttr("zhandouli",_zhandouli,old);
				}
			}else{
				_zhandouli=value;
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
		public static const Attributes:Array=["uid","userName","userLevel","rank","chongbaiCount","zhandouli","userGunId","userImage","userMovieFrame","userColors"];
		public static const KeyAttr:String="uid";
	}
}