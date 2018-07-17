package ui.bag
{
	import com.fish.modules.core.models.tempData.BagSetData;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import org.osflash.signals.Signal;
	
	import ui.DoubleWindow;
	import ui.HeroModule;
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollerControllerMatrix;
	
	import view.module.LabelSwitch;
	import view.module.ToggleController;
	
	public class BagWindow extends DoubleWindow
	{
		public static var panelRect:Rectangle;
		public var _btn_close:Button;
		public var _pos_scroll_bag:Position;
//		public var _scroll_bag:ScrollerControllerMatrix;
		
		/** 包裹标签显示序列 **/
		public static const BagLabels:Array=[BagSetData.SET_Equip,BagSetData.SET_Tool,BagSetData.SET_Baosi,BagSetData.SET_Suipian];
		public static const Panels:Array=[Bag_Equip_Panel,Bag_Tool_Panel,Bag_Baosi_Panel,Bag_Suipian_Panel];
//		public var toggle:ToggleController;
		private var btnArray:Array;
		
		public var changeLabel_SN:Signal=new Signal(String);
		
		public var currentLabel:String;
		
		public var labelSwitch:LabelSwitch;
		
		public var _heroModule:HeroModule;
		
		
		
		public function BagWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBagNew);
			this.addChild(_scene);
			
			
			var bgmc:MovieClip=_scene.mc_right;
			_btn_close=new Button(bgmc.btn_close);
//			toggle=new ToggleController(true);
			btnArray=[];
			for(var index:int=0; index<BagLabels.length; index++){
				var button:Button=new Button(bgmc["btn_tag"+(index+1)]);
//				toggle.registerToggle(button,onChangeButton);
				btnArray.push(button);
			}
			
			_pos_scroll_bag=new Position(bgmc.pos_scroll_bag);
			labelSwitch=new LabelSwitch(_pos_scroll_bag,btnArray,Panels);
			panelRect=new Rectangle(0,0,_pos_scroll_bag.rect.width,_pos_scroll_bag.rect.height);
			
			_heroModule=new HeroModule(_scene.mc_left);
			
			
//			_scroll_bag=new ScrollerControllerMatrix(_pos_scroll_bag);
		}
		
		protected override function tweenOpenComplete():void{
			super.tweenOpenComplete();
			_heroModule.initHeroThumb();
		}
		
		/*private function onChangeButton(btn:Button):void{
			var index:int= btnArray.indexOf(btn);
			if(index!=-1){
				if(currentLabel!=BagLabels[index]){
					currentLabel=BagLabels[index];
					changeLabel_SN.dispatch(currentLabel);
				}
			}
		}*/
		
	/*	public function changeToLabel(label:String):void{
			if(label!=currentLabel){
				var index:int=BagLabels.indexOf(label);
				if(index!=-1){
					currentLabel=label;
//					toggle.changeBtnStatus(btnArray[index]);
					changeLabel_SN.dispatch(currentLabel);
				}
			}
			
		}*/
		
		
		public override function destory():void{
//			if(toggle) {toggle.destory(); toggle=null;};
			if(_pos_scroll_bag) {_pos_scroll_bag.destory(); _pos_scroll_bag=null;};
//			if(_scroll_bag) {_scroll_bag.destory(); _scroll_bag=null;};
			if(btnArray){
				for each(var btn:Button in btnArray){
					btn.destory();
				}
				btnArray=null;
			}
			if(labelSwitch){ labelSwitch.destory(); labelSwitch=null;}
			if(_btn_close) {_btn_close.destory();_btn_close=null;}
			if(_heroModule) {_heroModule.destory();_heroModule=null;}
			super.destory();
		}
	}
}