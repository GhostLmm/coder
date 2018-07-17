package ui.window.huodong
{
	import flash.display.MovieClip;
	
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import view.Base_Item;
	import view.viewData.HuodongData;
	public class Item_HuodongIcon extends Base_Item implements IGridItemMax
	{
		
		private var _pos_image:Position;
		private var _mc_xuanzhong:MovieClip;
		private var _mc_tip:MovieClip;
//		private var _fnt_huodong_name:FontField;
		
		public function Item_HuodongIcon()
		{
			//TODO: implement function
			super();
		}
		
		public override function destory():void
		{
			if(_pos_image) {_pos_image.destory();_pos_image=null;};
			_mc_xuanzhong=null;
			_mc_tip=null;
//			if(_fnt_huodong_name) {_fnt_huodong_name.destory();_fnt_huodong_name=null;};
			super.destory();
		}
		
		protected override function initModule():void{
			
			_pos_image=new Position(itemMaterial.btn_huodong_iconbg);
			_mc_xuanzhong=itemMaterial.mc_xuanzhong;
			_mc_xuanzhong.visible=false;
			_mc_tip=itemMaterial.mc_tishi;
			_mc_tip.visible=false;
//			_fnt_huodong_name=new FontField(itemMaterial.fnt_huodong_name);
		}
		protected override function setShow():void{
			var huodongData:HuodongData=data as HuodongData;
//			_fnt_huodong_name.text=data.xml.name;
			_mc_xuanzhong.visible=isSelect;
			_pos_image.fillWithBitmapByClassName(data.xml.icon);
			_mc_tip.visible=huodongData.couldHarvest;
		}
		protected override function get itemClassName():Class
		{
			return item_huodong_image; 
		}
		
		private function get itemMaterial():flash.display.MovieClip  
		{
			return m_mc as flash.display.MovieClip;  
		}
		
		protected override function registerEvent():void
		{
//			addTargetEvent(this,TQTTouchEvent.TOUCH_TAP,onTap);
		}
		
		
		
		/*private function onTap(evt:Event):void
		{
			var mdi:MDI_HuodongNew=Context.getInjectInstance(MDI_HuodongNew);
			if(mdi!=null){
				mdi.onClickIcon(node);
			}
		}*/
		
		public function set enable(value:Boolean):void
		{
			//TODO: implement function
		}
		
		public function get enable():Boolean
		{
			//TODO: implement function
			return true;
		}
		private var isSelect:Boolean;
		public function set selected(value:Boolean):void
		{
			isSelect=value;
			_mc_xuanzhong.visible=isSelect;
		}
		
		public function get selected():Boolean
		{
			return isSelect;
		}
		private var m_index:int;
		public function set index(value:int):void
		{
			m_index=value;
		}
		
		public function get index():int
		{
			return m_index;
		}
		
		/*public function loadData($data:Object):*
		{
			//TODO: implement function
			setData($data);
			return null;
		}*/
		
		public function get data():Object
		{
			//TODO: implement function
			return m_data;
		}
		
		public function enterMovie():*
		{
			//TODO: implement function
			return null;
		}
		
		private function get node():HuodongData{
			return m_data as HuodongData;
		}
	}
}

