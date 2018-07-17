package snake.viewdata
{
	import snake.viewdata.battle.AttackComputeData;

	public interface IHeroData
	{
		function get jumpHeight():int;
		function get runSpeed():int;
		function get maxHealth():int;
		function get curHealth():int;
		function get atk():int;
		function get computeData():AttackComputeData;
		function get id():int;
		function get gunXid():int;
		function get fireDerTime():int;
		
		function get appearance():Array;
		function get color():Array;
		
		function destroy():void;
	}
}