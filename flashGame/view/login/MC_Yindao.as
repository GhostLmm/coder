package view.login
{
	import flash.display.MovieClip;
	
	import ui.widget.Position;
	
	import view.Base_Mc;
	public class MC_Yindao extends Base_Mc
	{
		private var _pos_desc_image:Position;
		private var _pos_kapai_image:Position;
		
		public function MC_Yindao()
		{
			super();
		}
		protected override function initModule():void
		{
			_pos_desc_image = new Position(mcMaterial.pos_desc_image);
			_pos_kapai_image = new Position(mcMaterial.pos_kapai_image);
			this.mouseChildren=false;
		}
		public override function destory():void
		{
			if(_pos_desc_image){_pos_desc_image.destory();_pos_desc_image=null};
			if(_pos_kapai_image){_pos_kapai_image.destory();_pos_kapai_image=null};
			super.destory();
		}
		protected override function setShow():void
		{
		
		}
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("McYindao") as Class); 
		}
		private function get mcMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		public function setData(_data:Object):void
		{
			m_data=_data;
			setShow();
		}

	}
}
