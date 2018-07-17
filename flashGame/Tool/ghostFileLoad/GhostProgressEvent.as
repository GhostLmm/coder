package Tool.ghostFileLoad
{
	import flash.events.Event;
	
	public class GhostProgressEvent extends Event
	{
		public function GhostProgressEvent(type:String)
		{
			super(type);
		}
		
		public static const PROGRESS:String="ghostProgress";
		public static const COMPLETE:String="ghostComplete";
		public static const NETERROR:String="ghostNeterror";
		
		internal var i_byteLoaded:Number;
		internal var i_bytesTotal:Number;
		
		public function get percentLoaded():Number
		{
			return i_byteLoaded/i_bytesTotal;
		}
		
		public function get bytesLoaded():Number
		{
			return i_byteLoaded;
		}
		public function get bytesTotal():Number
		{
			return i_bytesTotal;
		}
	}
}