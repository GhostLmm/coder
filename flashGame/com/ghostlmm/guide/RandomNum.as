package com.ghostlmm.guide
{
	import flash.utils.Dictionary;

	public class RandomNum
	{
		
		private var total:Number=0;
		private var keyArray:Array=[];
		private var regionArray:Array=[];
		private var rndArray:Array=[];
		
		public function RandomNum()
		{
		}
		
		public function addType(type:*,value:Number,region:Array):void{
			keyArray.push(type);
			regionArray.push(region);
			rndArray.push(value);
			total+=value;
		}
		
		public function createRandomType():Array{
			var rnd:Number=Math.random()*total;
			var t:Number=0;
			var index:int=0;
			for (; index<keyArray.length; index++){
				t+=rndArray[index];
				if(rnd<t){
					break ;
				}
			}
			
			var re:Array=[];
			re.push(keyArray[index]);
			
			var region:Array=regionArray[index];
			re.push(Math.random()*(region[1]-region[0])+region[0]);
			return re;
			
		}
		
	}
}