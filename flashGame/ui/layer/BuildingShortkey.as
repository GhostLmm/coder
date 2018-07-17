package ui.layer
{
	import com.fish.modules.core.models.GuideModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_shortkey;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import snake.GameManager;
	
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	
	import util.SwitchManager;
	
	import view.Base_Mc;
	
	public class BuildingShortkey extends Base_Mc
	{
		private var _pos_jianzhu:Position;
		private var _scr_jianzhu:ScrollControllerMax;
		
		private var __height:Number;
		public function BuildingShortkey($mc:Object=null)
		{
			super($mc);
		}
		
		protected override function get mcClassName():Class{
			return McJianzhu;
		}
		
		public override function destory():void{
			if(_pos_jianzhu) {_pos_jianzhu.destory(); _pos_jianzhu=null;}
			if(_scr_jianzhu) {_scr_jianzhu.destory(); _scr_jianzhu=null;}
			super.destory();
		}
		
		protected override function initModule():void{
			__height=m_mc.height;
			
			_pos_jianzhu=new Position(m_mc.pos_jianzhu);
			_scr_jianzhu=new ScrollControllerMax(_pos_jianzhu);
			
			_scr_jianzhu.initClass(Item_ShortKey);
		}
		
		public function getHeight():Number{
			return __height;
		}
		
		private function setBuildingKey():void{
			var array:Array=[];
			
			if(GameManager.manager.mapInfo.hasOwnProperty("pos_building")){
				var buildObjs:Object=GameManager.manager.mapInfo.pos_building;
				for each(var node:Node_shortkey in XMLDataManager.Node_shortkeyArray){
					var data:ShortKeyData=new ShortKeyData();
					var obj:Object=buildObjs[node.building_key];
					data.key=node.type;
					data.icon=node.icon;
					data.node=node;
					if(obj){
						data.buildingX=obj.x+obj.width/2;
					}
					
					if("qiyuan"==data.key){
						
					}
					
					
					data.name=node.name;
					
					if(!SwitchManager.getInstance().Switch_Paihangbang && data.key=="paihang"){
						continue;
					}
					
					array.push(data);
				}
			}
			var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			if(!guideModel.isComplete){
				array.sort(compareShortkeyOnGuide);
			}
			_scr_jianzhu.setData(array);
		}
		
		public function initBuildKey():void{
			
			setBuildingKey();
		}
		
		private function getShortKeyValue(data:ShortKeyData):int{
			if(data.key=="qiyuan"){
				return -300;
			}
			
			if(data.key=="dig"){
				return -200;
			}
			if(data.key=="fuben"){
				return -100;
			}
			return 0;
		}
		
		public function compareShortkeyOnGuide(A:ShortKeyData,B:ShortKeyData):int{
			var va:int=A.node.id;
			var vb:int=B.node.id;
			va+=getShortKeyValue(A);
			vb+=getShortKeyValue(B);
			return va-vb;
		}
		
		
		public function getItemByKey(key:String):Item_ShortKey{
			if(_scr_jianzhu.dataArray){
				for(var index:int=0; index<_scr_jianzhu.dataArray.length; index++){
					if( (_scr_jianzhu.dataArray[index] as ShortKeyData).key==key ){
						return _scr_jianzhu.getRealyItemByIndex(index) as Item_ShortKey;
					}
				}
			}
			return null;
		}
		
	}
}