package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class BattleinfoVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _heroHp;
	 	}

		**/

		{
			if(initFlag){
				if(_heroHp!=value){
					var old:int=_heroHp;
					_heroHp=value;
					onChangeAttr("heroHp",_heroHp,old);
				}
			}else{
				_heroHp=value;
			}
		}

		**/


		**/

	 	{
	 		return _skillAvailable;
	 	}

		**/

		{
			if(initFlag){
				if(_skillAvailable!=value){
					var old:String=_skillAvailable;
					_skillAvailable=value;
					onChangeAttr("skillAvailable",_skillAvailable,old);
				}
			}else{
				_skillAvailable=value;
			}
		}

		**/


		**/

	 	{
	 		return _skillCD;
	 	}

		**/

		{
			if(initFlag){
				if(_skillCD!=value){
					var old:String=_skillCD;
					_skillCD=value;
					onChangeAttr("skillCD",_skillCD,old);
				}
			}else{
				_skillCD=value;
			}
		}


}