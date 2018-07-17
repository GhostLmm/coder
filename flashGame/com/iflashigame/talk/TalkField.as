package com.iflashigame.talk
{
	import com.ghostlmm.xmldata.Node_fnt_img_reflect;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Rectangle;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import ui.widget.BitdataChache;
	
	import util.Util;
	
	/**
	 * 图文显示框
	 * @author 闪刀浪子
	 * 使用方法：
	 */
	public class TalkField extends Sprite
	{
		private var _tf:TextField;
		private var _tfMask:Sprite;
		private var _faceContainer:Sprite;
		
		private var _maskWidth:Number;
		private var _maskHeight:Number;
		private var _textFormat:TextFormat;
		private var _alpha:Number;
		
		private var _appDomain:ApplicationDomain;
		
		/**
		 * 构造函数
		 * @param	width	图文宽度
		 * @param	height  图文框高度
		 * @param	leading  显示的文本行的行间距
		 * @param	appDomain  包含"facexx"的程序域
		 * @param	textColor	默认文本的颜色，如果没有用<font>标签定义颜色，则使用此颜色
		 * @param	alpha  图文框的背景透明度
		 */
		public function TalkField($tf:TextField,alpha:Number=0) 
		{
			
			_tf=$tf;
			_textFormat=Util.cloneTextformat(_tf.defaultTextFormat);
			_maskWidth = _tf.width;
			_maskHeight = _tf.height;
			_alpha = alpha;
			_appDomain = ApplicationDomain.currentDomain ;
			
			initView()
			initEvent();
		}
		public function destory():void{
			_tf=null;
			if(_faceContainer) {_faceContainer.removeChildren(); _faceContainer=null;}
			this.removeChildren();
		}
		
		private function initView():void
		{
			createBK();
			createMask();
			createTF();
			createFaceContainer();
		}
		
		private function initEvent():void
		{
			addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelHandler);
		}
		
		private function onMouseWheelHandler(e:MouseEvent):void 
		{
			maskY -= (e.delta * 4.0);
			dispatchEvent(new Event("scroll"));
		}
		
		private function createBK():void
		{
			if(_alpha>0){
				graphics.beginFill(0, _alpha);
				graphics.drawRect( -5, -2, _maskWidth + 10, _maskHeight + 14);
				graphics.endFill();
			}
			
		}
		
		private function createMask():void
		{
			_tfMask = new Sprite();
			showTextIndex(int.MAX_VALUE);
			addChild(_tfMask);
		}
		
		private function createTF():void
		{
			
			addChild(_tf);
			this.mask = _tfMask;
		}
		
		private function createFaceContainer():void
		{
			_faceContainer = new Sprite();
			_faceContainer.scrollRect = new Rectangle(0, 0, _maskWidth, _maskHeight);
			addChild(_faceContainer);
		}
		
		private function clearFaceContain():void
		{
			_faceContainer.removeChildren();
			/*while (_faceContainer.numChildren > 0)
			{
				_faceContainer.removeChildAt(0);
			}*/
		}
		
		public function getTfText():String{
			return _tf.text;
		}
		
		private var faceArr:Array;
		/**
		 * 聊天显示框
		 * @param	str 必须为htmlText格式
		 */
		public function setText(str:String):void
		{
//			str="这是一群疯狂的人。 。我得快点调查清楚他们在做什么 ";
			_tf.text = "";
//			_tf.defaultTextFormat = _textFormat;
//			var faceArr:Array = [];
			faceArr=[];
			clearFaceContain();
			
			//保存表情符的编号并替换为空格,此处可以根据你的表情数量来修改正则表达式
			//表情素材的导出类名规则为——face01-face05
			/*var face:Array = str.match(/\*(0[1-5])/g);
			if (face != null)
			{
				faceArr = faceArr.concat(face);
			}*/
			//注意这里是将表情编号替换为全角的空格，所以记住你的输入框要禁止玩家输入全角空格
			//需要替换的内容是：*01 - *09
//			str = str.replace(/\*(0[1-5])/g, "<font size='24'>　</font>");
			str=str.replace(/\/([0-9][0-9])/g,repFn);
			_tf.htmlText = str;
			_tf.height;
			
			//记录空格的索引号
			var text:String = _tf.text;
			var indexArr:Array = [];
			for (var index:int = 0; index < text.length; index++)
			{
				if (text.charAt(index) == "　" )
				{
					indexArr.push(index);
				}
			}
			_tf.height;
			for (var j:int = 0; j < indexArr.length; j++)
			{
				/*var tempPos:Rectangle = _tf.getCharBoundaries(indexArr[j]);
				var linkClass:Class = _appDomain.getDefinition("face" + faceArr[j].substr(1, 2)) as Class;
				if (linkClass != null&&tempPos!=null)
				{
					var mc:MovieClip = new linkClass as MovieClip;
					_faceContainer.addChild(mc);
					mc.x = tempPos.x;
					mc.y = tempPos.y+3;
				}*/
				var tempPos:Rectangle = _tf.getCharBoundaries(indexArr[j]);
				if(faceArr.length>j && tempPos!=null){
					var mc:DisplayObject = faceArr[j];
					_faceContainer.addChild(mc);
					mc.x = tempPos.x;
					mc.y = tempPos.y+3;
				}
			}
			showTextIndex(int.MAX_VALUE);
			dispatchEvent(new Event(Event.CHANGE));
		}
		private var showIndex:int;
		/** 显示文本的字数 **/
		public function showTextIndex(index:int):void{
			
			if(showIndex==index) return ;
			
			if(index>=_tf.text.length-1){
				showIndex=int.MAX_VALUE;
				_tfMask.graphics.clear();
				_tfMask.graphics.beginFill(0x000000);
				_tfMask.graphics.drawRect(0, 0, _maskWidth, _maskHeight);
				_tfMask.graphics.endFill();
			}else{
				
				if(index<=0){
					showIndex=0;
					_tfMask.graphics.clear();
				}else{
					showIndex=index;
					var tempPos:Rectangle = _tf.getCharBoundaries(index-1);
					if(tempPos==null){
						/*_tfMask.graphics.clear();
						_tfMask.graphics.beginFill(0x000000);
						_tfMask.graphics.drawRect(0, 0, _maskWidth, _maskHeight);
						_tfMask.graphics.endFill();*/
					}else{
						_tfMask.graphics.clear();
						_tfMask.graphics.beginFill(0x000000);
						_tfMask.graphics.drawRect(0, 0, _maskWidth, tempPos.top);
						_tfMask.graphics.drawRect(0, tempPos.top, tempPos.right, tempPos.height);
						_tfMask.graphics.endFill();
					}
				}
				
			}
//			trace("showIndex: "+showIndex);
		}
		
		private function repFn():String{
			if(arguments.length>0){
				var key:String=arguments[0];
				var node:Node_fnt_img_reflect=XMLDataManager.getFnt_img_reflectById(key);
				if(node){
					var mc:DisplayObject;
					if(node.biaozhi=="img"){
						mc=new Bitmap(BitdataChache.getBitdata(node.image));
					}else{
						mc=AssetManager.createDisplay(node.image);
					}
					faceArr.push(mc);
					return "<font size='"+node.size+"'>　</font>";
				}else{
					return key;
				}
			}
			return "";
		}
		
		/**
		 * 设置文本
		 * @param	arr 频道数组
		 */
		private function setMultiText(arr:Array):void
		{
			if (arr == null) return;
			_tf.text = "";
			_tf.defaultTextFormat = _textFormat;
			var faceArr:Array = [];
			clearFaceContain();
			
			var allStr:String=""
			for (var i:int = 0; i < arr.length; i++)
			{
				var str:String = arr[i];
				var face:Array = str.match(/\*(0[1-5])/g);
				if (face != null)
				{
					faceArr = faceArr.concat(face);
				}
				str = str.replace(/\*(0[1-5])/g, "<font size='24'>　</font>");
				allStr += str;
			}
			_tf.htmlText = allStr;
			_tf.height;
			
			//记录空格的索引号
			var text:String = _tf.text;
			var indexArr:Array = [];
			for (var index:int = 0; index < text.length; index++)
			{
				if (text.charAt(index) == "　")
				{
					indexArr.push(index);
				}
			}
			_tf.height;
			for (var j:int = 0; j < indexArr.length; j++)
			{
				var tempPos:Rectangle = _tf.getCharBoundaries(indexArr[j]);
				var linkClass:Class = _appDomain.getDefinition("face" + faceArr[j].substr(1, 2)) as Class;
				if (linkClass != null&&tempPos!=null)
				{
					var mc:MovieClip = new linkClass as MovieClip;
					_faceContainer.addChild(mc);
					mc.x = tempPos.x;
					mc.y = tempPos.y+3;
				}
			}
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		/* INTERFACE game.ui.list.IScrollElement */
		
		public function get maskX():Number 
		{
			return _faceContainer.scrollRect.x;
		}
		
		public function set maskX(val:Number):void 
		{
			var rec:Rectangle = _faceContainer.scrollRect;
			rec.x = val;
			_tf.x = -val;
			_faceContainer.scrollRect = rec;
			
		}
		
		public function get maskY():Number 
		{
			return _faceContainer.scrollRect.y;
		}
		
		public function set maskY(val:Number):void 
		{
			var rec:Rectangle = _faceContainer.scrollRect;
			if (val < 0) val = 0;
			else if (val > maxScroll) val = maxScroll;
			_tf.y = -val;
			rec.y = val;
			_faceContainer.scrollRect = rec;
		}
		
		public function get minScroll():Number 
		{
			return 0;
		}
		
		public function get maxScroll():Number 
		{
			if (_tf.height <= _tfMask.height) return 0;
			else return _tf.height - _tfMask.height;
		}
		
		
	}

}