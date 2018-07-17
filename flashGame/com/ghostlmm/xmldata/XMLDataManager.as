package com.ghostlmm.xmldata
{
	import flash.utils.Dictionary;
	import flash.system.ApplicationDomain;

	/** 
	**/
	public class XMLDataManager extends Object
	{
		public static var Node_banghuizhan_rewardArray:Array=[];
		public static var Node_banghuizhan_rewardDic:Dictionary=new Dictionary();
		public static function getBanghuizhan_rewardById(id:int):Node_banghuizhan_reward{
			return Node_banghuizhan_rewardDic[id];
		}
		public static function getBanghuizhan_rewardByTag(tag:String,value:*):Node_banghuizhan_reward{
			for each(var node:Node_banghuizhan_reward in Node_banghuizhan_rewardArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_banghuizhan_reward\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_banghui_chuangjianArray:Array=[];
		public static var Node_banghui_chuangjianDic:Dictionary=new Dictionary();
		public static function getBanghui_chuangjianById(id:int):Node_banghui_chuangjian{
			return Node_banghui_chuangjianDic[id];
		}
		public static function getBanghui_chuangjianByTag(tag:String,value:*):Node_banghui_chuangjian{
			for each(var node:Node_banghui_chuangjian in Node_banghui_chuangjianArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_banghui_chuangjian\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_banghui_guangong_rewardArray:Array=[];
		public static var Node_banghui_guangong_rewardDic:Dictionary=new Dictionary();
		public static function getBanghui_guangong_rewardById(id:int):Node_banghui_guangong_reward{
			return Node_banghui_guangong_rewardDic[id];
		}
		public static function getBanghui_guangong_rewardByTag(tag:String,value:*):Node_banghui_guangong_reward{
			for each(var node:Node_banghui_guangong_reward in Node_banghui_guangong_rewardArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_banghui_guangong_reward\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_banghui_iconArray:Array=[];
		public static var Node_banghui_iconDic:Dictionary=new Dictionary();
		public static function getBanghui_iconById(id:int):Node_banghui_icon{
			return Node_banghui_iconDic[id];
		}
		public static function getBanghui_iconByTag(tag:String,value:*):Node_banghui_icon{
			for each(var node:Node_banghui_icon in Node_banghui_iconArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_banghui_icon\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_banghui_jianzhulvupArray:Array=[];
		public static var Node_banghui_jianzhulvupDic:Dictionary=new Dictionary();
		public static function getBanghui_jianzhulvupById(id:int):Node_banghui_jianzhulvup{
			return Node_banghui_jianzhulvupDic[id];
		}
		public static function getBanghui_jianzhulvupByTag(tag:String,value:*):Node_banghui_jianzhulvup{
			for each(var node:Node_banghui_jianzhulvup in Node_banghui_jianzhulvupArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_banghui_jianzhulvup\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_banghui_juanxianArray:Array=[];
		public static var Node_banghui_juanxianDic:Dictionary=new Dictionary();
		public static function getBanghui_juanxianById(id:int):Node_banghui_juanxian{
			return Node_banghui_juanxianDic[id];
		}
		public static function getBanghui_juanxianByTag(tag:String,value:*):Node_banghui_juanxian{
			for each(var node:Node_banghui_juanxian in Node_banghui_juanxianArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_banghui_juanxian\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_banghui_shangchengArray:Array=[];
		public static var Node_banghui_shangchengDic:Dictionary=new Dictionary();
		public static function getBanghui_shangchengById(id:int):Node_banghui_shangcheng{
			return Node_banghui_shangchengDic[id];
		}
		public static function getBanghui_shangchengByTag(tag:String,value:*):Node_banghui_shangcheng{
			for each(var node:Node_banghui_shangcheng in Node_banghui_shangchengArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_banghui_shangcheng\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_banghui_shangchengzhenpinArray:Array=[];
		public static var Node_banghui_shangchengzhenpinDic:Dictionary=new Dictionary();
		public static function getBanghui_shangchengzhenpinById(id:int):Node_banghui_shangchengzhenpin{
			return Node_banghui_shangchengzhenpinDic[id];
		}
		public static function getBanghui_shangchengzhenpinByTag(tag:String,value:*):Node_banghui_shangchengzhenpin{
			for each(var node:Node_banghui_shangchengzhenpin in Node_banghui_shangchengzhenpinArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_banghui_shangchengzhenpin\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_baoshiArray:Array=[];
		public static var Node_baoshiDic:Dictionary=new Dictionary();
		public static function getBaoshiById(id:int):Node_baoshi{
			return Node_baoshiDic[id];
		}
		public static function getBaoshiByTag(tag:String,value:*):Node_baoshi{
			for each(var node:Node_baoshi in Node_baoshiArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_baoshi\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_bossArray:Array=[];
		public static var Node_bossDic:Dictionary=new Dictionary();
		public static function getBossById(id:int):Node_boss{
			return Node_bossDic[id];
		}
		public static function getBossByTag(tag:String,value:*):Node_boss{
			for each(var node:Node_boss in Node_bossArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_boss\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_boss_rewardArray:Array=[];
		public static var Node_boss_rewardDic:Dictionary=new Dictionary();
		public static function getBoss_rewardById(id:int):Node_boss_reward{
			return Node_boss_rewardDic[id];
		}
		public static function getBoss_rewardByTag(tag:String,value:*):Node_boss_reward{
			for each(var node:Node_boss_reward in Node_boss_rewardArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_boss_reward\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_bulletArray:Array=[];
		public static var Node_bulletDic:Dictionary=new Dictionary();
		public static function getBulletById(id:int):Node_bullet{
			return Node_bulletDic[id];
		}
		public static function getBulletByTag(tag:String,value:*):Node_bullet{
			for each(var node:Node_bullet in Node_bulletArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_bullet\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_canbaiArray:Array=[];
		public static var Node_canbaiDic:Dictionary=new Dictionary();
		public static function getCanbaiById(id:int):Node_canbai{
			return Node_canbaiDic[id];
		}
		public static function getCanbaiByTag(tag:String,value:*):Node_canbai{
			for each(var node:Node_canbai in Node_canbaiArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_canbai\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_chaonengliArray:Array=[];
		public static var Node_chaonengliDic:Dictionary=new Dictionary();
		public static function getChaonengliById(id:int):Node_chaonengli{
			return Node_chaonengliDic[id];
		}
		public static function getChaonengliByTag(tag:String,value:*):Node_chaonengli{
			for each(var node:Node_chaonengli in Node_chaonengliArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_chaonengli\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_chaonengli_mainArray:Array=[];
		public static var Node_chaonengli_mainDic:Dictionary=new Dictionary();
		public static function getChaonengli_mainById(id:int):Node_chaonengli_main{
			return Node_chaonengli_mainDic[id];
		}
		public static function getChaonengli_mainByTag(tag:String,value:*):Node_chaonengli_main{
			for each(var node:Node_chaonengli_main in Node_chaonengli_mainArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_chaonengli_main\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_chongzhiArray:Array=[];
		public static var Node_chongzhiDic:Dictionary=new Dictionary();
		public static function getChongzhiById(id:int):Node_chongzhi{
			return Node_chongzhiDic[id];
		}
		public static function getChongzhiByTag(tag:String,value:*):Node_chongzhi{
			for each(var node:Node_chongzhi in Node_chongzhiArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_chongzhi\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_choujiangArray:Array=[];
		public static var Node_choujiangDic:Dictionary=new Dictionary();
		public static function getChoujiangById(id:int):Node_choujiang{
			return Node_choujiangDic[id];
		}
		public static function getChoujiangByTag(tag:String,value:*):Node_choujiang{
			for each(var node:Node_choujiang in Node_choujiangArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_choujiang\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_constArray:Array=[];
		public static var Node_constDic:Dictionary=new Dictionary();
		public static function getConstById(id:String):Node_const{
			return Node_constDic[id];
		}
		public static function getConstByTag(tag:String,value:*):Node_const{
			for each(var node:Node_const in Node_constArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_const\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_daily_taskArray:Array=[];
		public static var Node_daily_taskDic:Dictionary=new Dictionary();
		public static function getDaily_taskById(id:int):Node_daily_task{
			return Node_daily_taskDic[id];
		}
		public static function getDaily_taskByTag(tag:String,value:*):Node_daily_task{
			for each(var node:Node_daily_task in Node_daily_taskArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_daily_task\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_dig_itemArray:Array=[];
		public static var Node_dig_itemDic:Dictionary=new Dictionary();
		public static function getDig_itemById(id:int):Node_dig_item{
			return Node_dig_itemDic[id];
		}
		public static function getDig_itemByTag(tag:String,value:*):Node_dig_item{
			for each(var node:Node_dig_item in Node_dig_itemArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_dig_item\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_dig_lvArray:Array=[];
		public static var Node_dig_lvDic:Dictionary=new Dictionary();
		public static function getDig_lvById(id:int):Node_dig_lv{
			return Node_dig_lvDic[id];
		}
		public static function getDig_lvByTag(tag:String,value:*):Node_dig_lv{
			for each(var node:Node_dig_lv in Node_dig_lvArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_dig_lv\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_dig_mapArray:Array=[];
		public static var Node_dig_mapDic:Dictionary=new Dictionary();
		public static function getDig_mapById(id:int):Node_dig_map{
			return Node_dig_mapDic[id];
		}
		public static function getDig_mapByTag(tag:String,value:*):Node_dig_map{
			for each(var node:Node_dig_map in Node_dig_mapArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_dig_map\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_equipArray:Array=[];
		public static var Node_equipDic:Dictionary=new Dictionary();
		public static function getEquipById(id:int):Node_equip{
			return Node_equipDic[id];
		}
		public static function getEquipByTag(tag:String,value:*):Node_equip{
			for each(var node:Node_equip in Node_equipArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_equip\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_equipEnhanceArray:Array=[];
		public static var Node_equipEnhanceDic:Dictionary=new Dictionary();
		public static function getEquipEnhanceById(id:int):Node_equipEnhance{
			return Node_equipEnhanceDic[id];
		}
		public static function getEquipEnhanceByTag(tag:String,value:*):Node_equipEnhance{
			for each(var node:Node_equipEnhance in Node_equipEnhanceArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_equipEnhance\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_equip_baoshiArray:Array=[];
		public static var Node_equip_baoshiDic:Dictionary=new Dictionary();
		public static function getEquip_baoshiById(id:int):Node_equip_baoshi{
			return Node_equip_baoshiDic[id];
		}
		public static function getEquip_baoshiByTag(tag:String,value:*):Node_equip_baoshi{
			for each(var node:Node_equip_baoshi in Node_equip_baoshiArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_equip_baoshi\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_equip_nbArray:Array=[];
		public static var Node_equip_nbDic:Dictionary=new Dictionary();
		public static function getEquip_nbById(id:int):Node_equip_nb{
			return Node_equip_nbDic[id];
		}
		public static function getEquip_nbByTag(tag:String,value:*):Node_equip_nb{
			for each(var node:Node_equip_nb in Node_equip_nbArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_equip_nb\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_equip_ronglianArray:Array=[];
		public static var Node_equip_ronglianDic:Dictionary=new Dictionary();
		public static function getEquip_ronglianById(id:int):Node_equip_ronglian{
			return Node_equip_ronglianDic[id];
		}
		public static function getEquip_ronglianByTag(tag:String,value:*):Node_equip_ronglian{
			for each(var node:Node_equip_ronglian in Node_equip_ronglianArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_equip_ronglian\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_equip_starArray:Array=[];
		public static var Node_equip_starDic:Dictionary=new Dictionary();
		public static function getEquip_starById(id:int):Node_equip_star{
			return Node_equip_starDic[id];
		}
		public static function getEquip_starByTag(tag:String,value:*):Node_equip_star{
			for each(var node:Node_equip_star in Node_equip_starArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_equip_star\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_equip_typeArray:Array=[];
		public static var Node_equip_typeDic:Dictionary=new Dictionary();
		public static function getEquip_typeById(id:int):Node_equip_type{
			return Node_equip_typeDic[id];
		}
		public static function getEquip_typeByTag(tag:String,value:*):Node_equip_type{
			for each(var node:Node_equip_type in Node_equip_typeArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_equip_type\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_expressionArray:Array=[];
		public static var Node_expressionDic:Dictionary=new Dictionary();
		public static function getExpressionById(id:String):Node_expression{
			return Node_expressionDic[id];
		}
		public static function getExpressionByTag(tag:String,value:*):Node_expression{
			for each(var node:Node_expression in Node_expressionArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_expression\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_fnt_img_reflectArray:Array=[];
		public static var Node_fnt_img_reflectDic:Dictionary=new Dictionary();
		public static function getFnt_img_reflectById(id:String):Node_fnt_img_reflect{
			return Node_fnt_img_reflectDic[id];
		}
		public static function getFnt_img_reflectByTag(tag:String,value:*):Node_fnt_img_reflect{
			for each(var node:Node_fnt_img_reflect in Node_fnt_img_reflectArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_fnt_img_reflect\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_fubenArray:Array=[];
		public static var Node_fubenDic:Dictionary=new Dictionary();
		public static function getFubenById(id:int):Node_fuben{
			return Node_fubenDic[id];
		}
		public static function getFubenByTag(tag:String,value:*):Node_fuben{
			for each(var node:Node_fuben in Node_fubenArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_fuben\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_fuben_mapArray:Array=[];
		public static var Node_fuben_mapDic:Dictionary=new Dictionary();
		public static function getFuben_mapById(id:int):Node_fuben_map{
			return Node_fuben_mapDic[id];
		}
		public static function getFuben_mapByTag(tag:String,value:*):Node_fuben_map{
			for each(var node:Node_fuben_map in Node_fuben_mapArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_fuben_map\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_fuben_monster_heapArray:Array=[];
		public static var Node_fuben_monster_heapDic:Dictionary=new Dictionary();
		public static function getFuben_monster_heapById(id:int):Node_fuben_monster_heap{
			return Node_fuben_monster_heapDic[id];
		}
		public static function getFuben_monster_heapByTag(tag:String,value:*):Node_fuben_monster_heap{
			for each(var node:Node_fuben_monster_heap in Node_fuben_monster_heapArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_fuben_monster_heap\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_fuben_paimingArray:Array=[];
		public static var Node_fuben_paimingDic:Dictionary=new Dictionary();
		public static function getFuben_paimingById(id:int):Node_fuben_paiming{
			return Node_fuben_paimingDic[id];
		}
		public static function getFuben_paimingByTag(tag:String,value:*):Node_fuben_paiming{
			for each(var node:Node_fuben_paiming in Node_fuben_paimingArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_fuben_paiming\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_fuben_starArray:Array=[];
		public static var Node_fuben_starDic:Dictionary=new Dictionary();
		public static function getFuben_starById(id:int):Node_fuben_star{
			return Node_fuben_starDic[id];
		}
		public static function getFuben_starByTag(tag:String,value:*):Node_fuben_star{
			for each(var node:Node_fuben_star in Node_fuben_starArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_fuben_star\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_gongneng_kaiguanArray:Array=[];
		public static var Node_gongneng_kaiguanDic:Dictionary=new Dictionary();
		public static function getGongneng_kaiguanById(id:int):Node_gongneng_kaiguan{
			return Node_gongneng_kaiguanDic[id];
		}
		public static function getGongneng_kaiguanByTag(tag:String,value:*):Node_gongneng_kaiguan{
			for each(var node:Node_gongneng_kaiguan in Node_gongneng_kaiguanArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_gongneng_kaiguan\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_guankaArray:Array=[];
		public static var Node_guankaDic:Dictionary=new Dictionary();
		public static function getGuankaById(id:int):Node_guanka{
			return Node_guankaDic[id];
		}
		public static function getGuankaByTag(tag:String,value:*):Node_guanka{
			for each(var node:Node_guanka in Node_guankaArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_guanka\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_gunArray:Array=[];
		public static var Node_gunDic:Dictionary=new Dictionary();
		public static function getGunById(id:int):Node_gun{
			return Node_gunDic[id];
		}
		public static function getGunByTag(tag:String,value:*):Node_gun{
			for each(var node:Node_gun in Node_gunArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_gun\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_heidianArray:Array=[];
		public static var Node_heidianDic:Dictionary=new Dictionary();
		public static function getHeidianById(id:int):Node_heidian{
			return Node_heidianDic[id];
		}
		public static function getHeidianByTag(tag:String,value:*):Node_heidian{
			for each(var node:Node_heidian in Node_heidianArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_heidian\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_heroArray:Array=[];
		public static var Node_heroDic:Dictionary=new Dictionary();
		public static function getHeroById(id:int):Node_hero{
			return Node_heroDic[id];
		}
		public static function getHeroByTag(tag:String,value:*):Node_hero{
			for each(var node:Node_hero in Node_heroArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_hero\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_huodongArray:Array=[];
		public static var Node_huodongDic:Dictionary=new Dictionary();
		public static function getHuodongById(id:int):Node_huodong{
			return Node_huodongDic[id];
		}
		public static function getHuodongByTag(tag:String,value:*):Node_huodong{
			for each(var node:Node_huodong in Node_huodongArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_huodong\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_huodongzongpeizhiArray:Array=[];
		public static var Node_huodongzongpeizhiDic:Dictionary=new Dictionary();
		public static function getHuodongzongpeizhiById(id:int):Node_huodongzongpeizhi{
			return Node_huodongzongpeizhiDic[id];
		}
		public static function getHuodongzongpeizhiByTag(tag:String,value:*):Node_huodongzongpeizhi{
			for each(var node:Node_huodongzongpeizhi in Node_huodongzongpeizhiArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_huodongzongpeizhi\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_huodong_caishenxiafanArray:Array=[];
		public static var Node_huodong_caishenxiafanDic:Dictionary=new Dictionary();
		public static function getHuodong_caishenxiafanById(id:int):Node_huodong_caishenxiafan{
			return Node_huodong_caishenxiafanDic[id];
		}
		public static function getHuodong_caishenxiafanByTag(tag:String,value:*):Node_huodong_caishenxiafan{
			for each(var node:Node_huodong_caishenxiafan in Node_huodong_caishenxiafanArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_huodong_caishenxiafan\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_huodong_chongzhiArray:Array=[];
		public static var Node_huodong_chongzhiDic:Dictionary=new Dictionary();
		public static function getHuodong_chongzhiById(id:int):Node_huodong_chongzhi{
			return Node_huodong_chongzhiDic[id];
		}
		public static function getHuodong_chongzhiByTag(tag:String,value:*):Node_huodong_chongzhi{
			for each(var node:Node_huodong_chongzhi in Node_huodong_chongzhiArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_huodong_chongzhi\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_huodong_guagualeArray:Array=[];
		public static var Node_huodong_guagualeDic:Dictionary=new Dictionary();
		public static function getHuodong_guagualeById(id:int):Node_huodong_guaguale{
			return Node_huodong_guagualeDic[id];
		}
		public static function getHuodong_guagualeByTag(tag:String,value:*):Node_huodong_guaguale{
			for each(var node:Node_huodong_guaguale in Node_huodong_guagualeArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_huodong_guaguale\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_huodong_lvArray:Array=[];
		public static var Node_huodong_lvDic:Dictionary=new Dictionary();
		public static function getHuodong_lvById(id:int):Node_huodong_lv{
			return Node_huodong_lvDic[id];
		}
		public static function getHuodong_lvByTag(tag:String,value:*):Node_huodong_lv{
			for each(var node:Node_huodong_lv in Node_huodong_lvArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_huodong_lv\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_huodong_shouji_duihuanArray:Array=[];
		public static var Node_huodong_shouji_duihuanDic:Dictionary=new Dictionary();
		public static function getHuodong_shouji_duihuanById(id:int):Node_huodong_shouji_duihuan{
			return Node_huodong_shouji_duihuanDic[id];
		}
		public static function getHuodong_shouji_duihuanByTag(tag:String,value:*):Node_huodong_shouji_duihuan{
			for each(var node:Node_huodong_shouji_duihuan in Node_huodong_shouji_duihuanArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_huodong_shouji_duihuan\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_huodong_shouji_npcArray:Array=[];
		public static var Node_huodong_shouji_npcDic:Dictionary=new Dictionary();
		public static function getHuodong_shouji_npcById(id:int):Node_huodong_shouji_npc{
			return Node_huodong_shouji_npcDic[id];
		}
		public static function getHuodong_shouji_npcByTag(tag:String,value:*):Node_huodong_shouji_npc{
			for each(var node:Node_huodong_shouji_npc in Node_huodong_shouji_npcArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_huodong_shouji_npc\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_itemArray:Array=[];
		public static var Node_itemDic:Dictionary=new Dictionary();
		public static function getItemById(id:int):Node_item{
			return Node_itemDic[id];
		}
		public static function getItemByTag(tag:String,value:*):Node_item{
			for each(var node:Node_item in Node_itemArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_item\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_jihuaArray:Array=[];
		public static var Node_jihuaDic:Dictionary=new Dictionary();
		public static function getJihuaById(id:int):Node_jihua{
			return Node_jihuaDic[id];
		}
		public static function getJihuaByTag(tag:String,value:*):Node_jihua{
			for each(var node:Node_jihua in Node_jihuaArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_jihua\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_jinkuangArray:Array=[];
		public static var Node_jinkuangDic:Dictionary=new Dictionary();
		public static function getJinkuangById(id:int):Node_jinkuang{
			return Node_jinkuangDic[id];
		}
		public static function getJinkuangByTag(tag:String,value:*):Node_jinkuang{
			for each(var node:Node_jinkuang in Node_jinkuangArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_jinkuang\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_jinkuangrukouArray:Array=[];
		public static var Node_jinkuangrukouDic:Dictionary=new Dictionary();
		public static function getJinkuangrukouById(id:int):Node_jinkuangrukou{
			return Node_jinkuangrukouDic[id];
		}
		public static function getJinkuangrukouByTag(tag:String,value:*):Node_jinkuangrukou{
			for each(var node:Node_jinkuangrukou in Node_jinkuangrukouArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_jinkuangrukou\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_languageArray:Array=[];
		public static var Node_languageDic:Dictionary=new Dictionary();
		public static function getLanguageById(id:String):Node_language{
			return Node_languageDic[id];
		}
		public static function getLanguageByTag(tag:String,value:*):Node_language{
			for each(var node:Node_language in Node_languageArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_language\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_leitaiArray:Array=[];
		public static var Node_leitaiDic:Dictionary=new Dictionary();
		public static function getLeitaiById(id:int):Node_leitai{
			return Node_leitaiDic[id];
		}
		public static function getLeitaiByTag(tag:String,value:*):Node_leitai{
			for each(var node:Node_leitai in Node_leitaiArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_leitai\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_levelArray:Array=[];
		public static var Node_levelDic:Dictionary=new Dictionary();
		public static function getLevelById(id:int):Node_level{
			return Node_levelDic[id];
		}
		public static function getLevelByTag(tag:String,value:*):Node_level{
			for each(var node:Node_level in Node_levelArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_level\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_mailArray:Array=[];
		public static var Node_mailDic:Dictionary=new Dictionary();
		public static function getMailById(id:int):Node_mail{
			return Node_mailDic[id];
		}
		public static function getMailByTag(tag:String,value:*):Node_mail{
			for each(var node:Node_mail in Node_mailArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_mail\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_mario_tileArray:Array=[];
		public static var Node_mario_tileDic:Dictionary=new Dictionary();
		public static function getMario_tileById(id:int):Node_mario_tile{
			return Node_mario_tileDic[id];
		}
		public static function getMario_tileByTag(tag:String,value:*):Node_mario_tile{
			for each(var node:Node_mario_tile in Node_mario_tileArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_mario_tile\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_monsterArray:Array=[];
		public static var Node_monsterDic:Dictionary=new Dictionary();
		public static function getMonsterById(id:int):Node_monster{
			return Node_monsterDic[id];
		}
		public static function getMonsterByTag(tag:String,value:*):Node_monster{
			for each(var node:Node_monster in Node_monsterArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_monster\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_monster_typeArray:Array=[];
		public static var Node_monster_typeDic:Dictionary=new Dictionary();
		public static function getMonster_typeById(id:int):Node_monster_type{
			return Node_monster_typeDic[id];
		}
		public static function getMonster_typeByTag(tag:String,value:*):Node_monster_type{
			for each(var node:Node_monster_type in Node_monster_typeArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_monster_type\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_nameArray:Array=[];
		public static var Node_nameDic:Dictionary=new Dictionary();
		public static function getNameById(id:int):Node_name{
			return Node_nameDic[id];
		}
		public static function getNameByTag(tag:String,value:*):Node_name{
			for each(var node:Node_name in Node_nameArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_name\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_npcArray:Array=[];
		public static var Node_npcDic:Dictionary=new Dictionary();
		public static function getNpcById(id:int):Node_npc{
			return Node_npcDic[id];
		}
		public static function getNpcByTag(tag:String,value:*):Node_npc{
			for each(var node:Node_npc in Node_npcArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_npc\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_npc_talkArray:Array=[];
		public static var Node_npc_talkDic:Dictionary=new Dictionary();
		public static function getNpc_talkById(id:int):Node_npc_talk{
			return Node_npc_talkDic[id];
		}
		public static function getNpc_talkByTag(tag:String,value:*):Node_npc_talk{
			for each(var node:Node_npc_talk in Node_npc_talkArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_npc_talk\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_push_notificationArray:Array=[];
		public static var Node_push_notificationDic:Dictionary=new Dictionary();
		public static function getPush_notificationById(id:int):Node_push_notification{
			return Node_push_notificationDic[id];
		}
		public static function getPush_notificationByTag(tag:String,value:*):Node_push_notification{
			for each(var node:Node_push_notification in Node_push_notificationArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_push_notification\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_rongyu_shangdianArray:Array=[];
		public static var Node_rongyu_shangdianDic:Dictionary=new Dictionary();
		public static function getRongyu_shangdianById(id:int):Node_rongyu_shangdian{
			return Node_rongyu_shangdianDic[id];
		}
		public static function getRongyu_shangdianByTag(tag:String,value:*):Node_rongyu_shangdian{
			for each(var node:Node_rongyu_shangdian in Node_rongyu_shangdianArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_rongyu_shangdian\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_serverlistArray:Array=[];
		public static var Node_serverlistDic:Dictionary=new Dictionary();
		public static function getServerlistById(id:int):Node_serverlist{
			return Node_serverlistDic[id];
		}
		public static function getServerlistByTag(tag:String,value:*):Node_serverlist{
			for each(var node:Node_serverlist in Node_serverlistArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_serverlist\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_shortkeyArray:Array=[];
		public static var Node_shortkeyDic:Dictionary=new Dictionary();
		public static function getShortkeyById(id:int):Node_shortkey{
			return Node_shortkeyDic[id];
		}
		public static function getShortkeyByTag(tag:String,value:*):Node_shortkey{
			for each(var node:Node_shortkey in Node_shortkeyArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_shortkey\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_skillArray:Array=[];
		public static var Node_skillDic:Dictionary=new Dictionary();
		public static function getSkillById(id:int):Node_skill{
			return Node_skillDic[id];
		}
		public static function getSkillByTag(tag:String,value:*):Node_skill{
			for each(var node:Node_skill in Node_skillArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_skill\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_skill_upgradeArray:Array=[];
		public static var Node_skill_upgradeDic:Dictionary=new Dictionary();
		public static function getSkill_upgradeById(id:int):Node_skill_upgrade{
			return Node_skill_upgradeDic[id];
		}
		public static function getSkill_upgradeByTag(tag:String,value:*):Node_skill_upgrade{
			for each(var node:Node_skill_upgrade in Node_skill_upgradeArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_skill_upgrade\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_soundArray:Array=[];
		public static var Node_soundDic:Dictionary=new Dictionary();
		public static function getSoundById(id:int):Node_sound{
			return Node_soundDic[id];
		}
		public static function getSoundByTag(tag:String,value:*):Node_sound{
			for each(var node:Node_sound in Node_soundArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_sound\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_storyArray:Array=[];
		public static var Node_storyDic:Dictionary=new Dictionary();
		public static function getStoryById(id:int):Node_story{
			return Node_storyDic[id];
		}
		public static function getStoryByTag(tag:String,value:*):Node_story{
			for each(var node:Node_story in Node_storyArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_story\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_taskArray:Array=[];
		public static var Node_taskDic:Dictionary=new Dictionary();
		public static function getTaskById(id:int):Node_task{
			return Node_taskDic[id];
		}
		public static function getTaskByTag(tag:String,value:*):Node_task{
			for each(var node:Node_task in Node_taskArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_task\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_textArray:Array=[];
		public static var Node_textDic:Dictionary=new Dictionary();
		public static function getTextById(id:String):Node_text{
			return Node_textDic[id];
		}
		public static function getTextByTag(tag:String,value:*):Node_text{
			for each(var node:Node_text in Node_textArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_text\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_tileArray:Array=[];
		public static var Node_tileDic:Dictionary=new Dictionary();
		public static function getTileById(id:int):Node_tile{
			return Node_tileDic[id];
		}
		public static function getTileByTag(tag:String,value:*):Node_tile{
			for each(var node:Node_tile in Node_tileArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_tile\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_tuangouArray:Array=[];
		public static var Node_tuangouDic:Dictionary=new Dictionary();
		public static function getTuangouById(id:int):Node_tuangou{
			return Node_tuangouDic[id];
		}
		public static function getTuangouByTag(tag:String,value:*):Node_tuangou{
			for each(var node:Node_tuangou in Node_tuangouArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_tuangou\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_vipArray:Array=[];
		public static var Node_vipDic:Dictionary=new Dictionary();
		public static function getVipById(id:int):Node_vip{
			return Node_vipDic[id];
		}
		public static function getVipByTag(tag:String,value:*):Node_vip{
			for each(var node:Node_vip in Node_vipArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_vip\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_xinshouyindaoArray:Array=[];
		public static var Node_xinshouyindaoDic:Dictionary=new Dictionary();
		public static function getXinshouyindaoById(id:int):Node_xinshouyindao{
			return Node_xinshouyindaoDic[id];
		}
		public static function getXinshouyindaoByTag(tag:String,value:*):Node_xinshouyindao{
			for each(var node:Node_xinshouyindao in Node_xinshouyindaoArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_xinshouyindao\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var Node_xitonggonggaoArray:Array=[];
		public static var Node_xitonggonggaoDic:Dictionary=new Dictionary();
		public static function getXitonggonggaoById(id:int):Node_xitonggonggao{
			return Node_xitonggonggaoDic[id];
		}
		public static function getXitonggonggaoByTag(tag:String,value:*):Node_xitonggonggao{
			for each(var node:Node_xitonggonggao in Node_xitonggonggaoArray){
				if(node[tag]==value){
					return node;
				}
			}
			trace("没有找到该类型的数据\t"+"Node_xitonggonggao\t"+"tag:"+tag+"\tvalue:"+value);
			return null;
		}

		public static var nameArray:Array=[];
		
		public static function parseXml(xml:XML,name:String):void
		{
//			if(nameArray.indexOf(name)!=-1)
//			{
//				trace(name+" xml已经载入，无需重复加载");
//				return ;
//			}
			
			var clsName:String="com.ghostlmm.xmldata."+"Node_"+name;
			if(!ApplicationDomain.currentDomain.hasDefinition(clsName)){
				trace("xml没有定义类型，检查代码\t"+name);
				return ;
			}
//			nameArray.push(name);
			
			if(nameArray.indexOf(name)==-1){
				nameArray.push(name);
			}else{
				trace(name+" xml已经载入，重复加载");
			}
			XMLDataManager["Node_"+name+"Array"]=[];
			XMLDataManager["Node_"+name+"Dic"]=new Dictionary();
			
			var array:Array=XMLDataManager["Node_"+name+"Array"];
			var dic:Dictionary=XMLDataManager["Node_"+name+"Dic"];
			var nodeCls:Class=ApplicationDomain.currentDomain.getDefinition(clsName) as Class;
			for each(var node:XML in xml.node)
			{
				var xmlNode:Object=new nodeCls();
				xmlNode.loadData(node);
				array.push(xmlNode);
				dic[xmlNode.id]=xmlNode;
			}
			if(name=="huodong_jifenshangcheng"){
				trace(xml)
			}
		}
		
		public static function reset():void
		{
			for each(var name:String in nameArray)
			{
				(XMLDataManager["Node_"+name+"Array"] as Array).length=0;
				XMLDataManager["Node_"+name+"Dic"]=new Dictionary();
			}
			nameArray.length=0;
		}
	}
}