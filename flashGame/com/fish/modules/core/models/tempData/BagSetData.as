package com.fish.modules.core.models.tempData
{
	/** 包裹集合 **/
	public class BagSetData
	{
		public static const SET_Equip:String="set_equip";
		public static const SET_Tool:String="set_tool";
		public static const SET_Baosi:String="set_baosi";
		public static const SET_Suipian:String="set_suipian";
		
		
		
		public function BagSetData($setType:String)
		{
			setType=$setType;
			if(setType==SET_Equip){
				autoIncrease=false;
			}else{
				autoIncrease=true;
			}
		}
		
		public var setType:String;
		public var autoIncrease:Boolean;
		public var totalBags:int;
		public var couldUseBags:int;
		
		public function destory():void{
			
		}
	}
}