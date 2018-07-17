package Tool.windyEffect
{
    import flash.display.*;
    import flash.filters.*;
    import flash.geom.*;

    public class JWavesEffect extends Sprite
    {
        private var hig:Number;
        private var target:Object;
        private var wid:Object;
        private var offsetPoints:Array;
        private var map:Bitmap;
        private var blurQuality:Number;
        private var __value:Number = 0;
        public var baseX:Number;
        public var baseY:Number;
        public var bitmap:BitmapData;
        public var fractalNoiseVal:Object;

		public function JWavesEffect(_target:DisplayObject, _smooth:Boolean, quality:Number, width:Number = 0, height:Number = 0)
		{
			this.blurQuality = quality;
			this.target = _target;
			this.map = new Bitmap();
			this.map.smoothing = _smooth;
			this.addChild(this.map);
			this.baseX = this.baseX || 100;
			this.baseY = this.baseY || 100;
			this.fractalNoiseVal = this.fractalNoiseVal || true;
			this.offsetPoints = new Array();
			this.offsetPoints[0] = new Point();
			this.wid = width == 0 ? (target.width) : (width);
			this.hig = height == 0 ? (target.height) : (height);
			this.wid = this.wid > 2880 ? (2880) : (this.wid);
			this.hig = this.hig > 2880 ? (2880) : (this.hig);
			this.bitmap = new BitmapData(this.wid + 2, this.hig + 2, true, 0);
			return;
		}

		/**
		 * 设置效果值
		 * @param num 效果值
		 * 
		 */		
        public function set value(num:Number) : void
        {
            this.__value = num;
            this.setEffect();
            return;
        }
		/**
		 * 
		 * @return 效果值
		 * 
		 */
        public function get value() : Number
        {
            return this.__value;
        }
		/**
		 * 初始化滤镜效果
		 * @param nowValue 当前效果值
		 * 
		 */
        private function initFilters(nowValue:Number) : void
        {
            var filter:BitmapFilter = this.getDisplacement(nowValue);
            this.target.filters = [filter];
            return;
        }

		/**
		 * 获取置换滤镜
		 * @param nowValue 效果值
		 * @return 置换滤镜
		 * 
		 */		
        private function getDisplacement(nowValue:Number) : BitmapFilter
        {
            var pt:Point = new Point(0, 0);
            var filter:BitmapFilter = new DisplacementMapFilter(this.bitmap, pt, 1, 1, nowValue / 3, nowValue / 3, "color");
            return filter;
        }
		/**
		 * 设置具体效果实现 
		 * 
		 */
        private function setEffect() : void
        {
            this.initFilters(this.value);
            var filterArr:Array = this.target.filters;
            this.offsetPoints[0].x = this.value;
            this.offsetPoints[0].y = this.value;
            this.bitmap.perlinNoise(this.baseX, this.baseY, 2, 100, true, this.fractalNoiseVal, 7, true, this.offsetPoints);
			filterArr[0].mapBitmap = this.bitmap;
            this.target.filters = filterArr;
            this.map.bitmapData = this.bitmap;
            return;
        }

    }
}
