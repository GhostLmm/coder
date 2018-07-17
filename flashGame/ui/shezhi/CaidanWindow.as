package ui.shezhi
{	
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.ButtonMax;
	import ui.widget.FontField;
	import ui.window._WindowBase;

	public class CaidanWindow extends _WindowBase
	{
		public var _btn_close:Button;
		
		public var _btn_tuisong:Button;
		public var _btn_yinxiao:Button;
		public var _btn_yinyue:Button;

		
		public var _fnt_id:FontField;
		public var _fnt_pingtaihao:FontField;
		
		public var _mc_kefu:MovieClip;
		public var _fnt_kefu:FontField;
		

		
		public var btnArray:Array;
		
//		private var _btn_gonggao:Button;
//		private var _btn_zhanghaozhongxin:Button;
//		private var _btn_libaoduihuan:Button;
//		private var _btn_chenghao:Button;
//		private var _btn_haoyou:Button;
//		private var _btn_libao:Button;
		
		private var sx:Number;
		private var sy:Number;
		private var spanx:Number;
		private var spany:Number;
		public function CaidanWindow(params:Object=null)
		{
			super(params);			_scene=AssetManager.createMCForText(WindowCaidan);
			
			_btn_close = new Button(_scene.btn_close);
			
			
			
			_btn_yinxiao = new Button(_scene.btn_yinxiao);
			_btn_yinyue = new Button(_scene.btn_yinyue);
			_btn_tuisong=new Button(_scene.btn_tuisong);
			_mc_kefu=_scene.mc_xinxi2;
			_fnt_kefu=new FontField(_mc_kefu.fnt_kefu);
			_fnt_id=new FontField(_scene.mc_xinxi.fnt_id);
			_fnt_pingtaihao=new FontField(_scene.mc_xinxi.fnt_pingtaihao);
			
			btnArray=[];
			
			for (var index:int=1; index<=6; index++){
				var btn:ButtonMax=new ButtonMax(_scene["btn_"+index]);
				btnArray.push(btn);
			}

//			sx=_scene.btn_gonggao.x;
//			sy=_scene.btn_gonggao.y;
//			spanx=_scene.btn_zhanghaozhongxin.x-sx;
//			spany=_scene.btn_zhanghaozhongxin.y-sy;
			
//			_btn_gonggao=new Button(_scene.btn_gonggao);
//			_btn_zhanghaozhongxin=new Button(_scene.btn_zhanghaozhongxin);
//			_btn_libaoduihuan=new Button(_scene.btn_libaoduihuan);
//			_btn_chenghao=new Button(_scene.btn_chenghao);
//			_btn_haoyou=new Button(_scene.btn_haoyou);
//			_btn_libao=new Button(_scene.btn_libao);
//			
//			sx=_btn_gonggao.x;
//			sy=_btn_gonggao.y;
//			spanx=_btn_zhanghaozhongxin.x-sx;
//			spany=_btn_chenghao.y-sy;
//			
//			btnArray.push(_btn_gonggao,_btn_zhanghaozhongxin,_btn_libaoduihuan,_btn_chenghao,_btn_haoyou,_btn_libao);
			
		}
		
		/*public function resetButtonPosition():void{
			var t:Array=[];
			for each(var btn:Button in btnArray){
				if(btn.visible){
					t.push(btn);
				}
			}
			
			for(var index:int=0; index<t.length; index++){
				var btn:Button=t[index];
				btn.x=sx+(index%3)*spanx;
				btn.y=sy+int(index/3)*spany;
			}
		}*/
		
		
		public override function destory():void
		{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_btn_yinxiao) {_btn_yinxiao.destory(); _btn_yinxiao=null;}
			if(_btn_yinyue) {_btn_yinyue.destory(); _btn_yinyue=null;}
			_mc_kefu=null;
			if(_fnt_kefu) {_fnt_kefu.destory(); _fnt_kefu=null;}
			if(_fnt_id) {_fnt_id.destory();_fnt_id=null;}
			if(_fnt_pingtaihao) {_fnt_pingtaihao.destory();_fnt_pingtaihao=null;}
			if(_btn_tuisong) {_btn_tuisong.destory();_btn_tuisong=null;}
			
			if(btnArray){
				for each(var btn:ButtonMax in btnArray){
					btn.destory();
				}
				btnArray=null;
			}
			super.destory();
		}
	}
}
