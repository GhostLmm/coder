package view.commontools
{
	import flash.utils.ByteArray;

	public class CheckBanWords
	{
		
		
		private static var _words:Array=[];
		private static var initFlag:Boolean=false;
		
		public function CheckBanWords()
		{
		}
		private static function initWords():void{
			
			var byteDataTxt:ByteArray = new (EmbedData.wc)();  
			var txt:String = byteDataTxt.readUTFBytes(byteDataTxt.bytesAvailable); 
			txt = txt.replace(/\r/g,"");
			var all:Array = txt.split("\n");
			for each(var ban:String in all)
			{
				if(_words.indexOf(ban) < 0)
				{
					_words.push(ban);
				}
			}
		}
		public static function isBad(words:String):Boolean
		{
			if(initFlag==false){
				initWords();
				initFlag=true;
			}
			for each(var banWord:String in _words)
			{
				if(banWord)
				{
					var index:int = words.indexOf(banWord); 
					if(index >= 0)
					{
						return true;
					}
				}
			}
			return false;
		}
		public static function check(words:String):String
		{
			if(initFlag==false){
				initWords();
				initFlag=true;
			}
			for each(var banWord:String in _words)
			{
				if(banWord)
				{
					var index:int = words.indexOf(banWord); 
					if(index >= 0)
					{
						words = replace(banWord,words);
					}
				}
			}
			return words;
		}
		private static function replace(key:String,words:String):String
		{
			var index:int = words.indexOf(key); 
			if(index >= 0)
			{
				var before:String = words.slice(0,index);
				var after:String = words.slice(index + key.length);
				words = before + getStarByWord(key) + after;
				return replace(key,words);
			}
			else
			{
				return words;
			}
			
		}
		
		private static function getStarByWord(word:String):String
		{
			var count:int = 0;
			var star:String = "";
			while(count < word.length)
			{
				star += "*";
				count++;
			}
			return star;
		}
	}
}