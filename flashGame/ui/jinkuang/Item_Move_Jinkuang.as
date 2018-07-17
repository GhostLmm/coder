package ui.jinkuang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.JinkuangModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_jinkuangrukou;
	
	import flash.display.MovieClip;
	import flash.utils.Dictionary;
	
	import ui.widget.Position;
	
	import view.Base_Item;
	
	public class Item_Move_Jinkuang extends Base_Item
	{
		public static const MaxNum:int=34;
		public var _posDic:Dictionary;
		
		private var jinkuangModel:JinkuangModel;
		
		public function Item_Move_Jinkuang($mc:MovieClip=null)
		{
			super($mc);
		}
		protected override function initModule():void
		{
			_posDic=new Dictionary();
			var index:int;
			for(index=1;index<=MaxNum;index++)
			{
				_posDic[index]=new Position(itemMaterial["pos_"+index]);
			}
			jinkuangModel=Context.getInjectInstance(JinkuangModel);
		}
		private function destroyMc():void
		{
			var index:int;
			for(index=1;index<=MaxNum;index++)
			{
				(_posDic[index] as Position).destory();
				_posDic[index]=null;
				delete _posDic[index];				
			}
			_posDic=null;
		}
		protected override function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			jinkuangModel.XitongkuangChangeSN.add(setJinkuangShow);
		}
		private function setJinkuangShow():void
		{
			var xmllist:Array=jinkuangModel.getJinkuangDataArray(rukouData.type);
			var index:int;
			for(index=1;index<=xmllist.length&&index<=MaxNum;index++)
			{
				var item:Item_JinkuangWindow=new Item_JinkuangWindow();
				item.loadData(xmllist[index-1]);
				(_posDic[index] as Position).fillWithObject(item);
			}
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_code<=0)
			{
				return;
			}
			else
			{
				
				switch(_msgType)
				{
					case C2SEmitter.REQ_GetTargetKuangInfoHandler:
						JinkuangModel.dealWithJinkuangInfo(_code);
						break;
					case C2SEmitter.REQ_GetServerKuangInfoHandler:
					case C2SEmitter.REQ_RetreatKuangHandler:
					case C2SEmitter.REQ_GetServerKuangInfoHandler:
					case C2SEmitter.REQ_KuangQuganRewardHandler:
					case C2SEmitter.REQ_KuangLveduoRewardHandler:
					case C2SEmitter.REQ_GainKuangHandler:
					case C2SEmitter.REQ_FushuKuangHandler:
						setJinkuangShow();
						break;
				}
			}
		}
		protected override function setShow():void
		{
			C2SEmitter.requestServerKuang(rukouData.type);
		}
		private function get rukouData():Node_jinkuangrukou
		{
			return m_data as Node_jinkuangrukou;
		}
		public override function destory():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			jinkuangModel.XitongkuangChangeSN.remove(setJinkuangShow);
			jinkuangModel=null;
			destroyMc();
			super.destory();
		}
		protected override function get itemClassName():Class
		{
			return ItemScrollJinkuang;
		}
		private function get itemMaterial():ItemScrollJinkuang
		{
			return m_mc as ItemScrollJinkuang;
		}
	}
}