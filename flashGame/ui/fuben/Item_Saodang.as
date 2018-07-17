package ui.fuben
{
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.tempData.FubenBoxData;
	import com.fish.modules.core.models.tempData.SaodangData;
	import com.ghostlmm.lightMVC.Context;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	
	import ui.mc.JiangliMc;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	
	import util.Util;
	
	import view.Base_Item;

	public class Item_Saodang extends Base_Item implements IGridItemMax
	{
		private var _fnt_changci:FontField;
		private var _fnt_zhandouzhong:FontField;
		private var _mc_shengli_jiangli:MovieClip;
		private var _fnt_jieguo:FontField;
		private var _fnt_money:FontField;
		private var _fnt_exp:FontField;
//		private var _pos_jiangli1:Position;
//		private var _pos_jiangli2:Position;
//		private var _pos_jiangli3:Position;
		
		private var _pos_scroll_jiangli:Position;
		private var _src_jiangli:ScrollControllerMax;
		public function Item_Saodang()
		{
			super();
		}
		
		protected override function initModule():void
		{
			_fnt_changci=new FontField(itemMaterial.fnt_changci);
			_fnt_zhandouzhong=new FontField(itemMaterial.fnt_zhandouzhong);
			_mc_shengli_jiangli=itemMaterial.mc_shengli_jiangli;
			_fnt_jieguo=new FontField(_mc_shengli_jiangli.fnt_jieguo);
			_fnt_money=new FontField(_mc_shengli_jiangli.fnt_money);
			_fnt_exp=new FontField(_mc_shengli_jiangli.fnt_exp);
			_pos_scroll_jiangli=new Position(_mc_shengli_jiangli.pos_scroll_jiangli);
			_src_jiangli=new ScrollControllerMax(_pos_scroll_jiangli,ScrollControllerMax.HORIZONTAL);
			_src_jiangli.initClass(JiangliMc);
//			_pos_jiangli1=new Position(_mc_shengli_jiangli.pos_jiangli1);
//			_pos_jiangli2=new Position(_mc_shengli_jiangli.pos_jiangli2);
//			_pos_jiangli3=new Position(_mc_shengli_jiangli.pos_jiangli3);
		}
		
		public override function destory():void
		{
			stopShowWait();
			if(_fnt_changci) {_fnt_changci.destory();_fnt_changci=null;}
			if(_fnt_zhandouzhong) {_fnt_zhandouzhong.destory();_fnt_zhandouzhong=null;}
			if(_fnt_jieguo) {_fnt_jieguo.destory();_fnt_jieguo=null;}
			if(_fnt_money) {_fnt_money.destory();_fnt_money=null;}
			if(_fnt_exp) {_fnt_exp.destory();_fnt_exp=null;}
//			if(_pos_jiangli1) {_pos_jiangli1.destory();_pos_jiangli1=null;}
//			if(_pos_jiangli2) {_pos_jiangli2.destory();_pos_jiangli2=null;}
//			if(_pos_jiangli3) {_pos_jiangli3.destory();_pos_jiangli3=null;}
			_mc_shengli_jiangli=null;
			
			super.destory();
		}
		
		private var _num:int;
		public function set num(value:int):void
		{
			_num=value;
			if(_fnt_zhandouzhong==null) return ;
			var txt:String=Util.getLanguage("正在战斗中");
			for(var index:int=0; index<_num%6; index++){
				txt+=".";
			}
			_fnt_zhandouzhong.text=txt;
		}
		public function get num():int
		{
			return _num;
		}
		private function startShowWait():void
		{
			num=0;
			TweenLite.to(this,MDI_Saodang.SaodangWaitTime,{num:MDI_Saodang.SaodangWaitTime*10});
		}
		private function stopShowWait():void
		{
			TweenLite.killTweensOf(this);
		}
		
		public function set enable(value:Boolean):void
		{
		}
		
		public function get enable():Boolean
		{
			return false;
		}
		
		public function set selected(value:Boolean):void
		{
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		
		public function set index(value:int):void
		{
		}
		
		public function get index():int
		{
			return 0;
		}
		
		public override function loadData($data:Object):*
		{
			var wait:Boolean=$data.wait;
//			var copyData:FubenBoxData=$data.copyData;
			var changci:int=$data.changci;
			var result:Boolean=$data.result;
			
			_fnt_changci.text=Util.getLanguage("第n场战斗",changci);
			
			if(wait){
				startShowWait();
				_mc_shengli_jiangli.visible=false;
				_fnt_zhandouzhong.visible=true;
			}else{
				stopShowWait();
				_mc_shengli_jiangli.visible=true;
				_fnt_zhandouzhong.visible=false;
				
				setJieguoShow($data.saodang,result);
			}
			
			return null;
		}
		
		private function setJieguoShow(saodangData:SaodangData,result:Boolean):void
		{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			var index:int = 1;
//			for(;index<=3;index++) {
//				this["_pos_jiangli"+index].removeChildren();
//			}
			trace("扫荡\t"+saodangData.index+":"+saodangData.rewardArray.length+"/"+result);
			if(result){
				_fnt_exp.text = saodangData.node.reward_exp.toString();
				_fnt_money.text = saodangData.node.reward_money.toString();
				
				_src_jiangli.setData(saodangData.rewardArray);
				
//				for( index=0; index<3; index++) {
//					if(saodangData.rewardArray.length>index){
//						this["_pos_jiangli"+(index+1)].fillWithObject(new JiangliMc().loadData(saodangData.rewardArray[index]));
//					}
//				}
				
//				if(1==copyData.copyVo.dropCard)
//				{
//					this["_pos_jiangli"+index].fillWithObject(new JiangliMc().loadData({"key":"card","xid":copyData.node.drop_card}));
//					index++;
//				}
//				if(1==copyData.copyVo.dropCash)
//				{
//					this["_pos_jiangli"+index].fillWithObject(new JiangliMc().loadData({"key":"cash","num":copyData.node.drop_cash}));
//					index++;
//				}
//				if(1==copyData.copyVo.dropItem)
//				{
//					this["_pos_jiangli"+index].fillWithObject(new JiangliMc().loadData({"key":"item","xid":copyData.node.drop_item,"num":1}));
//					index++;
//				}
				_fnt_jieguo.text=Util.getLanguage("战斗胜利");
			}else{
				_fnt_jieguo.text=Util.getLanguage("战斗失败");
//				var shibaiModules:Number=MapModel.getShibaiModulus();
//				_fnt_exp.text = int(copyData.node.reward_exp*shibaiModules).toString();
//				_fnt_money.text = int(copyData.node.reward_money*shibaiModules).toString();
			}
			
		}
		
		public function get data():Object
		{
			return null;
		}
		
		public function enterMovie():*
		{
			return null;
		}
		
		protected override function get itemClassName():Class
		{
			return (AssetManager.getAssetClass("ItemSaodang") as Class); 
		}
		private function get itemMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
	}
}
