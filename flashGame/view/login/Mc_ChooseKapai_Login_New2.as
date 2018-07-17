package view.login
{
	import com.ghostlmm.xmldata.Node_hero;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import Tool.account.AccountControl;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	
	import view.Base_Mc;

	public class Mc_ChooseKapai_Login_New2 extends Base_Mc
	{
		private var _btn_kaishi:Button;
		public function Mc_ChooseKapai_Login_New2()
		{
			super();
		}
		protected override function initModule():void
		{
			mcMaterial.x=GlobalRef.width/2;
			mcMaterial.y=GlobalRef.height/2;
			_btn_kaishi=new Button(mcMaterial.btn_kaishi);
		}
		
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_kaishi,TqtEvent.BUTTON_CLICK,onKaishiClicked);
			setShow();
		}
		private function onKaishiClicked(evt:Event):void
		{
			var heroArray:Array=XMLDataManager.Node_heroArray;
			var selectIndex:int=heroArray.length*Math.random();
			if(selectIndex>=heroArray.length)
			{
				selectIndex=heroArray.length-1;
			}
			var nodeHero:Node_hero=heroArray[selectIndex];
			AccountControl.getInstance().chooseHero(nodeHero);
		}
		
		protected override function setShow():void
		{
			
		}
		
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("SceneYindao2_new") as Class); 
		}
		private function get mcMaterial():flash.display.MovieClip
		{
			return m_mc as flash.display.MovieClip; 
		}

		public override function destory():void
		{
			
			super.destory();
		}
	}
}
