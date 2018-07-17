package ui.jinkuang
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.C2SEmitter;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	
	import ui.widget.FontField;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.viewData.JinkuangData;
	
	public class Item_JinkuangWindow extends Base_Item
	{
		public var _pos_image:Position;
		public var _fnt_name:FontField;
		public var _mc_zhanling:MovieClip;
		public var _mc_vip:MovieClip;
		public var _pos_vip:Position;
		public var _mc_bg:MovieClip;
		
		public function Item_JinkuangWindow()
		{
			super();
		}
		protected override function initModule():void
		{
			_pos_image=new Position(itemMaterial.pos_image);
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_mc_zhanling=itemMaterial.mc_zhanling;
			_mc_vip=itemMaterial.mc_vip;
			_pos_vip=new Position(itemMaterial.mc_vip.pos_vip);
			_mc_bg=itemMaterial.mc_bg;
			_mc_bg.gotoAndStop(1);
			this.mouseChildren=false;
		}
		protected override function registerEvent():void
		{
			addTargetEvent(this,TQTTouchEvent.TOUCH_TAP,onClicked);
		}
		private function onClicked(evt:Event):void
		{
			C2SEmitter.getKuangDetail(data.xml.id,data.xml.type);
		}
		protected override function setShow():void
		{
			_pos_image.fillWithBitmapByClassName(data.xml.image);
			_pos_vip.fillWithBitmapByClassName("vip"+data.xml.vip_limit);
			if(data.xml.vip_limit>0)
			{
				_mc_vip.visible=true;
			}
			else
			{
				_mc_vip.visible=false;
			}
			if((null==data.vo)||(data.vo.name==null))
			{
				_fnt_name.text=Util.getLanguage("无人占领");
				_mc_zhanling.visible=false;
			}
			else
			{
				_fnt_name.text=data.vo.name;
				if(data.vo.userId==int(GLBaseData.userId))
				{
					_mc_zhanling.visible=true;
				}
				else
				{
					_mc_zhanling.visible=false;
				}
			}
		}
		public override function destory():void
		{
			if(_pos_image){_pos_image.destory();_pos_image=null;};
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			_mc_zhanling=null;
			_mc_vip=null;
			if(_pos_vip){_pos_vip.destory();_pos_vip=null;};
			if(_mc_bg){_mc_bg=null;};
			super.destory();
		}
		protected override function get itemClassName():Class
		{
			return McJinkuang; 
		}
		private function get itemMaterial():McJinkuang 
		{
			return m_mc as McJinkuang; 
		}
		private function get data():JinkuangData
		{
			return m_data as JinkuangData;
		}
	}
}
