package snake
{
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import util.Util;

	public class PlayerThumb
	{
		private var charModel_title:character_create_model;
		
		public function PlayerThumb()
		{
			
		}
		
		public function initModule():void{
			if(charModel_title==null){
				charModel_title=new character_create_model();
				stopAllMovie();
//				charModel_title.head.stop();
//				charModel_title.body.stop();
//				charModel_title.ankle1.stop();
//				charModel_title.ankle2.stop();
//				charModel_title.foot1.stop();
//				charModel_title.foot2.stop();
//				charModel_title.cc_gun.stop();
			}
			
		}
		private function stopAllMovie():void
		{
			if(charModel_title)
			{
				Util.stopAllMovie(charModel_title);
			}
		}
		
		public function destory():void{
			if(charModel_title){
				if(null!=charModel_title.parent)
				{
					charModel_title.parent.removeChild(charModel_title);
				}
				stopAllMovie();
				charModel_title.stop();
				charModel_title=null;
			}
		}
		
		public function followEye(globalPoint:Point):void{
//			trace(charModel_title.head.rotation,charModel_title.head.x,charModel_title.head.y);
//			charModel_title.head.rotation=20;
			return ;
			var p:Point=charModel_title.globalToLocal(globalPoint);
			var rect:Rectangle=charModel_title.getBounds(charModel_title);
			if(rect.contains(p.x,p.y)){
				
			}else{
				if(p.x<0){
					charModel_title.scaleX=-1;
				}else{
					charModel_title.scaleX=1;
				}
				
				var ration:Number=Math.atan2(p.y-charModel_title.head.x, p.x-charModel_title.head.y)*180/Math.PI;
				charModel_title.head.rotation=ration;
				
				
			}
		}
		public function get display():DisplayObject{
			return charModel_title;
		}
		
		public function changToStatic(renderPlayerArg:RenderPlayerArg,scale:Number):void{
			stopAllMovie();
			
			charModel_title.scaleY=scale;
			var gunRot:Number=renderPlayerArg._gunRot*180/Math.PI;
			var headRot:Number=renderPlayerArg._headRot*180/Math.PI;
			if(renderPlayerArg._face==0){
				charModel_title.addChild(charModel_title.cc_gun);
				charModel_title.scaleX=scale;
//				charModel_title.cc_gun.scaleX=1;
//				charModel_title.head.scaleX=1;
				
			}else{
				charModel_title.addChildAt(charModel_title.cc_gun,0);
				charModel_title.scaleX=-scale;
				renderPlayerArg._gunX=-renderPlayerArg._gunX;
				gunRot-=180;
				gunRot=-gunRot;
				headRot-=180;
				headRot=-headRot;
			}
			charModel_title.cc_gun.x=renderPlayerArg._gunX;
			charModel_title.cc_gun.y=renderPlayerArg._gunY;
			charModel_title.cc_gun.rotation=gunRot;
			charModel_title.head.rotation=headRot;
			
		}
		
		public function loadAppearance(character_appearance:Array,character_color_values:Array,gun:int,_isStatic:Boolean=false):void{
			if(!_isStatic)
			{
				charModel_title.play();
			}
			var character_colorTransform:ColorTransform;
			charModel_title.head.gotoAndStop(character_appearance[0]);
			charModel_title.head.eye.gotoAndStop(character_appearance[1]);
			charModel_title.head.face.gotoAndStop(character_appearance[5]);
			charModel_title.body.gotoAndStop(character_appearance[2]);
			charModel_title.cc_gun.gotoAndStop((gun + 1));
			charModel_title.cc_gun["g" + gun].stop();
			charModel_title.cc_gun["g" + gun].hand1.gotoAndStop(character_appearance[3]);
			charModel_title.cc_gun["g" + gun].hand2.gotoAndStop(character_appearance[3]);
			charModel_title.foot1.gotoAndStop(character_appearance[4]);
			charModel_title.foot2.gotoAndStop(character_appearance[4]);
			charModel_title.ankle1.gotoAndStop(character_appearance[4]);
			charModel_title.ankle2.gotoAndStop(character_appearance[4]);
			charModel_title.head.box.visible = false;
			charModel_title.body.box.visible = false;
			charModel_title.foot1.box.visible = false;
			charModel_title.foot2.box.visible = false;
			charModel_title.ankle1.box.visible = false;
			charModel_title.ankle2.box.visible = false;
			character_colorTransform = charModel_title.head.color1.transform.colorTransform;
			character_colorTransform.color = character_color_values[0];
			charModel_title.head.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.head.color2.transform.colorTransform;
			character_colorTransform.color = character_color_values[1];
			charModel_title.head.color2.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.head.color3.transform.colorTransform;
			character_colorTransform.color = character_color_values[0];
			charModel_title.head.color3.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.head.eye.color1.transform.colorTransform;
			character_colorTransform.color = character_color_values[2];
			charModel_title.head.eye.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.head.eye.color2.transform.colorTransform;
			character_colorTransform.color = character_color_values[3];
			charModel_title.head.eye.color2.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.body.color1.transform.colorTransform;
			character_colorTransform.color = character_color_values[4];
			charModel_title.body.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.body.color2.transform.colorTransform;
			character_colorTransform.color = character_color_values[5];
			charModel_title.body.color2.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.cc_gun["g" + gun].hand1.color1.transform.colorTransform;
			character_colorTransform.color = character_color_values[6];
			charModel_title.cc_gun["g" + gun].hand1.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.cc_gun["g" + gun].hand2.color1.transform.colorTransform;
			character_colorTransform.color = character_color_values[6];
			charModel_title.cc_gun["g" + gun].hand2.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.foot1.color1.transform.colorTransform;
			character_colorTransform.color = character_color_values[8];
			charModel_title.foot1.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.ankle1.color1.transform.colorTransform;
			character_colorTransform.color = character_color_values[8];
			charModel_title.ankle1.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.foot1.color2.transform.colorTransform;
			character_colorTransform.color = character_color_values[9];
			charModel_title.foot1.color2.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.foot2.color1.transform.colorTransform;
			character_colorTransform.color = character_color_values[8];
			charModel_title.foot2.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.ankle2.color1.transform.colorTransform;
			character_colorTransform.color = character_color_values[8];
			charModel_title.ankle2.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = charModel_title.foot2.color2.transform.colorTransform;
			character_colorTransform.color = character_color_values[9];
			charModel_title.foot2.color2.transform.colorTransform = character_colorTransform;
		}
		
	}
}