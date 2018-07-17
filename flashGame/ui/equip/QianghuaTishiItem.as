package ui.equip
{
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	
	import util.Util;
	
	import view.Base_Item;
	
	public class QianghuaTishiItem extends Base_Item implements IGridItemMax
	{
		private var _fnt_gunping:FontField;
		public function QianghuaTishiItem($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function  get itemClassName():Class{
			return McScrollFnt;
		}
		
		protected override function initModule():void{
			_fnt_gunping=new FontField(m_mc.fnt_gunping);
		}
		
		protected override function setShow():void{
			var success:Boolean=m_data.success;
			var dataIndex:int=m_data.index;
			var lv:int=m_data.lv;
			var baodi:Boolean=m_data.baodi;
			
			if(success){
				_fnt_gunping.textColor=uint("0x"+XMLDataManager.getConstById("color_chenggong").desc);
				if(baodi){
					_fnt_gunping.text=Util.getLanguage("强化十连成功保底提示",dataIndex,lv);
				}else{
					_fnt_gunping.text=Util.getLanguage("强化十连成功提示",dataIndex,lv);
				}
				
				
			}else{
				_fnt_gunping.textColor=uint("0x"+XMLDataManager.getConstById("color_shibai").desc);
				_fnt_gunping.text=Util.getLanguage("强化十连失败提示",dataIndex,lv);
			}
			
		}
		
		public override function destory():void{ 
			if(_fnt_gunping) {_fnt_gunping.destory(); _fnt_gunping=null;}
			super.destory();
		}
		
		public function set enable(value:Boolean):void
		{
		}
		
		public function get enable():Boolean
		{
			return false;
		}
		
		public function set selected(value:Boolean):void
		{
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		
		public function set index(value:int):void
		{
		}
		
		public function get index():int
		{
			return 0;
		}
		
		public function get data():Object
		{
			return null;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}