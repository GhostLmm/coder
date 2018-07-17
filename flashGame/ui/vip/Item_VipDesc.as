package ui.vip
{
	import com.ghostlmm.xmldata.Node_vip;
	
	import flash.display.MovieClip;
	
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	
	import view.Base_Item;
	
	public class Item_VipDesc extends Base_Item implements IGridItemMax
	{
		public function Item_VipDesc($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function get itemClassName():Class{
			return McVipDesc;
		}
		
		private var _fntArray:Array;
		protected override function initModule():void{
			_fntArray=[];
			for(var ind:int=1; ind<=7; ind++){
				var ft:FontField=new FontField(m_mc["fnt_"+ind]);
				ft.text="";
				_fntArray.push(ft);
			}
			
		}
		
		protected override function setShow():void{
			var node:Node_vip=m_data as Node_vip;
			(_fntArray[0] as FontField).text=node.desc1;
			var fid:int=1;
			for(var id:int=1; id<=6; id++){
				var key:String="desc"+id+"_num";
				if(node.hasOwnProperty(key)){
					if(node[key]>0){
						(_fntArray[fid] as FontField).text=node["desc"+id];
						fid++;
					}
				}else{
					(_fntArray[fid] as FontField).text=node["desc"+id];
					fid++;
				}
			}
		}
		
		
		
		public function set enable(value:Boolean):void
		{
		}
		
		public function get enable():Boolean
		{
			return true;
		}
		
		private var _selected:Boolean;
		public function set selected(value:Boolean):void
		{
			_selected=value;
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}
		private var _index:int;
		public function set index(value:int):void
		{
			_index=value;
		}
		
		public function get index():int
		{
			return _index;
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