package ui.bag
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.tempData.BagData;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.PlayerGuideManager;
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import ui.equip.EquipChuandaiWindow;
	import ui.equip.MDI_EquipRonglian;
	import ui.mc.ItemMc;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	
	public class BagEquipItem extends Base_Item implements IGridItemMax
	{
		private var _mc_up:MovieClip;
		private var _pos_item:Position;
		private var _mc_suo:MovieClip;
		
//		private var _mc_down:MovieClip;
		
		public function BagEquipItem()
		{
			super();
		}
		
		protected override function get itemClassName():Class{
			return McBag;
		}
		public override function destory():void{
			_mc_up=null;
			_mc_suo=null;
			if(_pos_item) {_pos_item.destory();_pos_item=null;}
			super.destory();
		}
		protected override function setShow():void{
			
//			_fnt_num.visible=false;
			if(m_data is BagData){
				var bagData:BagData = m_data as BagData;
				if(bagData.lock){
					_pos_item.destory();
					_mc_up.visible=false;
					_mc_up.stop();
					_mc_suo.visible=true;
				}else{
					if(bagData.data){
						var equipData:EquipData=bagData.data as EquipData;
						_pos_item.fillWithObject(new ItemMc().loadData(equipData));
						_mc_up.visible=false;
						_mc_up.stop();
						_mc_suo.visible=false;
						
						if(bagData.state==1){
							_mc_up.visible=true;
							_mc_up.play();
						}
						if(bagData.state==-1){
						}
						
					}else{
						_pos_item.destory();
						_mc_up.visible=false;
						_mc_up.stop();
						_mc_suo.visible=false;
					}
				}
			}
			
			if(m_data is EquipData){
				_pos_item.fillWithObject(new ItemMc().loadData(m_data));
				_mc_up.visible=false;
				_mc_up.stop();
				_mc_suo.visible=false;
			}
			
			if(m_data==null){
				_pos_item.destory();
				_mc_up.visible=false;
				_mc_up.stop();
				_mc_suo.visible=false;
			}
		}
		protected override function initModule():void{
			var mc:McBag=m_mc as McBag;
			_mc_up=mc.mc_up;
			_mc_up.stop();
			_pos_item=new Position(mc.pos_item);
			_mc_suo=mc.mc_suo;
			
			addTargetEvent(this,TQTTouchEvent.TOUCH_TAP,onClick);
		}
		
		private function onClick(evt:Event):void{
			
			if( m_data is BagData){
				var bagData:BagData = m_data as BagData;
				if(bagData.lock){
					var cost:int=(Context.getInjectInstance(BagModel) as BagModel).calcUnlockBagCost(bagData.lockIndex);
					var desc:String=Util.getLanguage("解锁背包提示",cost,bagData.lockIndex);
					WindowManager.openAlert(desc,jieshuoOk);
				}else{
					if(bagData.data){
						WindowManager.openOnlyWinodw(EquipChuandaiWindow,bagData.data);
						if(!Util.guideIsCompelete()){
							PlayerGuideManager.getInstance().createFadeButtonClick("equipItem");
						}
					}
				}
			}
			
			if((m_data is EquipData) || m_data==null){
				var mdi:MDI_EquipRonglian=Context.getInjectInstance(MDI_EquipRonglian);
				if(mdi){
					mdi.onScrSelected(index);
				}
			}
			
		}
		
		private function jieshuoOk():void{
			var bagData:BagData = m_data as BagData;
			var re:JudgeResult=(Context.getInjectInstance(BagModel) as BagModel).couldUnlockBag(bagData.lockIndex);
			if(re.success){
				C2SEmitter.unlockBag(bagData.lockIndex);
			}else{
				if(re.code==JudgeResult.CD_CashNotEnough){
					CommonControlFun.cashNotEnoughDo();
				}else{
					Util.flow(re.desc);
				}
			}
			
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
		
		private var _index:int;
		public function set index(value:int):void
		{
			_index=value;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function get data():Object
		{
			return m_data;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}