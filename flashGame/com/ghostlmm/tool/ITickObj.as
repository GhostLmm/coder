package com.ghostlmm.tool
{
	public interface ITickObj
	{
		function update(interval:Number):void;
		function get tickActive():Boolean;
		function get tickId():int;
	}
}