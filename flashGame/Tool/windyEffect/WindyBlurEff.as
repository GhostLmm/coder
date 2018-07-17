package Tool.windyEffect
{
	import com.greensock.TweenLite;
	
	import flash.filters.BlurFilter;

	/**
	 *@author 锋
	 *@version 1.0.0
	 *@创建时间:2012-11-5 下午5:32:13
	 * */
	public class WindyBlurEff extends IEffectFather
	{
		protected var tweenObject:Object;
		private var _blurQuality:Number = 2;
		private var _blurY:Number = 16;
		private var _blurX:Number = 16;
		public function WindyBlurEff()
		{
		}

		
		/**
		 * 
		 * @param _bx 水平模糊量。有效值为从 0 到 255（浮点）。2 的乘方值（如 2、4、8、16 和 32）经过优化，呈现速度比其它值更快。 
		 * 
		 */		
		public function set blurX(_bx:Number) : void
		{
			if (_bx < 0)
			{
				_bx = 0;
			}
			this._blurX = _bx;
			return;
		}
		
		/**
		 * 
		 * @return 水平模糊量
		 * 
		 */		
		public function get blurX() : Number
		{
			return this._blurX;
		}
		
		/**
		 * 
		 * @param _by 垂直模糊量。有效值为从 0 到 255（浮点）。2 的乘方值（如 2、4、8、16 和 32）经过优化，呈现速度比其它值更快。 
		 * 
		 */		
		public function set blurY(_by:Number) : void
		{
			if (_by < 0)
			{
				_by = 0;
			}
			this._blurY = _by;
			return;
		}
		/**
		 * 
		 * @return 垂直模糊量
		 * 
		 */		
		public function get blurY() : Number
		{
			return this._blurY;
		}
		
		/**
		 * 	设置执行模糊次数
		 * @param _bq 执行模糊的次数 quality 的值为低(1)、中(2)或高(3)就足够了。虽然您可以使用不超过 15 的其它数值来增加应用模糊的次数，但该数值越高，呈现速度就越慢。除了增加 quality 的值，仅增加 blurX 和 blurY 属性的值通常也可以获得类似的效果，而且呈现速度更快。
		 * 
		 */		
		public function set blurQuality(_bq:int) : void
		{
			if (_bq < 0)
			{
				_bq = 0;
			}
			else if (_bq > 15)
			{
				_bq = 15;
			}
			this._blurQuality = _bq;
			return;
		}
		/**
		 * 
		 * @return 执行模糊次数
		 * 
		 */		
		public function get blurQuality():int
		{
			return this._blurQuality;
		}
		
		/**
		 * 特效结束
		 * 
		 */		
		protected function motionFinish() : void
		{
			//			this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
			return;
		}
		
		/**
		 *	删除特效 
		 * 
		 */		
		override public function remove() : void
		{
			if (this.tweenObject is Object)
			{
				TweenLite.killTweensOf(this.tweenObject, false);
				this.tweenObject = null;
			}
			if (this.target != null)
			{
				this.target.filters = [];
				this.target.alpha = 1;
			}
			return;
		}
		/**
		 * 消失特效 
		 * 
		 */		
		override public function hide() : void
		{
			this.startTransition(false);
			return;
		}
		
		/**
		 *	显示特效 
		 * 
		 */		
		override public function show() : void
		{
			this.startTransition(true);
			return;
		}
		
		/**
		 * 
		 * @param isShow 开始执行特效
		 * 
		 */		
		protected function startTransition(isShow:Boolean) : void
		{
			this.tweenObject = {position:Math.max(Math.max(this.blurX, this.blurY), 0.001)};
			this.tweenObject.initialPosition = this.tweenObject.position;
			this.tweenObject.startPositionX = 0;
			this.tweenObject.startPositionY = 0;
			if (isShow == true)
			{
				TweenLite.to(this.tweenObject, _tweenDuration, {position:0, ease:easeFunc, onUpdate:this.motionChange, onComplete:this.motionFinish});
			}
			else
			{
				this.tweenObject.position = 0;
				TweenLite.to(this.tweenObject, _tweenDuration, {position:this.tweenObject.initialPosition, ease:easeFunc, onUpdate:this.motionChange, onComplete:this.motionFinish});
			}
			this.motionChange();
			this.target.visible = true;
			//			this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
			return;
		}
		/**
		 * 渐变水平和垂直模糊量，产生效果 
		 * 
		 */		
		protected function motionChange() : void
		{
			var _tweenObject:Object = this.tweenObject;
			var nowPosition:Number = _tweenObject.position;
			var bx:Number = nowPosition / _tweenObject.initialPosition * this.blurX + _tweenObject.startPositionX;
			var by:Number= nowPosition / _tweenObject.initialPosition * this.blurY + _tweenObject.startPositionY;
			this.target.alpha = 1 - nowPosition / _tweenObject.initialPosition;
			this.blurEffect(bx, by, this.blurQuality);
			return;
		}
		
		/**
		 *
		 * 使用blurfilter效果 
		 * @param bx
		 * @param by
		 * @param bq
		 * 
		 */		
		
		private function blurEffect(bx:Number, by:Number, bq:int) : void
		{
			var fit:BlurFilter = new BlurFilter(bx, by, bq);
			this.target.filters = [fit];
			return;
		}
		
		
	}
}