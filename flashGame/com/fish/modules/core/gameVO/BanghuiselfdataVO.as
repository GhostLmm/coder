package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class BanghuiselfdataVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _hisGongxian;
	 	}

		**/

		{
			if(initFlag){
				if(_hisGongxian!=value){
					var old:int=_hisGongxian;
					_hisGongxian=value;
					onChangeAttr("hisGongxian",_hisGongxian,old);
				}
			}else{
				_hisGongxian=value;
			}
		}

		**/


		**/

	 	{
	 		return _curGongxian;
	 	}

		**/

		{
			if(initFlag){
				if(_curGongxian!=value){
					var old:int=_curGongxian;
					_curGongxian=value;
					onChangeAttr("curGongxian",_curGongxian,old);
				}
			}else{
				_curGongxian=value;
			}
		}

		**/


		**/

	 	{
	 		return _shengqingList;
	 	}

		**/

		{
			if(initFlag){
				if(_shengqingList!=value){
					var old:String=_shengqingList;
					_shengqingList=value;
					onChangeAttr("shengqingList",_shengqingList,old);
				}
			}else{
				_shengqingList=value;
			}
		}

		**/


		**/

	 	{
	 		return _bid;
	 	}

		**/

		{
			if(initFlag){
				if(_bid!=value){
					var old:int=_bid;
					_bid=value;
					onChangeAttr("bid",_bid,old);
				}
			}else{
				_bid=value;
			}
		}

		**/


		**/

	 	{
	 		return _banghuiDaoju;
	 	}

		**/

		{
			if(initFlag){
				if(_banghuiDaoju!=value){
					var old:String=_banghuiDaoju;
					_banghuiDaoju=value;
					onChangeAttr("banghuiDaoju",_banghuiDaoju,old);
				}
			}else{
				_banghuiDaoju=value;
			}
		}

		**/


		**/

	 	{
	 		return _juanxian;
	 	}

		**/

		{
			if(initFlag){
				if(_juanxian!=value){
					var old:int=_juanxian;
					_juanxian=value;
					onChangeAttr("juanxian",_juanxian,old);
				}
			}else{
				_juanxian=value;
			}
		}

		**/


		**/

	 	{
	 		return _canbaiCount;
	 	}

		**/

		{
			if(initFlag){
				if(_canbaiCount!=value){
					var old:int=_canbaiCount;
					_canbaiCount=value;
					onChangeAttr("canbaiCount",_canbaiCount,old);
				}
			}else{
				_canbaiCount=value;
			}
		}

		**/


		**/

	 	{
	 		return _hasChuzhan;
	 	}

		**/

		{
			if(initFlag){
				if(_hasChuzhan!=value){
					var old:int=_hasChuzhan;
					_hasChuzhan=value;
					onChangeAttr("hasChuzhan",_hasChuzhan,old);
				}
			}else{
				_hasChuzhan=value;
			}
		}


}