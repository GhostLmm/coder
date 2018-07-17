package ui.map
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.tempData.FubenMapData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.tool.ListenerAddProxy;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import core.LayerController;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	
	import view.CommonControlFun;

	public class MapScene extends Sprite
	{
		
		private var mapModel:MapModel;
		public var curMap:MapPage;
		private var _btnBack:Button;
		private var _pos_section:Position;
		private var _src_section:ScrollControllerMax;
		
		private var _btn_chaonengli:Button;
		private var _mc_chaonengli:MovieClip;
		
		
		private var _bigFunbenNamesDic:Dictionary=new Dictionary();
		private var _bigFunbenLockDic:Dictionary=new Dictionary();
		
		protected var _listenerProxy:ListenerAddProxy;
		protected function addViewListener(target:Object,type:String,listener:Function,useCapture:Boolean=false,priority:int=0,useWeek:Boolean=false):void
		{
			_listenerProxy.addListener(target,type,listener,useCapture,priority,useCapture);
		}
		public function MapScene()
		{
			_listenerProxy=new ListenerAddProxy();
			initModel();
		}
		
		private function initModel():void{
	
			mapModel=Context.getInjectInstance(MapModel);
//			mapModel.resetFubenGuanmingDeatil();
			var mc:MovieClip=new BtnHuijia();
			mc.y=GlobalRef.height-mc.height;
			addChild(mc);
			_btnBack=new Button(mc);			
			_mc_chaonengli=new BtnStar();
			_mc_chaonengli.x=GlobalRef.width-_mc_chaonengli.width;
			addChild(_mc_chaonengli);
			_btn_chaonengli=new Button(_mc_chaonengli);
			Music.play(Music.MC_Fuben);
			registerEvt();
		}
		
		private function registerEvt():void{
			addViewListener(_btnBack,TqtEvent.BUTTON_CLICK,onClickBack);
			addViewListener(_btn_chaonengli,TqtEvent.BUTTON_CLICK,onClickChaonengli);
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_FubenNameGetHandler){
				if(code>0){
//					_bigFunbenLockDic[c2s.fuben.mapId]=false;
					var obj:Object=JSON.parse(GameVOManager.getInstance().funbenguanming.fubenNameMap);
					_bigFunbenNamesDic[c2s.fuben.mapId]=obj;
					if(curMap && curMap.mapData.node.id==c2s.fuben.mapId){
						curMap.loadFunbenNames(obj);
					}
				}
			}
		}
		
		private function onClickChaonengli(evt:Event):void
		{
			CommonControlFun.openChaonengliWindow();
		}
		
		private function onClickBack(evt:Event):void{
			LayerController.instance.sceneLayer.remove();
			Music.play(Music.MainMusic);
		}
		
		private var initMoudleFlag:Boolean=false;
		private function initMoudle():void{
			if(initMoudleFlag) return ;
			initMoudleFlag=true;
			var sections:Array=mapModel.getMapDataArrayForShow();
			var maxWidht:Number=GlobalRef.width*2/3;
			var tempItem:McMapImage=new McMapImage();
			var shape:MovieClip=new MovieClip();
			var sw:Number=tempItem.width*sections.length;
			sw=Math.min(sw,maxWidht);
			shape.graphics.drawRect(0,0,sw,tempItem.height);
			shape.x=GlobalRef.width-sw;
			shape.y=GlobalRef.height-tempItem.height;
			addChild(shape);
			_pos_section=new Position(shape);
			_src_section=new ScrollControllerMax(_pos_section,ScrollControllerMax.HORIZONTAL);
			_src_section.initClass(SectionItem);
		}
		
		public function initData(arg:Object):void{
			
			//  指引 副本
			var needGuid:Boolean=false;
			var guideFuben:int;
			if(arg!=null && arg.hasOwnProperty("guideFuben") && arg.guideFuben!=-1 ){
				needGuid=true;
				guideFuben=arg.guideFuben;
			}
			
			
			
			initMoudle();
			
			var sections:Array=mapModel.getMapDataArrayForShow();
			_src_section.setData(sections);
			
			if(needGuid){
				showGuideMap(guideFuben,sections);
			}else{
				if(mapModel.showFubenFirst==-1){
					showDefaultMap(sections);
				}else{
					showFirstMap(mapModel.showFubenFirst,sections);
				}
			}
			mapModel.showFubenFirst=-1;
			
		}
		
		private function showGuideMap(guideFuben:int,sections:Array):void{
			var sectionId:int;
			sectionId=XMLDataManager.getFubenById(guideFuben).fuben_map-1;
			_src_section.setSelectIndexOrData(sections[sectionId],true);
			
			selectMap(sections[sectionId],guideFuben);
		}
		private function showFirstMap(firstFuben:int,sections:Array):void{
			var sectionId:int;
			sectionId=XMLDataManager.getFubenById(firstFuben).fuben_map-1;
			_src_section.setSelectIndexOrData(sections[sectionId],true);
			
			selectMap(sections[sectionId]);
		}
		
		private function showDefaultMap(sections:Array):void{
//			var defaultSection:int=0;
//			for ( var index:int=0; index<sections.length; index++){
//				if(!mapModel.isMapActive(sections[index])){
//					defaultSection=index-1;
//					break;
//				}
//			}
			
			var defaultSection:int=mapModel.getDefaultSection(sections);
			
			_src_section.setSelectIndexOrData(sections[defaultSection],true);
			
			selectMap(sections[defaultSection]);
		}
		
		public function onMapChoose(_mapData:FubenMapData):void
		{
			selectMap(_mapData);
		}
		
		private function getBigFubenNames(mapId:int):Object{
			var obj:Object = _bigFunbenNamesDic[mapId];
			if(obj==null){
				
				if(!_bigFunbenLockDic[mapId]){
					C2SEmitter.getBigFubenGuanming(mapId);
					_bigFunbenLockDic[mapId]=true;
				}
			}
			return obj;
		}
		
		
		
		private function selectMap($mapData:FubenMapData,guideFuben:int=-1):void{
			
			if(curMap){
				if(curMap.mapData==$mapData){
					curMap.refreshData(mapModel.getFubenBoxDataOnMap($mapData),guideFuben);
					curMap.loadFunbenNames(getBigFubenNames($mapData.node.id));
					return ;
				}
			}
			if(curMap){
				curMap.destory();
			}
			curMap=new MapPage();
			curMap.init($mapData,mapModel.getFubenBoxDataOnMap($mapData),guideFuben);
			curMap.loadFunbenNames(getBigFubenNames($mapData.node.id));
			
			addChildAt(curMap.display,0);
		}
		
		public function destory():void{
			if(_listenerProxy){
				_listenerProxy.clear();
			}
			
			if(_btnBack){_btnBack.destory(); _btnBack=null;}
			if(_btn_chaonengli){_btn_chaonengli.destory(); _btn_chaonengli=null;}
			if(_pos_section){_pos_section.destory(); _pos_section=null;}
			if(_src_section){_src_section.destory(); _src_section=null;}
			
			if(_mc_chaonengli)
			{
				if(_mc_chaonengli.parent) _mc_chaonengli.parent.removeChild(_mc_chaonengli);
				_mc_chaonengli=null;
			}
			
			if(curMap){
				curMap.destory();
				curMap=null;
			}
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			removeChildren();
		}
		
		
	}
}