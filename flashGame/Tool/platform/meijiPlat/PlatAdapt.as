package Tool.platform.meijiPlat
{

	import flash.system.ApplicationDomain;
	
	import Tool.platform.IPlatform;


	public class PlatAdapt
	{	
		private static var plat:IMJPlatform;
		
		CONFIG::UseSwf{
			private static var clsDic:Object={
				"test":"MJPlat_Union_Test",
				"hwand":"MJPlat_Huawei_Android",
				"opand":"MJPlat_Oppo_Android",
				"dland":"MJPlat_Dangle_Android",
				"ucand":"MJPlat_UC_Android",
				"azand":"MJPlat_Anzhi_Android",
				"wdjand":"MJPlat_Wandoijia_Android",
				"xmand":"MJPlat_Xiaomi_Android",
				"dkand":"MJPlat_Duoku_Android",
				"lenand":"MJPlat_Lenovo_Android",
				"4399and":"MJPlat_4399_Andriod",
				"360":"MJPlat_360_Android",
				"ali":"MJPlat_Union_Ali"
					
			};
		}
		
		public static function createPlatform():IMJPlatform
		{
			CONFIG::UseSwf{
				if(SwitchConfig.ST_RemoteLoad){
					
					try{
						MJPlat_Union_Test;
					}catch(e:Error){}
					try{
						MJPlat_Huawei_Android;
					}catch(e:Error){}
					try{
						MJPlat_Oppo_Android;
					}catch(e:Error){}
					try{
						MJPlat_Dangle_Android;
					}catch(e:Error){}
					try{
						MJPlat_UC_Android;
					}catch(e:Error){}
					try{
						MJPlat_Anzhi_Android;
					}catch(e:Error){}
					try{
						MJPlat_Wandoijia_Android;
					}catch(e:Error){}
					try{
						MJPlat_Xiaomi_Android;
					}catch(e:Error){}
					try{
						MJPlat_Duoku_Android;
					}catch(e:Error){}
					try{
						MJPlat_Lenovo_Android;
					}catch(e:Error){}
					try{
						MJPlat_4399_Andriod;
					}catch(e:Error){}
					try{
						MJPlat_360_Android;
					}catch(e:Error){}
					try{
						MJPlat_Union_Ali;
					}catch(e:Error){}
					
					
					var platName:String=GameArgRefelect.PlatName;
//					platName="test";
					var className:String="Tool.platform.meijiPlat."+clsDic[platName];
					trace("platClassName: "+className);
					var cls:Class=ApplicationDomain.currentDomain.getDefinition(className) as Class;
//					var cls:Class=ApplicationDomain.currentDomain.getDefinition("Tool.platform.meijiPlat.MJPlat_Union_Test") as Class;
					if(platName){
						return new (cls) ();
					}
				}
			}
//			plat = new MJPlat_PP_IOS();
//			plat=new MJPlat_Appstore_Union();
//			plat=new MJPlat_Lengjin_Android();
//			plat=new MJPlat_Union_Ali;
//			plat=new MJPlat_Union_Register;
			plat=new MJPlat_Union_Test;
//			plat=new MJPlat_4399_Andriod;
//			plat=new MJPlat_Oppo_Android;
//			plat=new MJPlat_UC_Android;
//			plat=new MJPlat_Anzhi_Android;
//			plat=new MJPlat_Xiaomi_Android;
//			plat=new MJPlat_Dangle_Android;
//			plat=new MJPlat_Huawei_Android;
//			plat=new MJPlat_Dangle_Android
//			plat=new MJPlat_360_Android;
//			plat=new MJPlat_Huawei_Android;
//			plat=new MJPlat_Duoku_Android;
//			plat=new MJPlat_Wandoijia_Android;
		
			return plat;
		}

	}
}