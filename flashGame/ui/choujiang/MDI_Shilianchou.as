package ui.choujiang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.ChoujiangModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_choujiang;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import com.greensock.plugins.FramePlugin;
	import com.greensock.plugins.TweenPlugin;
	
	import flash.events.Event;
	import flash.geom.Point;
	
	import core.event.TqtEvent;
	
	import ui.widget.ImageBitmap;
	import ui.widget.Position;
	
	import util.Dict;
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_Shilianchou extends Mediator
	{
		[Inject]
		public var window:ShilianshouWindow;
		
		private var choujiangType:String;
		
		public var xuanxiuModel:ChoujiangModel;
		
		public function MDI_Shilianchou()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
			setShow();
		}
		private function initModule():void
		{
			xuanxiuModel=Context.getInjectInstance(ChoujiangModel);
			choujiangType=window._params.type;
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_fanhui,TqtEvent.BUTTON_CLICK,onFanhuiClicked);
			addViewListener(window._btn_zaichouyici,TqtEvent.BUTTON_CLICK,onZaichouyiciClicked);
		}
		private function checkIfCouldClicked():Boolean
		{
			if(null==timeline)
			{
				return true;
			}
			if(!timeline.isActive())
			{
				return true;
			}
			return false;
		}
		private function onOptMessage(_mesType:String,_code:int):void
		{
			if(_code==1)
			{
				if(_mesType==C2SEmitter.REQ_HaixuanBatchChooseHandler)
				{
					showMovie();
				}
				else if(_mesType==C2SEmitter.REQ_JingxuanBatchChooseHandler)
				{
					showMovie();
				}
			}
		}
		private function onFanhuiClicked(evt:Event):void
		{
			if(checkIfCouldClicked())
			{
				window.close();
			}
		}
		private function onZaichouyiciClicked(evt:Event):void
		{
			if(!checkIfCouldClicked())
			{
				return;
			}
			if(choujiangType==ChoujiangModel.TP_Haixuan)
			{
				if(xuanxiuModel.hasInitVO())
				{
					showHaixuanShilianchou();
				}
				else
				{
					xuanxiuModel.initComplete_SN.addOnce(showHaixuanShilianchou);
					xuanxiuModel.init();
				}
			}
			else
			{
				if(xuanxiuModel.hasInitVO())
				{
					showJinxuanShilianchou();
				}
				else
				{
					xuanxiuModel.initComplete_SN.addOnce(showJinxuanShilianchou);
					xuanxiuModel.init();
				}
			}
		}
		private function showHaixuanShilianchou():void
		{
			var re:JudgeResult=xuanxiuModel.couldHaixuanShilian();
			if(re.success){
				C2SEmitter.choujiang_haixuan_shilian();
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		private function showJinxuanShilianchou():void
		{
			var re:JudgeResult=xuanxiuModel.couldJingxuanShilian();
			if(re.success){
				C2SEmitter.choujiang_jingxuan_shilian();			
			}else if(re.code==JudgeResult.CD_CashNotEnough){
				CommonControlFun.cashNotEnoughDo();
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		private function setShow():void
		{
			setCostShow();
			showMovie();
		}
		private static const DerTime:Number=0.4;
		private var timeline:TimelineLite;
		private var mcDic:Dict;
		private function showMovie():void
		{
			setVisible(false);
			clear();
			clearMovie();
			timeline=new TimelineLite();
			mcDic=new Dict();
			var idArray:Array=[];
			if(choujiangType==ChoujiangModel.TP_Haixuan)
			{
				idArray=JSON.parse(xuanxiuModel.choujiangVo.haixuanShilian) as Array;
			}
			else
			{
				idArray=JSON.parse(xuanxiuModel.choujiangVo.jingxuanShilian) as Array;
			}
			showBaoxiangMovie();
			var fenjieXids:Array=JSON.parse(xuanxiuModel.choujiangVo.fenjieXids) as Array;
			var index:int;
			for(index=1;index<=ShilianshouWindow.MaxNum;index++)
			{
				var node:Node_choujiang=XMLDataManager.getChoujiangById(idArray[index-1]);
				var position:Position=window.getPositionByIndex(index);
				var xyPos:Point=window.getXYPosByIndex(index);
				var itemMc:ChoujiangMovie=new ChoujiangMovie(node);
				itemMc.x=window._pos_baoxiang.rect.x+window._pos_baoxiang.rect.width/2;
				itemMc.y=window._pos_baoxiang.rect.y+window._pos_baoxiang.rect.height/2;
				itemMc.visible=false;
				window.addChild(itemMc);
				var isNeedFenjie:Boolean=false;
				var xidIndex:int=fenjieXids.indexOf(node.item_id);
				if(-1!=xidIndex)
				{
					isNeedFenjie=true;
					fenjieXids.splice(xidIndex,1);
				}
				var gunNode:Node_equip;
				if(isNeedFenjie)
				{
					gunNode=XMLDataManager.getEquipById(node.item_id);
				}
				timeline.append(new TweenLite(itemMc,DerTime,{onUpdate:function(_target:ChoujiangMovie):void{
					_target.visible=true;
				},onUpdateParams:[itemMc],
					x:xyPos.x,y:xyPos.y,rotatevalue:720,onComplete:function(_target:ChoujiangMovie,_fenjie:Boolean,_gunNode:Node_equip,_timeLine:TimelineLite):void
				{
					if(_fenjie)
					{
						_timeLine.pause();
						CommonControlFun.showChoujiangFenjie(_gunNode,_timeLine);
						_target.showSuipian();
					}
					_target.showTextFiled();
					},onCompleteParams:[itemMc,isNeedFenjie,gunNode,timeline]}));				
				mcDic[itemMc]=itemMc;
			}
			timeline.append(new TweenLite(this,DerTime,{onComplete:function():void{setVisible(true)}}));
			window.addChild(baoxiangMc);
		}
		private function setVisible(_value:Boolean):void
		{
			window._btn_fanhui.visible=_value;
			window._btn_zaichouyici.visible=_value;
			window._pos_cost.visible=_value;
			window._fnt_cost.visible=_value;
		}
		private var baoxiangMc:McBaoxiang2;
		private function showBaoxiangMovie():void
		{
			baoxiangMc=new McBaoxiang2();
			baoxiangMc.x=window._pos_baoxiang.rect.x;
			baoxiangMc.y=-GlobalRef.height/2-2*baoxiangMc.height;
			window.addChild(baoxiangMc);
			baoxiangMc.scaleX=1.5;
			baoxiangMc.scaleY=1.5;
			baoxiangMc.gotoAndStop(1);
			timeline.append(new TweenLite(baoxiangMc,DerTime,{y:0}));
			TweenPlugin.activate([FramePlugin]);
			timeline.append(new TweenLite(baoxiangMc,DerTime,{frame:baoxiangMc.totalFrames}));
			timeline.append(new TweenLite(baoxiangMc,DerTime,{y:window._pos_baoxiang.rect.y,scaleX:1,scaleY:1}));
		}
		private function clearMovie():void
		{
			if(timeline)
			{
				timeline.clear();
				timeline=null;
			}
		}
		private function clear():void
		{
			if(mcDic==null)
			{
				return;
			}			
			for each(var mc:ChoujiangMovie in mcDic)
			{
				if(window.contains(mc))
				{
					window.removeChild(mc);
				}
				mc.destroy();
				mc=null;
			}
			mcDic=null;
			if(baoxiangMc)
			{
				if(window.contains(baoxiangMc))
				{
					window.removeChild(baoxiangMc);
				}
				baoxiangMc=null;
			}
		}
		private function setCostShow():void
		{
			if(choujiangType==ChoujiangModel.TP_Haixuan)
			{
				window._pos_cost.fillWithObject(new ImageBitmap("image_ronglian"));
				window._fnt_cost.text=ChoujiangModel.Haixuan_shilianchouCost.toString();
			}
			else
			{
				window._pos_cost.fillWithObject(new ImageBitmap("icon_cash"));
				window._fnt_cost.text=ChoujiangModel.Cash_shilianchou.toString();
			}
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			clear();
			clearMovie();
			super.destroy();
		}
	}
}