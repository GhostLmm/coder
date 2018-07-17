package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.utils.Dictionary;
	
	import util.Util;

	public class EquipPingzhi
	{
		public function EquipPingzhi()
		{
		}
		
		public var name:String;
		public var color:uint;
		public var star:int;
		
		public static function get pingzhiArray():Array{
			if(_pingzhiArray==null){
				initEquipPingzhi();
			}
			return _pingzhiArray;
		}
		
		public static function get pingzhiDic():Dictionary{
			if(_pingzhiDic==null){
				initEquipPingzhi();
			}
			return _pingzhiDic;
		}
		
		public static const TypeNum:int=5;
		
		private static var _pingzhiArray:Array;
		private static var _pingzhiDic:Dictionary;
		private static function initEquipPingzhi():void{
			_pingzhiArray=[];
			_pingzhiDic=new Dictionary();
			for (var $star:int=1; $star<=5; $star++){
				var pingzhi:EquipPingzhi=new EquipPingzhi();
				pingzhi.name=Util.getLanguage("装备name_"+$star);
				pingzhi.color=uint("0x"+XMLDataManager.getConstById("color_star"+$star).desc);
				pingzhi.star=$star;
				_pingzhiArray.push(pingzhi);
				_pingzhiDic[pingzhi.star]=pingzhi;
			}
		}
		
		public static function getEquipPingzhiByStar($star:int):EquipPingzhi{
			return pingzhiDic[$star];
		}
	}
}