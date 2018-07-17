package view.login
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import Tool.account.AccountControl;
	
	import core.event.TQTTouchEvent;
	
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import view.Base_Mc;

	public class MC_Server extends Base_Mc implements IGridItemMax
	{
		private var _fnt_name:FontField;
		private var _pos_image:Position;
		
		public function MC_Server()
		{
			super();
		}
		protected override function initModule():void
		{
			_fnt_name = new FontField(mcMaterial.fnt_name);
			_pos_image = new Position(mcMaterial.pos_image);
		}
		private function destoryMc():void
		{
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_pos_image){_pos_image.destory();_pos_image=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		protected override function registerEvent():void
		{
			addTargetEvent(this,TQTTouchEvent.TOUCH_TAP,onClicked);
		}
		private function onClicked(evt:Event):void
		{
			var serverId:int=m_data.zoneId;
			AccountControl.getInstance().setServerId(serverId);
		}
		protected override function setShow():void
		{
			_fnt_name.text = m_data.zoneName;
			if(m_data.hasOwnProperty("zoneStatus"))
			{
				_pos_image.fillWithBitmapByClassName("image_server_"+m_data.zoneStatus);
			}
		}
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("McServer") as Class); 
		}
		private function get mcMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		public function setData(_data:Object):void
		{
			m_data=_data;
			setShow();
		}
		public override  function loadData($data:Object):*{
			m_data=$data;
			setShow();
			return this;
		}
		
		public function set enable(value:Boolean):void{
			
		}
		public function  get enable():Boolean{
			return true;
		}
		
		private var _slected:Boolean;
		public function set selected(value:Boolean):void{
			_slected=value;
		}
		public function get selected():Boolean{
			return _slected;
		}
		
		private var _index:int;
		public function set index(value:int):void{
			_index=value;
		}
		public function get index():int{
			return _index;
		}
		
		//		function loadData($data:Object):*;
		public function get data():Object{
			return m_data;
		}
		
		public function enterMovie():*{
			
		}
	}
}
