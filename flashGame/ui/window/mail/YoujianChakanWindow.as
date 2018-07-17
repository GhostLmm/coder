package ui.window.mail
{
	import flash.text.TextField;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerCenterMax;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;

	public class YoujianChakanWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _Btn_liuyan_huifu:Button;
		public var _Btn_queding:Button;
		public var _fnt_to_player:FontField;
		public var _fnt_mail:TextField;
		
		public var _fnt_wu:FontField;
		public var _pos_scroll_jiangli:Position;
		public var _scroll_jiangli:ScrollControllerCenterMax;
		
		public function YoujianChakanWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowYoujianChakan);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_Btn_liuyan_huifu=new Button(windowMaterial.Btn_liuyan_huifu);
			_Btn_queding=new Button(windowMaterial.btn_queding);
			
			_fnt_to_player=new FontField(windowMaterial.fnt_to_player);
			_fnt_mail=windowMaterial.fnt_mail;
			
			_fnt_wu=new FontField(windowMaterial.fnt_wu);
			_pos_scroll_jiangli=new Position(windowMaterial.pos_scroll_jiangli);
			_scroll_jiangli=new ScrollControllerCenterMax(_pos_scroll_jiangli,ScrollControllerMax.HORIZONTAL);
			
//			var tempArray:Array=[];
//			var count:int=0;
//			var index:int;
//			for(index=0;index<windowMaterial.numChildren;index++)
//			{
//				var tempObj:Object= windowMaterial.getChildAt(index);
//				if((tempObj is TextField)||(tempObj is FontField))
//				{
////					tempObj.text=index.toString();
//					tempArray.push(tempObj);
//					count++;
//				}
//			}
//			
//			for(index=0;index<tempArray.length;index++)
//			{
//				tempArray[index].y=0+index*10;
//				windowMaterial.addChild(tempArray[index] as DisplayObject);
//			}
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_Btn_liuyan_huifu){_Btn_liuyan_huifu.destory();_Btn_liuyan_huifu=null;};
			if(_Btn_queding){_Btn_queding.destory();_Btn_queding=null;};
			
			if(_fnt_to_player){_fnt_to_player.destory();_fnt_to_player=null;};
			if(_fnt_mail){_fnt_mail=null;};
			
			if(_fnt_wu){_fnt_wu.destory();_fnt_wu=null;};
			if(_pos_scroll_jiangli){_pos_scroll_jiangli.destory();_pos_scroll_jiangli=null;};
			if(_scroll_jiangli){_scroll_jiangli.destory();_scroll_jiangli=null;};
		}
		private function get windowMaterial():WindowYoujianChakan 
		{
			return _scene as WindowYoujianChakan; 
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
	}
}
