package view.item
{
	import flash.display.MovieClip;
	
	import core.event.TqtEvent;
	
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import view.Base_Item;
	import view.login.MC_Server;
	public class Item_Xuanqu_Login extends Base_Item implements IGridItem
	{
		private var _pos_1:Position;
		private var _pos_2:Position;
		
		private var _mc_1:MC_Server;
		private var _mc_2:MC_Server;
		
		public function Item_Xuanqu_Login()
		{
			super();
		}
		protected override function initModule():void
		{
			_pos_1 = new Position(itemMaterial.pos_1);
			_pos_2 = new Position(itemMaterial.pos_2);
		}
		protected override function registerEvent():void
		{
			
		}
		protected override function setShow():void
		{
			if(m_data.hasOwnProperty("1")) {
				_mc_1 = new MC_Server();
				_mc_1.setData(m_data["1"]);
				_pos_1.fillWithObject(_mc_1);
			}
			if(m_data.hasOwnProperty("2")) {
				_mc_2 = new MC_Server();
				_mc_2.setData(m_data["2"]);
				_pos_2.fillWithObject(_mc_2);
			}
		}
		protected override function get itemClassName():Class
		{
			return McServer; 
		}
		private function get itemMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		public override function destory():void
		{
			if(_pos_1){_pos_1.destory();_pos_1=null};
			if(_pos_2){_pos_2.destory();_pos_2=null};
			if(_mc_1)
			{
				_mc_1.destory();
				_mc_1=null;
			}
			if(_mc_2)
			{
				_mc_2.destory();
				_mc_2=null;
			}
			super.destory();
		}
		public override function loadData($data:Object):*
		{
			m_data=$data;
			setShow();
		}
	}
}
