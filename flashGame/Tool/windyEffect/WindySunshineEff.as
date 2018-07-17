package Tool.windyEffect
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Strong;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	
	/**
	 *@author 锋
	 *@version 1.0.0
	 *@创建时间:2012-11-6 上午9:53:36
	 * */
	public class WindySunshineEff extends IEffectFather
	{
		LensGlare_AlmondHalo,LensGlare_AlmondRim,LensGlare_BrownCircle,LensGlare_BrownHalo,LensGlare_GreenGlow,LensGlare_LightSource,LensGlare_LightSourceShadow,LensGlare_Lines,LensGlare_RandowRim;
		protected var tweenObject:Object;
		protected var lastTransition:Boolean = true;
		private var maskee:Sprite;
		private var _lightOffset:Number = 0;
		protected var light:Point;Point
		protected var linesRotation:Number = 30;
		private var targetBounds:Rectangle;
		private var _lightDirection:Boolean = false;
		private var _margins:Number = 20;
		protected var startLight:Number;
		protected var center:Point;
		protected var gradientOffset:Number;
		protected var lensOwner:Sprite;
		protected var length:Number;
		protected var lensGlare:Array;
		private var _gradientWidth:Number = 50;
		protected var endLight:Number;
		protected var direction:Point;
		protected static var lensGlarePath:Array = ["LensGlare_AlmondHalo", "LensGlare_LightSourceShadow", "LensGlare_LightSource", "LensGlare_Lines", "LensGlare_GreenGlow", "LensGlare_GreenGlow", "LensGlare_BrownHalo", "LensGlare_BrownHalo", "LensGlare_BrownCircle", "LensGlare_AlmondRim", "LensGlare_RandowRim"];
		protected static var lensGlareScale:Array = [1, 1, 1, 1, 0.5, 1, 1, 1.5, 1, 1, 1, 1];
		protected static var lensGlarePosition:Array = [-1 / 8, 0, 0, 0, 0.4, 0.5, 0.7, 0.73, 0.8, 0.9, 1];
		
		public function WindySunshineEff()
		{
			this.init();
		}
		
		
		private function init() : void
		{
			_easeType = "easeOut";
			_tweenType = "Strong";
			_tweenDuration = 2;
			return;
		}
		
		public function get margins() : Number
		{
			return this._margins;
		}
		
		public function set margins(param1:Number) : void
		{
			this._margins = param1;
			return;
		}
		
		public function get lightDirection() : Boolean
		{
			return this._lightDirection;
		}
		
		public function set lightDirection(param1:Boolean) : void
		{
			this._lightDirection = param1;
			return;
		}
		
		public function get lightOffset() : Number
		{
			return this._lightOffset;
		}
		
		public function set lightOffset(param1:Number) : void
		{
			this._lightOffset = param1;
			return;
		}
		
		override public function show() : void
		{
			this.startTransition(true);
			return;
		}
		
		
		
		
		override public function hide() : void
		{
			this.startTransition(false);
			return;
		}
		
		private function tweenComplete() : void
		{
			this.remove();
			//			this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
			return;
		}
		
		private function tweenUpdate() : void
		{
			var _loc_4:Number = NaN;
			var _loc_5:MovieClip = null;
			var _loc_6:MovieClip = null;
			var _loc_1:* = this.tweenObject.pos;
			this.lensOwner.x = this.startLight + (this.endLight - this.startLight) * _loc_1;
			this.light = new Point(this.lensOwner.x, this.lensOwner.y);
			this.direction = this.center.subtract(this.light);
			this.direction.x = this.direction.x / (this.target.width / 2 + this._margins + this._gradientWidth);
			this.direction.y = this.direction.y / (this.target.height / 2 + this._margins + this._gradientWidth);
			var _loc_2:* = Math.min(this.getBezier(_loc_1, 0, 2, 0), 1);
			this.lensOwner.alpha = _loc_2;
			var _loc_3:Number = 0;
			for each (_loc_5 in this.lensGlare)
			{
				
				_loc_4 = WindySunshineEff.lensGlarePosition[_loc_3];
				_loc_5.x = this.targetBounds.x * target.scaleX + this.direction.x * _loc_4 * this.length * (2 - _loc_2);
				_loc_5.y = this.targetBounds.y * target.scaleY + this.direction.y * _loc_4 * this.length * (2 - _loc_2);
				var _loc_9:* = WindySunshineEff.lensGlareScale[_loc_3];
				_loc_5.scaleY = WindySunshineEff.lensGlareScale[_loc_3];
				_loc_5.scaleX = _loc_9;
				_loc_3 = _loc_3 + 1;
			}
			_loc_6 = this.lensGlare[2];
			var _loc_7:* = _loc_2 + 0.2;
			_loc_6.scaleY = _loc_2 + 0.2;
			this.lensGlare[2].scaleX = _loc_7;
			_loc_6.filters = [new GlowFilter(16777215, 0.3)];
			this.lensGlare[3].rotation = this.linesRotation * _loc_1;
			this.drawMask(this.tweenObject);
			return;
		}
		
		protected function startTransition(param1:Boolean) : void
		{
			var _loc_6:* = undefined;
			var _loc_7:Number = NaN;
			var _loc_8:Object = null;
			var _loc_9:Class = null;
			var _loc_10:MovieClip = null;
			this.lastTransition = param1;
			this.lensOwner = new Sprite();
			//			this.component.targetOwner.addChild(this.lensOwner);
			target.parent.addChild(this.lensOwner);
			this.lensOwner.y = this.target.height / 2;
			var _loc_2:uint = 0;
			var _loc_3:uint = 1;
			var _loc_4:* = this._gradientWidth;
			var _loc_5:Number = 0;
			if (param1 == false)
			{
				_loc_2 = 1;
				_loc_3 = 0;
				_loc_4 = 0;
				_loc_5 = this._gradientWidth;
			}
			this.lensGlare = [];
			for (_loc_6 in WindySunshineEff.lensGlarePath)
			{
				
				_loc_9 = getDefinitionByName(WindySunshineEff.lensGlarePath[_loc_6]) as Class;
				_loc_10 = new _loc_9();
				this.lensGlare.push(_loc_10);
				this.lensOwner.addChild(_loc_10);
			}
			this.maskee = new Sprite();
			//			this.component.targetOwner.addChild(this.maskee);
			target.parent.addChild(this.maskee);
			this.target.mask = this.maskee;
			this.targetBounds = this.target.getBounds(this.target);
			this.maskee.x = this.targetBounds.x * this.target.scaleX;
			this.maskee.y = this.targetBounds.y * this.target.scaleY;
			var _loc_11:Boolean = true;
			this.maskee.cacheAsBitmap = true;
			this.target.cacheAsBitmap = _loc_11;
			this.linesRotation = 30;
			_loc_7 = this.target.width;
			this.center = new Point(this.target.x + this.target.width / 2, this.target.y + this.target.height / 2 - this.lightOffset);
			this.length = this.target.width + 2 * this._margins;
			this.startLight = -this._margins;
			this.endLight = this.target.width + this._margins + this._gradientWidth;
			if (this.lightDirection == false)
			{
				this.gradientOffset = -this._margins - this._gradientWidth;
				this.tweenObject = {pos:0, r1:-this._margins - _loc_4, r2:-this._margins + this._gradientWidth - _loc_4, a1:_loc_3, a2:_loc_2};
				_loc_8 = {r1:_loc_7 + this._margins + this._gradientWidth - _loc_4, r2:_loc_7 + this._margins + 2 * this._gradientWidth - _loc_4, ease:easeFunc, pos:1, onUpdate:this.tweenUpdate, onComplete:this.tweenComplete};
			}
			else
			{
				this.gradientOffset = -this._margins - this._gradientWidth - _loc_5;
				this.tweenObject = {pos:1, r1:_loc_7 + this._margins - _loc_5, r2:_loc_7 + this._margins + this._gradientWidth - _loc_5, a1:_loc_2, a2:_loc_3};
				_loc_8 = {r1:-this._margins - this._gradientWidth - _loc_5, r2:-this._margins - _loc_5, ease:easeFunc, pos:0, onUpdate:this.tweenUpdate, onComplete:this.tweenComplete};
			}
			TweenLite.to(this.tweenObject, this._tweenDuration, _loc_8);
			this.tweenUpdate();
			//			this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
			return;
		}
		
		protected function drawMask(param1:Object) : void
		{
			var tweenObj:* = param1;
			var w:* = this.target.width;
			var h:* = this.target.height;
			var r1:* = (tweenObj.r1 - this.gradientOffset) / (w + 2 * this._margins + 2 * this._gradientWidth) * 255;
			var r2:* = (tweenObj.r2 - this.gradientOffset) / (w + 2 * this._margins + 2 * this._gradientWidth) * 255;
			if (r1 < 0)
			{
				r1;
			}
			if (r2 < 0)
			{
				r2;
			}
			if (r2 > 255)
			{
				r2;
			}
			var matr:* = new Matrix();
			matr.createGradientBox(w + 2 * this._margins + 2 * this._gradientWidth, h, 0, -this._margins - this._gradientWidth);
			var _loc_3:* = this.maskee.graphics;
			with (this.maskee.graphics)
			{
				clear();
				beginGradientFill("linear", [255, 255], [tweenObj.a1, tweenObj.a2], [r1, r2], matr);
				drawRect(0, 0, w, h);
			}
			return;
		}
		
		public function set gradientWidth(param1:Number) : void
		{
			this._gradientWidth = param1;
			if (param1 < 0)
			{
				param1 = 0;
			}
			return;
		}// end function
		
		public function get gradientWidth() : Number
		{
			return this._gradientWidth;
		}// end function
		
		protected function getBezier(param1:Number, param2:Number, param3:Number, param4:Number) : Number
		{
			return (1 - param1) * (1 - param1) * param2 + 2 * param1 * (1 - param1) * param3 + param1 * param1 * param4;
		}
		
		//		private function tweenComplete() : void
		//		{
		//			this.remove();
		////			this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
		//			return;
		//		}
		
	}
}