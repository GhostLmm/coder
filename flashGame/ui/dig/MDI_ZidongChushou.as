package ui.dig
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.GuankaModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.Util;
	
	public class MDI_ZidongChushou extends Mediator
	{
		[Inject]
		public var wm:ZidongChushouWindow;
		[Inject]
		public var guankaModel:GuankaModel;
		
		private var sellStar:int;
		public function MDI_ZidongChushou()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			sellStar=guankaModel.vo.chushouSetinfo;
			setshow();
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_baocun,TqtEvent.BUTTON_CLICK,onClickBaocun);
			S2CHanlder.instance.messageMax_SN.add(onMessage);
			for each(var item:DigAutoSellItem in wm._sellItems){
				item.select_SN.add(onSelectItem);
			}
		}
		
		private function onSelectItem(item:DigAutoSellItem):void{
			if(item.selected){
				sellStar=item.colorType-1;
			}else{
				sellStar=item.colorType;
			}
			
			setshow();
		}
		
		
		public static const SellEquipColors:int=4;
		/** 获取挖矿信息   **/
		public function getWakuangSetinfo():Array{
			var re:Array=[];
			var setObj:Object={};
			
			for(var color:int=1; color<=SellEquipColors; color++){
				var obj:Object={};
				obj.color=color;
				obj.select=false;
				if(color<=sellStar){
					obj.select=true;
				}
				re.push(obj);
			}
			return re;
		}
		
		private function setshow():void{
			var setInfos:Array=getWakuangSetinfo();
			for(var index:int=0; index<wm._sellItems.length; index++){
				(wm._sellItems[index] as DigAutoSellItem).loadData(setInfos[index]);
			}
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_DigSetterHandler){
				if(code>0){
					Util.flow("挖矿设置成功");
//					setshow();
					wm.close();
				}
			}
		}
		
		private function onClickBaocun(evt:Event):void{
//			var setObj:Object={};
//			for each(var item:DigAutoSellItem in wm._sellItems){
//				setObj[item.colorType]=item.selected;
//			}
			C2SEmitter.setWakangDigInfo(sellStar);
		}
		
		
		public override function destroy():void
		{
			// todo
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			super.destroy();
		}
	}
}