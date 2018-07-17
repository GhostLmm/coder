package ui.window.huodong
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.HuodongControlModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.window.huodong.items.IHuodongItem;
	import ui.window.huodong.items.Item_New_Canbai;
	import ui.window.huodong.items.Item_New_Tili;
	
	import view.Base_Item;
	import view.viewData.HuodongData;

	public class MDI_HuodongNew extends Mediator
	{
		[Inject]
		public var window:HuodongNewWindow;
		[Inject]
		public var huodongControl:HuodongControlModel;
		
		private var activeArray:Array;
		
		private var huodongStateArray:Array; 
		
		private var curItem:Base_Item;
		
		public function MDI_HuodongNew()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
			setShow();
		}
		private function initModule():void
		{
			window._touxiangController.initClass(Item_HuodongIcon);
		}
		private function setHuodongShow():void
		{
//			itemsQueue=new Queue();			
			activeArray=[];
			huodongStateArray=[];
			var tmp:Array=huodongControl.huodongArray;
			var index:int;
			for(index=0;index<tmp.length;index++)
			{
				var node:HuodongData=tmp[index] as HuodongData;
				if(ItemClassDic[node.xml.type]){
					activeArray.push(node);
					huodongStateArray.push(tmp[index]);
				}
			}						
			
			window._touxiangController.setData(activeArray);
			addViewListener(window._touxiangController,TqtEvent.SCROLL_SELECTED,onSelectTouxiang);
			window._touxiangController.setSelectIndexOrData(0);		
		}
		
		
		public static function updateIcon():void{
			var mdi:MDI_HuodongNew=Context.getInjectInstance(MDI_HuodongNew);
			if(mdi && mdi.window && mdi.window._touxiangController){
				if(mdi.activeArray){
					for each( var data:HuodongData in mdi.activeArray){
						data.resetHarvestState();
					}
					mdi.window._touxiangController.setData(mdi.activeArray);
				}
			}
		}
		
		private function onSelectTouxiang(evt:TqtEvent):void{
//			if(evt.
			destroyCurItem();
			if(huodongStateArray.length>0){
				curItem=createHuodongItemByNode(huodongStateArray[evt.data.index]);
				curItem.loadData(huodongStateArray[evt.data.index]);
				var childIndex:int=window._pos_huodong.parent.getChildIndex(window._pos_huodong);
				window._pos_huodong.parent.addChildAt(curItem,childIndex);
				curItem.x=window._pos_huodong.rect.x;
				curItem.y=window._pos_huodong.rect.y;
			}
			
		}
		private function destroyCurItem():void
		{
			if(curItem){
				if(curItem.parent){
					curItem.parent.removeChild(curItem);
				}
				curItem.destory();
				curItem=null;
			}
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_GetHuodongListHandler)
			{
				if(_code==1)
				{
					setHuodongShow();
				}
			}
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		
		private function setShow():void
		{
			C2SEmitter.requestHuodongInfo();
		}
		
		public override function destroy():void
		{
			destroyCurItem();
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			super.destroy();
		}
		
		
		
		
		//-----------------------------------------------
		//            活动id 对应素材访问
		
		public function createHuodongItemByNode(node:HuodongData):Base_Item
		{
			var cls:Class=ItemClassDic[node.xml.type];
			if(cls){
				var item:IHuodongItem=new cls();
				item.type=node.xml.type;
				return item as Base_Item;
			}
			return null;
		}
		private static const ItemClassDic:Object={
			"canbai":Item_New_Canbai,
			"tili":Item_New_Tili,
			"chongji":Item_Huodong_Chongji_HuodongWindow,
			"chongzhi":Item_Huodong_ChongZhi_HuodongWindow,
			"laba":Item_Huodong_Laba_HuodongWindow,
			"guaguale":Item_Huodong_Guaguale,
			"shouji":Item_Huodong_Shouji,
			"growth":Item_Huodong_Growth
		};
		
	}
}
