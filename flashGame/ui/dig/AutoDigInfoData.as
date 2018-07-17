package ui.dig
{
	import com.fish.modules.core.gameVO.DiginfoVO;
	import com.fish.modules.core.models.tempData.EquipPingzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.text.TextFieldAutoSize;
	import flash.utils.Dictionary;
	
	import ui.widget.TextTipData;
	
	import util.Util;

	public class AutoDigInfoData
	{
		public function AutoDigInfoData()
		{
		}
		
		public var digTime:int;
		public var money:int;
		public var exp:int;
		public var equipInfos:Array;
		
		
		
		public function initFromVo(vo:DiginfoVO):void{
			var GetDic:Dictionary=new Dictionary();
			var SellDic:Dictionary=new Dictionary();
			
			var star:int;
			for(star=1; star<=EquipPingzhi.TypeNum; star++){
				GetDic[star]=0;
				SellDic[star]=0;
			}
			
			digTime=vo.guajiDigTime;
			money=vo.guajiDigMoney;
			exp=vo.guajiDigExp;
			
			var bagEquipMap:Object=JSON.parse(vo.guajiDigEquips);
			var sellEquipMap:Object=JSON.parse(vo.guajiDigSellEquips);
			
			var key:String;
			for(key in bagEquipMap){
				star=XMLDataManager.getEquipById(int(key)).star;
				GetDic[star]+=bagEquipMap[key];
			}
			for(key in sellEquipMap){
				star=XMLDataManager.getEquipById(int(key)).star;
				GetDic[star]+=sellEquipMap[key];
				SellDic[star]+=sellEquipMap[key];
			}
			
			equipInfos=[];
			
			for(star=1; star<=EquipPingzhi.TypeNum; star++){
				if(GetDic[star]>0){
					var textTip:TextTipData=new TextTipData();
					var equipPingzhi:EquipPingzhi=EquipPingzhi.getEquipPingzhiByStar(star);
					if(SellDic[star]>0){
						textTip.text=Util.getLanguage("自动挖矿结算提示带售出",equipPingzhi.name,GetDic[star],SellDic[star]);
					}else{
						textTip.text=Util.getLanguage("自动挖矿结算提示无售出",equipPingzhi.name,GetDic[star]);
					}
					textTip.color=equipPingzhi.color;
					textTip.autoSize=TextFieldAutoSize.LEFT;
					equipInfos.push(textTip);
				}
			}
		}
	}
}