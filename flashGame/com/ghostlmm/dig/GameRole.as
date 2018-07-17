package com.ghostlmm.dig
{
	import com.ghostlmm.tool.WheelControl;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;

	public class GameRole 
	{
		/**
		 *   小人可以走 0.5 的格子，这样可以给游戏操作者带来更大的乐趣
		 */
		public function GameRole()
		{
		}
		
		public function get avatar():Avatar{
			return _avatar;
		}
		
		public function get x():Number{
			return _avatar.x;
		}
		public function get y():Number{
			return _avatar.y;
		}
		
		private var _curTileX:int;
		private var _curTileY:int;
		
		public function get curTileX():int{
			return _curTileX;
		}
		public function get curTileY():int{
			return _curTileY;
		}
		
		private var _avatar:Avatar;
		
		private var dir:int=0;
		
		/**
		 *  自由掉落操作锁定
		 */
		private var dropLock:Boolean=false;
		
		/**
		 *    当前 到达的层数
		 */
		private var _arriveLayer:int;
		
		/**
		 *   抵达一层派发
		 */
		public var arriveLayer_SN:Signal=new Signal(int);
		
		public function get arriveLayer():int{
			return _arriveLayer;
		}
		
		/** 
		 *    锄头的伤害
		 *    每秒钟伤害值
		 */
		public var hurt:Number=50;
		
		/**
		 *  挖钻的结束深度
		 */
		private var _endDrillDeep:int;
		
		
		private var curState:int=ST_Move;
		
		/**
		 *   挖的状态
		 */
		private static const ST_Drill:int=100;
		/**
		 *  走的状态
		 */
		private static const ST_Move:int=200;
		
		public function destory():void{
//			DigGameControl.instance.dirChange_SN.remove(onChangeDir);
//			DigGameControl.instance.update_SN.remove(update);
//			DigGameControl.instance.break_SN.remove(onBreak);
			if(drillComplete_SN){
				drillComplete_SN.removeAll();
				drillComplete_SN=null;
			}
			if(arriveLayer_SN){
				arriveLayer_SN.removeAll();
				arriveLayer_SN=null;
			}
			if(_avatar) {_avatar.destory();_avatar=null;}
		}
		
		
		public var drillComplete_SN:Signal=new Signal();
		
		public function addDrillEffect(deep:int):void{
//			_drillDeepth+=GameConstConfig.DrillDeep;
			_endDrillDeep=Math.max(_endDrillDeep,_curTileY+1);
//			_endDrillDeep+=GameConstConfig.DrillDeep;
			_endDrillDeep=_curTileY+deep;
//			onChangeDir(DigGameControl.ST_Down);
			isDrill=true;
			showDrill();
		}
		private function stopDrill():void{
			isDrill=false;
			hideDrill();
			drillComplete_SN.dispatch();
		}
		public var isDrill:Boolean=false;
		
		private function showDrill():void{
			_avatar.showDrill();
		}
		private function hideDrill():void{
			_avatar.hideDrill();
			
		}
		
	
		
		public function init($avtar:Avatar):void{
			_avatar=$avtar;
		}
		
		public function setAvatarToGird(tx:int,ty:int):void{
			var p:Object=DigGameControl.instance.calcTileToLayerPosition(tx,ty);
			_avatar.x=p.x;
			_avatar.y=p.y;
			updateCurTile();
		}
		
		public function start():void{
			reset();
			DigGameControl.instance.dirChange_SN.add(onChangeDir);
			DigGameControl.instance.update_SN.add(update);
			DigGameControl.instance.break_SN.add(onBreak);
		}
		
		public function reset():void{
			_endDrillDeep=int.MIN_VALUE;
			_arriveLayer=int.MIN_VALUE;
			hideDrill();
			DigGameControl.instance.dirChange_SN.remove(onChangeDir);
			DigGameControl.instance.update_SN.remove(update);
			DigGameControl.instance.break_SN.remove(onBreak);
		}
		
		
		private var breakFlag:Boolean=false;
		private function onBreak():void{
//			breakFlag=!breakFlag;
			GameConstConfig.log(this);
		}
		
		private function isInStrongDrlling():Boolean{
			return _endDrillDeep>_curTileY;
		}
		
		private function eatTiles(lastGrid:Object):void{
			// 吃掉可以吃的
			var eatArray:Array=[];
			if(isDrill){
				eatArray=eatArray.concat(DigGameControl.instance.getNearTiles(lastGrid.x,lastGrid.y,DigGameControl.ST_Mid,GameConstConfig.DrillWidth));
			}else{
				eatArray=eatArray.concat(DigGameControl.instance.getNearTiles(lastGrid.x,lastGrid.y,DigGameControl.ST_Mid));
				eatArray=eatArray.concat(DigGameControl.instance.getNearTiles(lastGrid.x,lastGrid.y,DigGameControl.ST_Left));
				eatArray=eatArray.concat(DigGameControl.instance.getNearTiles(lastGrid.x,lastGrid.y,DigGameControl.ST_Right));
			}
			
			
			
			for each(var eatTile:GameTile in eatArray){
				if(eatTile && eatTile.hasDie && eatTile.couldEat()){
					eatTile.eat();
				}
			}
		}
		
		private function updateCurTile():void{
			var tileObj:Object=DigGameControl.instance.calcLayerPositionToTile(x,y);
			_curTileX=tileObj.x;
			_curTileY=tileObj.y;
			GameConstConfig.log("位置："+_curTileX+"/"+_curTileY);
			if(_arriveLayer!=int(_curTileY)){
				_arriveLayer=int(_curTileY);
				arriveLayer_SN.dispatch(_arriveLayer);
			}
		}
		
		/**
		 *   是否有 移动方向
		 */
		private function hasMoveDirection():Boolean{
			if(dir==DigGameControl.ST_Left || dir==DigGameControl.ST_Right){
				return true;
			}
			return false;
		}
		
		
		/**
		 *   如果在挖矿过程中 显示 挖矿特效
		 */
		private function showDigEffect():void{
			
		}
		
		
		/**
		 *   下一段格子的状态    0 为 空， 1 为实
		 */
		private function getNearTileState($dir:int):int{
			var curGrid:Object=DigGameControl.instance.calcLayerPositionToTile(x,y);
			var downTiles:Array=DigGameControl.instance.getNearTiles(curGrid.x,curGrid.y,$dir);
			for each(var tile:GameTile in downTiles){
				if(tile.isBoundary()){
					if($dir!=DigGameControl.ST_Down){
						return -1;
					}
				}else{
					if(tile && !tile.hasDie){
						return 1;
					}
				}
				
			}
			return 0;
		}
		
		private function FMS(durtime:Number):void{
			
			if(isInStrongDrlling()){
				//如果是在钻头变身期间
				FMS_StrongDirll(durtime);
				
			}else{
				if(getNearTileState(DigGameControl.ST_Down)==0){
					FMS_Down(durtime);
				}else{
					if(hasMoveDirection()){
						//						FMS_Move(leaveDurtime);
						// 运动方向上 的格子状态 如果是空的话就可以走了
						var moveState:int=getNearTileState(dir);
						if(moveState==0){
							FMS_Move(durtime);
						}else if(moveState==-1){
							return ;
						}else{
							FMS_Drill(durtime);
						}
					}else{
						FMS_Drill(durtime);
					}
				}
			}
			
			
		}
		
		private function FMS_Down(durtime:Number):void{
			var curGrid:Object=DigGameControl.instance.calcLayerPositionToTile(x,y);
			var midX:int=Math.floor(curGrid.x+0.5);
			var midY:int=Math.floor(curGrid.y+0.5);
			var next:int=midY+1;
			// 走完一个格子需要的时间
			var moveTime:Number=(next-curGrid.y)/GameConstConfig.DropSpeed*1000;
			
			if(moveTime>=durtime){
				
				toDown(durtime);
				updateCurTile();
				return ;
			}else{
				toDown(moveTime);
				updateCurTile();
				//如果有剩余时间的话 ， 判断下一个 动作
				var leaveDurtime:Number=durtime-moveTime;
				FMS(leaveDurtime);
				
			}
			
		}
		
		private function FMS_Move(durtime:Number):void{
			var curGrid:Object=DigGameControl.instance.calcLayerPositionToTile(x,y);
			var midX:int=Math.floor(curGrid.x+0.5);
			var midY:int=Math.floor(curGrid.y+0.5);
			var next:int;
			if(dir==DigGameControl.ST_Left){
				next=midX-1;
			}else{
				next=midX+1;
			}
			var moveTime:Number=(Math.abs(next-curGrid.x))/GameConstConfig.RunSpeed*1000;
			
			if(moveTime>=durtime){
				if(dir==DigGameControl.ST_Left){
					toLeft(durtime);
				}else{
					toRight(durtime);
				}
				updateCurTile();
				return ;
			}
			var leaveTime:Number=durtime-moveTime;
			if(dir==DigGameControl.ST_Left){
				toLeft(moveTime);
			}else{
				toRight(moveTime);
			}
			updateCurTile();
			FMS(leaveTime);
			
		}
		
		private function FMS_StrongDirll(durtime:Number):void{
			showDrill();
			var curGrid:Object=DigGameControl.instance.calcLayerPositionToTile(x,y);
			var midX:int=Math.floor(curGrid.x+0.5);
			var midY:int=Math.floor(curGrid.y+0.5);
			
			var targetTiles:Array;
			targetTiles=DigGameControl.instance.getNearTiles(curGrid.x,curGrid.y,DigGameControl.ST_Down,GameConstConfig.DrillWidth);
			
			for each(var tile:GameTile in targetTiles){
				if(tile.couldDrill()){
					tile.injure(1000000);
					if(tile.hasDie && tile.couldEat()){
						tile.eat();
					}
				}
			}
			
			var next:int=midY+1;
			// 走完一个格子需要的时间
			var moveTime:Number=(next-curGrid.y)/GameConstConfig.DropSpeed*1000;
			
			if(moveTime>=durtime){
				
				toDown(durtime);
				updateCurTile();
				if(!isInStrongDrlling()){
					stopDrill();
				}
				return ;
			}else{
				toDown(moveTime);
				updateCurTile();
				if(!isInStrongDrlling()){
					stopDrill();
				}
				//如果有剩余时间的话 ， 判断下一个 动作
				var leaveDurtime:Number=durtime-moveTime;
				FMS(leaveDurtime);
			}
			
		}
		
		public function judgeHasCanntDig(targetTiles:Array):Boolean{
			for each(var tile:GameTile in targetTiles){
				if(!tile.couldDrill()){
					return true;
				}
			}
			return false;
		}
		
		private function FMS_Drill(durtime:Number):void{
			var curGrid:Object=DigGameControl.instance.calcLayerPositionToTile(x,y);
			var midX:int=Math.floor(curGrid.x+0.5);
			var midY:int=Math.floor(curGrid.y+0.5);
			
			var targetTiles:Array;
			if(hasMoveDirection()){
				targetTiles=DigGameControl.instance.getNearTiles(curGrid.x,curGrid.y,dir);
			}else{
				targetTiles=DigGameControl.instance.getNearTiles(curGrid.x,curGrid.y,DigGameControl.ST_Down);
			}
			
			var hasNotDigTile:Boolean=judgeHasCanntDig(targetTiles);
			if(hasNotDigTile){
				//如果有不能挖的状况就不做处理
				return ;
			}
			
			
			
			var digTime:Number=0;
			for each(var tile:GameTile in targetTiles){
				if(tile.isBoundary()){
					continue;
				}
				var t:Number=tile.life/hurt*1000;
				digTime=Math.max(digTime,t);
				var hasInjure:Boolean=tile.injure(durtime*hurt/1000);
				if(tile.hasDie && tile.couldEat()){
					tile.eat();
				}
				if(hasInjure && tile.hasDie){
					//如果 是这次挖掉的，显示特效
					var p:Object=DigGameControl.instance.calcTileToLayerPosition(tile.tileX,tile.tileY);
					DigGameControl.instance.showDirllEffect(p.x,p.y);
				}
			}
			if(digTime>=durtime){
				return ;
			}
			//如果有剩余时间的话 ， 判断下一个 动作
			var leaveDurtime:Number=durtime-digTime;
			FMS(leaveDurtime);
			
		}
		public function update(durtime:Number):void{
			FMS(durtime);
		}
		
		public function update2(durtime:Number,turnLock:Boolean=false):void{
//			//GameConstConfig.log("更新时间: "+durtime.toFixed(2));
			
			updateTurn();
			
			if(breakFlag){
				//GameConstConfig.log();
			}
//			eatMidTile();
			
			var lastGrid:Object=DigGameControl.instance.calcLayerPositionToTile(x,y);
			var midX:int=Math.floor(lastGrid.x+0.5);
			
			var midY:int=Math.floor(lastGrid.y+0.5);
			
			
			
			
			var targetTiles:Array;
			if(isDrill){
				targetTiles=DigGameControl.instance.getNearTiles(lastGrid.x,lastGrid.y,dir,GameConstConfig.DrillWidth);
			}else{
				targetTiles=DigGameControl.instance.getNearTiles(lastGrid.x,lastGrid.y,dir);
			}
			
			
			if(targetTiles.length==0){
//				//GameConstConfig.log("error:\t"+"目标不能为空");
			}
			// 是否需要挖掘
			var needDig:Boolean=false;
			var digTime:Number=0;
			for each(var tile:GameTile in targetTiles){
				if(!tile.hasDie){
					needDig=true;
				}
			}
			
			if(needDig){
				//如果需要挖掘
				dropLock=false;
				
				for each(var tile:GameTile in targetTiles){
					if(!tile.hasDie){
						var t:Number=tile.life/hurt*1000;
						if(digTime<t){
							digTime=t;
						}
						tile.injure(durtime*hurt/1000);
						if(tile && tile.hasDie && tile.couldEat()){
							tile.eat();
						}
						
					}
					// 如果放下向下，有一个死掉了，那么就方向锁定
					if(tile.tileX!=midX && tile.tileY!=midY && tile.hasDie && dir==DigGameControl.ST_Down){
						dropLock=true;
					}
				}
				
//				eatTiles(lastGrid);
				
				var leftTime:Number=durtime-digTime;
//				//GameConstConfig.log("挖掘:\t"+digTime.toFixed(2)+"\t剩余："+leftTime.toFixed(2));
				if(leftTime>0){
					update(leftTime);
				}
			}else{
				
				
				
				var moveTime:Number=0;
				var next:int;
				
				if(isDrill){
					next=midY+1;
					moveTime=(next-lastGrid.y)/GameConstConfig.DropSpeed*1000;
					if(moveTime>durtime){
						toDown(durtime);
					}else{
						toDown(durtime-moveTime);
					}
//					//GameConstConfig.log("drill 判断:\t"+_endDrillDeep+"\t"+_curTileY);
					if(_endDrillDeep<=_curTileY){
						stopDrill();
					}
				}else{
					if(dir==DigGameControl.ST_Down){
						dropLock=true;
						next=midY+1;
						moveTime=(next-lastGrid.y)/GameConstConfig.DropSpeed*1000;
						if(moveTime>durtime){
							toDown(durtime);
						}else{
							toDown(durtime-moveTime);
							dropLock=false;
							if(breakFlag){
								//GameConstConfig.log();
							}
						}
					}
					
					if(dir==DigGameControl.ST_Left){
						next=midX-1;
						moveTime=(lastGrid.x-next)/GameConstConfig.RunSpeed*1000;
						if(moveTime>durtime){
							toLeft(durtime);
						}else{
							toLeft(moveTime-durtime);
						}
					}
					
					if(dir==DigGameControl.ST_Right){
						next=midX+1;
						moveTime=(next-lastGrid.x)/GameConstConfig.RunSpeed*1000;
						if(moveTime>durtime){
							toRight(durtime);
						}else{
							toRight(moveTime-durtime);
						}
					}
				}
				
				var tileObj:Object=DigGameControl.instance.calcLayerPositionToTile(x,y);
				_curTileX=tileObj.x;
				_curTileY=tileObj.y;
				
				
				var moveLeftTime:Number=durtime-moveTime;
//				//GameConstConfig.log("挖掘:\t"+digTime.toFixed(2)+"\t剩余："+moveLeftTime.toFixed(2));
//				eatTiles(lastGrid);
				
				if(moveLeftTime>0){
					update(moveLeftTime);
				}
			}
			
			
		}
		
		private function eatMidTile():void{
			
			
			var lastGrid:Object=DigGameControl.instance.calcLayerPositionToTile(x,y);
			
			var eatArray:Array
			
			var midX:int=Math.floor(lastGrid.x+0.5);
			
			var midY:int=Math.floor(lastGrid.y+0.5);
			
			var midTile:GameTile=DigGameControl.instance.mapData.getTile(midX,midY);
			if(midTile && midTile.hasDie && midTile.couldEat()){
				midTile.eat();
			}
		}
		
		private var _trunDir:int;
		
		private function updateTurn():Boolean{
			if(_trunDir!=dir){
				if(!dropLock && !isDrill ){
					dir=_trunDir;
					dropLock=false;
					//GameConstConfig.log("人物转向： \t"+dir);
					return true;
				}
			}
			return false;
		}
		public function onChangeDir($dir:int):void{
//			_trunDir=$dir;
//			updateTurn();
			dir=$dir;
			if(dir==DigGameControl.ST_Left){
				_avatar.turn(WheelControl.DIR_Left);
			}
			if(dir==DigGameControl.ST_Right){
				_avatar.turn(WheelControl.DIR_Right);
			}
		}
		
	
		public function pause():void{
			if(_avatar){
				_avatar.pause();
			}
		}
		
		
		public function toLeft(durTime:Number):void{
//			_roleMC.scaleX=1;
//			_container.x+=-GameConstConfig.RunSpeed*GameConstConfig.Tile_Width/1000
//				*durTime;
			_avatar.toLeft(durTime,GameConstConfig.RunSpeed);
		}
		
		public function toRight(durTime:Number):void{
//			_roleMC.scaleX=-1;
//			_container.x+=GameConstConfig.RunSpeed*GameConstConfig.Tile_Width/1000*durTime;
			_avatar.toRight(durTime,GameConstConfig.RunSpeed);
		}
		
		public function toDown(durTime:Number):void{
			//GameConstConfig.log("[下降]"+durTime);
//			_container.y+=GameConstConfig.DropSpeed*GameConstConfig.Tile_Height/1000*durTime;
			_avatar.toDown(durTime,GameConstConfig.DropSpeed);
		}
		
		public function toString():String{
			var grid:Object=DigGameControl.instance.calcLayerPositionToTile(x,y);
			return "[人物信息]\t"+"位置:("+x.toFixed(2)+","+y.toFixed(2)+")\t网格：("+grid.x.toFixed(2)+","+grid.y.toFixed(2)+")";
		}
		
	}
}