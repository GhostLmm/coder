package ui.fuben
{
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.MapModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import core.event.TqtEvent;
	
	import util.Util;
	
	public class MDI_FubenPaihangReward extends Mediator
	{
		[Inject]
		public var wm:FubenPaihangRewardWindow;
		[Inject]
		public var mapModel:MapModel;
		public function MDI_FubenPaihangReward()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
//			var nowPaimg:int=mapModel.getFubenPaiming_Now();
//			var oldPaimg:int=mapModel.getFubenPaiming_Old();
			var old:Object=JSON.parse(GameVOManager.getInstance().extrdata.fubenPaimingOld);
			var now:Object=JSON.parse(GameVOManager.getInstance().extrdata.fubenPaimingNow);
			
			
			
			var id1:int;
			var id2:int;
			var paiming1:int;
			var paiming2:int;
			
			for (var key:String in old){
				id2=int(key);
				paiming2=old[key];
			}
			for (var key:String in now){
				id1=int(key);
				paiming1=now[key];
			}
			
			if(id1<=0){
				wm._fnt_fuben1.text="";
				wm._fnt_mingci1.text=Util.getLanguage("无排名");
			}else{
				wm._fnt_fuben1.text=XMLDataManager.getFubenById(id1).name;
				wm._fnt_mingci1.text=Util.getLanguage("排名",paiming1);
			}
			if(id2<=0){
				wm._fnt_fuben2.text="";
				wm._fnt_mingci2.text=Util.getLanguage("无排名");
			}else{
				wm._fnt_fuben2.text=XMLDataManager.getFubenById(id2).name;
				wm._fnt_mingci2.text=Util.getLanguage("排名",paiming2);
			}
			wm._scr_reward.initClass(Item_FubenPaihangReward);
			wm._scr_reward.setData(XMLDataManager.Node_fuben_paimingArray.concat());
			
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
		}
		
		
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
	}
}