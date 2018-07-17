package Tool
{
	import com.cc.units.Unit;
	import com.cc.units.Units;
	import com.sincetimes.transport.protocol.MiscLock;
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import huodong.DefenceManager;
	
	import myDisplay.GDisplay.GMainDisplay;
	import myDisplay.flashUI.UIManager;
	import myDisplay.flashUI.UI_SendTroops;

	/**
	 * 和多点触控相关的处理，目前包含如下功能
	 * 1、多点触控框选单位
	 * @author xuzonglian
	 */
	public class MultiTouchUtil
	{
		/** 总开关 */
		private var LOCK_All:int = 0;
		/** 军团歼灭战开关 */
		private var LOCK_NPCGroup:int = 0;
		/** 基地时开关 */
		private var LOCK_Base:int = 0;
		/** 打玩家开关 */
		private var LOCK_PlayerAttack:int = 0;
		/** 打NPC战役推图开关 */
		private var LOCK_NPC:int = 0;
		
		private static var instance:MultiTouchUtil = null;
		public function MultiTouchUtil()
		{
		}
		public static function getInstance():MultiTouchUtil
		{
			if(instance==null)
			{
				instance = new MultiTouchUtil();
			}
			return instance;
		}
		
		private var rectSprite:Sprite = null;
		/**
		 * 多点触摸框选单位初始化
		 */
		public function multiSelectInit():void
		{
			if(rectSprite == null)
			{
				rectSprite = new Sprite();
				GLOBAL._stage.addChild(rectSprite);
			}
			GLOBAL._stage.addEventListener(MouseEvent.MOUSE_DOWN, touchBeginHandler);
			GLOBAL._stage.addEventListener(MouseEvent.MOUSE_MOVE, touchMoveHandler);
			GLOBAL._stage.addEventListener(MouseEvent.MOUSE_UP, touchEndHandler);
			_selecting = false;
		}
		private function touchBeginHandler(evt:MouseEvent):void
		{
			setFinger(evt.touchPointID, evt.stageX, evt.stageY);
		}
		private function touchMoveHandler(evt:MouseEvent):void
		{
			setFinger(evt.touchPointID, evt.stageX, evt.stageY);
		}
		private function touchEndHandler(evt:MouseEvent):void
		{
			clearFinger(evt.touchPointID);
		}
		
		private var xxxx:Boolean = false;
		public function test():void
		{
			if(!xxxx)
			{
				setFinger(1, 1, 1);
				setFinger(2, GLOBAL._gameSize.width, GLOBAL._gameSize.height);
			}
			else
			{
				clearFinger(1);
				clearFinger(2);
			}
			xxxx = !xxxx;
		}
		
		private var finger1:int = -1;
		private var finger2:int = -1;
		private var hasFinger1:Boolean = false;
		private var hasFinger2:Boolean = false;
		private var location1:Point = new Point();
		private var location2:Point = new Point();
		private var x1:Number;
		private var x2:Number;
		private var y1:Number;
		private var y2:Number;
		private var _selecting:Boolean=false;
		private function setFinger(pointID:int, xx:Number, yy:Number):void
		{
			var needUpdateRect:Boolean = false;
			if(hasFinger1 && finger1 == pointID)
			{
				if(location1.x - xx > 5 || location1.x - xx < -5 || location1.y - yy > 5 || location1.y - yy < -5)
				{
					needUpdateRect = true;
					finger1 = pointID;
					location1.x = xx;
					location1.y = yy;
				}
			}
			else if(hasFinger2 && finger2 == pointID)
			{
				if(location2.x - xx > 5 || location2.x - xx < -5 || location2.y - yy > 5 || location2.y - yy < -5)
				{
					needUpdateRect = true;
					finger2 = pointID;
					location2.x = xx;
					location2.y = yy;
				}
			}
			else if(hasFinger1==false)
			{
				hasFinger1 = true;
				needUpdateRect = true;
				finger1 = pointID;
				location1.x = xx;
				location1.y = yy;
			}
			else if(hasFinger2 == false)
			{
				hasFinger2 = true;
				needUpdateRect = true;
				finger2 = pointID;
				location2.x = xx;
				location2.y = yy;
			}
			else{
				return;
			}
			if(needUpdateRect)
			{
				updateRect();
			}
		}
		private function clearFinger(pointID:int):void
		{
			if(hasFinger1 && finger1 == pointID){
				hasFinger1 = false;
				finger1 = -1;
				updateRect();
			}
			if(hasFinger2 && finger2 == pointID){
				hasFinger2 = false;
				finger2 = -1;
				updateRect();
			}
		}
		private function updateRect():void
		{
			var canselect:Boolean = false;
			if(LOCK_All == 0)//总开关
			{
				canselect = false;
				return;
			}
			if(GLOBAL._mode == "build" && LOCK_Base == 1 && DefenceManager.getInstance().isStart==false && GOGOBAR.YanxiMode==false)//自己基地
			{
				canselect = true;
			}
			if(GLOBAL._mode == "wmattack")
			{
				if(GLOBAL.nowNPCType == 1 && LOCK_NPC == 1)//战役NPC
				{
					canselect = true;
				}
				if(GLOBAL.nowNPCType == 2 && LOCK_NPCGroup == 1)//军团歼灭战NPC
				{
					canselect = true;
				}
			}
			if(GLOBAL._mode == "attack" && LOCK_PlayerAttack == 1)
			{
				canselect = true;
			}
			
			if(DefenceManager.getInstance().isStart)//防守活动战斗时不能选兵
			{
				canselect = false;
				return;
			}
			else if(GOGOBAR.YanxiMode){//作战演习时不能框选
				canselect = false;
				return;
			}
			
			
			if(UIManager.getInstance().getUILabel(UIManager.SendTroopsUI))//派兵时不能框选
			{
				var sendTroops:UI_SendTroops=UIManager.getInstance().getCurrentUiOpened(UIManager.SendTroopsUI) as UI_SendTroops;
				if((sendTroops)&&(!sendTroops.isAttack))
				{
					canselect = false;
				}
			}
//			else if(
			if(hasFinger1 && hasFinger2 && GLOBAL._layerWindows.numChildren == 0 && TUTORIAL._completed && canselect)
			{
				if(location1.x < location2.x){
					x1 = location1.x;
					x2 = location2.x;
				}
				else{
					x1 = location2.x;
					x2 = location1.x;
				}
				if(location1.y < location2.y){
					y1 = location1.y;
					y2 = location2.y;
				}
				else{
					y1 = location2.y;
					y2 = location1.y;
				}
				var graph:Graphics = rectSprite.graphics;
				graph.clear();
				graph.lineStyle(1, 0x00FF00);
				graph.moveTo(x1, y1);
				graph.lineTo(x1, y2);
				graph.lineTo(x2, y2);
				graph.lineTo(x2, y1);
				graph.lineTo(x1, y1);
				_selecting = true;
				GMainDisplay.StopMoving();
				selectUnits();
			}
			else
			{
				if(rectSprite)
				{
					rectSprite.graphics.clear();
				}
				if(hasFinger1==false && hasFinger2==false)
				{
					_selecting = false;
				}
			}
		}
		private function selectUnits():void
		{
			var globalVec1:Vector3D = new Vector3D(x1,y1);
			var globalVec2:Vector3D = new Vector3D(x2,y2);

			var TotalAttackNum:int=Units._units.length;
			var units:Vector.<Unit>=Units._units;
			var landVec1:Vector3D = GMainDisplay._BUILDINGTOPS.transform.worldToLocal(globalVec1);
			var landVec2:Vector3D = GMainDisplay._BUILDINGTOPS.transform.worldToLocal(globalVec2);
			var tmpUnit:Unit;
			for(var i:int=0;i < TotalAttackNum;i++)
			{
				tmpUnit = units[i];
				if(((GLOBAL._mode == "build" && tmpUnit._attacker==false) || (GLOBAL._mode != "build" && tmpUnit._attacker==true)))//自己的部队
				{
					if(tmpUnit._x > landVec1.x && tmpUnit._x < landVec2.x && tmpUnit._y > landVec1.y && tmpUnit._y < landVec2.y)
					{
						tmpUnit.Select();
					}
					else{
						tmpUnit.Deselect();
					}
				}
				else
				{
					tmpUnit.Deselect();
				}
			}
			
//			if(vec.x > -_hitArea.width/2 && vec.x < _hitArea.width/2 && vec.y > -_hitArea.height/2 && vec.y < _hitArea.height/2)
//			{
//				e.stopImmediatePropagation();
//				GLOBAL.nextMoveDisable = true;
////				this.Click(globeVec);
//			}
			
		}
		/** 是否在框选单位，框选时不移动场景 */
		public function get selecting():Boolean
		{
			return _selecting;
		}
		/** 设置框选开关 */
		public function setLocks(lockConfig:MiscLock):void
		{
			LOCK_All = lockConfig.selectall;
			LOCK_Base = lockConfig.selectbase;
			LOCK_NPC = lockConfig.selectnpc;
			LOCK_NPCGroup = lockConfig.selectarmygroup;
			LOCK_PlayerAttack = lockConfig.selectplayer;
		}
	}
}