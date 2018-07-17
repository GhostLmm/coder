package Tool
{
	import flash.display.Sprite;
	import flash.text.TextField;

	public class MyTextBox extends Sprite
	{
		private static var txt:TextField;
		private static var num:int=0;
		public function MyTextBox()
		{
			txt=new TextField();
			addChild(txt);
			txt.backgroundColor=0xffcc00;
			txt.multiline=true;
			txt.textColor=0xffcc00;
			txt.width=300;
			txt.height=300;
			this.mouseChildren=false;
			this.mouseEnabled=false;
		}
		
		public static function setTxt(str:String):void
		{
			txt.text=txt.text+"\n"+str;
			num++;
			if(num%10==0)
				txt.text="";
		}
	}
}