package Tool.windyEffect
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;

	/**
	 *@author 锋
	 *@version 1.0.0
	 *@创建时间:2012-11-5 下午5:37:27
	 * */
	public class IEffectFather extends Sprite
	{
		protected var _target:DisplayObject;
		protected var _tweenDuration:Number = 2;
		protected var _tweenType:String = "Strong";
		protected var _easeType:String = "easeInOut";
		public function IEffectFather()
		{
		}
		
		/**
		 *	消失特效 
		 * 
		 */		
		public function hide() : void
		{
			return;
		}
		/**
		 *	显示特效 
		 * 
		 */		
		public function show() : void
		{
			return;
		}
		/**
		 * 
		 * @return 特效作用对象
		 * 
		 */		
		public function get target():DisplayObject
		{
			return this._target;
		}
		/**
		 * 设置特效作用对象
		 * @param displayObject 特效作用对象
		 * 
		 */		
		public function set target(displayObject:DisplayObject) : void
		{
			this._target = displayObject;
			return;
		}
		
		/**
		 *	删除特效应用 
		 * 
		 */		
		
		public function remove() : void
		{
			return;
		}
		
		
		/**
		 * 
		 * @return 缓动类型  例:"Strong"
		 * 
		 */		
		public function get tweenType() : String
		{
			return this._tweenType;
		}
		/**
		 * 设置缓动类型
		 * @param type  缓动类型  例:"Strong"
		 * 
		 */		
		public function set tweenType(type:String) : void
		{
			this._tweenType = type;
			return;
		}
		/**
		 * 
		 * @return 缓动方式 例:"easeInOut"
		 * 
		 */		
		public function get easeType() : String
		{
			return this._easeType;
		}
		
		/**
		 * 
		 * @param type 缓动方式 例:"easeInOut"
		 * 
		 */		
		public function set easeType(type:String) : void
		{
			this._easeType = type;
			return;
		}
		
		/**
		 * 获取缓动函数
		 * @return 缓动函数
		 * 
		 */		
		public function get easeFunc() : Function
		{
			var easeFunc:*;
			try
			{
				easeFunc = getDefinitionByName("com.greensock.easing." + this.tweenType) as Class;
				return easeFunc[this.easeType];
			}
			catch (e:ReferenceError)
			{
				throw "error:" + this.tweenType;
				return null;
			}
			return null;
		}// end function
		
		/**
		 * 
		 * @param time 缓动时间
		 * 
		 */		
		public function set tweenDuration(time:Number) : void
		{
			if (time < 0.001)
			{
				time = 0.001;
			}
			this._tweenDuration = time;
			return;
		}
		
		/**
		 * 
		 * @return 缓动时间
		 * 
		 */		
		public function get tweenDuration() : Number
		{
			return this._tweenDuration;
		}
	}
}