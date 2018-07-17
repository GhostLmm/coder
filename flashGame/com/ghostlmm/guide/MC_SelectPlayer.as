package com.ghostlmm.guide
{
	import com.ghostlmm.xmldata.Node_hero;
	import com.ghostlmm.xmldata.Node_name;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import Tool.account.AccountControl;
	
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import org.osflash.signals.Signal;
	
	import ui.widget.Button;
	import ui.widget.InputField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	
	import util.Util;
	
	import view.Base_Mc;
	import view.commontools.CheckBanWords;
	
	public class MC_SelectPlayer extends Base_Mc
	{
		private var container:Sprite;
		private var _pos_touxiang:Position;
		private var _scr_touxiang:ScrollControllerMax;
		private var _fnt_shuru:InputField;
		private var _mc_shuiji:MovieClip;
		private var _btn_jinru:Button;
		
		public var slected_SN:Signal=new Signal(Node_hero);
		private var NameMaxNumDic:Dictionary;
		
		private var curentHero:Node_hero;
		private function initDic():void
		{
			NameMaxNumDic=new Dictionary();
			NameMaxNumDic[1]=0;
			NameMaxNumDic[2]=0;
			NameMaxNumDic[3]=0;
		}
		public function MC_SelectPlayer()
		{
			container=new Sprite();
			super(container);
		}
		public override function destory():void{
			slected_SN.removeAll();
			TweenLite.killTweensOf(this);
			if(_pos_touxiang) {_pos_touxiang.destory(); _pos_touxiang=null;}
			if(_scr_touxiang) {_scr_touxiang.destory(); _scr_touxiang=null;}
			if(_fnt_shuru) {_fnt_shuru.destory(); _fnt_shuru=null;}
			if(_btn_jinru) {_btn_jinru.destory(); _btn_jinru=null;}
			_mc_shuiji=null;
			super.destory();
		}
		
		protected override function initModule():void{
			initDic();
			var selecMC:McXuanrenZhanshi=new McXuanrenZhanshi();
			container.addChild(selecMC);
			selecMC.x=GlobalRef.width-selecMC.width/2;
			selecMC.y=GlobalRef.height/2;
			_pos_touxiang=new Position(selecMC.pos_touxiang);
			_scr_touxiang=new ScrollControllerMax(_pos_touxiang);
			_scr_touxiang.initClass(Item_SelectHero);
			
			var nameMC:McInputName=new McInputName();
			container.addChild(nameMC);
			nameMC.x=GlobalRef.width/2;
			nameMC.y=GlobalRef.height-nameMC.height/2;
			_fnt_shuru=new InputField(nameMC.fnt_shuru);
			_mc_shuiji=nameMC.btn_suiji;
			
			var btnMc:BtnQianwangDiaocha=new BtnQianwangDiaocha();
			btnMc.x=GlobalRef.width-btnMc.width;
			btnMc.y=GlobalRef.height-btnMc.height;
			container.addChild(btnMc);
			
			_btn_jinru=new Button(btnMc);
			
			addTargetEvent(_scr_touxiang,TqtEvent.SCROLL_SELECTED,onSelected);
			_scr_touxiang.setData(createSelectHeroXmls());
			_scr_touxiang.setSelectIndexOrData(0);
			
			addTargetEvent(_mc_shuiji,TQTTouchEvent.TOUCH_BEGIN,onTouchSuiji);
			addTargetEvent(_mc_shuiji,TQTTouchEvent.TOUCH_TAP,onRandomName);
			addTargetEvent(_btn_jinru,TqtEvent.BUTTON_CLICK,onClickNext);
		}
		private var _radio:Number=0;
		public function get radio():Number{
			return _radio;
		}
		public function set radio(value:Number):void{
			if(_radio!=value){
				_radio=value;
				if(_mc_shuiji){
					_mc_shuiji.rotation=_radio;
				}
			}
		}
		
		private function onClickNext(evt:Event):void{
			if(_fnt_shuru.isInputed() == false) 
			{
				genRandomName();
			}
			if(CheckBanWords.isBad(_fnt_shuru.text))
			{
				Util.flow("包含敏感词汇，请重新输入");
				return;
			}
//			AccountControl.getInstance().nameGame(_fnt_shuru.text);
			
			AccountControl.getInstance().createPlayer(_fnt_shuru.text,curentHero);
			
		}
		
		private function onRandomName(evt:Event):void{
			genRandomName();
		}
		
		private function onTouchSuiji(evrt:Event):void{
			TweenLite.killTweensOf(this);
			TweenLite.to(this,3,{radio:1000+radio});
		}
		
		private function genRandomName():void
		{
			var name1:String = XMLDataManager.getNameById(getRandomValueByIndex(1)).name1;
			var name2:String =XMLDataManager.getNameById(getRandomValue()).name2;
			var name3:String = XMLDataManager.getNameById(getRandomValueByIndex(3)).name3;
			var name:String;
			if(name1!="")
			{
				trace("==================");
				trace("name1"+"不为空了");
				trace("name1:"+name1);
				trace("==================");
			}
			if(name3!="")
			{
				trace("==================");
				trace("name3"+"不为空了");
				trace("name3:"+name3);
				trace("==================");
			}
			if(name2 != "null") {
				name = name1+name2+name3;
			} else {
				name = name1+name3;
			}
			_fnt_shuru.text = name;
		}
		private function getRandomValue():int
		{
			var MaxNum:int=XMLDataManager.Node_nameArray.length;
			var result:int=1;
			var tempNum:int=Math.ceil(Math.random()*MaxNum);
			result=(1>tempNum)?1:tempNum;
			return result;
		}
		private function getRandomValueByIndex(_index:int):int
		{
			if(NameMaxNumDic[_index]==0)
			{
				NameMaxNumDic[_index]=getMaxRandomValueByNameIndex(_index);
			}
			var MaxNum:int=NameMaxNumDic[_index];
			var result:int=1;
			var tempNum:int=Math.ceil(Math.random()*MaxNum);
			result=(1>tempNum)?1:tempNum;
			return result;
		}
		private static function getMaxRandomValueByNameIndex(_index:int):int
		{
			var beginTime:int=getTimer();
			var nameStr:String="name"+_index;
			var index:int;
			var nameArray:Array=XMLDataManager.Node_nameArray;
			for(index=0;index<nameArray.length;index++)
			{
				var node:Node_name=nameArray[index] as Node_name;
				if(node[nameStr]=="")
				{
					break;
				}
			}
			trace("name"+_index+"消耗时间:"+(getTimer()-beginTime));
			return index;
		}
		
		
		private function onSelected(evt:TqtEvent):void{
			curentHero=evt.data.data;
			slected_SN.dispatch(evt.data.data);
		}
		
		private function createSelectHeroXmls():Array{
			return XMLDataManager.Node_heroArray.concat([]);
		}
		
		
	}
}