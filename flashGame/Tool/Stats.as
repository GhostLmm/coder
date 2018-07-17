/**
 * stats.as
 * https://github.com/mrdoob/Hi-ReS-Stats
 * 
 * Released under MIT license:
 * http://www.opensource.org/licenses/mit-license.php
 *
 * How to use:
 * 
 *	addChild( new Stats() );
 *
 **/

package Tool {
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.system.System;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.utils.getTimer;
	
	import citrus.physics.nape.Nape;

	public class Stats extends Sprite {	

		protected const WIDTH : uint = 90;
		protected const HEIGHT : uint = 110;

		protected var xml : XML;

		protected var text : TextField;
		protected var style : StyleSheet;

		protected var timer : uint;
		protected var fps : uint;
		protected var ms : uint;
		protected var ms_prev : uint;
		protected var mem : Number;
		protected var mem_max : Number;

		protected var graph : BitmapData;
		protected var rectangle : Rectangle;

		protected var fps_graph : uint;
		protected var mem_graph : uint;
		protected var mem_max_graph : uint;

		protected var colors : Colors = new Colors();

		private var m_runTimeTotal:int;
		private var m_renderTimeTotal:int;
		private var m_starlingCostTimeTotal:int;
		private var m_frameTimeTest:CalculateFrameTime;
		/**
		 * <b>Stats</b> FPS, MS and MEM, all in one.
		 */
		public function Stats() : void {
			
			alpha=0.5;
			
			mem_max = 0;

			xml = <xml><fps>FPS:</fps><ms>MS:</ms><mem>MEM:</mem><memMax>MAX:</memMax><time>TIME:</time></xml>;
		
			style = new StyleSheet();
			style.setStyle('xml', {fontSize:'9px', fontFamily:'_sans', leading:'-2px'});
			style.setStyle('fps', {color: hex2css(colors.fps)});
			style.setStyle('ms', {color: hex2css(colors.ms)});
			style.setStyle('mem', {color: hex2css(colors.mem)});
			style.setStyle('memMax', {color: hex2css(colors.mem)});
			style.setStyle('time', {color: hex2css(colors.mem)});
			
			text = new TextField();
			text.width = WIDTH;
			text.height = 60;
			text.styleSheet = style;
			text.condenseWhite = true;
			text.selectable = false;
			text.mouseEnabled = false;
			
			rectangle = new Rectangle(WIDTH - 1, 0, 1, HEIGHT - 50);			
			
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy, false, 0, true);
			
		}

		private function init(e : Event) : void {
			
			m_frameTimeTest=new CalculateFrameTime(stage);
			graphics.beginFill(colors.bg);
			graphics.drawRect(0, 0, WIDTH, HEIGHT);
			graphics.endFill();

			addChild(text);
			
			graph = new BitmapData(WIDTH, HEIGHT - 60, false, colors.bg);
			graphics.beginBitmapFill(graph, new Matrix(1, 0, 0, 1, 0, 50));
			graphics.drawRect(0, 50, WIDTH, HEIGHT - 50);
			
			addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(Event.ENTER_FRAME, update);
			
		}

		private function destroy(e : Event) : void {
			
			graphics.clear();
			
			while(numChildren > 0)
				removeChildAt(0);			
			
			graph.dispose();
			
			removeEventListener(MouseEvent.CLICK, onClick);
			removeEventListener(Event.ENTER_FRAME, update);
			
		}

		private function update(e : Event) : void {
			
			timer = getTimer();
			
			if( timer - 1000 > ms_prev ) {
				
				ms_prev = timer;
				mem = Number((System.totalMemory * 0.000000954).toFixed(3));
				mem_max = mem_max > mem ? mem_max : mem;
				
				fps_graph = Math.min(graph.height, ( fps / stage.frameRate ) * graph.height);
				mem_graph = Math.min(graph.height, Math.sqrt(Math.sqrt(mem * 5000))) - 2;
				mem_max_graph = Math.min(graph.height, Math.sqrt(Math.sqrt(mem_max * 5000))) - 2;
				
				graph.scroll(-1, 0);
				
				graph.fillRect(rectangle, colors.bg);
				graph.setPixel(graph.width - 1, graph.height - fps_graph, colors.fps);
				graph.setPixel(graph.width - 1, graph.height - ( ( timer - ms ) >> 1 ), colors.ms);
				graph.setPixel(graph.width - 1, graph.height - mem_graph, colors.mem);
				graph.setPixel(graph.width - 1, graph.height - mem_max_graph, colors.memmax);
				
				xml.fps = "FPS: " + fps + " / " + stage.frameRate; 
//				if(fps>=stage.frameRate)
//				{
//					stage.frameRate+=15;
//				}
				xml.time="Run:"+int(m_runTimeTotal/fps)+" / Render:"+int(m_frameTimeTest.renderTime);
//				xml.memMax = "MAX: "
//				trace("/n/n/n/n/n/n/n帧率："+fps);
				xml.mem = "MEM: " + mem;
//				xml.memMax = "MAX: " + mem_max;	
				xml.memMax = "Starling: "+int(m_starlingCostTimeTotal/fps);
				
				fps = 0;
				m_runTimeTotal=0;
				m_renderTimeTotal=0;
				m_starlingCostTimeTotal=0;
			}

			m_runTimeTotal+=m_frameTimeTest.runTime;
			m_renderTimeTotal+=m_frameTimeTest.renderTime;
			m_starlingCostTimeTotal+=Nape.costTime;
			fps++;
			
			xml.ms = "MS: " + (timer - ms);
//			trace("每帧间隔时间："+(timer - ms)+"ms");
			ms = timer;
			
			text.htmlText = xml;
		}

		private function onClick(e : MouseEvent) : void {
			
			mouseY / height > .5 ? stage.frameRate-- : stage.frameRate++;
			xml.fps = "FPS: " + fps + " / " + stage.frameRate;  
			text.htmlText = xml;
			
		}

		// .. Utils

		private function hex2css( color : int ) : String {
			
			return "#" + color.toString(16);
			
		}
		
	}
	
}
import flash.display.Stage;
import flash.events.Event;
import flash.utils.getTimer;


class Colors {

	public var bg : uint = 0x000033;
	public var fps : uint = 0xffff00;
	public var ms : uint = 0x00ff00;
	public var mem : uint = 0x00ffff;
	public var memmax : uint = 0xff0070;
	
}
class CalculateFrameTime
{
	//		private var m_stage:Stage;
	private var time:int;
	private var m_stage:Stage;
	private var m_renderTime:int;
	private var m_runTime:int;
	public var starlingRunTime:int;
	public function get runTime():int
	{
		return m_runTime;
	}
	public function get renderTime():int
	{
		return m_renderTime;
	}
	public function CalculateFrameTime(stage:Stage)
	{
		m_stage=stage;
		stage.addEventListener(Event.ENTER_FRAME,frameStart,false,int.MAX_VALUE);
		stage.addEventListener(Event.RENDER,onRenderStart,false,int.MIN_VALUE);
	}
	private function frameStart(evt:Event):void
	{
		var lastTime:int=time;
		
		time=getTimer();
		m_renderTime=time-lastTime;
//		trace("flash渲染执行时间："+m_renderTime+"ms");
		m_stage.invalidate();
		
	}
	private function onRenderStart(evt:Event):void
	{
		var lastTime:int=time;
		time=getTimer();
		m_runTime=time-lastTime;
//		trace("客户代码运行时间："+m_runTime+"ms");
	}
}