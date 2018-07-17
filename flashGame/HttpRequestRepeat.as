package
{
	import com.ghostlmm.tool.HttpRequest;

	public class HttpRequestRepeat
	{
		public function HttpRequestRepeat()
		{
		}
		public static function getRequest(url:String, args:Object, handlerFun:Function, _needMasking:Boolean=false,repeatcount:int=3,timeout:uint = 60000, reload:Boolean = false, dataFormat:String = "text"):void{
			var callHandle:Function=function(data:String):void{
				var json:Object;
				try{
					json=JSON.parse(data);
					if(json.hasOwnProperty("code")){
						repeatcount--;
						if(repeatcount>0){
							getRequest(url,args,handlerFun,_needMasking,repeatcount,timeout,reload,dataFormat);
						}else{
							handlerFun(data);
						}
						
						return ;
					}else{
						handlerFun(data);
					}
				}catch(e:Error){
					if(json.hasOwnProperty("code")){
						repeatcount--;
						getRequest(url,args,handlerFun,_needMasking,repeatcount,timeout,reload,dataFormat);
						return ;
					}
				}
			};
			if(repeatcount>0){
				HttpRequest.getInstance().getRequest(url,args,callHandle,timeout,reload,dataFormat,_needMasking);
			}
			
		}
	}
}