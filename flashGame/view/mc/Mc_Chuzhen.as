package view.mc
{
	import com.fish.modules.core.models.CardData;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	
	
	import ui.widget.FontField;
	import ui.widget.Position;
	
	import view.Base_Mc;
	
import flash.display.MovieClip
	public class Mc_Chuzhen extends Base_Mc
	{
		private var _pos_touxiang:Position;
		private var _pos_touxiangkuang:Position;
		private var _fnt_level:FontField;
		
		public function Mc_Chuzhen()
		{
			super();
			_pos_touxiang = new Position(mcMaterial.pos_touxiang);
			_pos_touxiangkuang = new Position(mcMaterial.pos_touxiangkuang);
			_fnt_level = new FontField(mcMaterial.fnt_lv);
		
		}
		public override function destory():void
		{
			if(_pos_touxiang){_pos_touxiang.destory();_pos_touxiang=null;};
			if(_pos_touxiangkuang){_pos_touxiangkuang.destory();_pos_touxiangkuang=null;};
			if(_fnt_level){_fnt_level.destory();_fnt_level=null;};
			super.destory();
		}
		public function setData(_data:Object):void
		{
			m_data=_data;
			setShow();
		}
		protected override function setShow():void
		{
			var isLock:Boolean=m_data["isLock"];
			var isVisible:Boolean=m_data["isVisible"];
			var cardData:CardData=m_data["cardData"];
			var posId:int=m_data["posId"];
			if(isLock)
			{
				var userData:UserModel=Context.getInjectInstance(UserModel);
				_fnt_level.text=userData.getUnLockLevelByPosId(posId).toString()+"级";
				if(isVisible)
				{
					this.visible=true;
					_pos_touxiang.visible=false;
					_pos_touxiangkuang.visible=false;
					mcMaterial.mc_suozi.visible=true;
					_fnt_level.visible=true;
				}
				else
				{
					this.visible=false;
				}
			}
			else
			{
				this.visible=true;
				if(null!=cardData)
				{
					_pos_touxiang.visible=true;
					_pos_touxiangkuang.visible=true;
					mcMaterial.mc_suozi.visible=false;
					_fnt_level.visible=false;
					_pos_touxiang.fillWithBitmapByClassName(cardData.cardXml.kapai_touxiang);
					_pos_touxiangkuang.fillWithBitmapByClassName(cardData.cardXml.kapai_touxiangkuang);
				}
				else
				{
					_pos_touxiang.visible=false;
					_pos_touxiangkuang.visible=false;
					mcMaterial.mc_suozi.visible=false;
					_fnt_level.visible=false;
				}
			}
		}
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("ItemChuzhen") as Class); 
		}
		private function get mcMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
	}
}
