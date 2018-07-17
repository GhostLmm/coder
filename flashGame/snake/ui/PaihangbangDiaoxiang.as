package snake.ui
{
	import com.fish.modules.core.gameVO.PaihangbangpersionVO;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import snake.GameUtil;
	import snake.PlayerInfoBar;
	import snake.PlayerThumb;

	public class PaihangbangDiaoxiang
	{
		private var _bitdata:BitmapData;
		public var _bound:Rectangle;
		public var playerInfo:PlayerInfoBar;
		public var active:Boolean=false;
		public var x:Number;
		public var y:Number;
		public function get bitdata():BitmapData{
			return _bitdata;
		}
		
		public function PaihangbangDiaoxiang()
		{
		}
		
		public function loadPersionData(viewData:PaihangbangpersionVO,$offsetX:Number,$offestY:Number):void{
			/*x=$offsetX;
			y=$offestY;
			if(viewData==null){
				active=false;
				return ;
			}
			try{
				active=true;
				var appearance:Array=JSON.parse(viewData.userMovieFrame) as Array;
				var color:Array=GameUtil.turnArryStringToUint(viewData.userColors) as Array;
				var thumb:PlayerThumb=new PlayerThumb();
				thumb.initModule();
				thumb.loadAppearance(appearance,color,XMLDataManager.getGunById(viewData.userGunId).gun_magType,true);
				thumb.changToStatic(1,-Math.PI*1/4,1.3);
				var container:Sprite=new Sprite();
				container.addChild(thumb.display);
				if(_bitdata){
					_bitdata.dispose();
				}
				
				_bound=container.getBounds(container);
				_bitdata=new BitmapData(_bound.width,_bound.height,true,0);
				var mt:Matrix=new Matrix();
				mt.translate(-_bound.x,-_bound.y);
				_bitdata.draw(container,mt,null,null,null,true);
				thumb.destory();
				if(playerInfo){
					playerInfo.destory();
				}
				playerInfo=new PlayerInfoBar();
				playerInfo.setInfo(viewData.userLevel,viewData.userName,0);
			}catch(e:Error){
				active=false;
			}*/
			
		}
		
		public function destory():void{
			if(_bitdata){
				_bitdata.dispose();
				_bitdata=null;
			}
		}
	}
}