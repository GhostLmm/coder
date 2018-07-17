package snake.zhucheng
{
	import flash.display.Sprite;

	public class ZhuchengBackground
	{
		private var layer2:ZhuchengLayer;
		private var layer3:ZhuchengLayer;
		public var container:Sprite;
		
		public var oldCameraX:Number=0;
		public var oldCameraY:Number=0;
		
		
		public var layers:Array;
		
		public function ZhuchengBackground()
		{
		}
		
		public function init($container:Sprite=null):void{
			container=$container;
			if(container==null){
				container=new Sprite();
			}
			
			layer3=new ZhuchengLayer(new mc_bg_layer3_star(),0.2);
			layer2=new ZhuchengLayer(new mc_bg_layer2(),0.8);
			layers=[];
			container.addChild(layer3.mc);
			container.addChild(layer2.mc);
		}
		
		public function addLayer(layer:ZhuchengLayer):void{
			layers.push(layer);
			container.addChild(layer.mc);
		}
		public function removeLayer(layer:ZhuchengLayer):void{
			var index:int=layers.indexOf(layer);
			if(index!=-1){
				layers.splice(index,1);
				if(container.contains(layer.mc)){
					container.removeChild(layer.mc);
				}
			}
		}
		
		public function destory():void{
			if(layer2) {layer2.destory();layer2=null;}
			if(layer3) {layer3.destory();layer3=null;}
			if(layers){
				for each(var layer:ZhuchengLayer in layers){
					layer.destory();
				}
				layers=null;
			}
		}
		
		public function render(cameraX:Number,cameraY:Number):void{
			var offsetX:Number=cameraX-oldCameraX;
			var offsetY:Number=cameraY-oldCameraY;
			if(offsetX!=0 || offsetY!=0){
				layer2.render(offsetX,offsetY);
				layer3.render(offsetX,offsetY);
				for each(var layer:ZhuchengLayer in layers){
					layer.render(offsetX,offsetY);
				}
			}
			oldCameraX=cameraX;
			oldCameraY=cameraY;
		}
	}
}