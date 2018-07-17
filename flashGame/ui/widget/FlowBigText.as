package ui.widget
{
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import core.LayerController;

	public class FlowBigText
	{
		public static const ST_Zhandouli:String="zhandouli";
		public static const ST_Money:String="money";
		public static const ST_Cash:String="cash";
		private var mc:MovieClip;
		private var _fnt_zhandouli_change_num:NumFontStatic;
		
		public static const HeightOffset:Number=0.6;
		public static const FlowHeightOffset:Number=0.2;
		
//		private static var instance:FlowBigText=new FlowBigText();
		
		public static function flow(change:int,type:String):void{
//			instance._flow(change,type);
			new FlowBigText(type)._flow(change);
		}
		
		public function FlowBigText(type:String)
		{
//			mc=new zhandouli_change();
			if(type==ST_Zhandouli){
				mc=new zhandouli_change();
			}
			if(type==ST_Money){
				mc=new jinbi_change();
			}
			if(mc==null){
				mc=new zhandouli_change();
			}
			_fnt_zhandouli_change_num=new NumFontStatic(mc.fnt_zhandouli_change_num);
		}
		
		private function _flow(change:int):void{
			if(change>=0){
				_fnt_zhandouli_change_num.text="+"+change;
			}else{
				_fnt_zhandouli_change_num.text=change.toString();
			}
			
			
			mc.alpha=1;
			var targetY:Number;
			if(change>0){
				mc.x=GlobalRef.width/2;
				mc.y=GlobalRef.height*HeightOffset;
				targetY=GlobalRef.height*HeightOffset-GlobalRef.height*FlowHeightOffset;
			}else{
				mc.x=GlobalRef.width/2;
				mc.y=GlobalRef.height*HeightOffset-GlobalRef.height*FlowHeightOffset;
				targetY=GlobalRef.height*HeightOffset;
			}
			
			TweenLite.killTweensOf(mc);
			if(LayerController.instance.floatLayer){
				LayerController.instance.floatLayer.removeChildren();
				LayerController.instance.floatLayer.addChild(mc);
				
				TweenLite.to(mc,0.7,{y:targetY,alpha:0.5,onComplete:flowComplete});
			}
			
		}
		
		private function flowComplete():void{
			if(mc.parent){
				mc.parent.removeChild(mc);
			}
		}
	}
}