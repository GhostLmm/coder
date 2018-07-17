package ui.window.mail
{
	public class Panel_Haoyou_Mail extends Panel_Mail
	{
		public function Panel_Haoyou_Mail()
		{
			super();
		}
		protected override function updateMailListShow():void
		{
			_scrollController.setData(mailModel.getHaoMailList());
		}
	}
}