package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_banghui_juanxian;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	
import flash.display.MovieClip
	public class Item_Gonghuidating extends Base_Item implements IGridItem
	{
		public var _btn_jianshe:Button;
		
		public var _fnt_jianshe_title:FontField;
		public var _fnt_money:FontField;
		public var _fnt_jianshe_desc1:FontField;
		public var _fnt_jianshe_desc2:FontField;
		
		public var _pos_cost_icon:Position;
		
		public function Item_Gonghuidating()
		{
			super();
		}
		protected override function initModule():void
		{
			_btn_jianshe=new Button(itemMaterial.btn_jianshe);
			
			_fnt_jianshe_title=new FontField(itemMaterial.fnt_jianshe_title);
			_fnt_money=new FontField(itemMaterial.fnt_money);
			_fnt_jianshe_desc1=new FontField(itemMaterial.fnt_jianshe_desc1);
			_fnt_jianshe_desc2=new FontField(itemMaterial.fnt_jianshe_desc2);
			
			_pos_cost_icon=new Position(itemMaterial.pos_cost_icon);
		}
		private function destoryMc():void
		{
			if(_btn_jianshe){_btn_jianshe.destory();_btn_jianshe=null;};
			
			if(_fnt_jianshe_title){_fnt_jianshe_title.destory();_fnt_jianshe_title=null;};
			if(_fnt_money){_fnt_money.destory();_fnt_money=null;};
			if(_fnt_jianshe_desc1){_fnt_jianshe_desc1.destory();_fnt_jianshe_desc1=null;};
			if(_fnt_jianshe_desc2){_fnt_jianshe_desc2.destory();_fnt_jianshe_desc2=null;};
			
			if(_pos_cost_icon){_pos_cost_icon.destory();_pos_cost_icon=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_jianshe,TqtEvent.BUTTON_CLICK,onJiansheClicked);
			addTargetEvent(_btn_jianshe,TqtEvent.BUTTON_CLICK_DISABLE,onJiansheClicked);
		}
		private function onJiansheClicked(evt:Event):void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(gonghuiModel.checkIfAreadyJuanxian())
			{
				Util.flow("今日已经捐献过了");
				return;
			}
			var re:JudgeResult=GonghuiModel.couldJuanxian(data);
			if(re.success)
			{
				C2SEmitter.jiansheDating(data.id);
			}
			else if(re.code==JudgeResult.CD_CashNotEnough)
			{
				CommonControlFun.cashNotEnoughDo();
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		protected override function setShow():void
		{
			if(null==data)
			{
				return;
			}
			_fnt_jianshe_title.text=data.title;
			_fnt_money.text=data.cost.toString();
			_fnt_jianshe_desc1.text=Util.getLanguage("增加军团总建设",data.get_banghuijianshe);
			_fnt_jianshe_desc2.text=Util.getLanguage("增加个人贡献",data.get_gerengongxian);
			_pos_cost_icon.fillWithBitmapByClassName("icon_"+data.type);
			
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(gonghuiModel.checkIfAreadyJuanxian())
			{
				_btn_jianshe.isEnabled=false;
			}
			else
			{
				_btn_jianshe.isEnabled=true;
			}
		}
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		protected override function get itemClassName():Class
		{
			return banghui_jianshe_item; 
		}
		private function get itemMaterial():banghui_jianshe_item 
		{
			return m_mc as banghui_jianshe_item; 
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get data():Node_banghui_juanxian
		{
			return m_data as Node_banghui_juanxian;
		}
	}
}
