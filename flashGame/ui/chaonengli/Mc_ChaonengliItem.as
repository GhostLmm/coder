package ui.chaonengli
{
	import com.fish.modules.core.models.ChaonengliModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_chaonengli;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import ui.widget.FontField;
	import ui.widget.ImageBitmap;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Mc;
	
	public class Mc_ChaonengliItem extends Base_Mc
	{
		public var _fnt_skill_name:FontField;
		
		public var _mc_skill_pos:Position;
		
		public var _mc_kuang_color:MovieClip;
		public var _mc_bg_color:MovieClip;
		
		private var chaonengliModel:ChaonengliModel;
		
		private var _mc_zhezhao:MovieClip;
		private var _mc_faguang:MovieClip;
				
		public function Mc_ChaonengliItem()
		{
			super();
		}
		protected override function initModule():void
		{
			chaonengliModel=Context.getInjectInstance(ChaonengliModel);
			mcMaterial.stop();
			_fnt_skill_name=new FontField(mcMaterial.fnt_skill_name);
			_mc_skill_pos=new Position(mcMaterial.mc_skill_pos);
			_mc_kuang_color=mcMaterial.mc_kuang_color;
			_mc_bg_color=mcMaterial.mc_bg_color;
			_mc_zhezhao=mcMaterial.mc_zhezhao;
			_mc_faguang=mcMaterial.mc_faguang;
			mcMaterial.mouseChildren=false;
			Util.setDiaplayButtonEffect(mcMaterial,false);
		}
		private function destroyMc():void
		{
			if(_fnt_skill_name){_fnt_skill_name.destory();_fnt_skill_name=null;};
			if(_mc_skill_pos){_mc_skill_pos.destory();_mc_skill_pos=null;};
			if(_mc_kuang_color){_mc_kuang_color=null;};
			if(_mc_bg_color){_mc_bg_color=null;};
			if(_mc_zhezhao){_mc_zhezhao=null;};
			if(_mc_faguang){_mc_faguang=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(mcMaterial,TQTTouchEvent.TOUCH_TAP,onTap);
//			addTargetEvent(mcMaterial,TqtEvent.BUTTON_CLICK,onTap);
		}
		private function onTap(evt:Event):void
		{
			if(chaonengliModel.checkIfAreadyUnlocked(node.id))
			{
				WindowManager.openOnlyWinodw(Chaonengli_YiJiesuo_Window,node);
			}
			else
			{
				WindowManager.openOnlyWinodw(Chaonengli_WeiJiesuo_Window,node);
			}
		}
		public function setZhezhaoAndNameVisible(_zhezhaoValue:Boolean,_nameValue:Boolean):void
		{
			_mc_zhezhao.visible=_zhezhaoValue;
			_fnt_skill_name.visible=_nameValue;
		}
		protected override function setShow():void
		{
			_fnt_skill_name.text=node.name;
			_mc_kuang_color.gotoAndStop(node.color);
			_mc_bg_color.gotoAndStop(node.color);
			_mc_skill_pos.fillWithObject(new ImageBitmap(node.icon));
			
			if(node.type>chaonengliModel._chaonengliVo.currentType)
			{
				_mc_zhezhao.visible=true;
				_mc_faguang.visible=false;
				return;
			}			
			if(chaonengliModel.checkIfAreadyUnlocked(node.id))
			{
				_mc_zhezhao.visible=false;
				_mc_faguang.visible=false;
				return;
			}
			else
			{
				_mc_zhezhao.visible=true;
			}
			if(chaonengliModel.checkIfHasRelatedNengli(node))
			{
				_mc_faguang.visible=true;
			}
			else
			{
				_mc_faguang.visible=false;
			}
		}
		protected override function get mcClassName():Class
		{
			return mc_skilli_item;
		}
		public function setData($data:Object):void
		{
			m_data=$data;
			setShow();
		}
		private function get node():Node_chaonengli
		{
			return m_data as Node_chaonengli;
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
		private function get mcMaterial():mc_skilli_item
		{
			return m_mc as mc_skilli_item;
		}
	}
}