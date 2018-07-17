package ui.tongzhi
{
	import Tool.platform.PlatformManager;
	
	import com.fish.modules.core.gameVO.TongzhiVO;
	import com.ghostlmm.xmldata.Node_xitonggonggao;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import util.Util;

	public class TongzhiData
	{
		public var xid:int;
		public var id:Number;
		public var message:String;
		public var type:int;
		public function TongzhiData(_data:TongzhiVO)
		{
			xid=_data.xid;
			id=_data.id;
			type=XMLDataManager.getXitonggonggaoById(xid).type;
			message=convertMessage(_data);
		}
		private function convertMessage(_data:TongzhiVO):String
		{
			var result:String;
			var node:Node_xitonggonggao=XMLDataManager.getXitonggonggaoById(_data.xid);
			var xmlStr:String=node.desc;
			var paramArray:Array=JSON.parse(_data.args) as Array;
			var paramConfig:Array=JSON.parse(node.param) as Array;
			paramArray=paramConvert(paramConfig,paramArray);
			var index:int;
			for(index=0;index<paramArray.length;index++)
			{
				var param:String=paramArray[index];
				xmlStr=xmlStr.replace("#V"+(index+1)+"#",param);
			}
			result=xmlStr;
			
			//替换qq群号
			if(_data.xid==Type_QQ){
				result=Util.stringFormat(result,PlatformManager.getInstance().getFuliQQ());
			}
			
			
			return result;
		}
		public static const Type_Fix:String="fix";
		public static const Type_Equip:String="equip";
		public static const Type_QQ:int=5;
		private function paramConvert(_paramConfig:Array,_paramArray:Array):Array
		{
			var result:Array=[];
			var index:int;
			for(index=0;index<_paramArray.length;index++)
			{
				var config:String=_paramConfig[index] as String;
				var param:String;
				switch(config)
				{
					case Type_Equip:
						param=XMLDataManager.getEquipById(int(_paramArray[index])).name;
						break;
					case Type_Fix:
					default:
						param=_paramArray[index];
				}
				result.push(param);
			}
			return result;
		}
	}
}