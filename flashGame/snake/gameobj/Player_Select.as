package snake.gameobj
{
	import com.fish.GameSwitchSceneController;
	import com.ghostlmm.guide.RandomNum;
	import com.ghostlmm.xmldata.Node_hero;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import snake.BattleAssetPreload;
	import snake.GameManager;
	import snake.NpcTalkInfoBar;
	import snake.gameEnemys.CharAnimData;
	import snake.viewdata.ViewData_SelectPlayer;

	public class Player_Select extends Player
	{
		private var frameTick:int=0;
		private var controlFrame:int=0;
		
		private var dirState:int;
		private var dirFr:int;
		
		private var jumpState:int
		private var jumpFr:int;
		
		private var shotState:int;
		private var shotFr:int;
		
		private var rndDir:RandomNum;
		private var rndJump:RandomNum;
		private var rndShot:RandomNum;
		
		
		
		
		
		
		
		public function Player_Select()
		{
			super();
			if(PlayerActionCFG.isMotionCapture){
				GlobalRef.stage.addEventListener(KeyboardEvent.KEY_DOWN,onKey);
			}
			
		}
		
	
		public override function destroy():void{
			super.destroy();
		}
		
		public function startShow(heroId:int,startX:Number,startY:Number):void{
			
			frameTick=0;
			var node:Node_hero=XMLDataManager.getHeroById(heroId);
			var selectData:ViewData_SelectPlayer=new ViewData_SelectPlayer();
			selectData.initData(heroId);
			
			initModule(selectData,startX,startY,selectData.gunXid);
			controlFrame=PlayerActionCFG.getControlFrames();
			
			rndDir=new RandomNum();
			rndDir.addType(0,3,[30,100]);
			rndDir.addType(1,1,[30,60]);
			rndDir.addType(-1,1,[30,60]);
			
			rndJump=new RandomNum();
			rndJump.addType(0,5,[5,20]);
			rndJump.addType(1,1,[5,20]);
			
			rndShot=new RandomNum();
			rndShot.addType(0,3,[5,20]);
			rndShot.addType(1,1,[5,100]);
			
			if(talkInfoBar==null) talkInfoBar=new NpcTalkInfoBar();
			talkInfoBar.setTalk(node.talk);
			
		}
		public override function logic():void{
			frameTick++;
			if(PlayerActionCFG.isMotionCapture){
				motionCapture();
			}else{
				adjustMove();
			}
			
			super.logic();
		}
		private var motionArray:Array=[];
		private function motionCapture():void{
			motionArray.push(KD[Keyboard.W],KD[Keyboard.A],KD[Keyboard.D]);
		}
		
		private function onKey(evt:KeyboardEvent):void{
			if(evt.keyCode==Keyboard.ENTER){
				trace("W:\t"+traceArray(createMotionArray(0)));
				trace("A:\t"+traceArray(createMotionArray(1)));
				trace("D:\t"+traceArray(createMotionArray(2)));
			}
		}
		
		private function traceArray(arrary:Array):String{
			var re:String="[ ";
			for (var index:int=0; index<arrary.length; index++){
				if(arrary[index] is Array){
					re+=traceArray(arrary[index] as Array);
				}else{
					re+=arrary[index];
				}
				if(index!=arrary.length-1){
					re+=",";
				}
			}
			re += " ]";
			return re;
		}
		
		private function createMotionArray(index:int):Array{
			var WM:Array=[];
			var isStart:Boolean=false;
			var reallyfr:int=0;
			for(; index<motionArray.length; index+=3){
				reallyfr++;
				if(!isStart){
					if(motionArray[index]==true){
						isStart=!isStart;
						WM.push([reallyfr]);
					}
				}else{
					if(motionArray[index]==false){
						isStart=!isStart;
						WM[WM.length-1].push(reallyfr);
					}
				}
			}
			
			
			
			return WM;
		}
		
		
		private function randomMove():void{
			if(dirFr<=0){
				var dirAY:Array=rndDir.createRandomType();
				dirState=dirAY[0];
				dirFr=dirAY[1];
			}
			if(jumpFr<=0){
				var jmpAY:Array=rndJump.createRandomType();
				jumpState=jmpAY[0];
				jumpFr=jmpAY[1];
			}
			if(shotFr<=0){
				var shotAY:Array=rndShot.createRandomType();
				shotState=shotAY[0];
				shotFr=shotAY[1];
			}
			
			if(dirState==0){
				KD[Keyboard.A]=false;
				KD[Keyboard.D]=false;
			}
			if(dirState==1){
				KD[Keyboard.A]=false;
				KD[Keyboard.D]=true;
			}
			if(dirState==-1){
				KD[Keyboard.A]=true;
				KD[Keyboard.D]=false;
			}
			
			KD[Keyboard.W]=(jumpState==1);
			
			if(shotState==1){
				if(character_reloadTime==0){
					if(mouseDown){
						mouseDown=false
						character_burstLength=0;
					}else{
						mouseDown=true;
					}
				}
			}else{
				if(mouseDown){
					mouseDown=false
					character_burstLength=0;
				}
			}
			
			dirFr--;
			jumpFr--;
			shotFr--;
		}
		
		protected function adjustMove():void{
			if(frameTick>controlFrame){
//				randomMove();
			}else{
				KD[Keyboard.W]=PlayerActionCFG.isActiveFr(frameTick,PlayerActionCFG.JumpAction);
				KD[Keyboard.A]=PlayerActionCFG.isActiveFr(frameTick,PlayerActionCFG.LeftAction);
				KD[Keyboard.D]=PlayerActionCFG.isActiveFr(frameTick,PlayerActionCFG.RigthAction);
				if(PlayerActionCFG.isActiveFr(frameTick,PlayerActionCFG.ShotAction)){
					if(character_reloadTime==0){
						if(mouseDown){
							mouseDown=false
							character_burstLength=0;
						}else{
							mouseDown=true;
						}
					}
					
				}else{
					mouseDown=false
					character_burstLength=0;
				}
			}
			
			needShowTalk=PlayerActionCFG.isActiveFr(frameTick,PlayerActionCFG.TalkAction);
			
		}
		
		/*public override function render():void{
			var charAnimData:CharAnimData=BattleAssetPreload.getInstance().charAnimDataVect[anim];
			
			renderPlayerArg._charAnimData=charAnimData;
			renderPlayerArg._charAsset=charAsset;
			renderPlayerArg._face=character_face;
			renderPlayerArg._frame=fr;
			renderPlayerArg._frameOld=frOld;
			renderPlayerArg._gunAsset=gunAsset;
			renderPlayerArg._gunData=playerGunData;
			renderPlayerArg._gunFrame=character_gunFrame;
			renderPlayerArg._gunRot=character_gunRot;
			renderPlayerArg._gunRotOld=character_gunRotOld;
			renderPlayerArg._gunX=character_gunX;
			renderPlayerArg._gunXOld=character_gunXOld;
			renderPlayerArg._gunY=character_gunY;
			renderPlayerArg._gunYOld=character_gunYOld;
			renderPlayerArg._headless=false;
			renderPlayerArg._headRot=character_headRot;
			renderPlayerArg._posX=character_x-canvas.cameraX;
			renderPlayerArg._posX_old=character_xOld-canvas.cameraX;
			renderPlayerArg._posY=character_y-canvas.cameraY;
			renderPlayerArg._posY_old=character_yOld-canvas.cameraY;
			renderPlayerArg._reloadTime=character_reloadTime;
			renderPlayerArg.hasDroppedMag=hasDroppedMag;
			renderPlayerArg._host=this;
			
			if(needShowTalk){
				renderPlayerArg.talkInfo=talkInfoBar;
			}else{
				renderPlayerArg.talkInfo=null;
			}
			
			
			renderPlayerArg.renderInfo=false;
			renderPlayerArg.playerInfo=null;
			
			GameManager.manager.canvas.render_a_character(renderPlayerArg);
			if(GameSwitchSceneController.isInBattle && GameManager.getManagerType()!=GameManager.MG_Select){
				renderHpBar();
			}
		}*/
		
	}
}