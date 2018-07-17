package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.ChaonengliVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.tempData.EquipAttrAttach;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_chaonengli;
	import com.ghostlmm.xmldata.Node_chaonengli_main;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.geom.Point;
	
	import snake.viewdata.PropertyData;
	
	import util.Util;
	
	public class ChaonengliModel extends BaseModel
	{
		public var _chaonengliVo:ChaonengliVO;
		public var _totalPropertyAdd:PropertyData;
		private var needFresh:Boolean=false;
		public function ChaonengliModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			_chaonengliVo=GameVOManager.getInstance().chaonengli;
//			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			_chaonengliVo.update_SN.add(onChaonengliUpdate);
		}
		private function onChaonengliUpdate():void{
			needFresh=true;
			modelUpdata_SN.dispatch();
		}
		/*private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_ChaonengFireHandler)
			{
				if(_code==1)
				{
					needFresh=true;
				}
			}
		}*/
		/**
		 * 外部接口，总加成
		 */
		public function get totalProperty():PropertyData
		{
			if((null==_totalPropertyAdd)||(needFresh))
			{
				computeTotalAddProperty();
			}
			return _totalPropertyAdd;
		}
		public function computeTotalAddProperty():void
		{
			if(null==_totalPropertyAdd)
			{
				_totalPropertyAdd=new PropertyData();
			}
			_totalPropertyAdd=compute();
			needFresh=false;
		}
		/**
		 * 计算加成
		 */
		private function compute():PropertyData
		{
			var result:PropertyData=new PropertyData();
			var type:int=_chaonengliVo.currentType;
			var xmlIdList:Array=JSON.parse(_chaonengliVo.xidList) as Array;
			var chaonengliList:Array=XMLDataManager.Node_chaonengliArray;
			var index:int;
			var m:int;
			var xml:Node_chaonengli;
			for(index=0;index<chaonengliList.length;index++)
			{
				xml=chaonengliList[index];
				if(xml.type<type)
				{
					for(m=0;m<AttrNames.length;m++)
					{
						var atrName:String=AttrNames[m];
						result[atrName]+=xml[atrName];
					}
				}
				else
				{
					break;
				}
			}
			for(index=0;index<xmlIdList.length;index++)
			{
				xml=XMLDataManager.getChaonengliById(xmlIdList[index]);
				for(m=0;m<AttrNames.length;m++)
				{
					var atrName:String=AttrNames[m];
					result[atrName]+=xml[atrName];
				}
			}
			return result;
		}
		public static function getChongnengMainliXmlList():Array
		{
			return XMLDataManager.Node_chaonengli_mainArray;
		}
		public static function getXmlListByType(_type:int):Array
		{
			var result:Array=[];
			var xmlList:Array=XMLDataManager.Node_chaonengliArray;
			var index:int;
			var xml:Node_chaonengli;
			for(index=0;index<xmlList.length;index++)
			{
				xml=xmlList[index];
				if(xml.type<_type)
				{
					continue;
				}
				else if(xml.type==_type)
				{
					result.push(xml);
				}
				else
				{
					break;
				}
			}
			return result;
		}
		/**
		 *  超能力是否解锁
		 */
		public function checkIfAreadyUnlocked(_id:int):Boolean
		{
			var node:Node_chaonengli=XMLDataManager.getChaonengliById(_id);
			if(_chaonengliVo.currentType>node.type)
			{
				return true;
			}
			if(_chaonengliVo.currentType<node.type)
			{
				return false;
			}
			var idArray:Array=JSON.parse(_chaonengliVo.xidList) as Array;
			if(-1==idArray.indexOf(_id))
			{
				return false;
			}
			return true;
		}
		public static const AttrNames:Array=["atk","def","hp","cri","renxing","hit","eva"];
		public static function convertAddPropertyToString(_node:Node_chaonengli):String
		{
			var result:String="";
			var index:int;
			for(index=0;index<AttrNames.length;index++)
			{
				var attrName:String=AttrNames[index];
				var addNum:int=_node[attrName];
				if(addNum>0)
				{
					result+=Util.getLanguage(attrName)+"+"+addNum+",";
				}
			}
			result+=",";
			result=result.split(",,")[0];
			return result;
		}
		public static function convertToCostToItemArray(_node:Object):Array
		{
			var result:Array=[];
			var itemsArray:Array=JSON.parse(_node.cost_item) as Array;
			var itemsNumArray:Array=JSON.parse(_node.cost_item_num) as Array;
			var index:int;
			for(index=0;index<itemsArray.length;index++)
			{
				result.push({"key":ResourceConst.R_item,"xid":itemsArray[index],"num":itemsNumArray[index],"chaonengli":true});
			}
			return result;
		}
		public function checkIfAreadyJinhua(_value:int):Boolean
		{
			if(_value<_chaonengliVo.currentType)
			{
				return true;
			}
			return false;
		}
		
		public function couldJinhua():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var _node:Node_chaonengli_main=XMLDataManager.getChaonengli_mainById(_chaonengliVo.currentType);
			if(_node.id>=XMLDataManager.Node_chaonengli_mainArray.length)
			{
				re.success=false;
				re.desc=Util.getLanguage("超能力已经达到最大进化等级 ");
				return re;
			}
			var areadyNum:int=(JSON.parse(_chaonengliVo.xidList) as Array).length;
			if(areadyNum<_node.num)
			{
				re.success=false;
				re.desc=Util.getLanguage("必须解锁本部位所有超能力才能进化 ");
				return re;
			}
			if(userModel.userVo.userStarCurrent<_node.cost_star)
			{
				re.success=false;
				re.desc=Util.getLanguage("用户星星不足");
				return re;
			}
			if(userModel.userVo.userMoney<_node.cost_money)
			{
				re.success=false;
				re.desc=Util.getLanguage("铜币不足");
				return re;
			}
			if(!checkItemCouldAfford(_node))
			{
				re.success=false;
				re.desc=Util.getLanguage("进化超能力所需材料不足");
				return re;
			}
			re.success=true;
			return re;
		}
		public function couldJieSuo(_node:Node_chaonengli):JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userLevel<_node.lv_limit)
			{
				re.success=false;
				re.desc=Util.getLanguage("需要等级解锁",_node.lv_limit);
				return re;
			}
			if(_node.type>_chaonengliVo.currentType)
			{
				re.success=false;
				re.desc=Util.getLanguage("请先解锁前一关能力 ");
				return re;
			}
			if(!checkIfHasRelatedNengli(_node))
			{
				re.success=false;
				re.desc=Util.getLanguage("请先解锁相邻能力");
				return re;
			}
			if(userModel.userVo.userStarCurrent<_node.cost_star)
			{
				re.success=false;
				re.desc=Util.getLanguage("用户星星不足");
				return re;
			}
			if(userModel.userVo.userMoney<_node.cost_money)
			{
				re.success=false;
				re.desc=Util.getLanguage("铜币不足");
				return re;
			}
			if(!checkItemCouldAfford(_node))
			{
				re.success=false;
				re.desc=Util.getLanguage("解锁超能力所需材料不足");
				return re;
			}
			re.success=true;
			return re;
		}
		public static function checkItemCouldAfford(_node:Object):Boolean
		{
			var itemModel:ItemModel=Context.getInjectInstance(ItemModel);
			var result:Boolean=true;
			var itemsArray:Array=JSON.parse(_node.cost_item) as Array;
			var itemsNumArray:Array=JSON.parse(_node.cost_item_num) as Array;
			var index:int;
			for(index=0;index<itemsArray.length;index++)
			{
				var itemNum:int=itemModel.getItemNumById(itemsArray[index]);
				if(itemNum<itemsNumArray[index])
				{
					result=false;
					break;
				}
			}
			return result;
		}
		public function checkIfHasRelatedNengli(_node:Node_chaonengli):Boolean
		{
			var xmlList:Array=getXmlListByType(_node.type);
			if(xmlList[0].id==_node.id)//当前关卡的第一个
			{
				return true;
			}
			var areadyArray:Array=JSON.parse(_chaonengliVo.xidList) as Array;
			var checkPointArray:Array=computeNodeRelatedArray(_node);
			var index:int;
			for(index=0;index<areadyArray.length;index++)
			{
				var xml:Node_chaonengli=XMLDataManager.getChaonengliById(areadyArray[index]);
				var geziArray:Array=JSON.parse(xml.gezi) as Array;
				var geziPoint:Point=new Point(geziArray[0],geziArray[1]);
				var temp:int;
				for(temp=0;temp<checkPointArray.length;temp++)
				{
					var checkPoint:Point=checkPointArray[temp];
					if((checkPoint.x==geziPoint.x)&&(checkPoint.y==geziPoint.y))
					{
						return true;
					}
				}
			}
			return false;
		}
		private static function computeNodeRelatedArray(_node:Node_chaonengli):Array
		{
			var result:Array=[];
			var geziArray:Array=JSON.parse(_node.gezi) as Array;
			var x:int=geziArray[0];
			var y:int=geziArray[1];
			result.push(new Point(x-1,y));
			result.push(new Point(x,y-1));
			result.push(new Point(x,y+1));
			result.push(new Point(x+1,y));
			if(x%2==0)
			{
				result.push(new Point(x-1,y+1));
				result.push(new Point(x+1,y+1));
			}
			else
			{
				result.push(new Point(x-1,y-1));
				result.push(new Point(x+1,y-1));
			}
			return result;
		}
		
		/** 超能力战斗力  **/
		public function calcChaonengliZhandouli():int{
			var p:PropertyData=totalProperty;
			var obj:Object={};
			for each(var attr:String in AttrNames){
				obj[attr]=p[attr];
			}
			return Util.calcZhandouliByAttrMap(obj);
		}
		
		
		public override function destory():void
		{
			if(_chaonengliVo) _chaonengliVo.update_SN.remove(onChaonengliUpdate);
			super.destory();
		}
	}
}