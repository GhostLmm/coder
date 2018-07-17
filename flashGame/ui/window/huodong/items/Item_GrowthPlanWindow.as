package ui.window.huodong.items
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.GrowthModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.RewardsPackData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_jihua;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.ImageBitmap;
	import ui.widget.Position;
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	import view.viewData.GrowthPlanData;

	public class Item_GrowthPlanWindow extends Base_Item implements IGridItem
	{
		public var _pos_image:Position;
		
		public var _fnt_name:FontField;
		public var _fnt_desc:FontField;
		
		public var _btn_lingqu:Button;
		
		public var growthModel:GrowthModel;
		
		public var _mc_wancheng:MovieClip;
		
		public function Item_GrowthPlanWindow()
		{
			super();
		}
		protected override function initModule():void
		{
			growthModel=Context.getInjectInstance(GrowthModel);
			_pos_image=new Position(itemMaterial.pos_image);
			_fnt_desc=new FontField(itemMaterial.fnt_desc);
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_btn_lingqu=new Button(itemMaterial.btn_lingqu);
			_mc_wancheng=itemMaterial.mc_wancheng;
		}
		protected override function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onMessage);
			addTargetEvent(_btn_lingqu,TqtEvent.BUTTON_CLICK,onLingquClicked);
		}
		private function onMessage(_mesType:String,_code:int):void
		{
			if(_mesType==C2SEmitter.REQ_LingquChengzhangJihuaHandler)
			{
				if(_code==1)
				{
					if(data==null)
					{
						return;
					}
					if(data.xml.id==growthModel.cacheXmlId)
					{
						var param:RewardsPackData=new RewardsPackData();
						param.bouns_cash=data.xml.cash;
						WindowManager.openOnlyWinodw(CommonRewardWindow,param);
					}
				}
			}
		}
		private function onLingquClicked(evt:Event):void
		{
			/*if(!growthModel.isAreadyBuy())
			{
				Util.flow("尚未购买成长计划，不能领取");
				return;
			}
			if(data.isLingqu)
			{
				Util.flow("已经领取过，不能再次领取");
				return;
			}
			if(!data.levelCouldLingqu())
			{
				Util.flow("达到等级才能领取成长计划",data.xml.lv_limit);
				return;	
			}*/
			var re:JudgeResult=growthModel.couldLinqu(data);
			if(re.success){
				growthModel.cacheXmlId=data.xml.id;
				growthModel.lingqu(data.xml.id);
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
			
		}
		protected override function setShow():void
		{
			var xml:Node_jihua=data.xml;
			_fnt_name.text=xml.name;
			_fnt_desc.text=xml.desc;
			_pos_image.fillWithObject(new ImageBitmap(xml.icon));
			if(data.isLingqu)
			{
				_btn_lingqu.visible=false;
				_mc_wancheng.visible=true;
			}
			else
			{
				_btn_lingqu.visible=true;
				_mc_wancheng.visible=false;
			}
			
			
		}
		public override function destory():void
		{
			growthModel=null;
			S2CHanlder.instance.Opt_Message_SN.remove(onMessage);
			if(_pos_image){_pos_image.destory();_pos_image=null;};
			if(_fnt_desc){_fnt_desc.destory();_fnt_desc=null;};
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_btn_lingqu){_btn_lingqu.destory();_btn_lingqu=null;};
			_mc_wancheng=null;
			super.destory();
		}
		
		protected override function get itemClassName():Class
		{
			return ItemJihua; 
		}
		private function get itemMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		private function get data():GrowthPlanData
		{
			return m_data as GrowthPlanData;
		}
	}
}
