package ui.window.mail
{
	public class Panel_Jinkuang_Mail extends Panel_Mail
	{
		public function Panel_Jinkuang_Mail()
		{
			super();
		}
		protected override function updateMailListShow():void
		{
			_scrollController.setData(mailModel.getJinkuangMailList());
		}
	}
}