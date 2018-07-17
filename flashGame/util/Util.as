package util
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.CoreConfig;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.ViewControl;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.JinyanVO;
	import com.fish.modules.core.models.ChongzhiModel;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ModuleManager;
	import com.ghostlmm.xmldata.Node_baoshi;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.Node_equip_type;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.Node_language;
	import com.ghostlmm.xmldata.Node_text;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.LocalConnection;
	import flash.system.ApplicationDomain;
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import mx.utils.StringUtil;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import core.AnimateManager;
	import core.LayerController;
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import r1.deval.D;
	
	import snake.GameManager;
	
	import ui.animate.TransformAnimate;
	import ui.chongzhi.ChongzhiWindow;
	import ui.chongzhi.ShouchongWindow;
	import ui.digWindow.LevelUpWindow;
	import ui.digWindow.MDI_LevelUp;
	import ui.layer.MDI_UiLayer;
	import ui.mc.ItemMc;
	import ui.widget.Flowtext;
	import ui.widget.FontField;
	import ui.widget.ImageBitmap;
	import ui.widget.Position;
	
	import view.CommonControlFun;
	
	

	public final class Util
	{
		
		public static const NO_LIMIT_COUNT:int=int.MAX_VALUE;
		
		public static function replace(from:DisplayObject,to:DisplayObject):void
		{
			var container:DisplayObjectContainer = from.parent;
			if(container == null || from == to) {
				return;
			}
			container.addChildAt(to,container.getChildIndex(from));
			container.removeChild(from);
		}
		
		
		
		public static function stringFormat(format:String,...rest):String
		{
			var params:Array = [format];
			params = params.concat(rest);
			return StringUtil.substitute.apply(null,params);
		}
		
		public static function reshapeAsRect(obj:DisplayObject,rect:Rectangle):void
		{
			obj.x = rect.x;
			obj.y = rect.y;
			obj.width = rect.width;
			obj.height = rect.height;
		}
		
		public static function swap(obj:Object,key1:*,key2:*):void
		{
			var temp:* = obj[key1];
			obj[key1] = obj[key2];
			obj[key2] = temp;
		}
		
		public static function intToTimeString(i:int,type:int=3):String
		{
			if(i<0) {
				i = 0;
			}
			var h:int = i/3600;
			var m:int = i%3600/60;
			var s:int = i%60;
			var H:String = h<10?"0"+h:h.toString();
			var M:String = m<10?"0"+m:m.toString();
			var S:String = s<10?"0"+s:s.toString();
			if(type == 3) {
				return H + ":" + M + ":" + S;
			} else if (type == 2) {
				return M + ":" + S;
			} else {
				return H + ":" + M + ":" + S;
			}
		}
		public static function log(msg:String):void
		{			

		}
		
		public static function getLanguage(key:String,...rest):String
		{
			//			return "";
			var value:String=key;
			var node:Node_language=XMLDataManager.getLanguageById(key);
			if(node==null){
				trace("&&&&&&&&&&&&&&\t翻译丢失：\t"+key);
				TAbDebug.log("翻译丢失",key);
			}else{
				value=node.value;
			}
			var params:Array = [value];
			params = params.concat(rest);
			return stringFormat.apply(null,params);
		}
		
		private static var WindowLanSuc:Boolean=false;
		public static function getWindowLan(proName:String):String{
			var node:Node_text=XMLDataManager.getTextById(proName);
			if(node){
				if(node.language.indexOf("$$")==0){
					return getWindowLan(node.language.substr(2));
				}else{
					WindowLanSuc=true;
					return node.language;
				}
			}
			trace("&&&&&&&&&&&&&&\t窗口翻译丢失：\t"+proName);
			WindowLanSuc=false;
			return proName;
		}
		
		public static function setStaticText(container:DisplayObjectContainer,proName:String=null):void{
			if(container!=null){
				if(proName==null){
					proName=getQualifiedClassName(container);
				}else{
					proName=proName+"."+container.name;
				}
				var childNum:int=container.numChildren;
				for(var index:int=0; index<childNum; index++){
					var child:DisplayObject=container.getChildAt(index);
					if(child!=null ){
						if((child is TextField)&&((child as TextField).type!=TextFieldType.INPUT)){
							if(child.name.indexOf("instance")==-1){
//								(child as TextField).mouseEnabled=false;
//								(child as TextField).selectable=false;
								var v:String=getWindowLan(proName+"."+child.name);
								
								if(WindowLanSuc){
									var tf:TextField=(child as TextField);
									tf.text=v;
//									var bitdata:BitmapData=new BitmapData(tf.width,tf.height,true,0);
//									bitdata.draw(tf);
//									replace(tf,new Bitmap(bitdata));
//									new FontField(child as TextField);
								}
								
								
							}
						}else if(child is DisplayObjectContainer){
							setStaticText(child as DisplayObjectContainer,proName);
						}
						
					}
				}
			}
		}
		
		public static function tweenFly(obj:DisplayObject,toRectOrDisplay:*,fromRectOrDisplay:*=null,alpha:Number=1,
										showTime:Number=0.5,ease:*=null,
										$completeFn:Function=null,$completeArgs:Array=null):*
		{
			var from:Rectangle;
			if(fromRectOrDisplay ==null){
				from=obj.getRect(LayerController.instance.floatLayer);
			}else{
				if(fromRectOrDisplay is DisplayObject){
					from=fromRectOrDisplay.getRect(LayerController.instance.floatLayer);
				}else{
					from=fromRectOrDisplay;
				}
			}
			var to:Rectangle;
			if(toRectOrDisplay is DisplayObject){
				to=(toRectOrDisplay as DisplayObject).getRect(LayerController.instance.floatLayer);
			}else{
				to=toRectOrDisplay;
			}
			
			var scaleX:Number=to.width/obj.width;
			var scaleY:Number=to.height/obj.height;
			var s:Number=Math.min(scaleX,scaleY);
			
			var tartX:Number=to.x+(to.width-obj.width*s)/2;
			var tartY:Number=to.y+(to.height-obj.height*s)/2;
			
			LayerController.instance.floatLayer.addChild(obj);
			obj.width = from.width;
			obj.height = from.height;
			obj.x = from.x;
			obj.y = from.y;
			
			var startFn:Function=function():void{
				
			};
			var completeFn:Function=function():void{
				if(obj.parent){
					obj.parent.removeChild(obj);
				}
				if($completeFn){
					$completeFn.apply(null,$completeArgs);
				}
			};
				
			
			return TweenLite.to(obj,showTime,{ease:ease,alpha:alpha,onStart:startFn,x:tartX,y:tartY,scaleX:s,scaleY:s,onComplete:completeFn});
			
			
		}
		
		/*public static function getLanguage(key:String,...rest):String
		{
//			return "";
			var value:String=key;
			var node:Node_language=XMLDataManager.getLanguageById(key);
			if(node==null){
				trace("&&&&&&&&&&&&&&\t翻译丢失：\t"+key);
			}else{
				value=node.value;
			}
			var params:Array = [value];
			params = params.concat(rest);
			return stringFormat.apply(null,params);
		}*/
		
		public static function flow(text:String,...rest):void
		{
			var params:Array = [text];
			params = params.concat(rest);
//			new Flowtext(getLanguage.apply(null,params)).go();
			Flowtext.flow(getLanguage.apply(null,params));
		}
		
		public static function random():Number
		{
			return Math.random();
		}
		
		public static function fly(obj:DisplayObject,from:Rectangle,to:Rectangle,onComplete:Function=null):void
		{
			LayerController.instance.floatLayer.addChild(obj);
			obj.width = from.width/1;
			obj.height = from.height/1;
			obj.x = (from.x-0)/1;
			obj.y = (from.y-0)/1;
			
			to.x = (to.x+to.width/2-0)/1-obj.width/2;
			to.y = (to.y+to.height/2-0)/1-obj.height/2;
			
			AnimateManager.push(new TransformAnimate(obj,500,{
				"to":{
					"x":to.x,
					"y":to.y
				},
				"onComplete":function():void{
					AnimateManager.push(new TransformAnimate(obj,500,{
						"to":{"alpha":0},
						"onComplete":function():void{
							LayerController.instance.floatLayer.removeChild(obj);
							if(onComplete!=null) onComplete();
						}
					}));
				}
			}
			));
		}
		
	/*	public static function tweenFly(obj:DisplayObject,from:Rectangle,to:Rectangle):*
		{
			LayerController.instance.floatLayer.addChild(obj);
			obj.width = from.width/1;
			obj.height = from.height/1;
			obj.x = (from.x-0)/1;
			obj.y = (from.y-0)/1;
			
			
			
			to.x = (to.x+to.width/2-0)/1-obj.width/2;
			to.y = (to.y+to.height/2-0)/1-obj.height/2;
			
			
		}*/
		
		public static function drawline(from:Point,to:Point):void
		{
			/*var graphics:Graphics = LayerController.instance.floatLayer.graphics;
			graphics.lineStyle(1,0x00ff00);
			graphics.moveTo(from.x,from.y);
			graphics.lineTo(to.x,to.y);*/
		}
		
		public static function exitApplication():void
		{
			
			PlatformManager.log("exitApplication 342");
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.ListernExitGame)){
				PlatformManager.log("exitApplication 344");
				(PlatformManager.getInstance().platformObj as Object).beforeExit();
			}
			NativeApplication.nativeApplication.exit(0);
			
			
		}
		
		public static function transArgToUrl(preUrl:String,arg:Object):String
		{
			var re:String="";
			for(var key:String in arg)
			{
				re+=key+"="+arg[key]+"&";
			}
			if(re.length)
			{
				re="?"+re.substr(0,re.length-1);
			}
			return preUrl+re;
		}
		
		/**  时间转金钱 单位 毫秒
		 * */
		public static function tradeTimeToMoney(miliSecond:Number):int
		{
			return Math.ceil(miliSecond/1000/XMLDataManager.getConstById("chanmian_time_unit").value);
		}
		public static function intToFix(value:int,fix:int=2):String
		{
			var s:String=value.toString();
			var l:int=fix-s.length;
			while(l>0)
			{
				s="0"+s;
				l--;
			}
			return s;
		}
		public static function cloneTextformat(s:TextFormat):TextFormat
		{
			var r:TextFormat=new TextFormat();
			r.align=s.align;
			r.blockIndent=s.blockIndent;
			r.bold=s.bold;
			r.bullet=s.bullet;
			r.color=s.color;
			r.font=s.font;
			r.indent=s.indent;
			r.italic=s.italic;
			r.kerning=s.kerning;
			r.leading=s.leading;
			r.leftMargin=s.leftMargin;
			r.letterSpacing=s.letterSpacing;
			r.rightMargin=s.rightMargin;
			r.size=s.size;
			r.tabStops=s.tabStops;
			r.target=s.target;
			r.underline =s.underline;
			r.url=s.url;
			return r;
		}
		
		public static function calcPayTime(frames:int):Number
		{
			return frames/GlobalRef.FPS;
		}
		
		/**  暂停 所有动画
		 * */
		public function stopAllMovie(target:MovieClip):void
		{
			target.stop();
		}
		
		public static function getRelativePostion(source:DisplayObject,target:DisplayObject,point:Point=null):Point
		{
			if(point==null) point=new Point();
			var t:Point=source.localToGlobal(point);
			return target.globalToLocal(t);
			
		}
		
		public static function getInstanceWithClassName(clsName:String):*
		{
			var obj:*=null;
			try{
				obj=new (ApplicationDomain.currentDomain.getDefinition(clsName) as Class)();
			}catch(e:Error){
				trace("没有该类型 : "+clsName);
				throw e;
			}
			return obj;
		}
		
		private static var tweenDic:Dictionary=new Dictionary();
		private static var curTween:TweenLite;
		public static function setDiaplayButtonEffect(target:Sprite,isCenter:Boolean=true):void
		{
			target.mouseChildren=false;
			if(!isCenter){
				var targetPoint:Point=calcPointDisplayToScala(target,0.8,0.8);
				tweenDic[target]=TweenLite.to(target,0.3,{x:targetPoint.x,y:targetPoint.y,scaleX:0.8,scaleY:0.8,paused:true});
			}else{
				tweenDic[target]=TweenLite.to(target,0.3,{scaleX:0.8,scaleY:0.8,paused:true});
			}
			
			target.addEventListener(TQTTouchEvent.TOUCH_BEGIN,onTouchBegin,false,0,true);
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_END,recoverTween,false,0,true);
		}
		
		public static function calcStartPointByWS(target:DisplayObject):Point
		{
			var x:Number=target.x-(1-target.scaleX)*target.width/2/target.scaleX;
			var y:Number=target.x-(1-target.scaleY)*target.height/2/target.scaleY;
			return new Point(x,y);
		}
		
		public static function setDisplaySimpleEffect(target:Sprite):void{
			target.addEventListener(TQTTouchEvent.TOUCH_BEGIN,onTouchBeginSimple,false,0,true);
			target.addEventListener(TQTTouchEvent.TOUCH_END,onTouchEndSimple,false,0,true);
		}
		public static function killDisplaySimpleEffect(target:Sprite):void{
			target.removeEventListener(TQTTouchEvent.TOUCH_BEGIN,onTouchBeginSimple,false);
			target.removeEventListener(TQTTouchEvent.TOUCH_END,onTouchEndSimple,false);
		}
		
		public static function calcPointDisplayToScala(target:DisplayObject,sx:Number,sy:Number):Point{
			var x:Number=target.x-(1-target.scaleX)*target.width/2/target.scaleX;
			var y:Number=target.y-(1-target.scaleY)*target.height/2/target.scaleY;
			x=x+(1-sx)*target.width/target.scaleX/2;
			y=y+(1-sy)*target.height/target.scaleY/2;
			return new Point(x,y);
		}
		
		private static function recoverTween(evt:Event):void
		{
			if(curTween){
				curTween.reverse(curTween._duration);
				curTween=null;
			}
		}
		public static function killDiaplayButtonEffect(target:Sprite):void
		{
			target.removeEventListener(TQTTouchEvent.TOUCH_BEGIN,onTouchBegin,false);
			if(tweenDic[target]){
				(tweenDic[target] as TweenLite).kill();
				tweenDic[target]=null;
				delete tweenDic[target];
			}
		}
		
		private static function onTouchBegin(evt:Event):void
		{
			var target:Sprite=evt.currentTarget as Sprite;
			var tween:TweenLite=tweenDic[target];
			if(tween){
				tween.play();
				curTween=tween;
			}
		}
		
		private static function onTouchBeginSimple(evt:Event):void{
			var target:Sprite=evt.currentTarget as Sprite;
			target.scaleX=1.2;
			target.scaleY=1.2;
		}
		private static function onTouchEndSimple(evt:Event):void{
			var target:Sprite=evt.currentTarget as Sprite;
			target.scaleX=1;
			target.scaleY=1;
		}
		
		
		
		public static function showMaoxianDaguanUpWindow():void
		{
			
			
		}
		
		
		
		/**  退出游戏
		 * */
		public static function exitGame(arg:Object=null,time:Number=0.5):void
		{
			
			GameRefreshControl.refreshFlag=false;
			//如果是ios 的话，退出游戏就是重新登陆
			CONFIG::UseIosMac{
				ViewControl.reEnterGame();
				return ;
			}
			var sp:Sprite=new Sprite();
			var mc:MovieClip=AssetManager.createMCForText(window_dengchu_tishi);
			sp.addChild(mc);
			sp.graphics.beginFill(0,0.5);
			sp.graphics.drawRect(-GlobalRef.width/2,-GlobalRef.height/2,GlobalRef.width,GlobalRef.height);
			sp.graphics.endFill();
			sp.x=GlobalRef.width/2;
			sp.y=GlobalRef.height/2;
			GlobalRef.root.addChild(sp);
			
			 
			Music.stopForExitGame();
			if(time<=0){
				//				NativeApplication.nativeApplication.exit();
				exitApplication();
			}else{
				TweenLite.delayedCall(time,exitApplication);
			}
		}
		
		public static function getColorNum(color:int,type:String):int
		{
			var objOffset:Object={"B":0,"b":0,"G":8,"g":8,"R":16,"r":16};
			var objIndex:Object={0:0xff,8:0xff00,16:0xff0000};
			var offset:int=objOffset[type];
			var index:int=objIndex[offset];
			
			var re:int= (color || index)>>offset ;
//			return re;
			return 0;
		}
		
		//把时间戳变成 天数
		
		public static function getDatesByTimestate(time:Number):Number
		{
			
//			return int(time/1000/60/60/24);
			var date:Date=new Date(time);
			return date.fullYear*400+date.month*35+date.date;
//			var date:Date=new Date(time);
//			return date.fullYear*400+date.month*35+date.date;
		}
		
		public static function GC():void{
			try{
				(new LocalConnection).connect("foo");
				(new LocalConnection).connect("foo");}catch(e){
					trace(System.totalMemory);
				}
		}
		
		public static function removeAllChildren(container:DisplayObjectContainer):void
		{
			while(container.numChildren){
				var child:DisplayObject = container.removeChildAt(0);
				if(child){
					if(child is MovieClip){
						(child as MovieClip).stop();
					}
				}
			}
		}
		
		
		/**  是否是android平台
		 * */
		public static function isAndroid():Boolean
		{
			if(Capabilities.os.indexOf("hone")==-1){
				return true;
			}
			return false;
		}
		
		public static function transStringToTime(time:String):GameTime{
			var start:Array=time.split(":");
			var gametime:GameTime=new GameTime();
			gametime.setMiliSeconds((start[0]*60*60+start[1]*60+start[2])*1000);
			return gametime;
		}
		
		/**  判断一天  时间是否在两个时间段中
		 *   12:00:01
		 * */
		public static function isBetweenTheTime(time:Number,startTime:String,endTime:String):Boolean
		{
			var date:Date=new Date(time);
			var start:Array=startTime.split(":");
			var startDate:Date=new Date(date.fullYear,date.month,date.date,int(start[0]),int(start[1]),int(start[2]),0);
			
			if(date.time<startDate.time){
				return false;
			}
			
			var end:Array=endTime.split(":");
			var endDate:Date=new Date(date.fullYear,date.month,date.date,int(end[0]),int(end[1]),int(end[2]),0);
			
			if(date.time>endDate.time){
				return false;
			}
			return true;
		}
		
		/**  一天之内时间比较
		 * */
		public static function contrastTime(time:Number,timeString:String):int
		{
			var date:Date=new Date(time);
			var start:Array=timeString.split(":");
			var startDate:Date=new Date(date.fullYear,date.month,date.date,int(start[0]),int(start[1]),int(start[2]),0);
			
			return date.time-startDate.time;
		}
		
		/**  停掉容器下的所有动画
		 * */
		public static function stopAllMovie(container:DisplayObjectContainer):void
		{
			if(container){
				if(container is MovieClip){
					(container as MovieClip).stop();
				}
				
				for(var index:int=0; index<container.numChildren; index++){
					var dis:DisplayObject=container.getChildAt(index);
					if(dis && (dis is DisplayObjectContainer)){
						stopAllMovie(dis as DisplayObjectContainer);
					}
				}
			}
		}
		
		
		public static function createHtml(color:uint,text:String):String
		{
			
			return "<font color=\"#" + color.toString(16) + "\">" + text + "</font>";
		}
		
		
		
		/**
		 * 点击帮会战操作
		 */
		public static function openBanghuizhan():void
		{
//			var phase:String;
//			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
//			phase=gonghuiModel.checkBanghuizhanPhase();
//			switch(phase)
//			{
//				case GonghuiModel.Baoming_Phase: 
//					WindowManager.getWindowByClass(BanghuizhanBaomingWindow).open();
//					break;
//				case GonghuiModel.Bisai_Phase:
//					WindowManager.getWindowByClass(BanghuizhanZhandouWindow).open();
//					break;
//				case GonghuiModel.Lingjiang_Phase:
//					WindowManager.getWindowByClass(BanghuizhanLingjiangWindow).open();
//					break;
//			}
		}
		/**
		 *    打开充值窗口
		 */
		public static function openChongzhiWinodow():void{
			WindowManager.openOnlyWinodw(ChongzhiWindow);
		}
		
		/**
		 *  显示网络等待
		 */
		public static function showWebWait():void{
			LayerController.instance.webWaiterLayer && LayerController.instance.webWaiterLayer.showWait();
		}
		/**
		 *  隐藏网络等待
		 */
		public static function hideWebWait():void{
			LayerController.instance.webWaiterLayer && LayerController.instance.webWaiterLayer.hideWait();
		}
		
		
		/*public static function createJiangliIcon(pos:Position,type:String,xid:int=0):void{
			
		}
		
		public static function createJiangliName(type:String,xid:int=0):String{
			
			return "";
		}
		
		public static function getResourceDesc(type:String,xid:int):String{
			
			return "";
		}
		
		public static function createJiangliDesc(type:String,num:int,xid:int=0):String{
			
			return "";
		}*/
		
		/**
		 *   创建图标类型的东西
		 */
//		public static function createIcon(resType:String,xid:int=0):DisplayObject{
//			
//			return null;
//		}
		
		
		
		
		private static const MaxShowJiangbeiNum:int=3;
		/**
		 *   添加等级名次背景图
		 */
		public static  function setPaimingBeijing(pos:Position,rank:int):void
		{
			if((rank<=MaxShowJiangbeiNum)&&(rank>0))
			{
				pos.fillWithBitmapByClassName(("jiangbei"+rank).toString());
			}
			else
			{
				pos.destoryChild();
			}
		}
		
		public static function createArrayJosnToMap(jsKey:String,jsNum:String):Object{
			var keys:Array=JSON.parse(jsKey) as Array;
			var nums:Array=JSON.parse(jsNum) as Array;
			
			var map:Object={};
			for(var index:int=0; index<keys.length; index++){
				map[keys[index]]=int(nums[index]);
			}
			return map;
		}
		
		
		/**
		 *   清理最上层的提示
		 */
		public static function clearTopTip():void{
			MDI_UiLayer.isInit=true;
			while(GlobalRef.topLayer.numChildren){
				var dis:DisplayObject=GlobalRef.topLayer.removeChildAt(0);
				try{
					(dis as Object).destory();
				}catch(e:Error){
					trace("refresh "+e.message);
				}
			}
		}
		/**
		 *   清理游戏
		 */
		public static function clearGame():void{
			S2CHanlder.instance.reset();
			//先撤掉所有显示
			GameSwitchSceneController.getInstance().clearFlashView();
//			
//			GameSwitchSceneController.getInstance().clearBattleView();
			GameManager.endBattle();
			
			//清理
			ModuleManager.getInstance().unLoadmodule(CoreConfig.NAME);
			
			CoreConfig.clearModel();
			
			//清理常量
			//			MDI_Maoxian2.showAlert=false;
			
			//			StoryManager.instance.reset();
			GameVOManager.getInstance().reset();
			
			
			
//			SwitchSceneController.getInstance().isInBattle=false;
		}
		
		/**
		 *   把url解析成object
		 */
		public static function trifyUrlToObj(url:String):Object{
			var argstring:String=url;
			var indexQuate:int=url.indexOf("?");
			if(indexQuate!=-1){
				argstring=url.substr(indexQuate+1);
			}
			var re:Object={};
			var atArray:Array=argstring.split("&");
			for each(var w:String in atArray){
				var objArray:Array=w.split("=");
				if(objArray.length==2){
					re[objArray[0]]=objArray[1];
				}
			}
			return re;
		}
		
		public static function setMouseUnable(target:*):void{
//			target.mouseChildren=false;
//			target.mouseEnabled=false;
			if(target is InteractiveObject){
				target.mouseEnabled=false;
			}
			if(target is DisplayObjectContainer){
				target.mouseChildren=false;
			}
		}
		
		public static function getLanguageAttrAdd(attr:String,addValue:int):String{
			return Util.getLanguage(attr)+":"+"+"+addValue;
		}
		
		public static function setItemName(tf:FontField,type:String,xid:int=0):void{
			var node:*;
			var color:uint;
			var name:String;
			if(ResourceConst.R_cash==type){
				name=Util.getLanguage(ResourceConst.R_cash);
			}
			if(ResourceConst.R_money==type){
				name=Util.getLanguage(ResourceConst.R_money);
			}
			if(ResourceConst.R_equip==type){
				node=XMLDataManager.getEquipById(xid);
			}
			if(ResourceConst.R_item==type){
				node = XMLDataManager.getItemById(xid);
			}
			if(ResourceConst.R_money==type){
				node =  Util.getLanguage(ResourceConst.R_money);
			}
			if(ResourceConst.R_baoshi==type){
				node =  XMLDataManager.getBaoshiById(xid);
			}
			if(ResourceConst.R_exp==type){
				name=Util.getLanguage(ResourceConst.R_exp);
			}
			if(ResourceConst.R_rongyu==type){
				name=Util.getLanguage(ResourceConst.R_rongyu);
			}
			if(ResourceConst.R_Star==type){
				name="";
			}
			if(name!=null){
//				color=XMLDataManager.getConstById("color_common").value;
				color=tf.defaultColor;
			}else{
				if(node){
					name=node.name;
					if(type==ResourceConst.R_equip){
						color=uint("0x"+XMLDataManager.getConstById("color_star"+node.star).desc);	
					}else{
						color=tf.defaultColor;
					}
					
				}
			}
			tf.textColor=color;
			tf.text=name;
		}
		public static function getXml(type:String,xid:int):Object
		{
			var result:Object;
			if(ResourceConst.R_equip==type){
				result=XMLDataManager.getEquipById(xid);
			}
			if(ResourceConst.R_baoshi==type)
			{
				result=XMLDataManager.getBaoshiById(xid);
				
			}
			if(ResourceConst.R_item==type){
				result = XMLDataManager.getItemById(xid);	
			}
			return result;
		}
		/**
		 * 奖励专门显示用的
		 */
		public static function createJiangliIcon_JiangliMc(pos:Position,type:String,xid:int=0):void{
			if(ResourceConst.R_equip==type){
				var equipNode:Node_equip=XMLDataManager.getEquipById(xid);
				pos.fillWithObject(new ItemMc().loadData(equipNode));
			}
			if(ResourceConst.R_baoshi==type)
			{
				var baoshiNode:Node_baoshi=XMLDataManager.getBaoshiById(xid);
				pos.fillWithObject(new ItemMc().loadData(baoshiNode));
			}
			if(ResourceConst.R_item==type){
				var itemNode:Node_item = XMLDataManager.getItemById(xid);	
				pos.fillWithObject(new ItemMc().loadData(itemNode));
			}
			if(ResourceConst.R_money==type){
				pos.fillWithObject(new ImageBitmap("image_reward_money"));
			}
			if(ResourceConst.R_cash==type){
				pos.fillWithObject(new ImageBitmap("image_reward_cash"));
			}
			if(ResourceConst.R_exp==type){
				pos.fillWithObject(new ImageBitmap("image_reward_exp"));
			}
			if(ResourceConst.R_rongyu==type){
				pos.fillWithBitmapByClassName("image_reward_cash");
			}
			if(ResourceConst.R_tili==type){
				pos.fillWithObject(new ImageBitmap("image_tili"));
			}
			if(ResourceConst.R_Star==type){
				pos.fillWithObject(new ImageBitmap("image_star"));
			}
			if(ResourceConst.R_rongyu==type){
				pos.fillWithObject(new ImageBitmap("image_rongyu"));
			}
		}
		public static function createJiangliIcon(pos:Position,type:String,xid:int=0):void{
			if(ResourceConst.R_equip==type){
				var equipNode:Node_equip=XMLDataManager.getEquipById(xid);
				pos.fillWithObject(new ItemMc().loadData(equipNode));
			}
			if(ResourceConst.R_baoshi==type)
			{
				var baoshiNode:Node_baoshi=XMLDataManager.getBaoshiById(xid);
				pos.fillWithObject(new ItemMc().loadData(baoshiNode));
			}
			if(ResourceConst.R_item==type){
				var itemNode:Node_item = XMLDataManager.getItemById(xid);	
				pos.fillWithObject(new ItemMc().loadData(itemNode));
			}
			if(ResourceConst.R_money==type){
				pos.fillWithObject(new ImageBitmap("image_money"));
			}
			if(ResourceConst.R_cash==type){
				pos.fillWithObject(new ImageBitmap("image_cash"));
			}
			if(ResourceConst.R_exp==type){
				pos.fillWithObject(new ImageBitmap("image_exp"));
			}
			if(ResourceConst.R_rongyu==type){
				pos.fillWithBitmapByClassName("image_rongyu");
			}
			if(ResourceConst.R_tili==type){
				pos.fillWithObject(new ImageBitmap("image_tili"));
			}
			if(ResourceConst.R_Star==type){
				pos.fillWithObject(new ImageBitmap("image_star"));
			}
		}
		
		public static function createJiangliName(type:String,xid:int=0):String{
//			if(ResourceConst.R_card==type){
//				return XMLDataManager.getKapaiById(xid).name;
//			}
			if(ResourceConst.R_cash==type){
				return Util.getLanguage(ResourceConst.R_cash);
			}
			if(ResourceConst.R_equip==type){
				return XMLDataManager.getEquipById(xid).name;
			}
			if(ResourceConst.R_item==type){
				return XMLDataManager.getItemById(xid).name;
			}
			if(ResourceConst.R_money==type){
				return Util.getLanguage(ResourceConst.R_money);
			}
//			if(ResourceConst.R_pet==type){
//				return XMLDataManager.getPetById(xid).name;
//			}
			if(ResourceConst.R_rongyu==type){
				return Util.getLanguage(ResourceConst.R_rongyu);
			}
			if(ResourceConst.R_skill==type){
				return XMLDataManager.getSkillById(xid).name;
			}
			if(ResourceConst.R_tili==type){
				return Util.getLanguage(ResourceConst.R_tili);
			}
			if(ResourceConst.R_yongqi==type){
				return Util.getLanguage(ResourceConst.R_yongqi);
			}
			return "";
		}
		
		public static function getResourceDesc(type:String,xid:int):String{
//			if(ResourceConst.R_card==type){
//				return XMLDataManager.getKapaiById(xid).desc;
//			}
			if(ResourceConst.R_cash==type){
				//				return Util.getLanguage(ResourceConst.R_cash)+"x"+num;
			}
			if(ResourceConst.R_equip==type){
				return XMLDataManager.getEquipById(xid).desc;
			}
			if(ResourceConst.R_item==type){
				return XMLDataManager.getItemById(xid).desc;
			}
			if(ResourceConst.R_money==type){
				//				return Util.getLanguage(ResourceConst.R_money)+"x"+num;
			}
//			if(ResourceConst.R_pet==type){
//				return XMLDataManager.getPetById(xid).desc;
//			}
			if(ResourceConst.R_rongyu==type){
//				return Util.getLanguage(ResourceConst.R_rongyu)+"x"+num;
			}
			if(ResourceConst.R_skill==type){
				return XMLDataManager.getSkillById(xid).desc;
			}
			if(ResourceConst.R_tili==type){
				//				return Util.getLanguage(ResourceConst.R_tili)+"x"+num;
			}
			if(ResourceConst.R_yongqi==type){
				//				return Util.getLanguage(ResourceConst.R_yongqi)+"x"+num;
			}
			return "";
		}
		
		public static function createJiangliDesc(type:String,num:int,xid:int=0):String{
			if(ResourceConst.R_cash==type){
				return Util.getLanguage(ResourceConst.R_cash)+"x"+num;
			}
			if(ResourceConst.R_equip==type){
				return XMLDataManager.getEquipById(xid).name+"x"+num;
			}
			if(ResourceConst.R_item==type){
				return XMLDataManager.getItemById(xid).name+"x"+num;
			}
			if(ResourceConst.R_money==type){
				return Util.getLanguage(ResourceConst.R_money)+"x"+num;
			}
			if(ResourceConst.R_baoshi==type){
				return XMLDataManager.getBaoshiById(xid).name+"x"+num;
			}
			return "";
		}
		
		/**
		 *   创建图标类型的东西
		 */
		public static function createIcon(resType:String,xid:int=0):DisplayObject{
			switch(resType){
				case ResourceConst.R_cash:
					return new ImageBitmap("image_cash")
					break;

				case ResourceConst.R_equip:
					return new ItemMc().loadData(XMLDataManager.getEquipById(xid));
					break;
				case ResourceConst.R_item:
					return (new ItemMc().loadData(XMLDataManager.getItemById(xid)));
					break;
				case ResourceConst.R_baoshi:
					return new ItemMc().loadData(XMLDataManager.getBaoshiById(xid))
					break;
				case ResourceConst.R_money:
					return new ImageBitmap("image_money");
					break;
				
				case ResourceConst.R_rongyu:
					return new ImageBitmap("image_rongyu");
					break;
				
				case ResourceConst.R_tili:
					return new ImageBitmap("image_tili");
					break;
				case ResourceConst.R_yongqi:
					return new ImageBitmap("image_yongqi");
					break;
			}
			return null;
		}
		
		/**  生成礼包 的 提示数据
		 * */
		public static  function createPackData(libaoId:int):RewardsPackData
		{
			var _xml:Node_item=XMLDataManager.getItemById(libaoId);
			var result:RewardsPackData=new RewardsPackData();
			var data:Object=JSON.parse(_xml.effect);
			result.bonus_money=data.money;
			result.bouns_cash=data.cash;
			result.bouns_yongqi=data.yongqi;
			result.bouns_shengwang=data.shengwang;
			result.bouns_tili=data.tili;
			result.bouns_itmes=data.item;
			result.bouns_equips=data.equip;
			return result;
		}
		/**
		 * 世界聊天禁言
		 */
		public static function checkIfShijieliaotianJinyan():Boolean
		{
			var result:Boolean=checkIfJinyan();
			return result;
		}
		public static function checkIfJinyan():Boolean
		{
			var jinyanVo:JinyanVO=GameVOManager.getInstance().jinyan;
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			if((jinyanVo.endTime<=timerModel.serverTime)||(jinyanVo.endTime==0))
			{
				return false;
			}
			return true;
		}
		/**
		 * 得到禁言提示
		 */
		public static function getJinyanShowDesc():String
		{
			var jinyanVo:JinyanVO=GameVOManager.getInstance().jinyan;
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			var beginTimeDesc:String=CommonControlFun.timeToMRHM(jinyanVo.startTime);
			var endTimeDesc:String=CommonControlFun.timeToMRHM(jinyanVo.endTime);
			return Util.getLanguage("禁言提示",jinyanVo.desc,beginTimeDesc,endTimeDesc);
		}
		/** 身体部位翻译 **/
		public static function getBodyPartLanguage(part:int):String{
//			return getLanguage(EquipModel.PartLanguage[part]);
			var node:Node_equip_type=XMLDataManager.getEquip_typeById(part);
			if(node) return node.name;
			return XMLDataManager.getEquipById(part).name;
			
		}
		
		
		/**   卡牌死亡后 头像颜色变灰滤镜
		 * */
//		public static var touxiangGrayMatrix:Vector.<Number>=new <Number> [
//			0.3086, 0.6094, 0.0820, 0, 0, 
//			0.3086, 0.6094, 0.0820, 0, 0, 
//			0.3086, 0.6094, 0.0820, 0, 0, 
//			0,      0,      0,      1, 0];
//		
//		
//		public static function changeGray(display:Object):void{
//			display
//		}
		
		public static const AllAttrNames:Array=["atk","def","hp","cri","renxing","hit","eva","speed"];
		/** 计算战斗力  **/
		public static function calcZhandouliByAttrMap(attrMap:Object):int{
			var exp:String=XMLDataManager.getExpressionById("zhandouli").expression;
			for each(var attr:String in AllAttrNames){
				if(!attrMap.hasOwnProperty(attr)){
					attrMap[attr]=0;
				}
			}
			return D.evalToInt(exp,attrMap);
		}
		
		public static function setSuccessText(tf:FontField,text:String):void{
			tf.textColor=uint("0x"+XMLDataManager.getConstById("color_chenggong").desc);
			tf.text=text;
		}
		public static function setFailText(tf:FontField,text:String):void{
			tf.textColor=uint("0x"+XMLDataManager.getConstById("color_shibai").desc);
			tf.text=text;
		}
		
		public static function getChengongColor():uint{
			return uint("0x"+XMLDataManager.getConstById("color_chenggong").desc);
		}
		public static function getShibaiColor():uint{
			return uint("0x"+XMLDataManager.getConstById("color_shibai").desc);
		}
		
		public static function showLevelUpWindow(comFn:Function=null):Boolean
		{
			// 如果没有引导完毕就不要显示升级窗口
			if(!guideIsCompelete()) return false ;
			
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.couldShowLevelUp())
			{
				if(!WindowManager.getCurrentOpenedWindowByClass(LevelUpWindow))
				{
					WindowManager.openOnlyWinodw(LevelUpWindow,comFn);
				}
				else
				{
					var shengjiWindow:MDI_LevelUp=Context.getInjectInstance(MDI_LevelUp);
					shengjiWindow.updateShow();
				}
				return true;
			}
			return false;
		}
		public static function checkCouldBanghuiLiaotian():Boolean
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(gonghuiModel.myBanghuiData.bid<=0)
			{
				Util.flow("需要加入帮会才能进行帮会聊天");
				return false;
			}
			return true;
		}
		
		public static function showShouchongAfterChongzhi():Boolean{
			var chongzhiModel:ChongzhiModel=Context.getInjectInstance(ChongzhiModel);
			if(chongzhiModel.getShouchongState()==ChongzhiModel.ST_Active){
				if(GameManager.manager && GameManager.getManagerType()==GameManager.MG_Zhucheng && (!chongzhiModel.hasShowShouchongAfterChongzhi)){
					chongzhiModel.hasShowShouchongAfterChongzhi=true;
					if(WindowManager.getCurrentOpenedWindowByClass(ShouchongWindow)==null){
						WindowManager.openOnlyWinodw(ShouchongWindow);
						return true;
					}
				}
			}
			return false;
		}
		
		public static function showChongzhiSuccessTip():void{
			var chongzhiModel:ChongzhiModel=Context.getInjectInstance(ChongzhiModel);
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(chongzhiModel.chongzhiSuccesXid);
			if(node){
				if(node.id==chongzhiModel.yuekaId){
					Util.flow("购买月卡成功");
				}else{
					Util.flow("充值成功提示",node.name,node.cash);
				}
			}
		}
		
		/**
		 *  根据用户id 获取用户头像
		 */
		public static function getUserImageNameByImageId(_id:int):String
		{
			return XMLDataManager.getHeroById(_id).touxiang;
		}
		
		public static function guideIsCompelete():Boolean{
			if(GameVOManager.getInstance().user){
				var step:int=GameVOManager.getInstance().user.guideStep;
				if(XMLDataManager.getXinshouyindaoById(step)==null){
					return true;
				}
			}
			return false;
		}
		
		public static function getClassName(cls:Class):String{
			var s:String=cls+"";
			s=s.substr("[class ".length);
			s=s.replace("]","");
			return s;
		}
		
		public static function getVipIcon(_vipLevel:int):String
		{
			return "vip"+_vipLevel;
		}
		
		public static function showStageMouse():void{
			showMouseLayer(GlobalRef.stage,0);
		}
		
		public static function traceParentScale(dis:DisplayObject):void{
			var s:String="缩放： ";
			while(dis){
				s+="\t"+dis.name+":"+"["+dis.scaleX+","+dis.scaleY+"]";
				dis=dis.parent;
			}
			trace(s);
		}
		
		public static function showMouseLayer(container:DisplayObjectContainer,layerIndex:int):void{
			var pre:String="";
			var index:int;
			var span:String="\t";
			for(index=0; index<layerIndex; index++){
				pre+=span;
			}
			if(container.visible==false){
				return ;
			}
			
			trace(pre+container.name+"\t\t"+container.mouseEnabled);
			if(container.mouseChildren){
				for(index=container.numChildren-1; index>=0; index--){
					var chlid:DisplayObject=container.getChildAt(index);
					if(chlid.visible==false) continue;
					if(chlid && chlid is InteractiveObject){
						if(chlid is DisplayObjectContainer){
							showMouseLayer((chlid as DisplayObjectContainer),layerIndex+1);
						}else{
							if((chlid as InteractiveObject).mouseEnabled){
								trace(pre+span+chlid.name+"\t\t"+true);
							}
						}
					}
				}
			}
		}
	}
}
