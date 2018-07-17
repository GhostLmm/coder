package ui.window.huodong.items
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.HuodongControlModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_huodong_chongzhi;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.viewData.HuodongData;
	public class Item_Chongzhi_ChongzhiHuodongItem extends Base_Item implements IGridItem
	{
		public static const MaxNum:int=4;
		public var _fnt_name:FontField;
		
		public var _btn_lingqu:Button;
		
		public var _pos_1:Position;
		public var _pos_2:Position;
		public var _pos_3:Position;
		public var _pos_4:Position;
		
		public var _mc_complete:MovieClip;
		
		public function Item_Chongzhi_ChongzhiHuodongItem()
		{
			super();
		}	
		protected override function initModule():void
		{
			_fnt_name=new FontField(itemMaterial.fnt_name);
			
			_btn_lingqu=new Button(itemMaterial.btn_lingqu);
			
			_pos_1=new Position(itemMaterial.pos_1);
			_pos_2=new Position(itemMaterial.pos_2);
			_pos_3=new Position(itemMaterial.pos_3);
			_pos_4=new Position(itemMaterial.pos_4);
			_mc_complete=itemMaterial.mc_wancheng;
		}
		private function destoryMc():void
		{
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			
			if(_btn_lingqu){_btn_lingqu.destory();_btn_lingqu=null;};
			
			if(_pos_1){_pos_1.destory();_pos_1=null;};
			if(_pos_2){_pos_2.destory();_pos_2=null;};
			if(_pos_3){_pos_3.destory();_pos_3=null;};
			if(_pos_4){_pos_4.destory();_pos_4=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_lingqu,TqtEvent.BUTTON_CLICK,onLingquClicked);
			addTargetEvent(_btn_lingqu,TqtEvent.BUTTON_CLICK_DISABLE,onLingquClicked);
		}
		private function onLingquClicked(evt:Event):void
		{
			var huodongControlModel:HuodongControlModel=Context.getInjectInstance(HuodongControlModel);
			/*if(huodongControlModel.checkIfChongzhiRewardAreadyLingqu(data.id))
			{
				Util.flow("活动奖励已经领取过了");
				return;
			}
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			var huodongData:HuodongData=huodongControlModel.getHuodongData(HuodongControlModel.HuodongType_Chongzhi);
			var timeResult:JudgeResult=HuodongControlModel.checkHuodongTime(timerModel.serverTime,huodongData.huodongSwitchVo.startTime,huodongData.huodongSwitchVo.endTime);
			if(!timeResult.success)
			{
				Util.flow(timeResult.desc);
				return;
			}
			if(huodongControlModel.huodongDetail.chongzhiCur<data.chongzhi_cash)
			{
				Util.flow("充值没有达到要求，不能领取充值奖励",data.chongzhi_cash);
				return;
			}*/
			var re:JudgeResult=huodongControlModel.couldLinquChongzhiJiangli(data);
			if(re.success){
				huodongControlModel.cacheChongzhiLinquId=data.id;
				C2SEmitter.GetChongzhiReward_Huodong(data.id);
			}else{
				Util.flow(re.desc);
			}
			
		}
		protected override function setShow():void
		{
			_fnt_name.text=Util.getLanguage("累计充值达到钱数",data.chongzhi_cash);
			var itemIdArray:Array=JSON.parse(data.item_id) as Array;
			var itemNumArray:Array=JSON.parse(data.item_num) as Array;
			var index:int;
			for(index=0;index<itemIdArray.length;index++)
			{
				var itemId:int=itemIdArray[index];
				var itemNum:int=itemNumArray[index];
				var pos:Position=this["_pos_"+(index+1)] as Position;				
				pos.fillWithObject(new JiangliMc().loadData({"key":"item","xid":itemId,"num":itemNum}));
			}
			var huodongControlModel:HuodongControlModel=Context.getInjectInstance(HuodongControlModel);
			if(huodongControlModel.checkIfChongzhiRewardAreadyLingqu(data.id))
			{
				_btn_lingqu.isEnabled=false;
			}
			else
			{
				_btn_lingqu.isEnabled=true;
			}
			var huodongControlModel:HuodongControlModel=Context.getInjectInstance(HuodongControlModel);
			var hasLingqu:Boolean=huodongControlModel.checkIfChongzhiRewardAreadyLingqu(data.id);
			if(hasLingqu){
				_btn_lingqu.visible=false;
				_mc_complete.visible=true;
			}else{
				_btn_lingqu.visible=true;
				_mc_complete.visible=false;
			}
			
		}
		
		protected override function get itemClassName():Class
		{
			return ItemChongzhiReward; 
		}
		private function get itemMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		public function get data():Node_huodong_chongzhi
		{
			return m_data as Node_huodong_chongzhi;
		}
	}
}



