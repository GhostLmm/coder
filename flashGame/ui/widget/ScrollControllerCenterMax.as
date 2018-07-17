package ui.widget
{
	public class ScrollControllerCenterMax extends ScrollControllerMax
	{
		public function ScrollControllerCenterMax(position:Position, align:int=VERTICAL, moveTop:Boolean=false)
		{
			super(position, align, moveTop);
		}
		
		public override function setData($dataArray:Array, resetIndex:Boolean=false, showMovie:Boolean=false, $itemSize:Number=-1, $itemWidth:Number=-1, $itemHeight:Number=-1):void
		{
			super.setData($dataArray,resetIndex,showMovie,$itemSize,$itemWidth,$itemHeight);
			if($dataArray && $dataArray.length>0){
				var sn:int=int(_position.rect[_distance]/_gridView.itemSize);
				if($dataArray.length>sn){
					this.x=_position.rect.x;
					this.y=_position.rect.y;
				}else{
					this[_direction]=_position.rect[_direction]+(_position.rect[_distance]-_gridView.itemSize*$dataArray.length)/2;
					this[_direction_oppo]=_position.rect[_direction_oppo];
				}
			}
		}
	}
}