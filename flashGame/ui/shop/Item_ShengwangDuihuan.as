package ui.shop
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.ShengwangModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_rongyu_shangdian;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	
	import util.Util;
	
	import view.Base_Item;
	
	public class Item_ShengwangDuihuan extends Base_Item implements IGridItemMax
	{
		public var _pos_touxiang:Position;
		public var _pos_huobi:Position;
		
		public var _fnt_name:FontField;
		public var _fnt_shanghaizhi:FontField;
		
		public var _mc_bg:MovieClip;
		public var _fnt_goumai:FontField;
		
		private var _prg:ProgressManager;
		
		public function Item_ShengwangDuihuan()
		{
			super();
		}
		protected override function initModule():void
		{
			
			_pos_touxiang=new Position(itemMaterial.pos_touxiang);
			_pos_huobi=new Position(itemMaterial.pos_huobi);
			
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_fnt_shanghaizhi=new FontField(itemMaterial.fnt_shanghaizhi);
			
			_mc_bg=itemMaterial.mc_bg;
			_mc_bg.stop();
			
			_fnt_goumai=new FontField(itemMaterial.fnt_goumai);
			_prg=new ProgressManager(null,_fnt_goumai);
			
			this.mouseChildren=false;
			this.mouseEnabled=true;
			itemMaterial.mc_vip.visible=false;
		}
		private function destoryMc():void
		{
			Util.killDiaplayButtonEffect(this);
			if(_pos_touxiang){_pos_touxiang.destory();_pos_touxiang=null;};
			if(_pos_huobi){_pos_huobi.destory();_pos_huobi=null;};
			
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_shanghaizhi){_fnt_shanghaizhi.destory();_fnt_shanghaizhi=null;};
			
			if(_fnt_goumai){_fnt_goumai.destory();_fnt_goumai=null;};
			if(_mc_bg){_mc_bg=null;};
			if(_prg){_prg.destory();_prg=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(this,TQTTouchEvent.TOUCH_TAP,onGoumaiClick);
		}
		private function onGoumaiOK(evt:Event=null):void
		{
			if(m_data){
				
				C2SEmitter.buyShenmiShangdianItem(m_data.id);
			}
		}
		private function onGoumaiClick(evt:Event):void
		{
			var shengwangModel:ShengwangModel=Context.getInjectInstance(ShengwangModel);
			if(shengwangModel.checkIfReachLimit(node))
			{
				Util.flow("购买次数超过上限");
				return;
			}
			var re:JudgeResult=ShengwangModel.couldGoumai(node);
			if(re.success)
			{
				
				shengwangModel.cacheBuyXid=node.id;
				C2SEmitter.shengwangBuy(node.id);
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		protected override function setShow():void
		{
			Util.setDiaplayButtonEffect(this,false);
			Util.createJiangliIcon(_pos_touxiang,node.item_type,node.item_id);
			
			_fnt_name.text=Util.createJiangliDesc(node.item_type,node.item_num,node.item_id);
			_fnt_shanghaizhi.text=node.price.toString();
			
			_pos_huobi.fillWithBitmapByClassName("image_"+node.price_type);
			var shengwangModel:ShengwangModel=Context.getInjectInstance(ShengwangModel);
			if(node.limit==0)
			{
				_fnt_goumai.text=Util.getLanguage("点击购买");
			}
			else
			{
				_prg.devider=node.limit;
				_prg.progress=shengwangModel.getAreadyBuyNum(node.id);
			}
			if(shengwangModel.checkIfReachLimit(node))
			{
				_mc_bg.gotoAndStop(3);
			}
			else
			{
				_mc_bg.gotoAndStop(1);
			}
		}
		protected override function get itemClassName():Class
		{
			return ItemShop;
		}
		private function get itemMaterial():ItemShop
		{
			return m_mc as ItemShop;
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
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
		
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		
		public function get data():Object
		{
			return m_data;
		}		
		public function enterMovie():*
		{
			return null;
		}
		public function get node():Node_rongyu_shangdian
		{
			return m_data as Node_rongyu_shangdian;
		}
	}
}

