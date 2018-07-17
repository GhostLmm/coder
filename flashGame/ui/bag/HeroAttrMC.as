package ui.bag
{
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.LeitaiModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.utils.Dictionary;
	
	import ui.widget.FontField;
	
	import util.Util;
	
	import view.Base_Mc;
	
	public class HeroAttrMC extends Base_Mc
	{
		private var fntDic:Dictionary;
		private var _fnt_leitai:FontField;
		public function HeroAttrMC($mc:Object=null)
		{
			super($mc);
		}
		protected override function initModule():void{
			fntDic=new Dictionary();
			for each(var attr:String in Util.AllAttrNames){
				fntDic[attr]=new FontField(m_mc["fnt_"+attr]);
			}
			_fnt_leitai=new FontField(m_mc.fnt_leitai);
			
		}
		
		protected override function setShow():void{
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			for each(var key:String in Util.AllAttrNames){
				fntDic[key].text=heroModel["real_"+key]+"";
			}
			var leitaiModel:LeitaiModel=Context.getInjectInstance(LeitaiModel);
			_fnt_leitai.text=leitaiModel._leitaiVo.myRank+"";
		}
		
		protected override function get mcClassName():Class{
			return McXiangqingShuju;
		}
		
		public override function destory():void{
			if(fntDic){
				for each(var ft:FontField in fntDic){
					ft.destory();
				}
				fntDic=null;
			}
			if(_fnt_leitai) {_fnt_leitai.destory(); _fnt_leitai=null;}
			super.destory();
		}
	}
}