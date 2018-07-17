package com.fish.modules.core.gameVO
{

	/** 故事数据
	**/
	public class HeroimageVO extends BaseVo
	{
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
		public static const Attributes:Array=["userMovieFrame","userColors"];
	}
}