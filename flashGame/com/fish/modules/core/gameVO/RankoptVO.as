package com.fish.modules.core.gameVO
{

	/** 崇拜和鄙视数据
	**/
	public class RankoptVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _levelChongbai;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _leitaiChongbai;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _tuhaoChongbai;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _lianshenChongbai;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _tuhaoBishi;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _isHide;
	 	}

		**/

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


}