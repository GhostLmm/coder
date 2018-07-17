package Tool.windyEffect
{
//	import com.greensock.Quadratic;
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	
	import flash.filters.BlurFilter;

	/**
	 *@author 锋
	 *@version 1.0.0
	 *@创建时间:2012-11-6 下午5:08:37
	 * */
	public class WindyWaterEff extends IEffectFather
	{
		private var radius:Number;
		private var maxWaveSize:Number;
		private var transitionType:String;
		private var owner:Object;
		private var bounds:Object;
		private var _blurAmount:Number = 3;
		private var waveIntensity:Object;
		private var _smooth:Boolean = true;
		private var _blurQuality:Number = 1;
		private var _wavesIntensity:Number = 50;
		private var t:Number;
		private var _waveSize:Number = 120;
		
		public function WindyWaterEff()
		{
			this.owner = {};
			this.init();
		}
		
		protected function init() : void
		{
			_tweenDuration = 2;
			_easeType = "easeIn";
			_tweenType = "Cubic";
			return;
		}
		/**
		 * 删除特效 
		 * 
		 */		
		override public function remove() : void
		{
			this.destroy();
			return;
		}
		/**
		 * 删除特效 
		 * 
		 */		
		private function destroy() : void
		{
			if (!this.owner)
			{
				return;
			}
			TweenLite.killTweensOf(target, false);
			TweenLite.killTweensOf(this.owner["wave"], false);
			TweenLite.killTweensOf(this.owner.blurFilterTween, false);
			if (this.owner["wave"])
			{
				this.owner["wave"].bitmap.dispose();
			}
			if (target)
			{
				target.filters = [];
				target.alpha = 1;
			}
			return;
		}
		/**
		 * 
		 * @return 执行模糊的次数 quality
		 * 
		 */		
		public function get blurQuality() : Number
		{
			return this._blurQuality;
		}
		/**
		 * 
		 * @param quality 执行模糊的次数
		 * 
		 */		
		public function set blurQuality(quality:Number) : void
		{
			if (quality < 0)
			{
				quality = 0;
			}
			this._blurQuality = quality;
			return;
		}
		/**
		 * 
		 * @return 模糊量
		 * 
		 */		
		public function get blurAmount() : Number
		{
			return this._blurAmount;
		}
		/**
		 * 
		 * @param amount 模糊量
		 * 
		 */		
		public function set blurAmount(amount:Number) : void
		{
			this._blurAmount = amount;
			return;
		}
		
		/**
		 * 
		 * @return 波纹效果的大小
		 * 
		 */		
		public function get waveSize() : Number
		{
			return this._waveSize;
		}
		/**
		 * 
		 * @param size 波纹效果大小
		 * 
		 */		
		public function set waveSize(size:Number) : void
		{
			this._waveSize = size;
			return;
		}

		/**
		 * 	获取模糊效果
		 * @param blurNum 模糊量
		 * @return 模糊效果
		 * 
		 */		
		private function getBlurFilter(blurNum:Number) : BlurFilter
		{
			var blurX:Number = blurNum;
			var blurY:Number = blurNum;
			return new BlurFilter(blurX, blurY, this._blurQuality);
		}
		
		/**
		 * 
		 * @param blurParam 模糊量变化参数
		 * 
		 */		
		private function hdlChangeFilter(blurParam:Object) : void
		{
			if (!target)
			{
				return;
			}
			var blurNum:Number = blurParam.value;
			var blurF:BlurFilter = this.getBlurFilter(blurNum);
			var nowFilters:Array = target.filters;
			nowFilters.push(blurF);
			target.filters = nowFilters;
			return;
		}
		
		public function set wavesIntensity(param1:Number) : void
		{
			this._wavesIntensity = param1;
			return;
		}
		public function get wavesIntensity() : Number
		{
			return this._wavesIntensity;
		}
		
		public function get smooth() : Boolean
		{
			return this._smooth;
		}
		public function set smooth(param1:Boolean) : void
		{
			this._smooth = param1;
			return;
		}
		
		
		/**
		 *	效果执行 
		 * 
		 */	
		
		private function transition():void
		{
			this.target.visible = true;
			var oriAlpha:Number = this.transitionType == "show" ? (0) : (1);
			var tarAlpha:Number = this.transitionType == "show" ? (1) : (0);
			var oriWaveSize:Number = this.transitionType == "show" ? (this.maxWaveSize) : (0);
			var tarWaveSize:Number = this.transitionType == "show" ? (0) : (this.maxWaveSize);
			this.owner["wave"] = new JWavesEffect(target, this.smooth, this._blurQuality, target.width, target.height);
			this.owner["wave"].baseX = this.waveIntensity;
			this.owner["wave"].baseY = this.waveIntensity;
			target.alpha = oriAlpha;
			//透明效果
			TweenLite.to(target, this.t, {alpha:tarAlpha, delay:0, onComplete:this.hdlMotionFinished, ease:easeFunc, overwrite:false});
			this.owner["wave"].value = oriWaveSize;
			//波纹效果
			TweenLite.to(this.owner["wave"], this.t, {value:tarWaveSize, delay:0, onComplete:this.hdlMotionFinished, ease:easeFunc, overwrite:false});
			var oriBlurNum:Number = this.transitionType == "show" ? (this.blurAmount) : (0);
			var tarBlurNum:Number = this.transitionType == "show" ? (0) : (this.blurAmount);
			this.owner.blurFilterTween = {};
			this.owner.blurFilterTween.value = oriBlurNum;
			//模糊效果
			TweenLite.to(this.owner.blurFilterTween, this.t, {value:tarBlurNum, delay:0, onUpdate:this.hdlChangeFilter, onUpdateParams:[this.owner.blurFilterTween], ease:easeFunc, overwrite:false});
//			this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
			return;
		}
		

		
		/**
		 *	效果执行完毕处理 
		 * 
		 */		
		private function hdlMotionFinished():void
		{
			remove();
//			this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
			return;
		}
		


		/**
		 * 
		 * @param isShow 显示消失字符段
		 * 
		 */		
		private function startTransition(isShow:String):void
		{
			this.owner.gain = this.waveSize;
			this.maxWaveSize = this.owner.gain == "" || isNaN(Number(this.owner.gain)) ? (100) : (this.owner.gain);
			this.maxWaveSize = Math.max(0, this.maxWaveSize);
			this.owner.customParam1 = this.wavesIntensity;
			this.waveIntensity = this.owner.customParam1 == "" || isNaN(Number(this.owner.customParam1)) ? (100) : (this.owner.customParam1);
			this.transitionType = isShow;
			this.t = this._tweenDuration;
			this.transition();
			return;
		}
		
		/**
		 *	消失特效 
		 * 
		 */		
		override public function hide() : void
		{
			this.startTransition("hide");
			return;
		}
		
		/**
		 *	显示特效 
		 * 
		 */		
		override public function show() : void
		{
			this.startTransition("show");
			return;
		}

		
	}
}