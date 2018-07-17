package ui.layer
{
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.ChoujiangModel;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.ShenmiShangdianModel;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import core.PlayerGuideManager;
	import core.event.TQTTouchEvent;
	
	import snake.GameManager;
	import snake.PlayMoveGuide;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import util.GameTime;
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	
	public class Item_ShortKey extends Base_Item implements IGridItemMax
	{
		private var _mc_bg:MovieClip;
		private var _fnt_name:FontField;
		private var _mc_jiantou:MovieClip;
		private var _pos_jianzhu:Position;
		
		private var _btn:Button;
		
		
		
		public function Item_ShortKey($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function get itemClassName():Class{
			return McItemJianzhu;
		}
		protected override function registerEvent():void{
			addTargetEvent(this,TQTTouchEvent.TOUCH_TAP,onTap);
//			TimerModel.instance.frame_SN.add(onFrame);
			TimerModel.instance.secondTimer_SN.add(onTick);
		}
		
		private function onTick():void{
			_mc_jiantou.visible=false;
			if(m_data){
				var shortKeyData:ShortKeyData=m_data as ShortKeyData;
				
				if(shortKeyData.key=="qiyuan"){
					var choujiangModel:ChoujiangModel=Context.getInjectInstance(ChoujiangModel);
					var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
					
					if(choujiangModel.hasInitVO()&&!isNaN(choujiangModel.choujiangVo.haixuanFreshTime)&&!isNaN(choujiangModel.choujiangVo.jingxuanFreshTime)){
						if(choujiangModel.choujiangVo.haixuanChosenid<0 || choujiangModel.choujiangVo.haixuanFreshTime-timerModel.serverTime<0
							|| choujiangModel.choujiangVo.jingxuanFreshTime-timerModel.serverTime<0)
						{
							_mc_jiantou.visible=true;
						}
					}
				}else if(shortKeyData.key=="paihang"){
					
				}else if(shortKeyData.key=="mail"){
					if(GameVOManager.getInstance().extrdata && GameVOManager.getInstance().extrdata.mailCount>0){
						_mc_jiantou.visible=true;
					}
				}else if(shortKeyData.key=="shop"){
					/*var shopModel:ShenmiShangdianModel=Context.getInjectInstance(ShenmiShangdianModel);
					if(shopModel.hasCouldBuy){
						_mc_jiantou.visible=true;
					}*/
				}
				
			}
		}
		
		/*private function onFrame(t:Number):void{
			if(m_data){
				var shortKeyData:ShortKeyData=m_data as ShortKeyData;
				if(GameManager.manager && GameManager.manager.player){
					var fr:int;
					if(GameManager.manager.player.character_x<shortKeyData.buildingX){
						fr=1;
					}else{
						fr=2;
					}
					if(_mc_jiantou.currentFrame!=fr){
						_mc_jiantou.gotoAndStop(fr);
					}
				}
			}
		}*/
		
		private function onTap(evt:Event):void{
			
			
			var key:String=m_data.key;
			var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			if(!guideModel.isComplete){
				PlayerGuideManager.getInstance().createFadeButtonClick(key);
			}
			switch(m_data.key)
			{
				case "qiyuan":
					CommonControlFun.gotoQiyuanta();
					break;
				case "shop":
					CommonControlFun.gotoShop();
					break;
				case "fuben":
					CommonControlFun.gotoFuben();
					break;
				case "dig":
					CommonControlFun.gotoWakuang();
					break;
				case "paihang":
					CommonControlFun.gotoPaihangbang();
					break;
				case "mail":
					CommonControlFun.gotoMail();
					break;
				case "leitai":
					PlayMoveGuide.openLeitai();
					break;
				case "tiejiangpu":
					PlayMoveGuide.openTiejiangpu();
					break;
			}
			
		}
		
		protected override function initModule():void{
			_mc_bg=m_mc.mc_bg;
			_fnt_name=new FontField(m_mc.fnt_name);
			_mc_jiantou=m_mc.mc_jiantou;
			_mc_bg.stop();
			_mc_jiantou.stop();
			_mc_jiantou.visible=false;
			_pos_jianzhu=new Position(m_mc.pos_jianzhu);
			_btn=new Button(m_mc as MovieClip);
//			Util.setDiaplayButtonEffect(m_mc as Sprite);
		}
		
		public override function destory():void{
//			Util.killDiaplayButtonEffect(m_mc as Sprite);
//			TimerModel.instance.frame_SN.remove(onFrame);
			TimerModel.instance.secondTimer_SN.remove(onTick);
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			_mc_bg=null;
			_mc_jiantou=null;
			if(_pos_jianzhu) {_pos_jianzhu.destory(); _pos_jianzhu=null;}
			if(_btn) {_btn.destory(); _btn=null;}
			super.destory();
		}
		
		protected override function setShow():void{
			var shortKeyData:ShortKeyData=m_data as ShortKeyData;
			_fnt_name.text=shortKeyData.name;
			_pos_jianzhu.fillWithBitmapByClassName(shortKeyData.icon);
			onTick();
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