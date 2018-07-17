package ui.mc
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.models.ItemModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.CommonControlFun;

	public class JiangliMc extends _McBase implements IGridItemMax
	{
		public var _fnt_jiangli:FontField;
		private var _pos_jiangli:Position;
		
		private var _proxy:ListenerAddProxy;
		private var _data:Object;
		
		public var _fnt_num:FontField;
		
		public static var WIDTH:Number=-1;
		public static var HEIGHT:Number=-1;
		
		public function JiangliMc()
		{
			super();
			_proxy=new ListenerAddProxy();
			_scene = new (AssetManager.getAssetClass("McJiangli") as Class); 
			this.addChild(_scene);
			_fnt_jiangli = new FontField(_scene.fnt_jiangli);
			_pos_jiangli = new Position(_scene.pos_jiangli);
			_fnt_num=new FontField(_scene.fnt_num);
			this.addEventListener(TQTTouchEvent.TOUCH_TAP,onTaped);
		}
		private function onTaped(evt:Event):void
		{
			if(checkIfIsChaonengli())
			{
				CommonControlFun.gotoGetItemMapSelectWindow(_data.xid);
			}
		}
		public override function destory():void
		{
			this.removeEventListener(TQTTouchEvent.TOUCH_TAP,onTaped);
			if(_proxy) {_proxy.clear(); _proxy=null;}
			if(_fnt_jiangli){_fnt_jiangli.destory();_fnt_jiangli=null;};
			if(_pos_jiangli){_pos_jiangli.destory();_pos_jiangli=null;};
			if(_fnt_num) {_fnt_num.destory(); _fnt_num=null;}
			super.destory();
		}
		private function checkIfIsChaonengli():Boolean
		{
			if((_data.hasOwnProperty("chaonengli"))&&(_data.chaonengli==true))
			{		
				return true;
			}
			return false;
		}
		public static const textColor:uint = 0XFF0000;
		public function loadData($data:Object):*
		{	
//			Util.traceParentScale(this);
			_data=$data;
			Util.createJiangliIcon_JiangliMc(_pos_jiangli,data.key,data.xid);
			if(checkIfIsChaonengli())
			{
				var itemModel:ItemModel=Context.getInjectInstance(ItemModel);
				var itemNum:int=itemModel.getItemNumById(data.xid);
				_fnt_num.text=itemNum+"/"+data.num;
				if(data.num>itemNum)
				{
					_fnt_num.textColor=textColor;
				}
				Util.setItemName(_fnt_jiangli,data.key,data.xid);
			}
			else
			{
				var num:int;
				if(!data.hasOwnProperty("num") || data.num==0){
					num=0;
				}else{
					num=data.num;
				}
				if(ResourceConst.isBaseResource(data.key)){
					_fnt_num.text="";
					if(num>1){
						_fnt_jiangli.text="X"+num;
					}else{
						_fnt_jiangli.text="";
					}
				}else{
					Util.setItemName(_fnt_jiangli,data.key,data.xid);
					if(ResourceConst.isDuidieResource(data.key)){
						if(num>1){
							_fnt_num.text="X"+num;
						}else{
							_fnt_num.text="";
						}
					}else{
						_fnt_num.text="";
					}
				}
			}
			if(WIDTH==-1){
				WIDTH=this.width;
				HEIGHT=this.height;
			}
			return this;
		}
		
		public function set enable(value:Boolean):void{
			
		}
		public function get enable():Boolean{
			return true;
		}
		
		private var _selected:Boolean;
		public function set selected(value:Boolean):void{
			_selected=value;
		}
		public function get selected():Boolean{
			return _selected;
		}
		
		private var _index:int;
		public function set index(value:int):void{
			_index=value;
		}
		public function get index():int{
			return _index;
		}
		
		
		public function get data():Object{
			return _data;
		}
		
		public function enterMovie():*{
			
		}
	}
}
