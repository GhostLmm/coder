package Tool
{
	import com.thor.utils.Locales;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	import myDisplay.ScaleManager;

	public class ConvertFunc
	{
		private static const dateObj:Object={"1":31,"2":29,"3":31,"4":30,"5":31,"6":30,"7":31,"8":31,"9":30,"10":31,"11":30,"12":31};
		public function ConvertFunc()
		{
		}
		/** 将数字转化成以w结尾的字符串
		 * */
		public static function digitalToStrW(_num:int):String
		{
			return (_num/10000+"W").toString();
		}
		/**
		 *  判断生日是否正确
		 * */
		public static function checkDateError(_birth:int):Boolean
		{
			var month:int=_birth/100;
			var day:int=_birth%100;
			if(month>12||month<=0)
			{
				return false;
			}
			if(day>int(dateObj[month])||(day<=0))
			{
				return false;
			}
			return true;
		}
		public static function transGetargToString(getArg:Object):String
		{
			var result:String="?";
			for (var key:String in getArg)
			{
				result+=key+"="+getArg[key]+"&";
			}
			result=result.substr(0,result.length-1);
			return result;
		}
		/**
		 *  专门用于背包卡片tip位置
		 * */
		public static function computeMcPos_BagCardTip(_mc:DisplayObject,_tipMc:DisplayObject):Point
		{
			var lowerR:Point=_mc.localToGlobal(new Point(_mc.width,0));
//			var UpperR:Point=_mc.localToGlobal(_mc.width,_mc.height-_tipMc.height);
//			var UpperL:Point=_mc.localToGlobal(-_tipMc.width,_mc.height-_tipMc.height);
			var lowerL:Point=_mc.localToGlobal(new Point(-_tipMc.width,0));
			
			var usePointX:Number=_mc.width;
			var posX:Number=lowerR.x/ScaleManager.getInstance().scaleX;
			if(posX+_tipMc.width>GLOBAL._useMaterialSize.w)
			{
				usePointX=-_tipMc.width;
			}
			
			var usePointY:Number=0;
			var posY:Number=lowerL.y/ScaleManager.getInstance().scaleY;
			if(posY+_tipMc.height>GLOBAL._useMaterialSize.h)
			{
				usePointY=_mc.height-_tipMc.height;
			}
			
			var tempPoint:Point=_mc.localToGlobal(new Point(usePointX,usePointY));
			var result:Point=new Point(tempPoint.x/ScaleManager.getInstance().scaleX,tempPoint.y/ScaleManager.getInstance().scaleY);
			return result;
		}
		/**
		 *  背包卡片获得时间
		 * */
		public static function convertTimeToString(_time:int):String
		{
			var date:Date = new Date(_time * 1000);
			var monthStr:String = (date.month + 1) >= 10 ? (date.month + 1) + "" : "0" + (date.month + 1);
			var dateStr:String = (date.date) >= 10 ? (date.date) + "" : "0" + (date.date);
			var hoursStr:String = (date.hours) >= 10 ? (date.hours) + "" : "0" + (date.hours);
			var minutesStr:String = (date.minutes) >= 10 ? (date.minutes) + "" : "0" + (date.minutes);
			var secondsStr:String = (date.seconds) >= 10 ? (date.seconds) + "" : "0" + (date.seconds);
			var timeStr:String = date.fullYear + "/" + monthStr + "/" + dateStr + "/" + hoursStr + ":" + minutesStr + ":" + secondsStr;
			timeStr=Locales.Get("bagItem_getTime",{v1:timeStr});
			return timeStr;
		}
		public static const ItemOutDateTime:int=3600*24;
		/**
		 *  获得过期时间
		 * */
		public static function convertTimeEndedDate(_time:int):String
		{
			var derTime:int=_time+ItemOutDateTime-GLOBAL.Timestamp();
			if(derTime<=0)
			{
				return Locales.Get("bagItem_outDate");
			}
			var timeStr:String=GLOBAL.ToTime(derTime);
			timeStr=Locales.Get("bagItem_TimeLeft",{v1:timeStr});
			return timeStr;
		}
	}
}