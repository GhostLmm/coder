package com.fish.modules.core.models
{
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.UserVO;
	import com.ghostlmm.xmldata.Node_vip;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class VipModel extends BaseModel
	{
		public static const TP_viptask:String="viptask";
		public static const TP_qiyuan:String="qiyuan";
		public static const TP_saodang:String="saodang";
		public static const TP_buymoney:String="buymoney";
		public static const TP_qianghuashi:String="qianghuashi";
		public static const TP_ronglianzhi:String="ronglianzhi";
		public static const TP_rongyuzhi:String="rongyuzhi";
		public static const TP_guangbo:String="guangbo";
		
		
		/** 是否可以进行vip任务 **/
		public var couldVipTask:Boolean;
		/** 祈愿缩短  **/
		public var couldQiyuanShuduan:Boolean;
		public var qiyuanTime:int;
		
		/** 是否副本-多次挑战,不再有冷却时间**/
		public var couldFubenNoTime:Boolean;
		
		/** 是否购买金币数量增加  **/
		public var couldBuyMoneyAdd:Boolean;
		public var buyMoneyAddNum:Number;
		
		/**是否宝箱掉落增加强化石概率 **/
		public var couldAddDropBoxLV:Boolean;
		public var dropBoxLv:Number;
		
		/**是否提高熔炼装备得到的熔炼值 **/
		public var couldAddRonglian:Boolean;
		public var ronglianLv:Number;
		
		/** 是否擂台增加荣誉  **/
		public var couldAddRongyuInLeitai:Boolean;
		public var rongyuLeitaiLv:Number;
		
		/** 是否全服广播  **/
		public var couldGuangbo:Boolean;
		
		/** 购买金币次数增加  **/
		public var addCount_buyMoney:int;
		
		/** 挖矿加速次数增加 **/
		public var addCount_wakuangJiashu:int;
		
		/** 购买体力次数增加 **/
		public var addCount_buyTili:int;
		
		
		public var icon:String;
		
		private var userVo:UserVO;
		
		public var vipLevel:int;
		
		public var hasVip:Boolean;
		
		public var curNode:Node_vip;
		
		public function VipModel()
		{
			super();
		}
		
		/*public function getNeedExpToNextLevel():int{
			var e1:int=0;
			if(vipLevel>0){
				e1=XMLDataManager.getVipById(vipLevel).cash_limit;
			}
			var e2:int=0;
			if(XMLDataManager.getVipById(vipLevel+1)){
				e2=XMLDataManager.getVipById(vipLevel+1).cash_limit;
			}else{
				return 1;
			}
			return e2-e1;
		}*/
		
		public function get vipExp():int{
			return userVo.vipExp;
		}
		
		public function getMaxLevel():int{
//			return XMLDataManager.getVipById(vipLevel+1)==null;
			return (XMLDataManager.Node_vipArray[XMLDataManager.Node_vipArray.length-1] as Node_vip).id;
		}
		
		protected override function onGameInitComplete():void
		{
			userVo=GameVOManager.getInstance().user;
			userVo.changAttr_SN.add(onAttrChange);
			setVipLevel();
		}
		private function setTagAndValue(tag:String,value:Number):void{
			switch(tag){
				case TP_buymoney:
					couldBuyMoneyAdd=true;
					buyMoneyAddNum=value;
					break;
				case TP_guangbo:
					couldGuangbo=true;
					break;
				case TP_qianghuashi:
					couldAddDropBoxLV=true;
					dropBoxLv=value;
					break;
				case TP_qiyuan:
					couldQiyuanShuduan=true;
					qiyuanTime=value;
					break;
				case TP_ronglianzhi:
					couldAddRonglian=true;
					ronglianLv=value;
					break;
				case TP_rongyuzhi:
					couldAddRongyuInLeitai=true;
					rongyuLeitaiLv=value;
					break;
				case TP_saodang:
					couldFubenNoTime=true;
					break;
				case TP_viptask:
					couldVipTask=true;
					break;
			}
		}
		
		private function setDefaultValue():void{
			/** 是否可以进行vip任务 **/
			couldVipTask=false;
			/** 祈愿缩短  **/
			couldQiyuanShuduan=false;
			qiyuanTime=0;
			/** 是否副本-多次挑战,不再有冷却时间**/
			couldFubenNoTime=false;
			/** 是否购买金币数量增加  **/
			couldBuyMoneyAdd=false;
			buyMoneyAddNum=0;
			/**是否宝箱掉落增加强化石概率 **/
			couldAddDropBoxLV=false;
			dropBoxLv=0;
			/**是否提高熔炼装备得到的熔炼值 **/
			couldAddRonglian=false;
			ronglianLv=0;
			/** 是否擂台增加荣誉  **/
			couldAddRongyuInLeitai=false;
			rongyuLeitaiLv=0;
			/** 是否全服广播  **/
			couldGuangbo=false;
			/** 购买金币次数增加  **/
			addCount_buyMoney=0;
			/** 挖矿加速次数增加 **/
			addCount_wakuangJiashu=0;
			/** 购买体力次数增加 **/
			addCount_buyTili=0;
		}
		

		
		private function setVipLevel():void{
			vipLevel=userVo.vipLevel;
			if(vipLevel<0){
				vipLevel=0;
			}
			if(vipLevel>getMaxLevel()){
				vipLevel=getMaxLevel();
			}
			icon="vip"+vipLevel;
			setDefaultValue();
			if(vipLevel<=0){
				hasVip=false;
			}else{
				hasVip=true;
				for each(var node:Node_vip in XMLDataManager.Node_vipArray){
					if(vipLevel>=node.id){
						var tags:Array=JSON.parse(node.desc1_tag) as Array;
						var values:Array=JSON.parse(node.desc1_num) as Array;
						for(var index:int=0; index<tags.length; index++){
							setTagAndValue(tags[index],values[index]);
						}
					}else{
						break;
					}
				}
				curNode=XMLDataManager.getVipById(vipLevel);
				addCount_buyMoney=curNode.desc2_num;
				addCount_wakuangJiashu=curNode.desc3_num;
				addCount_buyTili=curNode.desc4_num;
				icon=curNode.icon;
			}
		}
		
		
		
		private function onAttrChange(attr:String,t1:*,t2:*,vo:*):void{
			if(attr=="vipLevel"){
				setVipLevel();
			}
		}
		
		public override function destory():void
		{
			if(userVo) {userVo.changAttr_SN.remove(onAttrChange);}
			super.destory();
		}
	}
}