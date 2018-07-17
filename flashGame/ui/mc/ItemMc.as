package ui.mc
{
	
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.xmldata.Node_equip;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.utils.getTimer;
	
	import ui.widget.ImageBitmap;
	import ui.widget.Position;

	public class ItemMc extends _McBase
	{
		private var _pos_item:Position;
		private var _pos_item_bg:Position;
		private var _pos_nb:Position;
//		private var _scene:flash.display.MovieClip; 
		public function ItemMc()
		{
			super();
			_scene = new (AssetManager.getAssetClass("McItem") as Class); 
			this.addChild(_scene as DisplayObject);
			_pos_item = new Position(_scene.pos_item);
			_pos_item_bg= new Position(_scene.pos_item_bg);
			_pos_nb=new Position((_scene as McItem).pos_nb);
		}
		public override function destory():void
		{
			if(_pos_item){_pos_item.destory();_pos_item=null;};
			if(_pos_item_bg){_pos_item_bg.destory();_pos_item_bg=null;};
			if(_pos_nb) {_pos_nb.destory(); _pos_nb=null;}
			super.destory();
		}
		
		public function loadData(model:Object):DisplayObject
		{
//			var t1:int = getTimer();
			if(model is EquipData){
				_pos_item.fillWithObject(new ImageBitmap(model.node.icon));
			}else{
				_pos_item.fillWithObject(new ImageBitmap(model.icon));
			}
			
			
			_pos_nb.destory();
			
			if(model is Node_equip){
				_pos_item_bg.fillWithObject(new ImageBitmap("bg_equip_"+model.star));
				var nbId:int=(model as Node_equip).nb;
				if(nbId>0){
					showNbBg();
				}
			}
			
			if(model is EquipData){
				_pos_item_bg.fillWithObject(new ImageBitmap("bg_equip_"+(model as EquipData).node.star));
				if((model as EquipData).hasShenzhuang()){
					showNbBg();
				}
			}
			
			return this;
		}
		
		public function showNbBg():void{
			_pos_nb.fillWithObject(new McFightXuanzhong());
		}
		
		
	}
}
