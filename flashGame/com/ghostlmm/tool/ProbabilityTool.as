package com.ghostlmm.tool
{
	import com.fish.modules.core.ResourceConst;
	import com.ghostlmm.dig.GameConstConfig;

	public class ProbabilityTool
	{
		
		public function ProbabilityTool()
		{
			
		}
		
		private var itemArray:Array;
		private var totalNum:int;
		
		private var createTick:int=0;
		private var specialCreateItem:ProbabilityItem;
		private var specialStep:int;
		
		
		public function init(data:Array,total:int):void{
//			trace("随机总数 ： "+total);
			createTick=0;
			specialCreateItem=null;
			itemArray=[];
			totalNum=total;
			var wallItem:ProbabilityItem=new ProbabilityItem();
			wallItem.type=ResourceConst.T_Wall;
			itemArray.push(wallItem);
			for each(var obj:Object in data){
				var item:ProbabilityItem=new ProbabilityItem();
				item.type=obj.type;
				item.num=obj.num;
				item.xid=obj.xid;
				item.did=obj.did;
				itemArray.push(item);
				total-=item.num;
			}
			wallItem.num=total;
		}
		
		public function setEquip(xid:int,rid:int):void{
			for(var index:int=0; index<itemArray.length; index++){
				var item:ProbabilityItem=itemArray[index];
				if(item.type==ResourceConst.R_equip && item.xid==xid){
					item.num--;
					totalNum--;
					specialCreateItem=item;
					specialStep=rid;
				}
			}
		}
		
		public function isActive():Boolean{
			if(totalNum<=0){
				return false;
			}
			return true;
		}
		
		public function createRandom():Object{
//			trace("创建 ： "+createTick);
			if(specialCreateItem && createTick==specialStep){
				var obj:Object={};
				obj.type=specialCreateItem.type;
				obj.xid=specialCreateItem.xid;
				obj.did=specialCreateItem.did;
				GameConstConfig.log("[特别创建]\t"+totalNum+"/"+obj.type);
				createTick++;
				return obj;
			}else{
				var rnd:int=int(Math.random()*int.MAX_VALUE)%totalNum+1;
				var t:int=0;
				for each(var item:ProbabilityItem in itemArray){
					t+=item.num;
					if(rnd<=t){
						totalNum--;
						item.num--;
						var obj:Object={};
						obj.type=item.type;
						obj.xid=item.xid;
						obj.did=item.did;
						
						GameConstConfig.log("[随机创建]\t"+totalNum+"/"+obj.type);
						createTick++;
						return obj;
					}
				}
			}
			
			
			throw new Error("创建超出");
			return null;
		}
	}
}

class ProbabilityItem
{
	public var type:String;
	public var xid:int;
	public var num:int;
	public var did:int
}
