package ui.choujiang
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.RewardsData;
	import com.ghostlmm.xmldata.Node_choujiang;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.Sprite;
	
	import ui.mc.ItemMc;
	import ui.mc.JiangliMc;
	
	import util.Util;
	
	public class ChoujiangMovie extends Sprite
	{
		private var itemMc:ItemMc;
		private var m_data:Node_choujiang;
		private var jiangliMc:JiangliMc;
		public function ChoujiangMovie(_data:Object)
		{
			super();
			m_data=_data as Node_choujiang;
			initModule();
			registerEvent();
			setShow();
		}
		private function initModule():void
		{
			var data:RewardsData=new RewardsData();
			data.key=m_data.type;
			data.xid=m_data.item_id;
			data.num=1;
			jiangliMc=new JiangliMc();
			jiangliMc.loadData(data);
			jiangliMc.x=-jiangliMc.width/2;
			jiangliMc.y=-jiangliMc.height/2;
			addChild(jiangliMc);
			
			setFontFieldVisible(false);
		}
		private function setFontFieldVisible(_value:Boolean):void
		{
			jiangliMc._fnt_jiangli.visible=_value;
			jiangliMc._fnt_num.visible=_value;
		}
		public function destroy():void
		{
			removeChild(jiangliMc);
			jiangliMc.destory();
			jiangliMc=null;
			m_data=null;
		}
		public function showTextFiled():void
		{
			setFontFieldVisible(true);
		}
		public function showSuipian():void
		{
			var node:Node_equip=XMLDataManager.getEquipById(m_data.item_id);
			var fenjieArray:Array=JSON.parse(node.fenjie) as Array;
			var id:int=fenjieArray[0];
			var num:int=fenjieArray[1];
			var data:RewardsData=new RewardsData();
			data.key=ResourceConst.R_item;
			data.xid=id;
			data.num=num;
			jiangliMc.loadData(data);
		}
		private function registerEvent():void
		{
			
		}
		private function setShow():void
		{
			
		}
		public function set rotatevalue(_value:Number):void
		{
			this.rotation=_value;
		}
		public function get rotatevalue():Number
		{
			return this.rotation;
		}
	}
}