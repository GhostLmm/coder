package com.fish.modules.core.gameVO
{

	/** cdkey 礼包
	**/
	public class CdkeyVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _rewards;
	 	}

		**/

		{
			if(initFlag){
				if(_rewards!=value){
					var old:String=_rewards;
					_rewards=value;
					onChangeAttr("rewards",_rewards,old);
				}
			}else{
				_rewards=value;
			}
		}

		**/


		**/

	 	{
	 		return _name;
	 	}

		**/

		{
			if(initFlag){
				if(_name!=value){
					var old:String=_name;
					_name=value;
					onChangeAttr("name",_name,old);
				}
			}else{
				_name=value;
			}
		}


}