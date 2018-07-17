package view.login
{
	import com.ghostlmm.xmldata.Node_name;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import Tool.account.AccountControl;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.InputField;
	
	import util.Util;
	
	import view.Base_Mc;
	import view.commontools.CheckBanWords;

	public class MC_Name_Login extends Base_Mc
	{
		private var _btn_jinru:Button;
		private var _btn_suiji:Button;
		private var _fnt_shuru:InputField;
		private var _fnt_yuyan:FontField;
		
		private var NameMaxNumDic:Dictionary;
		private var _text:String;
		
		public function MC_Name_Login()
		{
			super();
		}
		protected override function initModule():void
		{
			_btn_jinru = new Button(mcMaterial.btn_jinru);
			_btn_suiji = new Button(mcMaterial.btn_suiji);
			_fnt_shuru = new InputField(mcMaterial.fnt_shuru,7);
			_fnt_yuyan=new FontField(mcMaterial.fnt_yuyan);
			_text=mcMaterial.fnt_yuyan.text;
			mcMaterial.x=GlobalRef.width/2;
			mcMaterial.y=GlobalRef.height/2;
			initDic();
		}
		private function initDic():void
		{
			NameMaxNumDic=new Dictionary();
			NameMaxNumDic[1]=0;
			NameMaxNumDic[2]=0;
			NameMaxNumDic[3]=0;
		}
		private function destoryMc():void
		{
			if(_btn_jinru){_btn_jinru.destory();_btn_jinru=null;};
			if(_btn_suiji){_btn_suiji.destory();_btn_suiji=null;};
			if(_fnt_shuru){_fnt_shuru.destory();_fnt_shuru=null;};
			if(_fnt_yuyan){_fnt_yuyan.destory();_fnt_yuyan=null;};
		}
		public override function destory():void
		{
			TweenLite.killTweensOf(this);
			destoryMc();
			super.destory();
		}
		protected override function registerEvent():void
		{		
			addTargetEvent(_btn_jinru,TqtEvent.BUTTON_CLICK,onOK);
			addTargetEvent(_btn_suiji,TqtEvent.BUTTON_CLICK,onRandomName);
			setShow();
		}
		private function onOK(evt:Event):void
		{
			if(_fnt_shuru.isInputed() == false) 
			{
				genRandomName();
			}
			if(CheckBanWords.isBad(_fnt_shuru.text))
			{
				Util.flow("包含敏感词汇，请重新输入");
				return;
			}
			AccountControl.getInstance().nameGame(_fnt_shuru.text);
		}
		private function onRandomName(evt:Event):void
		{
			genRandomName();
		}
		public static const FontsRate:Number=15;
		protected override function setShow():void
		{
//			Music.playFX(Music.FX_Nvpu);
			_textIndex=0;
			
			TweenLite.to(this,(_fnt_yuyan.text.length)/FontsRate,{textIndex:_fnt_yuyan.text.length+1,onComplete:onTextMovieComplete});
		}
		private function onTextMovieComplete():void
		{
			_fnt_yuyan.text=_text;
			TweenLite.killTweensOf(this);
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
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("SceneYindao1") as Class); 
		}
		private function get mcMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		private var _textIndex:int;
		public function get textIndex():int{
			return _textIndex;
		}
		public function set textIndex(value:int):void
		{
			_textIndex=value;
			_fnt_yuyan.text= _text.substr(0,_textIndex);
		}
	}
}
