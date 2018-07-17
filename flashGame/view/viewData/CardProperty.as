package view.viewData
{
	public class CardProperty
	{
		public var attack:int=0;
		public var defense:int=0;
		public var blood:int=0;
		public var speed:int=0;
		
		public function CardProperty()
		{
		}
		
		public function clone():CardProperty
		{
			var cp:CardProperty=new CardProperty();
			cp.attack=attack;
			cp.defense=defense;
			cp.blood=blood;
			cp.speed=speed;
			return cp;
		}
	}
}