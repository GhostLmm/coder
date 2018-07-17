package Tool.chongzhiCheck
{
	import Tool.PersistentObj;
	

	public class ChongzhiCheckManager
	{	
		public static const MaxTryAgain:int=3;
		private static var _instance:ChongzhiCheckManager;
		
		public static function get instance():ChongzhiCheckManager
		{
			if(_instance==null) _instance=new ChongzhiCheckManager();
			return _instance;
		}
		
		private static const PerisistentPath:String="redwar.chongzhi";
		private var persistentObj:PersistentObj;
		
		internal var checkBackUrl:String;
		
		private var postPerFlag:Boolean=false;
		
		public function ChongzhiCheckManager()
		{
			persistentObj=new PersistentObj(PerisistentPath);
		}
		
		public function setCheckBackUrl(url:String):void
		{
			checkBackUrl=url;
		}
		
		/**   发送以前的充值数据
		 * */
		public function startPostPerChongzhi():void
		{
			if(postPerFlag)
				return ;
			//
			
			if(checkBackUrl==null){
				return ;
			}
			
			var keyArray:Array=persistentObj.getKeyArray();
			for each(var key:String in keyArray)
			{
				var data:Object=persistentObj.getValueByKey(key);
				var item:CheckItem=new CheckItem();
				item.initFromObj(data,key);
				item.startCheck();
			}
			
			postPerFlag=true;
		}
		
		/**   添加 检测的check
		 * */
		public function addCheckData(postArg:Object):void
		{
			var date:Date=new Date();
			var key:String=date.time.toString()+"_"+Math.random().toString();
			
			postArg.tryAgain=MaxTryAgain;
			
			var item:CheckItem=new CheckItem();
			item.initData(postArg,key);
			persistentObj.setVaule(key,item.turnToObj());
			
			if(checkBackUrl==null){
				return ;
			}
			
			item.startCheck();
			
		}
		
		internal function updataItem(item:CheckItem):void{
			persistentObj.deleteKey(item.key);
			persistentObj.setVaule(item.key,item.turnToObj());
		}
		
		internal function killItem(item:CheckItem):void
		{
//			Wnd_Chongzhi_New.stopWaitForBuy();
			persistentObj.deleteKey(item.key);
			if(!item.repeatVerify && _handleFn!=null)
			{
				_handleFn(item);
			}
		}
		
		private var _handleFn:Function;
		public function setProccessHandle(fn:Function):void
		{
			_handleFn=fn;
		}
		
	}
}