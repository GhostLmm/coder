package snake
{
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	
	import core.LayerController;
	import core.WindowManager;
	
	import snake.gameobj.Player;
	
	import ui.equip.EquipCaozuoWindow;
	import ui.layer.MDI_NewWorld;
	import ui.layer.SceneLayer;
	import ui.layer.UiLayer;
	import ui.paihangbang.RankingWindow;
	import ui.widget.Position;
	import ui.window.mail.YoujianWindow;
	
	import view.CommonControlFun;

	public class PlayMoveGuide
	{
		public function PlayMoveGuide()
		{
		}
		
		private static var status:int;
//		private static var targetRect:Rectangle;
		private static var sx:Number;
		private static var ex:Number;
		private static var targetBD:String;
		private static var fubenId:int;
		
		private static var equipOpType:String;
		
		public static const BD_Map:String="zhucheng_bg_layer1_mark3";
		public static const BD_Wakuang:String="zhucheng_bg_layer1_mark6";
		public static const BD_Shop:String="zhucheng_bg_layer1_mark2";
		public static const BD_Equip:String="zhucheng_bg_layer1_mark1";
		public static const BD_Qiyuan:String="zhucheng_bg_layer1_mark4";
		public static const BD_Paihang:String="zhucheng_bg_layer1_mark8";
		public static const BD_Mail:String="zhucheng_bg_layer1_mark7";
		public static const BD_Tiejiangpu:String="zhucheng_bg_layer1_mark1";
		
		
		public static const BD_Leitai:String="leitai";
		
		
		public static function openFuben(fid:int=-1):void{
			var obj:Object=GameManager.manager.mapInfo.pos_building[BD_Map];
			fubenId=fid;
			moveToPos(obj.x,obj.x+obj.width,BD_Map);
		}
		
		public static function openWakuang():void{
			var obj:Object=GameManager.manager.mapInfo.pos_building[BD_Wakuang];
			moveToPos(obj.x,obj.x+obj.width,BD_Wakuang);
		}
		
		public static function openPaihang():void{
			var obj:Object=GameManager.manager.mapInfo.pos_building[BD_Paihang];
			moveToPos(obj.x,obj.x+obj.width,BD_Paihang);
		}
		
		
		public static function openQiyuan():void{
			var obj:Object=GameManager.manager.mapInfo.pos_building[BD_Qiyuan];
			moveToPos(obj.x,obj.x+obj.width,BD_Qiyuan);
		}
		
		
		public static function openShop():void{
			var obj:Object=GameManager.manager.mapInfo.pos_building[BD_Shop];
			moveToPos(obj.x,obj.x+obj.width,BD_Shop);
		}
		
		public static function openMail():void{
			var obj:Object=GameManager.manager.mapInfo.pos_building[BD_Mail];
			moveToPos(obj.x,obj.x+obj.width,BD_Mail);
		}
		
		public static function openEquip(opType:String):void{
			equipOpType=opType;
			var obj:Object=GameManager.manager.mapInfo.pos_building[BD_Equip];
			moveToPos(obj.x,obj.x+obj.width,BD_Equip);
		}
		
		public static function openLeitai():void{
//			GameManager.manager.mapInfo.
			if(!CommonControlFun.isInZhucheng()) return ;
			var leitaiPos:Object=GameManager.manager.mapInfo.leitaiButton.leitaiButton3;
			
			moveToPos(leitaiPos.x,leitaiPos.x+leitaiPos.width+50,BD_Leitai);
		}
		
		public static function openTiejiangpu():void{
			var obj:Object=GameManager.manager.mapInfo.pos_building[BD_Tiejiangpu];
			moveToPos(obj.x,obj.x+obj.width,BD_Tiejiangpu);
		}
		
		
		public static function moveToPos($sx:Number,$ex:Number,$targetBd:String):void{
//			targetRect=$targetRect;
			sx=$sx;
			ex=$ex;
			targetBD=$targetBd;
			TimerModel.instance.frame_SN.add(onFrame);
			GlobalRef.stage.mouseChildren=false;
		}
		private static function onFrame(t:*):void{
			if(GameManager.manager.player){
				if(GameManager.manager.player.character_x>=sx && GameManager.manager.player.character_x<=ex){
					onComplete();
				}else{
					var dir:uint;
					if(GameManager.manager.player.character_x<sx){
						dir=Keyboard.D;
					}else{
						dir=Keyboard.A;
					}
					GameManager.manager.player.setAllKDToFalse();
					Player.KD[dir]=true;
				}
			}
		}
		private static function onComplete():void{
			GameManager.manager.player.setAllKDToFalse();
			TimerModel.instance.frame_SN.remove(onFrame);
			GlobalRef.stage.mouseChildren=true;
			
			if(BD_Map==targetBD){
//				LayerController.instance.sceneLayer.addScene(SceneLayer.Scene_Map,{guideFuben:fubenId});
				if(fubenId!=-1){
					CommonControlFun.showFubemMap({guideFuben:fubenId});
				}else{
					CommonControlFun.showFubemMap();
				}
			}
			if(BD_Wakuang==targetBD){
				CommonControlFun.enterWakuang();
			}
			if(BD_Shop==targetBD){
				CommonControlFun.openShop();
			}
			if(BD_Equip==targetBD){
				WindowManager.openOnlyWinodw(EquipCaozuoWindow,{label:equipOpType});
			}
			if(BD_Leitai==targetBD){
				var leitaiPos:Object=GameManager.manager.mapInfo.leitaiButton.leitaiButton1;
//				LayerController.instance.worldLayer.showGuide(leitaiPos.x+leitaiPos.width/2,leitaiPos.y+20);
				var mdi:MDI_NewWorld=Context.getInjectInstance(MDI_NewWorld);
				if(mdi){
					mdi.showLeitaiGuide(leitaiPos.x+leitaiPos.width/2,leitaiPos.y+70);
				}
			}
			if(BD_Qiyuan==targetBD){
				CommonControlFun.gotoChoujiangWindow();
			}
			if(BD_Paihang==targetBD){
				WindowManager.openOnlyWinodw(RankingWindow);
			}
			if(BD_Mail==targetBD){
				WindowManager.openOnlyWinodw(YoujianWindow);
			}
			if(BD_Tiejiangpu==targetBD){
				WindowManager.openOnlyWinodw(EquipCaozuoWindow);
			}
		}
	}
}