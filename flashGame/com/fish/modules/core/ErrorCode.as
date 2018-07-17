package com.fish.modules.core
{
	public class ErrorCode
	{
		public static const SUCCESS:int = 1;
		public static const SKILL_UPGRADE_SUCESS:int = 1001;
		public static const SKILL_UPGRADE_FAILED:int = 1002;
		public static const PET_UPGRADE_SUCESS:int = 1101;
		public static const PET_UPGRADE_FAILED:int = 1102;
		
		
		
		public static const AUTHKEY_WRONG:int = -1;
		public static const USER_NOT_EXISTS= -2;
		public static const USER_LEVEL_LOW= -3;
		public static const USER_MONEY_LOW= -4;
		public static const USER_CASH_LOW:int = -5;
		public static const TIME_NOT_ACHIEVE:int = -6;
		public static const CHIKASHU_ARCHIVE:int = -7;
		public static const YAOQIANSHU_END:int = -8;
		public static const INDEX_WRONG:int = -9;
		public static const TILI_FULL:int = -10;
		public static const CHANMIAN_FULL:int = -11;
		public static const INVALIED_OPER:int = -12;
		public static const NOT_RESOURCE=-13;
		public static const SERVER_INNER_ERROR:int = -14;
		public static const HANDLE_FAILED:int = -15;
		public static const REPEATED_OPER:int = -16;
		public static const MESSAGE_ERROR:int = -17;
		
		public static const FIGHT_COUNT_CRASH:int = -18;
		public static const BATTLE_USER_RANK_ERROR:int = -19;
		public static const BATTLE_LENGQUE_ZHONG:int = -20;
		
		public static const LEITAIBOX_TIME_NOT_ARCHIVE:int = -21;
		
		public static const PET_NOT_EXISTS:int = -22;
		
		public static const SKILL_NOT_EXISTS:int = -23;
		public static const FLAG_NOT_ENOUGH:int = -24;
		
		public static const BONUS_NOT_EXITS:int = -25;
		
		public static const KEY_NOT_ENOUGH:int = -26;
		
		public static const CANMAN_MAX:int = -27;
		
		public static const LINGQU_MAX:int = -28;
		
		
		public static const USE_TILI_ITEM_ARCHIVE:int = -30;
		public static const VIP_NOT_ARCHIVE:int = -30;
		
		public static const LEVEL_NOT_ARCHIVE:int = -31;
		
		public static const SHOULAN_NOT_ENOUGH:int = -32;
		
		public static const SHOULAN_LOCKED:int = -33;
		
		public static const ALREADY_UNLOCK:int = -34;
		public static const SHOUHUNDAN_NOT_ENOUGH:int = -35;
		public static const FRIEND_NOT_EXISTS:int = -36;
		public static const PET_NOT_IN_SHOULAN:int = -37;
		public static const ATTACH_COUNT_OVER:int = -38;
		public static const FREIEND_HAS_USED:int = -39;
		public static const YONGQI_BUY_LIMIT:int = -40;
		public static const VIP_ITEM_BUY_LIMIT:int = -41;
		public static const LINGQU_TIME_EROR:int =-42;
		
		/**  cdkey 错误
		 * */
		public static const CD_KEY_WRONG:int = -3040;

		
		/**  该 cdkey 已经被其他人领取了
		 * */
		public static const CDKEY_ALREADY_LINGQU:int =  -3041;

		/**  礼包错误
		 * */
		public static const LIBAO_NOT_EXISTS:int =  -3072;

		
		/** boss已经死亡
		 * */
		public static const BOSS_HASDIE:int=-58;
		
		/**  该轮已经结束
		 * */
		public static const BOSS_OUTOFTIME:int=-59;
		
		/**  boss 挑战cd中
		 * */
		public static const BOSS_TIAOZANCD:int=-62;
		
		/**  boss buff加满，无法再加
		 * */
		public static const BOSS_GUWUFAIL:int=-63;
			
			
		
		public static const NET_ERROR:int=int.MIN_VALUE;
		public static const SERVER_RESTART:int=int.MIN_VALUE+1;
		public static const AUTHOR_ERROR:int=int.MIN_VALUE+2;
		//***************************************登陆错误码*****************
		/**账号已经存在**/
		public static const ACCOUNT_ALREADY_EXISTS:int = -1001;
		
		/**devicetoken不存在**/
		public static const DEVICE_TOKEN_NOT_EXISTS:int = -1002;
		
		/**登陆时账号或者服务器错误**/
		public static const ACCOUNT_OR_ZONE_ERROR:int = -1003;
		
		/**用户名为空,或者账号和服务器id错误**/
		public static const PARAM_ERROR:int = -1004;
		
		/**用户名重复**/
		public static const USER_NAME_CONFLICT:int = -1005;
		
		/**用户不存在**/
		public static const USER_NOT_EXIST:int = -1006;
		
		/**账号不存在**/
		public static const ACCOUNT_NOT_EXISTS:int = -1007;
		/**密码错误**/
		public static const PASSWORD_ERROR:int = -1008;
		
		public static const HUODONG_XML_ERROR:int = -8008;
		
		public static const NOT_ALLOW:int = -3004;
		public static const ALREADY_LINGQU:int = -3042;

		
		
		public static const Error_ServerLogic:int=-999999;
		
		/** 失败 **/
		public static const CaozuoFailError:int=11;
	}
}