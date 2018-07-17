package snake
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import core.LayerController;
	
	import ui.widget.MyRichText;

	public class NpcTalkInfoBar
	{
		
		private static  var qipao:McLiaotianQipao;
		private static  var rect:Rectangle;
		private static var imagText:MyRichText;
		
		private var _bitdata:BitmapData;
		
		private static var mt:Matrix=new Matrix();
		
		public var offset:Point;
		public function NpcTalkInfoBar()
		{
		}
		
		public function destory():void{
			/*if(qipao){
				qipao.removeEventListener(Event.ENTER_FRAME,onFrame);
				if(qipao.parent){
					qipao.parent.removeChild(qipao);
				}
			}*/
			/*if(imagText){
				imagText.destory();
				imagText=null;
			}*/
			if(_bitdata){
				_bitdata.dispose();
				_bitdata=null;
			}
		}
		
		public function get bitdata():BitmapData{
			return _bitdata;
		}
		
		
		
		public function setTalk(talk:String):void{
			if(qipao==null){
				qipao=new McLiaotianQipao();
				rect=qipao.getBounds(qipao);
				imagText=new MyRichText(qipao.fnt_talk);
				mt.translate(-rect.x,-rect.y);
			}
			GlobalRef.root.addChild(qipao);
			imagText.setText(talk);
//			imagText.forceRender();
//			var storeHeight:Number=qipao.fnt_talk.height;
			qipao.fnt_talk.height=qipao.fnt_talk.textHeight+4;
//			var lastRect:Rectangle=qipao.fnt_talk.getCharBoundaries(talk.length-1);
			

			offset=new Point();
			
			
			
			
			offset.x=-rect.x;
			offset.y=-rect.y;
			
			if(_bitdata==null){
				_bitdata=new BitmapData(rect.width,rect.height,true,0);
			}
			tick=0;
			qipao.width;
			
//			LayerController.instance.worldLayer.effectLayer.addChild(qipao);
			
//			LayerController.instance.worldLayer.effectLayer.removeChild(qipado);
			qipao.addEventListener(Event.ENTER_FRAME,onFrame);
//			TweenLite.delayedCall(0.1,_bitdata.draw,[qipao,mt]);
//			_bitdata.draw(qipao,mt);
			
			
			qipao.x=GlobalRef.width/2;
			qipao.y=GlobalRef.height/2;
			_bitdata.fillRect(_bitdata.rect,0);
			_bitdata.draw(qipao,mt);
			GlobalRef.root.removeChild(qipao);
//			qipao.visible=false;
		}
		private var tick:int=0;
		private function onFrame(evt:Event):void{
			
			/*tick++;
			if(tick>=2){
				qipao.removeEventListener(Event.ENTER_FRAME,onFrame);
				_bitdata.draw(qipao,mt);
				if(qipao.parent){
					qipao.parent.removeChild(qipao);
				}
			}*/
		}
		
	}
}