package core.event
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	public class TqtEvent extends Event
	{
		// TOUCH
		public static var TOUCH_BEGIN:String = flash.events.MouseEvent.MOUSE_DOWN;
		public static var TOUCH_END:String = flash.events.MouseEvent.MOUSE_UP;
		public static var TOUCH_MOVE:String = flash.events.MouseEvent.MOUSE_MOVE;
		public static var TOUCH_OUT:String = flash.events.MouseEvent.MOUSE_OUT;
		public static var TOUCH_OVER:String = flash.events.MouseEvent.MOUSE_OVER;
		public static var TOUCH_ROLL_OUT:String = flash.events.MouseEvent.ROLL_OUT;
		public static var TOUCH_ROLL_OVER:String = flash.events.MouseEvent.ROLL_OVER;
		public static var TOUCH_TAP:String = flash.events.MouseEvent.CLICK;
		// XML
		public static const XML_TOTAL_NUMBER:String = "tqt_xml_total_number";
		public static const XML_LOAD_ONE:String = "tqt_xml_load_one";
		public static const XML_LOAD_COMPLETE:String = "tqt_xml_load_complete";
		// TICKER
		public static const TICKER_FRAME:String = "tqt_ticker_frame";
		public static const TICKER_SECOND:String = "tqt_ticker_second";
		public static const TICKER_TIMEUP:String = "tqt_ticker_timeup";
		// NETWORK
		public static const NETWORK_PROGRESS:String = "tqt_network_progress";
		public static const NETWORK_COMPLETE:String = "tqt_network_complete";
		public static const NETWORK_ERROR_404:String = "tqt_network_error_404";
		public static const NETWORK_ERROR:String = "tqt_network_error";
		// DB
		public static const DB_DATA_RECEIVE:String = "tqt_db_data_receive";
		// SERVER
		public static const SERVER_DATA_RECEIVE:String = "tqt_server_data_receive";
		public static const SERVER_ERROR_RECEIVE:String = "tqt_server_error_receive";
		public static const SERVER_ERROR_PARSE:String = "tqt_server_error_parse";
		public static const SERVER_ERROR_CODE:String = "tqt_server_error_code";
		// DATA
		public static const DATA_CHANGE:String = "tqt_data_change";
		public static const DATA_GET_KEY_ERROR:String = "tqt_data_get_key_error";
		// BUTTON
		public static const BUTTON_CLICK:String = "tqt_button_click";
		public static const BUTTON_CLICK_DISABLE:String = "tqt_button_click_disable";
		public static const BUTTON_TA_SELECT:String="tqt_button_tab_select";
		// WINDOW
		public static const WINDOW_CLOSE:String = "tqt_window_close";
		// ALERT
		public static const ALERT_OK:String = "tqt_alert_ok";
		public static const ALERT_CANCEL:String = "tqt_alert_cancel";
		// MODEL
		public static const MODEL_CREATE:String = "tqt_model_create";
		public static const MODEL_UPDATE:String = "tqt_model_update";
		public static const MODEL_DELETE:String = "tqt_model_delete";
		// TAB
		public static const TAB_SELECT:String = "tqt_tab_select";
		// MC
		public static const MC_ADD_TO_STAGE:String = "tqt_mc_add_to_stage";
		// PLATFORM
		public static const PLATFORM_LOGIN:String = "tqt_platform_login";
		public static const PLATFORM_LOGOUT:String = "tqt_platform_logout";
		public static const PLATFORM_PAY_COMPLETE:String = "tqt_platform_pay_complete";
		// CUSTOM
		public static const CUSTOM:String = "tqt_custom";
		
		public static const SCROLL_SELECTED:String="scroll_select";
		public static const SCROLL_TAP:String="scroll_tap";
		
		private var _data:*;
		
		public static function init():void{
			if(DeviceType.isOnPC){
				TOUCH_BEGIN = flash.events.MouseEvent.MOUSE_DOWN;
				TOUCH_END = flash.events.MouseEvent.MOUSE_UP;
				TOUCH_MOVE = flash.events.MouseEvent.MOUSE_MOVE;
				TOUCH_OUT = flash.events.MouseEvent.MOUSE_OUT;
				TOUCH_OVER = flash.events.MouseEvent.MOUSE_OVER;
				TOUCH_ROLL_OUT = flash.events.MouseEvent.ROLL_OUT;
				TOUCH_ROLL_OVER = flash.events.MouseEvent.ROLL_OVER;
				TOUCH_TAP = flash.events.MouseEvent.CLICK;
			}else{
				TOUCH_BEGIN = TouchEvent.TOUCH_BEGIN;
				TOUCH_END = TouchEvent.TOUCH_END;
				TOUCH_MOVE = TouchEvent.TOUCH_MOVE;
				TOUCH_OUT =TouchEvent.TOUCH_OUT;
				TOUCH_OVER = TouchEvent.TOUCH_OVER;
				TOUCH_ROLL_OUT = TouchEvent.TOUCH_ROLL_OUT
				TOUCH_ROLL_OVER = TouchEvent.TOUCH_ROLL_OVER;
				TOUCH_TAP = TouchEvent.TOUCH_TAP;
			}
		}
		public function TqtEvent(type:String, data:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_data = data;
			super(type, bubbles, cancelable);
		}

		public function get data():*
		{
			return _data;
		}

	}
}