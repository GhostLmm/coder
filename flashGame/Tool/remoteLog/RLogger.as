package Tool.remoteLog
{
	import com.junkbyte.console.Cc;

	public class RLogger
	{
		public function RLogger()
		{
		}
		private var initFlag:Boolean=false;
		public function log(text:String):void{
			try{
				if(initFlag==false){
					//				Cc.config.style.backgroundAlpha = 1;
					
					//				Cc.startOnStage(this, "`"); // "`" - change for password. This will start hidden
					Cc.visible = false; // Show console, because having password hides console.
					
					Cc.config.commandLineAllowed = false; // enable advanced (but security risk) features.
					Cc.config.tracing = true; // Also trace on flash's normal trace
					Cc.config.remotingPassword = ""; // Just so that remote don't ask for password
					Cc.remoting = true; // Start sending logs to remote (using LocalConnection)
					
					Cc.commandLine = false; // Show command line
					
					Cc.remotingSocket(GhostLog.serverHost,GhostLog.serverPort);
					initFlag=true;
				}
				
				Cc.log(text);
				
			}catch(e:Error){
				
			}

			
		}
	}
}