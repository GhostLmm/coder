package com.fish.modules.core.gameVO
{

	/** 装备数据
	**/
	public class EquipVO extends BaseVo
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
	 		return _createTime;
	 	}

		**/

		{
			if(initFlag){
				if(_createTime!=value){
					var old:Number=_createTime;
					_createTime=value;
					onChangeAttr("createTime",_createTime,old);
				}
			}else{
				_createTime=value;
			}
		}

		**/


		**/

	 	{
	 		return _shenzhuangXid;
	 	}

		**/

		{
			if(initFlag){
				if(_shenzhuangXid!=value){
					var old:int=_shenzhuangXid;
					_shenzhuangXid=value;
					onChangeAttr("shenzhuangXid",_shenzhuangXid,old);
				}
			}else{
				_shenzhuangXid=value;
			}
		}

		**/


		**/

	 	{
	 		return _shenzhuangExp;
	 	}

		**/

		{
			if(initFlag){
				if(_shenzhuangExp!=value){
					var old:int=_shenzhuangExp;
					_shenzhuangExp=value;
					onChangeAttr("shenzhuangExp",_shenzhuangExp,old);
				}
			}else{
				_shenzhuangExp=value;
			}
		}



}