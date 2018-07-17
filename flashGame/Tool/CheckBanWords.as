package Tool
{
	import com.stimuli.loading.BulkLoader;
	import com.stimuli.loading.BulkProgressEvent;
	
	import flash.utils.ByteArray;

	public class CheckBanWords
	{
		private static var _words:Array=[];
		private static var _loader:BulkLoader = new BulkLoader("banWord");
		
		public function CheckBanWords()
		{
		}
		
		public static function setWords(url:String):void
		{
			_loader.addEventListener(BulkProgressEvent.COMPLETE,loadComplete);
			_loader.add(url,{id:"banWord"});
			_loader.start();
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
		
		
		private static var initFlag:Boolean=false;
		[Embed(source="assets/badwords.txt", mimeType="application/octet-stream")] 
		private static var wc:Class;
		
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
		
		private static function initWords():void{
			
			var byteDataTxt:ByteArray = new wc();  
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
		private static function loadComplete(evt:BulkProgressEvent):void
		{
			var txt:String = _loader.getText("banWord");
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
	}
}