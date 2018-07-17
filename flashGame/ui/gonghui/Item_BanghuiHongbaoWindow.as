package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.ProgressManager;
	
	import util.Util;
	
	import view.Base_Item;
	import view.viewData.BanghuiHongbaoData;

	public class Item_BanghuiHongbaoWindow extends Base_Item implements IGridItem
	{
		private var _btnlingqu:Button;
		private var _fnt_name:FontField;
		private var _fnt_shuliang:FontField;
		private var _fnt_kede:FontField;
		private var _prg:ProgressManager;
		
		public function Item_BanghuiHongbaoWindow()
		{
			super();
		}
		protected override function initModule():void
		{
			_btnlingqu=new Button(itemMaterial.btnlingqu);
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_fnt_shuliang=new FontField(itemMaterial.fnt_shuliang);
			_fnt_kede=new FontField(itemMaterial.fnt_kede);
			_prg=new ProgressManager(null,_fnt_shuliang);
		}
		private function destoryMc():void
		{
			if(_btnlingqu){_btnlingqu.destory();_btnlingqu=null;};
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_shuliang){_fnt_shuliang.destory();_fnt_shuliang=null;};
			if(_fnt_kede){_fnt_kede.destory();_fnt_kede=null;};
			if(_prg){_prg.destory();_prg=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btnlingqu,TqtEvent.BUTTON_CLICK,onLingquClicked);
			addTargetEvent(_btnlingqu,TqtEvent.BUTTON_CLICK_DISABLE,onLingquClicked);
		}
		private function onLingquClicked(evt:Event):void
		{
			if(data.leftHongbaoNum<=0)
			{
				Util.flow("下次早点来吧，红包已经被抢光了");
				return;
			}
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			gonghuiModel.LingquHongbaoCash_Before=userModel.userVo.userCash;
			C2SEmitter.LingquBanghuiHongbaoList(data.vo.id);
		}
		protected override function setShow():void
		{
			_fnt_name.text=data.userName;
			_fnt_kede.text=data.HongbaoCashRange;
			_prg.devider=GonghuiModel.HongbaoCouldLingquNum;
			_prg.progress=data.leftHongbaoNum;
		}
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		protected override function get itemClassName():Class
		{
			return item_linghongbao; 
		}
		private function get itemMaterial():item_linghongbao 
		{
			return m_mc as item_linghongbao; 
		}
		private function get data():BanghuiHongbaoData
		{
			return m_data as BanghuiHongbaoData;
		}
	}
}
