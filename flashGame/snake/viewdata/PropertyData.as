package snake.viewdata
{
	import com.fish.modules.core.models.tempData.EquipAttrAttach;

	public class PropertyData
	{
		public var atk:int=0;
		public var def:int=0;
		public var hp:int=0;
		public var cri:int=0;
		public var renxing:int=0;
		public var hit:int=0;
		public var eva:int=0;
		public var speed:int=0;
		public function PropertyData()
		{
		}
		
		public static function AddPropertyData(_A:PropertyData,_B:PropertyData):PropertyData
		{
			var result:PropertyData=new PropertyData(); 
			result.atk=_A.atk+_B.atk;
			result.def=_A.def+_B.def;
			result.hp=_A.hp+_B.hp;
			result.cri=_A.cri+_B.cri;
			result.renxing=_A.renxing+_B.renxing;
			result.hit=_A.hit+_B.hit;
			result.eva=_A.eva+_B.eva;
			result.speed=_A.speed+_B.speed;
			return result;
		}
		
		public static function SubPropertyData(_A:PropertyData,_B:PropertyData):PropertyData
		{
			var result:PropertyData=new PropertyData(); 
			result.atk=_A.atk-_B.atk;
			result.def=_A.def-_B.def;
			result.hp=_A.hp-_B.hp;
			result.cri=_A.cri-_B.cri;
			result.renxing=_A.renxing-_B.renxing;
			result.hit=_A.hit-_B.hit;
			result.eva=_A.eva-_B.eva;
			result.speed=_A.speed-_B.speed;
			return result;
		}
		
		
		public function toAttrMap():Object{
			var re:Object={};
			for each(var attr:String in EquipAttrAttach.AttrNames){
				if(this[attr]>0){
					re[attr]=this[attr];
				}
			}
			return re;
		}
	}
}