package ui.window
{
	import com.fish.modules.core.models.RewardsPackData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_CommonReward extends Mediator
	{
		[Inject]
		public var commonRewardWindow:CommonRewardWindow;
		
		private var rewardData:Object;
		private var callBack:Function;
		private var args:Array;
		
		private var scrDefaultX:Number;
		
		public function MDI_CommonReward()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			
			if(commonRewardWindow._params is Array){
				rewardData=commonRewardWindow._params;
			}else if( (commonRewardWindow._params is RewardsPackData)  ){
				rewardData=commonRewardWindow._params;
			}else{
				rewardData=commonRewardWindow._params.data;
				callBack=commonRewardWindow._params.callBack;
				args=commonRewardWindow._params.args;
			}
			
			scrDefaultX=commonRewardWindow._scroll_jiangli.x;
			initModule();
			registerEvent();
			setShow();
		}
		private function registerEvent():void
		{
			addViewListener(commonRewardWindow._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(commonRewardWindow._btn_queding,TqtEvent.BUTTON_CLICK,onCloseClicked);
			
			
			
		}
		private function onCloseClicked(evt:Event):void
		{
			if(callBack!=null){
				callBack.apply(null,args);
			}
//			LevelGuideManager.getInstance().createFadeButtonClick("btn_rewardQueding");
			commonRewardWindow.close();
		}
		private function initModule():void
		{
			
		}
		
		private function setShowFromArray(items:Array):void{
			commonRewardWindow._scroll_jiangli.initClass(JiangliMc);
			commonRewardWindow._scroll_jiangli.setData(items);
			
			if(items.length>0 ){
				var maxNum:int=Math.ceil(commonRewardWindow._scroll_jiangli._position.rect.width/JiangliMc.WIDTH);
				if(items.length<maxNum){
					var rect:Rectangle=commonRewardWindow._scroll_jiangli._position.rect;
					commonRewardWindow._scroll_jiangli.x=(rect.width-items.length*JiangliMc.WIDTH)/2+rect.x;
				}
				
			}
		}
		
		private function setShow():void
		{
			
			if(rewardData is Array){
				setShowFromArray(rewardData as Array);
			}
			if(rewardData is RewardsPackData){
				var items:Array=(rewardData as RewardsPackData).createItemDatas();
				setShowFromArray(items);
				var desc:String=(rewardData as RewardsPackData).desc;
				if(desc){
					commonRewardWindow._fnt_desc.text=desc;
				}
				var title:String=(rewardData as RewardsPackData).tiltle;
				if(title){
//					commonRewardWindow._fnt_title.text=Util.getLanguage(title);
				}
				//warning 如果位置过大，就需要用position来做
				
				
			}
			
			
			
		}
		public override function destroy():void
		{
			rewardData=null;
			callBack=null;
			args=null;
			super.destroy();
			CommonControlFun.showTongguanAlert();
		}
	}
}