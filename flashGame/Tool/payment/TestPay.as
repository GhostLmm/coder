package Tool.payment
{
	import org.osflash.signals.Signal;
	
	public class TestPay implements IPayment
	{
		public function TestPay()
		{
		}
		
		public function init():void
		{
		}
		
		public function pay(pid:int, bid:String):void
		{
			var data:Object={};
			data.bid=bid;
			_payBackSingal.dispatch(data);
		}
		
		public function get platname():String
		{
			return "test";
		}
		
		private var _payBackSingal:Signal=new Signal(Object);
		public function get payBackSingal():Signal
		{
			return _payBackSingal;
		}
	}
}