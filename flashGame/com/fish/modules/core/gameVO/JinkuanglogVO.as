package com.fish.modules.core.gameVO
{

	/** 金矿记录
	**/
	public class JinkuanglogVO extends BaseVo
	{
		/**  记录的唯一id
		**/
		private var _id:int;
		/**  记录的唯一id
		**/
		public function get id():int
	 	{
	 		return _id;
	 	}
		/**  记录的唯一id
		**/
		public function set id(value:int):void
		{
			if(initFlag){
				if(_id!=value){
					var old:int=_id;
					_id=value;
					onChangeAttr("id",_id,old);
				}
			}else{
				_id=value;
			}
		}
		/**  时间
		**/
		private var _time:Number;
		/**  时间
		**/
		public function get time():Number
	 	{
	 		return _time;
	 	}
		/**  时间
		**/
		public function set time(value:Number):void
		{
			if(initFlag){
				if(_time!=value){
					var old:Number=_time;
					_time=value;
					onChangeAttr("time",_time,old);
				}
			}else{
				_time=value;
			}
		}
		/**  
		**/
		private var _userName:String;
		/**  
		**/
		public function get userName():String
	 	{
	 		return _userName;
	 	}
		/**  
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
		/**  
		**/
		private var _type:int;
		/**  
		**/
		public function get type():int
	 	{
	 		return _type;
	 	}
		/**  
		**/
		public function set type(value:int):void
		{
			if(initFlag){
				if(_type!=value){
					var old:int=_type;
					_type=value;
					onChangeAttr("type",_type,old);
				}
			}else{
				_type=value;
			}
		}
		/**  
		**/
		private var _money:int;
		/**  
		**/
		public function get money():int
	 	{
	 		return _money;
	 	}
		/**  
		**/
		public function set money(value:int):void
		{
			if(initFlag){
				if(_money!=value){
					var old:int=_money;
					_money=value;
					onChangeAttr("money",_money,old);
				}
			}else{
				_money=value;
			}
		}
		/**  损失的铜钱数
		**/
		private var _lostMoney:int;
		/**  损失的铜钱数
		**/
		public function get lostMoney():int
	 	{
	 		return _lostMoney;
	 	}
		/**  损失的铜钱数
		**/
		public function set lostMoney(value:int):void
		{
			if(initFlag){
				if(_lostMoney!=value){
					var old:int=_lostMoney;
					_lostMoney=value;
					onChangeAttr("lostMoney",_lostMoney,old);
				}
			}else{
				_lostMoney=value;
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
		public static const Attributes:Array=["id","time","userName","type","money","lostMoney","userImage","userMovieFrame","userColors","fightPoint","userGunId"];
		public static const KeyAttr:String="id";
	}
}