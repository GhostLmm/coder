package view.mc
{
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.ItemVO;
	import com.fish.modules.core.models.ItemData;
	import com.fish.modules.core.models.LueduoModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.Node_skill;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.mc.ItemMc;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.ImageBitmap;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	import ui.window.dongfu.skill.SkillHechengWindow;
	import ui.window.lueduo.LueduoWindow;
	
	import view.Base_Mc;
	
import flash.display.MovieClip
	public class Mc_Hecheng_Skill extends Base_Mc
	{
		private var _pos_item_bg:Position;
		private var _mc_dianjilveduo2:MovieClip;
		private var _pos_item:Position;
		private var _fnt_num:FontField;
		private var _btn_dianjilueduo:Button;

		private var _prg_num:ProgressManager;
		private var index:int;
		
		private var _fnt_name:FontField;
		
		public function Mc_Hecheng_Skill()
		{
			super();
		}
		protected override function initModule():void
		{
			mcMaterial.mc_dianjilveduo2
			_pos_item_bg=new Position(mcMaterial.pos_item_bg);
			_pos_item=new Position(mcMaterial.pos_item);			
			_fnt_num = new FontField(mcMaterial.mc_num.fnt_num);			
			_prg_num = new ProgressManager(null,_fnt_num,ProgressManager.SUPPLY);
			_btn_dianjilueduo=new Button(mcMaterial.mc_dianjilveduo2);
			_fnt_name=new FontField(mcMaterial.fnt_name);
		}
		public override function destory():void
		{
			if(_pos_item_bg){_pos_item_bg.destory();_pos_item_bg=null;};
			if(_pos_item){_pos_item.destory();_pos_item=null;};
			if(_fnt_num){_fnt_num.destory();_fnt_num=null;};
			if(_prg_num){_prg_num.destory();_prg_num=null;};
			if(_btn_dianjilueduo){_btn_dianjilueduo.destory();_btn_dianjilueduo=null;};
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			
			super.destory();
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_dianjilueduo,TqtEvent.BUTTON_CLICK,onLueduoClicked);
		}
		private function onLueduoClicked(evt:Event):void
		{
			var luoduoModel:LueduoModel=Context.getInjectInstance(LueduoModel);
			var itemId:int=data["suipian"+index];
			luoduoModel.cacheLueduoItemId=itemId;
			WindowManager.getWindowByClass(LueduoWindow).open();
//			WindowManager.closeWindowByClass(SkillHechengWindow);
		}
		protected override function setShow():void
		{
			var itemId:int=data["suipian"+index];
			var itemVo:ItemVO=GameVOManager.getInstance().getItemVOByxid(itemId);
			var node:Node_item=XMLDataManager.getItemById(itemId);
			
			_pos_item.fillWithObject(new ImageBitmap(node.icon));
			_pos_item_bg.fillWithObject(new ImageBitmap("bg_zhuangbei_"+node.star));
			
			_fnt_name.text=node.name;
			_prg_num.devider=1;
			_prg_num.progress=(itemVo)?itemVo.num:0;
			if(_prg_num.progress<=0)
			{
				_btn_dianjilueduo.visible=true;
			}
			else
			{
				_btn_dianjilueduo.visible=false;
			}
		}
		public function setData(_data:Object,_index:int):void
		{
			m_data=_data;
			index=_index;
			setShow();
		}
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("McItemSkill") as Class); 
		}
		private function get mcMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		private function get data():Node_skill
		{
			return m_data as Node_skill;
		}
	}
}
