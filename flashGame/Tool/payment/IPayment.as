package Tool.payment
{
	import org.osflash.signals.Signal;

	public interface IPayment
	{
		function init():void;
		function pay(pid:int,bid:String):void;
		function get platname():String;
		function get payBackSingal():Signal;
	}
}