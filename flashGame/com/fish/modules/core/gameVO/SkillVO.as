package com.fish.modules.core.gameVO
{

	/** 技能数据
	**/
	public class SkillVO extends BaseVo
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
					var old:Number=_id;
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
	 		return _xid;
	 	}

		**/

		{
			if(initFlag){
				if(_xid!=value){
					var old:int=_xid;
					_xid=value;
					onChangeAttr("xid",_xid,old);
				}
			}else{
				_xid=value;
			}
		}

		**/


		**/

	 	{
	 		return _level;
	 	}

		**/

		{
			if(initFlag){
				if(_level!=value){
					var old:int=_level;
					_level=value;
					onChangeAttr("level",_level,old);
				}
			}else{
				_level=value;
			}
		}

		**/


		**/

	 	{
	 		return _heroId;
	 	}

		**/

		{
			if(initFlag){
				if(_heroId!=value){
					var old:int=_heroId;
					_heroId=value;
					onChangeAttr("heroId",_heroId,old);
				}
			}else{
				_heroId=value;
			}
		}

		**/


		**/

	 	{
	 		return _modifyType;
	 	}

		**/

		{
			if(initFlag){
				if(_modifyType!=value){
					var old:int=_modifyType;
					_modifyType=value;
					onChangeAttr("modifyType",_modifyType,old);
				}
			}else{
				_modifyType=value;
			}
		}

		**/


		**/

	 	{
	 		return _posId;
	 	}

		**/

		{
			if(initFlag){
				if(_posId!=value){
					var old:int=_posId;
					_posId=value;
					onChangeAttr("posId",_posId,old);
				}
			}else{
				_posId=value;
			}
		}

		**/


		**/

	 	{
	 		return _exp;
	 	}

		**/

		{
			if(initFlag){
				if(_exp!=value){
					var old:int=_exp;
					_exp=value;
					onChangeAttr("exp",_exp,old);
				}
			}else{
				_exp=value;
			}
		}



}