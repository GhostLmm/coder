package com.ghostlmm.tool.shakeMovement
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	public class ArrayObject
	{
		/**
		 * 检测数组中是否存在相应的元素
		 * @param ary
		 * @param rest
		 * @return 索引，-1没有搜索到， -2传进来的并非索引, -3传近来的索引有问题
		 * 
		 */
		public static function isIndex(array:Array, value:*, ...rest):int{
			//值
			var result:int = -1;
			var select:Array;
			var memory:*;
			var index:Number;
			var seach:Array = rest;
			var indexSeach:Number;
			//遍历初级数组
			for(index = 0; index < array.length; index++)
			{
				//为选择数组赋值
				select = array[index];
				//按层次剥离数组
				for(indexSeach = 0; indexSeach < seach.length; indexSeach ++)
				{
					//剥离到最后一项为存储对象复制
					if(seach.length != indexSeach + 1)
						select = select[seach[indexSeach]];
					else
						memory = select[seach[indexSeach]];
				}
				//判断是否相等
				switch(true)
				{
					//如果是数组
					case value is Array:
						if(value.toString() == memory.toString())
							result = index;
					break;
					//如果不是数组
					default:
						if(value == memory)
							result = index;
					break;
				}
				//判断返回值是否被赋值
				if(-1 != result)
					break;
			}
			
			
			
			return result;
		}
		
	}
}