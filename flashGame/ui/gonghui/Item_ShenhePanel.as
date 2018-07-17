package ui.gonghui
{
	import com.fish.modules.core.gameVO.ShengqingpersionVO;
	import com.fish.modules.core.models.GonghuiModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	
import flash.display.MovieClip
	public class Item_ShenhePanel extends Base_Item implements IGridItem
	{
		private var _btn_tongguoqingqiu:Button;
		private var _btn_jujueqingqiu:Button;
		
		private var _pos_vip:Position;
		
		private var _fnt_name:FontField;
		private var _fnt_lv:FontField;
		private var _fnt_paiming:FontField;
		
		public function Item_ShenhePanel()
		{
			super();
		}
		
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		protected override function initModule():void
		{
			_btn_tongguoqingqiu=new Button(itemMaterial.btn_tongguoqingqiu);
			_btn_jujueqingqiu=new Button(itemMaterial.btn_jujueqingqiu);
			
			_pos_vip=new Position(itemMaterial.pos_vip);
			
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_fnt_lv=new FontField(itemMaterial.fnt_lv);
			_fnt_paiming=new FontField(itemMaterial.fnt_paiming);
		}
		private function destoryMc():void
		{
			if(_btn_tongguoqingqiu){_btn_tongguoqingqiu.destory();_btn_tongguoqingqiu=null;};
			if(_btn_jujueqingqiu){_btn_jujueqingqiu.destory();_btn_jujueqingqiu=null;};
			
			if(_pos_vip){_pos_vip.destory();_pos_vip=null;};
			
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_lv){_fnt_lv.destory();_fnt_lv=null;};
			if(_fnt_paiming){_fnt_paiming.destory();_fnt_paiming=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_tongguoqingqiu,TqtEvent.BUTTON_CLICK,onTongguoClicked);
			addTargetEvent(_btn_jujueqingqiu,TqtEvent.BUTTON_CLICK,onJujueClicked);
		}
		private function onTongguoClicked(evt:Event):void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(!gonghuiModel.checkIfIamHuizhang())
			{
				Util.flow("不具有权限");
				return;
			}
			GonghuiModel.tongyiShenqing(data.uid,gonghuiModel.myBanghuiData.bid);
		}
		private function onJujueClicked(evt:Event):void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(!gonghuiModel.checkIfIamHuizhang())
			{
				Util.flow("不具有权限");
				return;
			}
			GonghuiModel.jujueShenqing(data.uid,gonghuiModel.myBanghuiData.bid);
		}
		protected override function setShow():void
		{
			if(null==data)
			{
				return;
			}
			_fnt_lv.text=data.userLevel.toString();
			_fnt_name.text=data.userName;
			if(data.leitaiRank>0)
			{
				_fnt_paiming.text=Util.getLanguage("排名",data.leitaiRank);
			}
			else
			{
				_fnt_paiming.text=Util.getLanguage("没有擂台排名");
			}
			_pos_vip.fillWithBitmapByClassName("vip"+data.vipLevel);
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		protected override function get itemClassName():Class
		{
			return Item_Chengyuanshenhe; 
		}
		private function get itemMaterial():Item_Chengyuanshenhe 
		{
			return m_mc as Item_Chengyuanshenhe; 
		}
		private function get data():ShengqingpersionVO
		{
			return m_data as ShengqingpersionVO;
		}
	}
}
