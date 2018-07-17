package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.WalknpcVO;
	import com.ghostlmm.xmldata.Node_hero;
	import com.ghostlmm.xmldata.Node_monster_type;
	import com.ghostlmm.xmldata.Node_npc;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import snake.GameUtil;
	
	import util.Util;

	public class NpcerData
	{
		public function NpcerData()
		{
		}
		
		public var uid:int;
		public var appearance:Array;
		public var color:Array;
		public var isUser:Boolean;
		public var gunId:int;
		public var userName:String;
		
		
		public function initFromVo(vo:WalknpcVO):Boolean{
			try{
				uid=vo.uid;
				appearance=JSON.parse(vo.userMovieFrame) as Array;
				color=GameUtil.turnArryStringToUint(vo.userColors);
				
				gunId=vo.userGunId;
				userName=vo.userName;
				isUser=true;
				
				if(appearance.length==6 && color.length==10){
					return true;
				}else{
					return false;
				}
				
			}catch (e:Error){
				return false;
			}
			return false;
		}
		
		public function initFromNpc(node:Node_npc,id:int):void{
			uid=id;
			var heroNode:Node_hero=XMLDataManager.getHeroById(node.hero_id);
			var typeNode:Node_monster_type=XMLDataManager.getMonster_typeById(heroNode.imageType);
			color=GameUtil.turnArryStringToUint(typeNode.colors);
			appearance=JSON.parse(typeNode.movie_frame) as Array;
			gunId=node.gun_id;
			userName=node.name;
			isUser=false;
		}
		
		
		
	}
}