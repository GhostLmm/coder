package util
{
	public class GameTime
	{
		public var h:int;
		public var m:int;
		public var s:int;
		
		private var _miliSecond:Number;
		public var seconds:Number;
		
		public function get miliSecond():Number
		{
			return _miliSecond;
		}
		public function GameTime(ms:Number=0)
		{
			setMiliSeconds(ms);
		}
		public function setMiliSeconds(miliSecond:Number):GameTime
		{
			var seconds:int=miliSecond/1000;
			h=int(seconds/60/60);
			seconds=seconds-h*60*60;
			m=int(seconds/60);
			s=seconds-m*60;
			this._miliSecond=miliSecond;
			this.seconds=int(_miliSecond/1000)
			return this;
		}
		public function toString2():String
		{
			if(h>0){
				return intToFix(h,2)+":"+intToFix(m,2);
			}
			return intToFix(m,2)+":"+intToFix(s,2);
		}
		
		public function toString3():String
		{
			return intToFix(h)+":"+intToFix(m)+":"+intToFix(s);
		}
		
		public function toStringDayOrTime():String
		{
			var day:int=int(miliSecond/24/60/60/1000);
			if(day>0){
				return Util.getLanguage("时间天",day);
			}else{
				return toString3();
			}
		}
		public function toStringDayOrTime2():String
		{
			var day:int=int(miliSecond/24/60/60/1000);
			if(day>0){
				return Util.getLanguage("时间天",day);
			}else{
				return toString2();
			}
		}
		public function toStringDHMOrHMS():String
		{
			var day:int=int(miliSecond/24/60/60/1000);
			if(day>0)
			{
				return Util.getLanguage("时间天",day)+Util.getLanguage("时间小时",intToFix(h-day*24))+Util.getLanguage("时间分",intToFix(m));
			}
			else
			{
				return toString3();
			}
		}
		
		public function toStringDHMS():String{
			var day:int=int(miliSecond/24/60/60/1000);
			var ds:String=Util.getLanguage("时间天",day);
			var hs:String=Util.getLanguage("时间小时",intToFix(h-day*24));
			var ms:String=Util.getLanguage("时间分",intToFix(m));
			var ss:String=Util.getLanguage("时间秒",intToFix(s));
			if(day>0){
				return ds+hs+ms;
			}
			if(h>0){
				return hs+ms+ss;
			}
			if(m>0){
				return ms+ss;
			}
			return ss;
		}
		
		private static function intToFix(value:int,fix:int=2):String
		{
			var s:String=value.toString();
			var l:int=fix-s.length;
			while(l>0)
			{
				s="0"+s;
				l--;
			}
			return s;
		}
		
	}
}