package com.fish.modules.core.gameVO
{

	/** 故事数据
	**/
	public class HeroimageVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _userMovieFrame;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _userColors;
	 	}

		**/

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


}