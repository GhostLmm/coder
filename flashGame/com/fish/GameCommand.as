package com.fish
{
	public class GameCommand
	{
		
		public function GameCommand()
		{
		}
		private static var _fn:Function;
		private static var _arg:Array;
		public static function addCommand($fn:Function,...rest):void{
			_fn=$fn;
			_arg=[].concat(rest);
		}
		
		public static function excute():void{
			if(_fn!=null){
				_fn.apply(null,_arg);
			}
			_fn=null;
			_arg=null;
		}
		
		public static function clear():void{
			_fn=null;
			_arg=null;
		}
	}
}