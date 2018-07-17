package ui.leitai
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import snake.viewdata.leitai.ViewData_LeitaiPerson;

	public class Bit_PlayerInfo_Leitai
	{
		private var _x:Number;
		private var _y:Number;
		
		
		private var leitaiRank:int;
		private var fightPoint:int;
		
		
		private var _bit:BitmapData;
		public var _bound:Rectangle;
		public function Bit_PlayerInfo_Leitai()
		{
		}
		
		public function init(leitaiInfo:Object):void{
			_x=leitaiInfo.x;
			_y=leitaiInfo.y;
		}
		
		public function get bitdata():BitmapData{
			return _bit;
		}
		public function destory():void{
			if(_bit){
				_bit.dispose();
				_bit=null;
			}
		}
		
		public function setData(leitaiView:ViewData_LeitaiPerson):void{
			
			if(leitaiRank!=leitaiView.leitaiRank || fightPoint!=leitaiView.fightPoint){
				var mc:leitaiInfo=new leitaiInfo();
				if(_bound==null){
					_bound=mc.getBounds(mc);
				}
				if(_bit==null){
					_bit=new BitmapData(_bound.width,_bound.height,true,0);
				}else{
					_bit.fillRect(_bit.rect,0);
				}
				mc.fnt_paiming_num.text=leitaiView.leitaiRank.toString();
				mc.fnt_zhanli_num.text=leitaiView.fightPoint.toString();
				var mat:Matrix=new Matrix();
				mat.translate(-_bound.x,-_bound.y);
				_bit.draw(mc,mat,null,null,null,true);
				
				leitaiRank=leitaiView.leitaiRank;
				fightPoint=leitaiView.fightPoint;
			}
		}
	}
}