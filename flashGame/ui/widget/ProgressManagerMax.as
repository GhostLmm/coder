package ui.widget
{
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.utils.Dictionary;
	
	public class ProgressManagerMax extends ProgressManager
	{
		private var _vect:Vector.<ProgressSection>;
		private var _keyMap:Dictionary;
		private var _curKey:String;
		
		private var _pgNum:Number=0;
		public function ProgressManagerMax(view:MovieClip, textField:TextInterface=null, type:int=NORMAL, formatFunction:Function=null)
		{
			super(view, textField, type, formatFunction);
			_vect=new Vector.<ProgressSection>();
			_keyMap=new Dictionary();
		}
		
		private var totalDevider:int=0;
		public function push($key:String,$devider:int):void{
			var section:ProgressSection=new ProgressSection();
			section.key=$key;
			section.devider=$devider;
			totalDevider+=section.devider;
			section.totalDevider=totalDevider;
			_vect.push(section);
			_keyMap[$key]=_vect.length-1;
		}
		
		private function calcTime(offset:int):Number{
			return 1;
		}
		
		public function get pgNum():Number{
			return _pgNum;
		}
		public function set pgNum(value:Number):void{
			if(value!=_pgNum){
				_pgNum=value;
				update();
			}
		}
		private function update():void{
			for each(var section:ProgressSection in _vect){
				if(_pgNum<section.totalDevider){
//					devider=section.totalDevider;
					devider=section.devider;
					progress=_pgNum-(section.totalDevider-section.devider);
//					trace("test: "+section.key+"/"+devider+"/"+progress);
					break;
				}
			}
		}
		
		public function tweenSet(sectionKey:String,$progress:int,time:Number=Number.NaN):void{
			var index:int=_keyMap[sectionKey];
			var section:ProgressSection=_vect[index];
			var target:Number=section.totalDevider-section.devider+$progress;
			if(isNaN(time)){
				time=calcTime(target-pgNum);
				TweenLite.to(this,time,{pgNum:target});
			}else if(time<=0){
				_pgNum=target;
				update();
			}else{
				TweenLite.to(this,time,{pgNum:target});
			}
		}
		public function tweenAdd(addProgress:int,time:Number=Number.NaN):void{
			
		}
	}
}
internal class ProgressSection
{
	public var key:String;
	public var devider:Number=0;
	public var totalDevider:Number=0;
}