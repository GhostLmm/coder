package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class EquipgridVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _gridQiang;
	 	}

		**/

		{
			if(initFlag){
				if(_gridQiang!=value){
					var old:String=_gridQiang;
					_gridQiang=value;
					onChangeAttr("gridQiang",_gridQiang,old);
				}
			}else{
				_gridQiang=value;
			}
		}

		**/


		**/

	 	{
	 		return _gridXing;
	 	}

		**/

		{
			if(initFlag){
				if(_gridXing!=value){
					var old:String=_gridXing;
					_gridXing=value;
					onChangeAttr("gridXing",_gridXing,old);
				}
			}else{
				_gridXing=value;
			}
		}

		**/


		**/

	 	{
	 		return _gridBaoshi;
	 	}

		**/

		{
			if(initFlag){
				if(_gridBaoshi!=value){
					var old:String=_gridBaoshi;
					_gridBaoshi=value;
					onChangeAttr("gridBaoshi",_gridBaoshi,old);
				}
			}else{
				_gridBaoshi=value;
			}
		}

		**/


		**/

	 	{
	 		return _gridRonglian;
	 	}

		**/

		{
			if(initFlag){
				if(_gridRonglian!=value){
					var old:String=_gridRonglian;
					_gridRonglian=value;
					onChangeAttr("gridRonglian",_gridRonglian,old);
				}
			}else{
				_gridRonglian=value;
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


}