package snake
{
	import snake.gameEnemys.CharAnimData;
	import snake.gameEnemys.CharSpriteAsset;
	import snake.guns.GunAsset;
	import snake.guns.GunData;

	public class RenderPlayerArg
	{
		public function RenderPlayerArg()
		{
		}
		
		public var _posX:Number;
		public var _posY:Number;
		public var _posX_old:Number;
		public var _posY_old:Number;
		public var _frame:int;
		public var _frameOld:int;
		public var _face:int;
		public var _gunRot:Number;
		public var _gunRotOld:Number;
		public var _headRot:Number;
		public var _gunX:Number;
		public var _gunY:Number;
		public var _gunXOld:Number;
		public var _gunYOld:Number;
		public var _gunFrame:int;
		public var _headless:Boolean;
		public var _reloadTime:int;
		public var _charAnimData:CharAnimData;
		public var _charAsset:CharSpriteAsset;
		public var _gunAsset:GunAsset;
		public var _gunData:GunData;
		public var hasDroppedMag:Boolean;
		
		public var playerInfo:PlayerInfoBar;
		public var renderInfo:Boolean;
		
		/**
		 * 要绘制的主人信息
		 */
		public var _host:Object;
		
		/**
		 *  绘制头上谈话是信息
		 */
		public var talkInfo:NpcTalkInfoBar;
	}
}