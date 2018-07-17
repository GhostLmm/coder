package ui.bag
{
	import flash.display.MovieClip;
	
	import ui.DoubleWindow;
	import ui.HeroModule;
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	
	import util.Queue;
	
	public class HeroDetailWidow extends DoubleWindow
	{
		public var _heroModule:HeroModule;
		
		public var _btn_guanbi:Button;
		private var _pos_scroll:Position;
		public var _scr_page:ScrollController;
		public var _heroAttr:HeroAttrMC;
		
		public function HeroDetailWidow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowRenwuXiangqing);
			_heroModule=new HeroModule(_scene.mc_left);
			
			var mc_right:MovieClip=_scene.mc_right;
			_btn_guanbi=new Button(mc_right.btn_guanbi);
			_pos_scroll=new Position(mc_right.pos_scroll);
			_scr_page=new ScrollController(_pos_scroll);
			_pos_scroll.addChild(_scr_page);
			
			_heroAttr=new HeroAttrMC();
			var queue:Queue=new Queue();
			queue.push(_heroAttr);
			_scr_page.initItems(queue);
		}
		protected override function tweenOpenComplete():void{
			super.tweenOpenComplete();
			_heroModule.initHeroThumb();
			
		}
		
		public override function destory():void{
			if(_btn_guanbi) {_btn_guanbi.destory(); _btn_guanbi=null;}
			if(_pos_scroll) {_pos_scroll.destory(); _pos_scroll=null;}
			if(_scr_page) {_scr_page.destory(); _scr_page=null;}
			if(_heroModule) {_heroModule.destory(); _heroModule=null;}
			if(_heroAttr) {_heroAttr.destory(); _heroAttr=null;}
			super.destory();
		}
	}
}