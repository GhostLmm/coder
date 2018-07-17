package Tool
{
	import flash.utils.ByteArray;

	public class MyMath
	{
		private static var _instance:MyMath;
		public function MyMath()
		{

		}
		
		public static function getInstance():MyMath
		{
			if(!_instance)
				_instance=new MyMath();
			return _instance;
		}
		
		public static function GetStringLength(thisString:String):Number{
			var thisStringBytsLength :ByteArray = new ByteArray();
			thisStringBytsLength.writeMultiByte(thisString,"gb2312");
			return thisStringBytsLength.length;
		}
		
		/**   判断名字那个是否合法, 返回 -1 表示 太短， 返回 0 表示可以， 返回 1 表示 太长
		 * */
		public static function availableName_Length(name:String):int
		{
			var length:int=GetStringLength(name);
			
			if(length<3)
			{
				return -1;
			}
			if(length>10)
			{
				return 1;
			}
			return 0;
		}
		public static const IllegalNamesArray:Array=["尖阁列岛","钓鱼岛"]
		public static function availbaleName_illegal(_name:String):Boolean
		{
			var result:Boolean=false;
			var index:int;
			for(index=0;index<IllegalNamesArray.length;index++)
			{
				if(-1!=_name.indexOf(IllegalNamesArray[index]))
				{
					result=true;
					break;
				}
			}
			return result;
		}
	}
}