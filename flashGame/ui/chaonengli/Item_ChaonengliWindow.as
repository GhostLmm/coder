package ui.chaonengli
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.ChaonengliModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_chaonengli;
	import com.ghostlmm.xmldata.Node_chaonengli_main;
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	import ui.widget.IGridItemMax;
	
	import view.Base_Item;
	
	public class Item_ChaonengliWindow extends Base_Item implements IGridItemMax
	{
		public var chaonengliModel:ChaonengliModel;		
		public var itemsArray:Array;
		private var initPoint1:Point;
		private var initPoint2:Point;
		private var derX:Number;
		private var derY:Number;
		
		public function Item_ChaonengliWindow($mc:MovieClip=null)
		{
			super($mc);
		}
		protected override function initModule():void
		{
			chaonengliModel=Context.getInjectInstance(ChaonengliModel);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			initPoint1=new Point();
			initPoint1.x=itemMaterial.mc_item_pos1.x;
			initPoint1.y=itemMaterial.mc_item_pos1.y;
			
			initPoint2=new Point();
			initPoint2.x=itemMaterial.mc_item_pos2.x;
			initPoint2.y=itemMaterial.mc_item_pos2.y;
			
			var item:MovieClip=new mc_skilli_item;
			item.stop();
			
			derX=initPoint2.x-initPoint1.y;
			derY=itemMaterial.mc_item_pos3.y-itemMaterial.mc_item_pos1.y;
			
			item=null;
			
			itemMaterial.mc_item_pos1.alpha=0;
			itemMaterial.mc_item_pos2.visible=false;
			itemMaterial.mc_item_pos3.visible=false;
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_ChaonengFireHandler)
			{
				if(_code==1)
				{
					setShow();
				}
			}
		}
		protected override function registerEvent():void
		{
			
		}
		protected override function setShow():void
		{
			destoryItems();
			itemsArray=[];
			var xmlList:Array=ChaonengliModel.getXmlListByType(node.id);
			var index:int;
			for(index=0;index<xmlList.length;index++)
			{
				var mc:Mc_ChaonengliItem=new Mc_ChaonengliItem();
				var xml:Node_chaonengli=xmlList[index];
				var pos:Point=computeItemPos(xml);
				mc.x=pos.x;
				mc.y=pos.y;
				mc.setData(xml);
				addChild(mc);
				itemsArray.push(mc);
			}
			itemMaterial.mc_item_pos1.width=this.width;
		}
		private function destoryItems():void
		{
			if(null==itemsArray)
			{
				return;
			}
			var index:int;
			for(index=0;index<itemsArray.length;index++)
			{
				var item:Mc_ChaonengliItem=itemsArray[index] as Mc_ChaonengliItem;
				removeChild(item);
				item.destory();
				item=null;
			}
		}
		private  function computeItemPos(_node:Node_chaonengli):Point
		{
			var result:Point=new Point();
			var gezi:Point=convertToPoint(_node.gezi);
			if(int(gezi.x)%2==1)
			{
				result.y=initPoint1.y+(gezi.y-1)*derY;
			}
			else
			{
				result.y=initPoint2.y+(gezi.y-1)*derY;
			}
			result.x=initPoint1.x+(gezi.x-1)*derX;
			return result;
		}
		public override function destory():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			destoryItems();
			super.destory();
		}
		private function get itemMaterial():mc_pos_item
		{
			return m_mc as mc_pos_item;
		}
		private static function convertToPoint(_gezi:String):Point
		{
			var result:Point=new Point();
			var array:Array=JSON.parse(_gezi) as Array;
			result.x=array[0];
			result.y=array[1];
			return result;
		}
		private function get node():Node_chaonengli_main
		{
			return m_data as Node_chaonengli_main;
		}
		protected override function get itemClassName():Class
		{
			return mc_pos_item;
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
			return m_data;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}