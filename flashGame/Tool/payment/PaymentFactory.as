package Tool.payment
{
	internal class PaymentFactory
	{
		public function PaymentFactory()
		{
		}
		
		public static function createPayment():IPayment
		{
//			return new AlipayPay();
//			return new TestPay();
			CONFIG::Alipay{
				return new AlipayPay();
			}
			return new TestPay();
		}
		
		
	}
}