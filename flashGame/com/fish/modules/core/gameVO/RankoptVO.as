package com.fish.modules.core.gameVO
{

	/** 崇拜和鄙视数据
	**/
	public class RankoptVO extends BaseVo
	{
		/**  等级崇拜json
		**/
		private var _levelChongbai:String;
		/**  等级崇拜json
		**/
		public function get levelChongbai():String
	 	{
	 		return _levelChongbai;
	 	}
		/**  等级崇拜json
		**/
		public function set levelChongbai(value:String):void
		{
			if(initFlag){
				if(_levelChongbai!=value){
					var old:String=_levelChongbai;
					_levelChongbai=value;
					onChangeAttr("levelChongbai",_levelChongbai,old);
				}
			}else{
				_levelChongbai=value;
			}
		}
		/**  擂台崇拜json
		**/
		private var _leitaiChongbai:String;
		/**  擂台崇拜json
		**/
		public function get leitaiChongbai():String
	 	{
	 		return _leitaiChongbai;
	 	}
		/**  擂台崇拜json
		**/
		public function set leitaiChongbai(value:String):void
		{
			if(initFlag){
				if(_leitaiChongbai!=value){
					var old:String=_leitaiChongbai;
					_leitaiChongbai=value;
					onChangeAttr("leitaiChongbai",_leitaiChongbai,old);
				}
			}else{
				_leitaiChongbai=value;
			}
		}
		/**  土豪崇拜json
		**/
		private var _tuhaoChongbai:String;
		/**  土豪崇拜json
		**/
		public function get tuhaoChongbai():String
	 	{
	 		return _tuhaoChongbai;
	 	}
		/**  土豪崇拜json
		**/
		public function set tuhaoChongbai(value:String):void
		{
			if(initFlag){
				if(_tuhaoChongbai!=value){
					var old:String=_tuhaoChongbai;
					_tuhaoChongbai=value;
					onChangeAttr("tuhaoChongbai",_tuhaoChongbai,old);
				}
			}else{
				_tuhaoChongbai=value;
			}
		}
		/**  连胜崇拜json
		**/
		private var _lianshenChongbai:String;
		/**  连胜崇拜json
		**/
		public function get lianshenChongbai():String
	 	{
	 		return _lianshenChongbai;
	 	}
		/**  连胜崇拜json
		**/
		public function set lianshenChongbai(value:String):void
		{
			if(initFlag){
				if(_lianshenChongbai!=value){
					var old:String=_lianshenChongbai;
					_lianshenChongbai=value;
					onChangeAttr("lianshenChongbai",_lianshenChongbai,old);
				}
			}else{
				_lianshenChongbai=value;
			}
		}
		/**  土豪崇拜json
		**/
		private var _tuhaoBishi:String;
		/**  土豪崇拜json
		**/
		public function get tuhaoBishi():String
	 	{
	 		return _tuhaoBishi;
	 	}
		/**  土豪崇拜json
		**/
		public function set tuhaoBishi(value:String):void
		{
			if(initFlag){
				if(_tuhaoBishi!=value){
					var old:String=_tuhaoBishi;
					_tuhaoBishi=value;
					onChangeAttr("tuhaoBishi",_tuhaoBishi,old);
				}
			}else{
				_tuhaoBishi=value;
			}
		}
		/**  1隐藏0不隐藏
		**/
		private var _isHide:int;
		/**  1隐藏0不隐藏
		**/
		public function get isHide():int
	 	{
	 		return _isHide;
	 	}
		/**  1隐藏0不隐藏
		**/
		public function set isHide(value:int):void
		{
			if(initFlag){
				if(_isHide!=value){
					var old:int=_isHide;
					_isHide=value;
					onChangeAttr("isHide",_isHide,old);
				}
			}else{
				_isHide=value;
			}
		}
		public static const Attributes:Array=["levelChongbai","leitaiChongbai","tuhaoChongbai","lianshenChongbai","tuhaoBishi","isHide"];
	}
}