package Tool.sns
{
	import org.osflash.signals.Signal;
	
	public class SnsBase implements ISnsPlat
	{
		protected var _failSingal:Signal;
		protected var _successSingal:Signal;
		protected var _type:String;
		protected var _priority:int;
		protected var _openId:String;
		protected var _token:String;
		public function SnsBase()
		{
			_failSingal=new Signal(Object);
			_successSingal=new Signal(Object);
			initProperty();
		}
		
		protected function initProperty():void{
			throw new Error("子类继承");
		}
		public function login():void{
			
		}
		public function get snsType():String
		{
			return _type;
		}
		
		public function get priority():int
		{
			return _priority;
		}
		
		public function get openId():String
		{
			return _openId;
		}
		
		public function get token():String
		{
			return _token;
		}
		
		public function get loginFailSingal():Signal
		{
			return _failSingal;
		}
		
		public function get loginSuccessSingal():Signal
		{
			return _successSingal;
		}
		
		public function logout():void{
			
		}
		
		public function clearLoginInfo():void{
			
		}
	}
}