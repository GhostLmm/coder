package snake.module
{
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import snake.GameCanvas;
	import snake.GameManager;
	
	import util.Dict;

	public class DamageUtil
	{
		public static const R:Number=50;
		public static var damageDic:Dict=new Dict();
		public static var damageNumDic:Dict=new Dict();
		
		public function DamageUtil()
		{
		}
		/**
		 *  显示伤害
		 */
		public static function showDamage(_x:Number,_y:Number,_damage:Number,_enemy:Object,_isBaoji:Boolean=false,_isShanbi:Boolean=false):void
		{
			var canvas:GameCanvas=GameManager.manager.canvas;
			var startX:Number=_x;
			var startY:Number=_y-100;
			var targetPos:Point=computeTargetPos(startX,startY,_enemy);
			var targetX:Number=targetPos.x;
			var targetY:Number=targetPos.y;
			var data:DamageData=new DamageData(startX,startY,targetX,targetY,_damage,_isBaoji,_isShanbi);
			addToDic(data,_enemy);
			TweenLite.delayedCall(DamageData.DuringTime,removeDamage,[data,_enemy]);			
		}
		public static function computeTargetPos(_x:Number,_y:Number,_enemy:Object):Point
		{
			var result:Point=new Point(_x,_y);
			var areadyNum:int=0;
			if(null!=damageNumDic)
			{
				if(damageNumDic[_enemy])
				{
					areadyNum=damageNumDic[_enemy];
				}
			}
			var al:Number=90/180*Math.PI;
			if(areadyNum>0)
			{
				al=180*Math.random()/180*Math.PI;
			}
			result.x+=R*Math.cos(al);
			result.y+=-R*Math.sin(al);
			return result;
		}
		public static function removeDamage(_data:DamageData,_enemy:Object):void
		{
			removeFromDic(_data,_enemy);
		}
		public static function addToDic(_data:DamageData,_enemy:Object):void
		{
			if(null==damageDic)
			{
				damageDic=new Dict();
			}
			damageDic[_data]=_data;
			
			if(null==damageNumDic)
			{
				damageNumDic=new Dict();
			}
			if(null==damageNumDic[_enemy])
			{
				damageNumDic[_enemy]=0;
			}
			damageNumDic[_enemy]++;
		}
		public static function removeFromDic(_data:DamageData,_enemy:Object):void
		{
			if(null==damageDic)
			{
				return;
			}
			if(damageDic[_data])
			{
				delete damageDic[_data];
			}
			_data.destroy();
			_data=null;
			
			if(null==damageNumDic)
			{
				return;
			}
			if(damageNumDic[_enemy])
			{
				damageNumDic[_enemy]--;
				if(damageNumDic[_enemy]<=0)
				{
					delete damageNumDic[_enemy];
				}
			}
		}
		
		public static function render():void
		{
			if(null==damageDic)
			{
				return;
			}
			var canvas:GameCanvas=GameManager.manager.canvas;
			var trans:Matrix=new Matrix();
			for each(var data:DamageData in damageDic)
			{	
//				trans.createBox(1, 1,0, data.posX, data.posY);
//				canvas.bm.draw(data.mc as DisplayObject,trans);
				var tempPoint:Point=new Point(data.posX,data.posY);
				canvas.bm.copyPixels(data.mc._bitdata,data.mc._bitdata.rect,tempPoint,null,null,true);
			}
		}
		public static function removeAll():void
		{
			if(null!=damageDic)
			{
				for each(var damage:* in damageDic)
				{
					delete damageDic[damage];
					damage.destroy();
					damage=null;
				}
				damageDic=null;
			}
			if(null!=damageNumDic)
			{
				for each(var enemy:* in damageNumDic)
				{
					delete damageNumDic[enemy];
				}
				damageNumDic=null;
			}
		}
	}
}