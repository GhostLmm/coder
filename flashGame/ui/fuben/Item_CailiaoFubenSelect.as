package ui.fuben
{
	import com.fish.modules.core.events.CoreViewEvent;
	import com.fish.modules.core.models.MapModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ViewDispatcher;
	import com.ghostlmm.xmldata.Node_fuben;
	import com.ghostlmm.xmldata.Node_fuben_map;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.LayerController;
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import snake.PlayMoveGuide;
	
	import ui.layer.MDI_UiLayer;
	import ui.layer.SceneLayer;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	
	public class Item_CailiaoFubenSelect extends Base_Item implements IGridItemMax
	{
		private var _pos_map_image:Position;
		private var _fnt_map_name:FontField;
		private var _fnt_fuben_name:FontField;
		private var _fnt_kaiqi:FontField;
		private var _btn_qianwang:Button;
		private var _mc_bag:MovieClip;
		
		public function Item_CailiaoFubenSelect($mc:MovieClip=null)
		{
			super($mc);
		}
		protected override function get itemClassName():Class{
			return ItemHuodeTujing;
		}
		protected override function initModule():void{
			var mc:ItemHuodeTujing = m_mc as ItemHuodeTujing;
			_pos_map_image=new Position(mc.pos_map_image);
			_fnt_map_name=new FontField(mc.fnt_map_name);
			_fnt_kaiqi=new FontField(mc.fnt_kaiqi);
			_btn_qianwang=new Button(mc.btn_qianwang);
			_fnt_fuben_name=new FontField(mc.fnt_fuben_name);
			
			_mc_bag=mc.mc_bg;
		}
		public override function destory():void{
			if(_pos_map_image) {_pos_map_image.destory();_pos_map_image=null;}
			if(_fnt_map_name) {_fnt_map_name.destory();_fnt_map_name=null;}
			if(_fnt_kaiqi) {_fnt_kaiqi.destory();_fnt_kaiqi=null;}
			if(_btn_qianwang) {_btn_qianwang.destory();_btn_qianwang=null;}
			if(_fnt_fuben_name) {_fnt_fuben_name.destory();_fnt_fuben_name=null;}
			super.destory();
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_qianwang,TqtEvent.BUTTON_CLICK,onQianwangClicked);
			addTargetEvent(_btn_qianwang,TqtEvent.BUTTON_CLICK_DISABLE,onQianwangClicked);
		}
		protected override function setShow():void
		{
			var node:Node_fuben = m_data as Node_fuben;
			var mapNode:Node_fuben_map = XMLDataManager.getFuben_mapById(node.fuben_map);
			
			_pos_map_image.fillWithBitmapByClassName(mapNode.image);
			_fnt_map_name.text=mapNode.name;
			_fnt_fuben_name.text=node.name;
			
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			if(mapModel.checkCouldPk(node)){
				_fnt_kaiqi.text="";
				_btn_qianwang.isEnabled=true;
				_mc_bag.gotoAndStop(1);
			}else{
				_btn_qianwang.isEnabled=false;
				_fnt_kaiqi.text=Util.getLanguage("副本未开启");
				_mc_bag.gotoAndStop(3);
			}
//			var zhangjieId:int=int(data.id/MapModel.DealBaseMap);
//			var mapXml:Node_map=XMLDataManager.Node_mapDic[zhangjieId] as Node_map
//			_fnt_zhangjie_num.text=zhangjieId.toString();
//			_fnt_zhangjie_name.text=mapXml.name;
//			
//			var copyId:int=data.id%MapModel.DealBaseMap;
//			_fnt_fuben_num.text = Util.stringFormat("{0}-{1}",zhangjieId,copyId);
//			_fnt_fuben_name.text = data.name;
//			
//			if(MapModel.checkCouldPk(data.id))
//			{
//				_btn_qianwang.isEnabled=true;
//				_fnt_weikaiqi.visible=false;
//			}
//			else
//			{
//				_btn_qianwang.isEnabled=false;
//				_fnt_weikaiqi.visible=true;
//			}
		}
		private function onQianwangClicked(evt:Event):void
		{
			var node:Node_fuben=m_data as Node_fuben;
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			if(!mapModel.checkCouldPk(node)){
				Util.flow("关卡尚未开启");
				return;
			}
			
//			LayerController.instance.sceneLayer.addScene(SceneLayer.Scene_Map,{guideFuben:node.id});
			if(!CommonControlFun.isInZhucheng()){
				Util.flow("当前不在主城中，无法完成指引");
				return ;
			}
			CommonControlFun.gotoFuben(node.id);
			WindowManager.closeAllWindow();
			
			
//			if(!MapModel.checkCouldPk(data.id))
//			{
//				Util.flow("关卡尚未开启");
//				return;
//			}
//			var mapModel:MapModel=Context.getInjectInstance(MapModel);
//			mapModel.cacheCailiaoCopyId=data.id;
//			var viewDispatcher:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
//			viewDispatcher.dispatchEvent(new CoreViewEvent(CoreViewEvent.JumpScene,{scene:MDI_UiLayer.Label_QiyuScene}));
		}
		public function set enable(value:Boolean):void
		{
		}
		
		public function get enable():Boolean
		{
			return false;
		}
		
		public function set selected(value:Boolean):void
		{
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		
		public function set index(value:int):void
		{
		}
		
		public function get index():int
		{
			return 0;
		}
		
		public function get data():Object
		{
			return null;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}