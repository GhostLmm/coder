package snake.ui
{
	import com.ghostlmm.xmldata.Node_gun;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	
	import snake.viewdata.battle.GunChangeManager;
	
	import ui.widget.Position;
	
	import view.Base_Mc;
	
	public class Mc_Battle_GunChoose extends Base_Mc
	{
		public var _mc_bg:MovieClip;
		public var _pos_scroll_gun:Position;
		public var itemsArray:Array;
		
		public function Mc_Battle_GunChoose()
		{
			super();
		}
		protected override function initModule():void
		{
			_mc_bg=mcMaterial.mc_bg;
			_pos_scroll_gun=new Position(mcMaterial.pos_scroll_gun);
		}
		private function destroyMc():void
		{
			if(_mc_bg){_mc_bg=null;};
			if(_pos_scroll_gun){_pos_scroll_gun.destory();_pos_scroll_gun=null;};
		}
		public override function destory():void
		{
			GunChangeManager.getInstance().GunChange_SN.remove(update);
			destroyItems();
			destroyMc();
			super.destory();
		}
		protected override function registerEvent():void
		{
			GunChangeManager.getInstance().GunChange_SN.add(update);
			setShow();
		}
		private static const DerX:Number=0;
		private function update():void
		{
			destroyItems();
			itemsArray=[];
			var gunArray:Array=GunChangeManager.getInstance().totalGunCouldUse;
			var index:int;
			var gunNum:int=0;
			for(index=0;index<gunArray.length;index++)
			{
				var gunId:int=gunArray[index];
				if(gunId!=GunChangeManager.getInstance().currentUseGun)
				{
					var gunMc:Mc_Gun=new Mc_Gun();
					var gunNode:Node_gun=XMLDataManager.getGunById(gunId);
					gunMc.loadData(gunNode);
					gunMc.x=_pos_scroll_gun.rect.x+gunMc.width*gunNum+DerX;
					gunMc.y==_pos_scroll_gun.rect.y;
					addChild(gunMc);
					itemsArray.push(gunMc);
					gunNum++;
					gunMc.mouseChildren=false;
					gunMc.addEventListener(TQTTouchEvent.TOUCH_TAP,onTaped);
				}
			}
			_mc_bg.width=this.width;
		}
		private function onTaped(evt:Event):void
		{
			var mc:Mc_Gun=evt.target as Mc_Gun;
			GunChangeManager.getInstance().changeGun(mc.node.id);
		}
		private function destroyItems():void
		{
			if(null==itemsArray)
			{
				return;
			}
			var index:int;
			for(index=0;index<itemsArray.length;index++)
			{
				var mc:Mc_Gun=itemsArray[index];
				removeChild(mc);
				mc.removeEventListener(TQTTouchEvent.TOUCH_TAP,onTaped);
				mc.destory();
				mc=null;
			}
			itemsArray=null;
		}
		protected override function setShow():void
		{
			update();
		}
		protected override function get mcClassName():Class
		{
			return McFightGunScroll;
		}
		private function get mcMaterial():McFightGunScroll
		{
			return m_mc as McFightGunScroll;
		}
	}
}