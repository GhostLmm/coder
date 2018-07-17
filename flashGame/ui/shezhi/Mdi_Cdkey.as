package ui.shezhi
{
	import com.adobe.utils.StringUtil;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ErrorCode;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.RewardsPackData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	
	public class Mdi_Cdkey extends Mediator
	{
		[Inject]
		public var window:CdKeyWindow;
		public function Mdi_Cdkey()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,window.close);
			addViewListener(window._btn_queding,TqtEvent.BUTTON_CLICK,onQueding);
			addViewListener(window._btn_zhantie,TqtEvent.BUTTON_CLICK,onZhantieClick);
			window._fnt_shuru_cdkey.setRestrict("0-9a-zA-Z\\-");
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
			S2CHanlder.instance.Opt_Message_SN.add(onErrorMessage);
		}
		
		private function onZhantieClick(evt:Event):void{
			var text:String=Clipboard.generalClipboard.getData(ClipboardFormats.TEXT_FORMAT) as String;
			if(text!=null){
				window._fnt_shuru_cdkey.text=text;
			}
		}
		
		public function showCdkeyReward(json:String):void{
			var data:Object={};
			try{
				data=JSON.parse(json);
			}catch(e:Error){trace(e.message)}
			
			// json 格式
			//			data.money=10;
			//			data.cash=100;
			//			data.items=[{1002:1}];
			//			data.kapais=[{500:1}];
			//			data.pets=[{500:1}];
			//			data.skills=[{500:1}];
			//			data.equips=[{500:1}];
			
			var result:RewardsPackData=new RewardsPackData();
			result.initFromData(data);
			WindowManager.openOnlyWinodw(CommonRewardWindow,result);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void
		{
			
			if(msType==C2SEmitter.REQ_NEWCDKeyRewardHandler && code>0){
				Util.flow("cdkey领取成功",GameVOManager.getInstance().cdkey.name);
				showCdkeyReward(GameVOManager.getInstance().cdkey.rewards);
				window.close();
				return ;
			}
			
		}
		
		private function onErrorMessage(msType:String,reCode:int):void
		{
			if(msType==C2SEmitter.REQ_NEWCDKeyRewardHandler)
			{
				if(reCode==ErrorCode.CD_KEY_WRONG){
					//cdkey 非法
					Util.flow("cdkey错误");
				}else if(reCode==ErrorCode.ALREADY_LINGQU){
					// 该用户已经领取过了同类型的cdkey
					Util.flow("用户领取过cdkey");
				}else if(reCode==ErrorCode.CDKEY_ALREADY_LINGQU){
					// cdkey已经被领取过了
					Util.flow("cdKey已经被使用");
				}else if(reCode==ErrorCode.LIBAO_NOT_EXISTS){
					//礼包错误
					Util.flow("礼包过期");
				}
				
			}
		}
		
		private function onQueding(evt:Event):void{
			if(window._fnt_shuru_cdkey.isInputed()){
				
				
				
				var cdkey:String=window._fnt_shuru_cdkey.text;
				cdkey=StringUtil.trim(cdkey);
				cdkey=cdkey.toLocaleLowerCase();
				while(cdkey.indexOf("-")!=-1){
					cdkey=cdkey.replace("-","");
				}
				trace("cdKey: "+cdkey);
				C2SEmitter.getNewCdKeyReward(cdkey);
				
			}else{
				Util.flow("请输入CDKey");
			}
		}
		
		public override function destroy():void
		{
			// todo
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			S2CHanlder.instance.Opt_Message_SN.remove(onErrorMessage);
			super.destroy();
		}
	}
}

