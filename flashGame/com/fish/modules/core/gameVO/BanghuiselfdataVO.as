package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class BanghuiselfdataVO extends BaseVo
	{
		/**  历史贡献
		**/
		private var _hisGongxian:int;
		/**  历史贡献
		**/
		public function get hisGongxian():int
	 	{
	 		return _hisGongxian;
	 	}
		/**  历史贡献
		**/
		public function set hisGongxian(value:int):void
		{
			if(initFlag){
				if(_hisGongxian!=value){
					var old:int=_hisGongxian;
					_hisGongxian=value;
					onChangeAttr("hisGongxian",_hisGongxian,old);
				}
			}else{
				_hisGongxian=value;
			}
		}
		/**  当前贡献
		**/
		private var _curGongxian:int;
		/**  当前贡献
		**/
		public function get curGongxian():int
	 	{
	 		return _curGongxian;
	 	}
		/**  当前贡献
		**/
		public function set curGongxian(value:int):void
		{
			if(initFlag){
				if(_curGongxian!=value){
					var old:int=_curGongxian;
					_curGongxian=value;
					onChangeAttr("curGongxian",_curGongxian,old);
				}
			}else{
				_curGongxian=value;
			}
		}
		/**  申请 json
		**/
		private var _shengqingList:String;
		/**  申请 json
		**/
		public function get shengqingList():String
	 	{
	 		return _shengqingList;
	 	}
		/**  申请 json
		**/
		public function set shengqingList(value:String):void
		{
			if(initFlag){
				if(_shengqingList!=value){
					var old:String=_shengqingList;
					_shengqingList=value;
					onChangeAttr("shengqingList",_shengqingList,old);
				}
			}else{
				_shengqingList=value;
			}
		}
		/**  公会id
		**/
		private var _bid:int;
		/**  公会id
		**/
		public function get bid():int
	 	{
	 		return _bid;
	 	}
		/**  公会id
		**/
		public function set bid(value:int):void
		{
			if(initFlag){
				if(_bid!=value){
					var old:int=_bid;
					_bid=value;
					onChangeAttr("bid",_bid,old);
				}
			}else{
				_bid=value;
			}
		}
		/**  帮会道具 json
		**/
		private var _banghuiDaoju:String;
		/**  帮会道具 json
		**/
		public function get banghuiDaoju():String
	 	{
	 		return _banghuiDaoju;
	 	}
		/**  帮会道具 json
		**/
		public function set banghuiDaoju(value:String):void
		{
			if(initFlag){
				if(_banghuiDaoju!=value){
					var old:String=_banghuiDaoju;
					_banghuiDaoju=value;
					onChangeAttr("banghuiDaoju",_banghuiDaoju,old);
				}
			}else{
				_banghuiDaoju=value;
			}
		}
		/**  是否捐献 0未捐
		**/
		private var _juanxian:int;
		/**  是否捐献 0未捐
		**/
		public function get juanxian():int
	 	{
	 		return _juanxian;
	 	}
		/**  是否捐献 0未捐
		**/
		public function set juanxian(value:int):void
		{
			if(initFlag){
				if(_juanxian!=value){
					var old:int=_juanxian;
					_juanxian=value;
					onChangeAttr("juanxian",_juanxian,old);
				}
			}else{
				_juanxian=value;
			}
		}
		/**  捐献次数
		**/
		private var _canbaiCount:int;
		/**  捐献次数
		**/
		public function get canbaiCount():int
	 	{
	 		return _canbaiCount;
	 	}
		/**  捐献次数
		**/
		public function set canbaiCount(value:int):void
		{
			if(initFlag){
				if(_canbaiCount!=value){
					var old:int=_canbaiCount;
					_canbaiCount=value;
					onChangeAttr("canbaiCount",_canbaiCount,old);
				}
			}else{
				_canbaiCount=value;
			}
		}
		/**  是否已经出战
		**/
		private var _hasChuzhan:int;
		/**  是否已经出战
		**/
		public function get hasChuzhan():int
	 	{
	 		return _hasChuzhan;
	 	}
		/**  是否已经出战
		**/
		public function set hasChuzhan(value:int):void
		{
			if(initFlag){
				if(_hasChuzhan!=value){
					var old:int=_hasChuzhan;
					_hasChuzhan=value;
					onChangeAttr("hasChuzhan",_hasChuzhan,old);
				}
			}else{
				_hasChuzhan=value;
			}
		}
		public static const Attributes:Array=["hisGongxian","curGongxian","shengqingList","bid","banghuiDaoju","juanxian","canbaiCount","hasChuzhan"];
	}
}