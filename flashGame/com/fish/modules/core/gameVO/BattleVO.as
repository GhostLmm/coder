package com.fish.modules.core.gameVO
{

	/** 战斗数据
	**/
	public class BattleVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _gongjiUserid;
	 	}

		**/

		{
			if(initFlag){
				if(_gongjiUserid!=value){
					var old:int=_gongjiUserid;
					_gongjiUserid=value;
					onChangeAttr("gongjiUserid",_gongjiUserid,old);
				}
			}else{
				_gongjiUserid=value;
			}
		}

		**/


		**/

	 	{
	 		return _fangyuUserid;
	 	}

		**/

		{
			if(initFlag){
				if(_fangyuUserid!=value){
					var old:int=_fangyuUserid;
					_fangyuUserid=value;
					onChangeAttr("fangyuUserid",_fangyuUserid,old);
				}
			}else{
				_fangyuUserid=value;
			}
		}

		**/


		**/

	 	{
	 		return _winUserid;
	 	}

		**/

		{
			if(initFlag){
				if(_winUserid!=value){
					var old:int=_winUserid;
					_winUserid=value;
					onChangeAttr("winUserid",_winUserid,old);
				}
			}else{
				_winUserid=value;
			}
		}



}