package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.gameVO.DengjirankVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.RankoptVO;
	import com.fish.modules.core.gameVO.TuhaorankVO;
	import com.fish.modules.core.gameVO.XiongbarankVO;
	import com.fish.modules.core.gameVO.ZhanlirankVO;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import org.osflash.signals.Signal;
	
	import view.viewData.DengjiData;
	import view.viewData.LianshengData;
	import view.viewData.TuhaoData;
	import view.viewData.XiongbaData;
	
	public class RankModel extends BaseModel
	{
		public function RankModel()
		{
			super();
		}
		public var rankOptVo:RankoptVO;
		protected override function onGameInitComplete():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.add(onVoArrayChange);
			rankOptVo=GameVOManager.getInstance().rankopt;
			rankOptVo.update_SN.add(onRankOptChange);
		}
		public var rankOpt_SN:Signal=new Signal();
		private var levelChongbaiArray:Array=[];
		private var xiongbaChongbaiArray:Array=[];
		private var lianshengChongbaiArray:Array=[];
		private var tuhaoChongbaiArray:Array=[];
		private var tuhaoBishiArray:Array=[];
		private function onRankOptChange():void
		{
			initRankOpt();
			rankOpt_SN.dispatch();
		}
		private function initRankOpt():void
		{
			if(!rankOptVo.hasInit())
			{
				return;
			}
			levelChongbaiArray=JSON.parse(rankOptVo.levelChongbai) as Array;
			xiongbaChongbaiArray=JSON.parse(rankOptVo.leitaiChongbai) as Array;
			lianshengChongbaiArray=JSON.parse(rankOptVo.lianshenChongbai) as Array;
			tuhaoChongbaiArray=JSON.parse(rankOptVo.tuhaoChongbai) as Array;
			tuhaoBishiArray=JSON.parse(rankOptVo.tuhaoBishi) as Array;
		}
		public static const Label_Level:String="levelRank";
		public static const Label_Xiongba:String="xiongbaRank";
		public static const Label_Liansheng:String="lianshengRank";
		public static const Label_Tuhao:String="tuhaoRank";
		public function checkIfAreadyChongbai(_userId:int,_label:String):Boolean
		{
			if(!rankOptVo.hasInit())
			{
				return false;
			}
			var result:Boolean;
			switch(_label)
			{
				case Label_Level:
					result=Boolean(levelChongbaiArray.indexOf(_userId)!=-1);
					break;
				case Label_Liansheng:
					result=Boolean(lianshengChongbaiArray.indexOf(_userId)!=-1);
					break;
				case Label_Xiongba:
					result=Boolean(xiongbaChongbaiArray.indexOf(_userId)!=-1);
					break;
				case Label_Tuhao:
					result=Boolean(tuhaoChongbaiArray.indexOf(_userId)!=-1);
					break;
			}
			return result;
		}
		public function checkIfAreadyBishi(_userId:int):Boolean
		{
			if(!rankOptVo.hasInit())
			{
				return false;
			}
			var result:Boolean=Boolean(-1!=tuhaoBishiArray.indexOf(_userId));
			return result;
		}
		public function checkIfReachMaxRankOptNum():Boolean
		{
			if(getRankOptCount()>=getMaxRankOptCount())
			{
				return true;
			}
			return false; 
		}
		public function getRankOptCount():int
		{
			initRankOpt();
			var result:int=0;
			result+=levelChongbaiArray.length;
			result+=lianshengChongbaiArray.length;
			result+=xiongbaChongbaiArray.length;
			result+=tuhaoChongbaiArray.length;
			result+=tuhaoBishiArray.length;
			return result;
		}
		public function getMaxRankOptCount():int
		{
			var result:int;
			result=XMLDataManager.getConstById("paihangbang_cishu").value;
			return result;
		}
		public override function destory():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.remove(onVoArrayChange);
			if(rankOptVo){
				rankOptVo.update_SN.remove(onRankOptChange);
				rankOptVo=null;
			}
				
			
			super.destory();
		}
		public var VoArrayChane:Signal=new Signal(Class);
		private function onVoArrayChange(cls:Class,array:Array):void
		{
			switch(cls)
			{
				case DengjirankVO:
				case TuhaorankVO:
				case ZhanlirankVO:
				case XiongbarankVO:
					VoArrayChane.dispatch(cls);
			}	 
			
		}
		/**
		 * 获得等级排行数据
		 */
		public function get dengjiDataArray():Array
		{
			var result:Array=[];
			var voArray:Array=GameVOManager.getInstance().dengjiranks;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var vo:DengjirankVO=voArray[index] as DengjirankVO;
				var viewData:DengjiData=new DengjiData();
				viewData.setData(vo);
				result.push(viewData);
			}
			result.sortOn("rank",Array.NUMERIC);
			return result;
		}
		/**
		 * 获得土豪排行数据
		 */
		public function get tuhaoDataArray():Array
		{
			var result:Array=[];
			var voArray:Array=GameVOManager.getInstance().tuhaoranks;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var vo:TuhaorankVO=voArray[index] as TuhaorankVO;
				var viewData:TuhaoData=new TuhaoData();
				viewData.setData(vo);
				result.push(viewData);
			}
			result.sortOn("rank",Array.NUMERIC);
			return result;
		}
		/**
		 * 获得连胜排行数据
		 */
		public function get lianshengDataArray():Array
		{
			var result:Array=[];
			var voArray:Array=GameVOManager.getInstance().zhanliranks;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var vo:ZhanlirankVO=voArray[index] as ZhanlirankVO;
				var viewData:LianshengData=new LianshengData();
				viewData.setData(vo);
				result.push(viewData);
			}
			result.sortOn("rank",Array.NUMERIC);
			return result;
		}
		/**
		 * 获得雄霸排行数据
		 */
		public function get xiongbaDataArray():Array
		{
			var result:Array=[];
			var voArray:Array=GameVOManager.getInstance().xiongbaranks;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var vo:XiongbarankVO=voArray[index] as XiongbarankVO;
				var viewData:XiongbaData=new XiongbaData();
				viewData.setData(vo);
				result.push(viewData);
			}
			result.sort(xiongbaCompare);
			return result;
		}
		private function xiongbaCompare(A:XiongbaData,B:XiongbaData):int
		{
			var weightA:int=0;
			var weightB:int=0;
			if(A.rank<B.rank)
			{
				weightA+=100;
			}
			if(B.rank<A.rank)
			{
				weightB+=100;
			}
			if(A.leitaiRank==0)
			{
				weightB+=10000;
			}
			if(B.leitaiRank==0)
			{
				weightA+=10000;
			}
			return weightB-weightA;
		}
		public function chongbai(_userId:int,_label:String):void
		{
			var reqMsg:String;
			switch(_label)
			{
				case Label_Level:
					reqMsg=C2SEmitter.REQ_ChongbaiLevelHonorHandler;
					break;
				case Label_Liansheng:
					reqMsg=C2SEmitter.REQ_ChongbaiLianshengHonorHandler;
					break;
				case Label_Tuhao:
					reqMsg=C2SEmitter.REQ_ChongbaiChongzhiHonorHandler;
					break;
				case Label_Xiongba:
					reqMsg=C2SEmitter.REQ_ChongbaiLeitaiHonorHandler;
					break;
			}
			C2SEmitter.RankList_chongbai(_userId,reqMsg);
		}
		public function bishi(_userId:int,_label:String):void
		{
			var reqMsg:String;
			switch(_label)
			{
				case Label_Tuhao:
					reqMsg=C2SEmitter.REQ_BishiChonzhiHonorHandler;
					break;
			}
			C2SEmitter.Ranklist_bishi(_userId,reqMsg);
		}
		/**
		 * 显示自己在排行榜中的位置
		 */
		public function rank_xianshi(_userId:int,_label:String):void
		{
			C2SEmitter.PaimingOpt();
		}
		/**
		 * 隐藏自己在排行榜中的显示
		 */
		public function rank_yincang(_userId:int,_label:String):void
		{
			C2SEmitter.PaimingOpt();
		}
		public static function getRankOptRewardMoney():int
		{
			return XMLDataManager.getConstById("paihangbang_money").value;
		}
	}
}