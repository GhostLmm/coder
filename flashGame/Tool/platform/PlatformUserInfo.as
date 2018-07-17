package Tool.platform
{
	import flash.utils.Dictionary;

	/**   平台的信息
	 * */
	public class PlatformUserInfo
	{
		public function PlatformUserInfo()
		{
		}
		
		public var platGetPhotoFn:Function;
		
		/**  获取平台头像
		 * */
		public function getPlatPhotoUrl(platId:String):String
		{
			if(platGetPhotoFn!=null)
			{
				return platGetPhotoFn(platId);
			}
			return "";
		}
		
		
		/**  是否支持平台头像
		 * */
		public var suportPlatHeadpic:Boolean=false;
		
		/** 是否支持平台的用户名称
		 * */
		public var suportPlatUsername:Boolean=false;
		
		/**  是否支持平台的好友信息
		 * */
		public var suportPlatFriendInfo:Boolean=false;
		
		/**  用户好友信息
		 * */
		public var friendsArray:Array=[];
		
		
		/**  平台的用户名称
		 * */
		public var platUserName:String="";
		
		/**  平台的id
		 * */
		public var platOpenId:String="";
		
		/**  平台头像url
		 * */
		public var headPicUrl:String="";
		
		public var createPlatPicUrl:Function;
		
		/**  获取平台的头像
		 * */
		public function getPlatHeadPicUrl(openId:String):String
		{
			if(createPlatPicUrl!=null)
			{
				return createPlatPicUrl(openId);
			}
			return "";
		}
		
		internal var tempFriends:Dictionary;
		
		internal function setPlatFrieds(friends:Array):void
		{
			friendsArray=[];
			for each(var data:Object in friends)
			{

				if(data.gid==null || data.gid=="")
				{
					continue ;
				}
				if(tempFriends && tempFriends[data.id]!=null)
				{
					data.pic=tempFriends[data.id].figureurl_2;
				}
				friendsArray.push(data);
			}
		}
		
	}
}