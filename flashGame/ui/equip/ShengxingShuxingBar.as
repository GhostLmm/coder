package ui.equip
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.tempData.EquipAttrAttach;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	import r1.deval.D;
	
	import ui.widget.FontField;
	import ui.widget.ImageBitmap;
	import ui.widget.Position;
	
	import util.Util;

	public class ShengxingShuxingBar
	{
		private var mc:MovieClip;
//		private var _pos_star:Position;
		private var _attrFontArray:Array;
		
		private var _fnt_num:FontField;
		
		
		public function ShengxingShuxingBar($mc:MovieClip)
		{
			mc=$mc;
//			_pos_star=new Position(mc.pos_star);
			_fnt_num=new FontField(mc.fnt_num);
			_attrFontArray=[];
			for (var index:int=1; index<=2; index++){
				var ft:FontField=new FontField(mc["fnt_shuxing"+index+"_1"]);
				_attrFontArray.push(ft);
			}
		}
		
		public function destory():void{
//			if(_pos_star) {_pos_star.destory();_pos_star=null;}
			if(_fnt_num) {_fnt_num.destory();_fnt_num=null;}
			if(_attrFontArray){
				for each(var ft:FontField in _attrFontArray){
					ft.destory();
				}
				_attrFontArray=null;
			}
		}
		public function setVisible(value:Boolean):void
		{
			mc.visible=value;
		}
		
		public function loadData(lv:int,gid:int,equipNode:Node_equip):void{
			
			var stars:Array=calcShowArray(lv);
			/*_pos_star.removeChildren();
			var startX:Number=(_pos_star.rect.width-stars.length*starWidth)/2+_pos_star.rect.x;
			var startY:Number=_pos_star.rect.y;
			for (var index:int=0; index<stars.length; index++){
				var img:ImageBitmap=new ImageBitmap("img_shengxing"+stars[index]);
				img.x=startX+index*starWidth;
				img.y=startY;
				_pos_star.addChild(img);
			}*/
			_fnt_num.text=Util.getLanguage("升星等级显示",XMLDataManager.getEquip_typeById(equipNode.type).name,lv);
			
			var attrArray:Array=EquipAttrAttach.getAttrArray(ResourceConst.R_item,equipNode.id);
			for (var index:int=0; index<2; index++){
				var tf:FontField=_attrFontArray[index];
				if(attrArray.length>index){
					var attr:String=attrArray[index];
					var exp:String=XMLDataManager.getExpressionById("equip_star_"+attr).expression;
					var obj:Object={};
					obj.equip_star=lv;
					obj["equip_"+attr]=equipNode[attr];
					var addValue:int=D.evalToInt(exp,obj);
					tf.text=Util.getLanguageAttrAdd(attr,addValue);
					tf.visible=true;
				}else{
					tf.visible=false;
				}
			}
			
		}
		
		private function calcShowArray(lv:int):Array{
			var re:Array=[];
			var scale:int=4;
			var type:int=1;
			
			for ( type=1; type<=5; type++){
				var num:int=lv%scale;
				for(var index:int=0; index<num; index++){
					re.push(type);
				}
				lv=int(lv/scale);
			}
			
			return re.reverse();
		}
	}
}