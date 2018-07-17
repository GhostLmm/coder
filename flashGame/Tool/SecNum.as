//Created by Action Script Viewer - http://www.buraks.com/asv
package Tool
{
    public class SecNum 
    {

        private var _o:Object;

        public function SecNum(_arg1:Object)
        {
            if ((_arg1 is String))
            {
                this.BadNum(0);
                return;
            };
            var _local2:int = (Math.random() * 99999);
            var _local3:Number = (int(_arg1) ^ _local2);
            var _local4:Number = ((_arg1 + (_local2 * 2)) ^ _local2);
            this._o = {
                s:_local2,
                n:_local4,
                x:_local3
            };
        }

        public function Set(_arg1:int):void
        {
            var _local2:int = (Math.random() * 99999);
            var _local3:Number = (_arg1 ^ _local2);
            var _local4:Number = ((_arg1 + (_local2 * 2)) ^ _local2);
            var _local5:Object = {
                s:_local2,
                n:_local4,
                x:_local3
            };
            this._o = null;
            this._o = _local5;
        }

        public function Add(_arg1:int):int
        {
            if ((_arg1 is String))
            {
                this.BadNum(1);
                return (0);
            };
            _arg1 = (_arg1 + this.Get());
            this.Set(_arg1);
            return (_arg1);
        }

        public function Get():int
        {
            var _local1:Number = (this._o.x ^ this._o.s);
            var _local2:Number = ((this._o.n ^ this._o.s) - (this._o.s * 2));
            if (_local1 == _local2)
            {
                return _local1;
            };
            this.BadNum(2);
            return (0);
        }

        public function BadNum(_arg1:int):void
        {
			
//            LOGGER.Log("err", ("SecNum" + _arg1));
//            GLOBAL.ErrorMessage("SecNum");
        }

		public function get value():int
		{
			return Get();
		}
    }
}//package com.cc.utils
