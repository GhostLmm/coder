package ui.window.mail
{
	public class Item_JinkuangMail_YoujianWindow extends Item_YoujianWindow
	{
		public function Item_JinkuangMail_YoujianWindow()
		{
			super();
		}
		protected override function setShow():void
		{
			if(null==viewData)
			{
				return;
			}
			_pos_item.fillWithBitmapByClassName(viewData.typeXml.image);
			_fnt_name.htmlText=viewData.mailTitle;
			_fnt_date.text=viewData.mailDate;		
			_fnt_desc.htmlText=viewData.mailItemShowDesc;
		}
	}
}