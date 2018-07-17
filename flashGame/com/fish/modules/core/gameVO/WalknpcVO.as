package com.fish.modules.core.gameVO
{

	/** 擂台成员数据
	**/
	public class WalknpcVO extends BaseVo
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
		public static const Attributes:Array=["uid","userGunId","userImage","userMovieFrame","userColors","userName"];
		public static const KeyAttr:String="uid";
	}
}