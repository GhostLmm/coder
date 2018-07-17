package ui.fuben
{
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.tempData.FubenBoxData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.greensock.TweenLite;
	
	import core.event.TqtEvent;
	
	import util.Util;
	
	public class MDI_Saodang extends Mediator
	{
		public static const SaodangWaitTime:Number=1;
		[Inject]
		public var window:SaodangWindow;
		[Inject]
		public var mapModel:MapModel;
		[Inject]
		public var userModel:UserModel;
//		private var _copyData:FubenBoxData;
		
		private var _dataArray:Array=[];
		
		private var saodangDatas:Array;
		
		public function MDI_Saodang()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,window.close);
			window._scr_saodang.initClass(Item_Saodang);
			mapModel.isInSaodang=true;
//			_copyData=window._params as FubenBoxData;
			
			saodangDatas=mapModel.getSaodangResult();
			
			window._btn_close.visible=false;
			
			startSaodang();
			
		}
		
		/*private function onMessage(msType:String,retCode:int):void
		{
			if(msType==C2SEmitter.REQ_ChallengeCopyHandler){
				if(retCode>0){
//					var data:Object=_dataArray[0];
					var data:Object=_dataArray[_dataArray.length-1];
					data.wait=false;
					data.result=(Context.getInjectInstance(BattleModel) as BattleModel).getBattleResult();
					data.copyData=_copyData.clone();
					window._scr_saodang.setData(_dataArray);
					
					step1_wait();
				}else{
//					data.wait=true;
//					data.result=false;
					window.close();
				}
			}
		}*/
		
		private function startSaodang():void
		{
			if(saodangDatas.length){
				step1_wait();
			}else{
				stopSaodang();
			}
//			var shuyuCishu:int=mapModel.couldShaodangCishu(_copyData);
//			if(shuyuCishu>0 && userModel.userVo.currentTili>=_copyData.copyXml.cost_tili){
//				step1_wait();
//			}else{
//				stopSaodang();
//			}
		}
		private function stopSaodang():void
		{
			trace("扫荡完毕");
			window._btn_close.visible=true;
			Util.flow("扫荡完毕");
		}
		
		private function step1_wait():void
		{
			if(saodangDatas.length==0){
				stopSaodang();
				return ;
			}
			var data:Object={};
			data.wait=true;
			data.changci=_dataArray.length+1;
			data.result=false;
			data.saodang=null;
			_dataArray.push(data);
//			_dataArray.splice(0,0,data);
			window._scr_saodang.setData(_dataArray);
//			trace("定位到地方： "+(_dataArray.length-1));
			window._scr_saodang.setSelectIndexOrData(_dataArray.length-1);
			TweenLite.delayedCall(SaodangWaitTime,step2_tiaozhan);
		}
		
		private function step2_tiaozhan():void
		{
			var data:Object=_dataArray[_dataArray.length-1];
			data.wait=false;
			data.result=true;
//			data.copyData=_copyData.clone();saodangDatas
			data.saodang=saodangDatas.shift();
			window._scr_saodang.setData(_dataArray);
			
			step1_wait();
		}
		
		public override function destroy():void 
		{
			// todo
			Util.showLevelUpWindow();
			TweenLite.killDelayedCallsTo(step2_tiaozhan);
			mapModel.isInSaodang=false;
			super.destroy();
		}
	}
}