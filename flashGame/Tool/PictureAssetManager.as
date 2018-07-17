package Tool
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	

	
	public class PictureAssetManager
	{

		
		public static const Size_Big:String="3";
		public static const Size_Mid:String="2";
		public static const Size_Small:String="1";
		public static const Size_Null:String="null";
		private static var m_instance:PictureAssetManager;
		public static function getInstance():PictureAssetManager
		{
			if(m_instance==null)
			{
				m_instance=new PictureAssetManager();
			}
			return m_instance;
		}

		public function PictureAssetManager():void
		{
		}
		
		/**
		 *  计算使用资源图片大小，暂定35以上用middle，35以下用small
		 **/
		private function computeSizeOfResImg(_squareLength:Number):String
		{
			var result:String;
			if(_squareLength<=35)
			{
				result="small";
			}
			else
			{
				result="middle";
			}
			return result;
		}
		
		/**
		 *  直接提供URL 返回要加载的图片
		 **/
		public function getPicture(url:String,width:Number=40,height:Number=40):Bitmap
		{
			var bitmap:Bitmap=new Bitmap(null,"auto",true);
			MyLoadImage.addLoadCompleteFn(url,chageBitdata,[url,bitmap,width,height]);
			return bitmap;
		}

		public function setBitdataOnUrl(url:String,bitdata:BitmapData=null):void
		{
			if(bitdata==null)
			{
				MyLoadImage.clearUrl(url);
			}
			else
			{
//				MyLoadImage.setUrlBitdata(url,bitdata);
			}
			
		}
		



	
		private function chageBitdata(url:String,bitmap:Bitmap,width:Number,height:Number):void
		{
			if(bitmap.bitmapData!=null)
			{
//				var temp:BitmapData=bitmap.bitmapData;
//				bitmap.bitmapData=null;
//				temp.dispose();
			}
			var bitdata:BitmapData=(MyLoadImage.loadDic[url] as MyLoadImage).bitdata;
			if(bitdata!=null)
			{
				bitmap.bitmapData=bitdata;
				bitmap.smoothing=true;
				bitmap.width=width;
				bitmap.height=height;
				//没有伸缩图片
//				bitmap.width=bitdata.width;
//				bitmap.height=bitdata.height;
			}
			else
			{
				bitmap.bitmapData=null;
			}
		}

	}
}


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.system.LoaderContext;
import flash.utils.ByteArray;
import flash.utils.Dictionary;


class MyLoadImage
{
	private var m_completeFlag:Boolean=false;
	private var m_fnArray:Array=[];
	private var m_load:Loader;
	private var m_bitdata:BitmapData;
	
	private var m_urlLoader:URLLoader;
	private var m_isPadPic:Boolean=false;
	private var m_urlReg:RegExp=/\.dat/;
	public function get bitdata():BitmapData
	{
		return m_bitdata;
	}
	public function MyLoadImage(url:String)
	{

		m_load=new Loader();
		m_load.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadComplete);
		m_load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,showIoError);
		m_load.load(new URLRequest(url),new LoaderContext(true));
		
		
	}
	private function showIoError(evt:IOErrorEvent):void
	{
//		evt.currentTarget.removeEventListener(Event.COMPLETE,bytesCompleteHandle);
//		evt.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR,showIoError);
		clear();
		trace(evt.text);
	}

	private function onLoadComplete(evt:Event):void
	{
		m_bitdata=(m_load.contentLoaderInfo.content as Bitmap).bitmapData;
		
		try
		{
			m_bitdata.getPixel32(10,10);
		}
		catch(e:*)
		{
			trace("头像解析错误");
			m_bitdata=null;
		}
		m_load.unloadAndStop();
//		m_load.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoadComplete);
//		m_load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,showIoError);
		m_load=null;
		clear();
	}
	private function clear():void{
		for each(var ob:Object in m_fnArray)
		{
			if(ob.fn!=null)
			{
				ob.fn.apply(null,ob.arg);
			}
		}
		m_fnArray=null;
		m_completeFlag=true;
		
	}
	private function addComFn(fn:Function,extrArg:Array):void
	{
		if(m_completeFlag)
		{
			fn.apply(null,extrArg);
		}
		else
		{
			m_fnArray.push({fn:fn,arg:extrArg});
		}
	}

	
	private static var m_loadDic:Dictionary=new Dictionary;
	
	public static function addLoadCompleteFn(url:String,fn:Function,extrArg:Array):void
	{
		var imagLoad:MyLoadImage=getImageLoad(url);
		imagLoad.addComFn(fn,extrArg);
	}
	public static function clearUrl(url:String):void
	{
		if(m_loadDic[url]!=null)
		{
			delete m_loadDic[url];
		}
	}
	public static function get loadDic():Dictionary
	{
		return m_loadDic;
	}
	private static function getImageLoad(url:String):MyLoadImage
	{
		if(m_loadDic[url]==null)
		{
			m_loadDic[url]=new MyLoadImage(url);
		}
		return m_loadDic[url] as MyLoadImage;
	}
}

