package snake.gameobj
{
	import snake.NpcTalkInfoBar;

	public class Player_Zhucheng extends Player
	{
		private var talkFr:int;
		public function Player_Zhucheng()
		{
			super();
		}
		public override function logic():void{
			talkFr--;
			needShowTalk=talkFr>0;
			super.logic();
		}
		public function showTalk(info:String):void{
			if(talkInfoBar==null){
				talkInfoBar=new NpcTalkInfoBar();
			}
			talkFr=200;
			talkInfoBar.setTalk(info);
		}
	}
}