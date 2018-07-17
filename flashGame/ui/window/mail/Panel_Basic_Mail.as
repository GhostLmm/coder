package ui.window.mail
{
	public class Panel_Basic_Mail extends Panel_Mail
	{
		public function Panel_Basic_Mail()
		{
			super();
		}
		protected override function updateMailListShow():void
		{
			_scrollController.setData(mailModel.getBasicMailList());
		}
	}
}