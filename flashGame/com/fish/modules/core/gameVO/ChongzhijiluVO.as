package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class ChongzhijiluVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _id;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _userChongzhi;
	 	}

		**/

		{
			if(initFlag){
				if(_userChongzhi!=value){
					var old:String=_userChongzhi;
					_userChongzhi=value;
					onChangeAttr("userChongzhi",_userChongzhi,old);
				}
			}else{
				_userChongzhi=value;
			}
		}

		**/


		**/

	 	{
	 		return _chonghziCash;
	 	}

		**/

		{
			if(initFlag){
				if(_chonghziCash!=value){
					var old:int=_chonghziCash;
					_chonghziCash=value;
					onChangeAttr("chonghziCash",_chonghziCash,old);
				}
			}else{
				_chonghziCash=value;
			}
		}



}