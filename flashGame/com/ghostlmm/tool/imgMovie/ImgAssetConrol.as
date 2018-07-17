package com.ghostlmm.tool.imgMovie
{
	import com.ghostlmm.tool.GameSession;
	import com.ghostlmm.tool.ITickObj;
	
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;

	public class ImgAssetConrol
	{

		private static var _instance:ImgAssetConrol;
		public static function getInstance():ImgAssetConrol
		{
			if(_instance==null) _instance=new ImgAssetConrol();
			return _instance;
		}
		public var timer:Timer;
		public function ImgAssetConrol()
		{
			imagCacheDic=new Dictionary();
			timer=new Timer(10000);
			timer.addEventListener(TimerEvent.TIMER,update);
			timer.start();
		}
		
		public var xmlPath:String="Assets\\movie\\";
		public var pngPath:String="Assets\\movie\\";
		
		private var imagCacheDic:Dictionary;
		
		public function preloadMovie(movieName:String):void
		{
			getImageCache(movieName);
		}
		
		private function getImageCache(movieName:String):ImagCache
		{
			var imagCache:ImagCache=imagCacheDic[movieName];
			if(imagCache==null || imagCache.hasDeath)
			{
				imagCache=new ImagCache(movieName,xmlPath+movieName+".xml",pngPath+movieName+".png");
				imagCacheDic[movieName]=imagCache;
				imagCache.initComplete_SN.addOnce(imagInitComplete);
			}
			imagCache.resetDeathTime();
			return imagCache;
		}
		
		private function imagInitComplete():void
		{
			
		}
		
		public function movieApply(movieName:String):Vector.<BitmapData>
		{
			var imgCache:ImagCache=getImageCache(movieName);
			imgCache.referTick++;
			return imgCache.bitVect;
		}
		public function movieRevoke(movieName:String):void
		{
			var imgCache:ImagCache = imagCacheDic[movieName];
			if(imgCache){
				imgCache.referTick--;
			}
		}
		
		public function update(evt:Event):void
		{
			for (var key:String in imagCacheDic)
			{
				var cache:ImagCache=imagCacheDic[key];
				cache.updateDeathTime(10);
				if(cache.hasDeath)
				{
					delete imagCacheDic[key];
				}
			}
		}

	}
}
import com.greensock.loading.ImageLoader;
import com.greensock.loading.LoaderMax;
import com.greensock.loading.XMLLoader;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.geom.Matrix;
import flash.net.URLLoader;
import flash.net.URLRequest;

import org.osflash.signals.Signal;

class ImagCache
{
	public static var chacheTime:int=60;
	private var _deathTime:int;
	private var _bitVect:Vector.<BitmapData>;
	private var _referTick:int;
	
	public var hasInit:Boolean=false;
	public var hasDeath:Boolean=false;
	
	public var name:String;
	private var _xml:XML;
	private var _png:BitmapData;
	public var initComplete_SN:Signal=new Signal();
	
	public function ImagCache(name:String,xmlPath:String,imgPath:String)
	{
		_bitVect=new Vector.<BitmapData>();
		this.name=name;
		
		var urlloader:URLLoader=new URLLoader();
		urlloader.addEventListener(Event.COMPLETE,onXmlLoadComplete);
		urlloader.load(new URLRequest(xmlPath));
		
		var loader:Loader=new Loader();
		loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onPngLoadComplete);
		loader.load(new URLRequest(imgPath));
		
//		var loadermax:LoaderMax=new LoaderMax({onComplete:onLoadeComplete});
//		
//		loadermax.append(new XMLLoader(xmlPath,{name:name+"xml"}));
//		loadermax.append(new ImageLoader(imgPath,{name:name+"png"}));
//		loadermax.load();
	}
	
	private function onXmlLoadComplete(evt:Event):void
	{
		(evt.currentTarget as URLLoader).removeEventListener(Event.COMPLETE,onXmlLoadComplete);
		_xml=new XML((evt.currentTarget as URLLoader).data);
		checkRes();
	}
	private function onPngLoadComplete(evt:Event):void
	{
		(evt.currentTarget).removeEventListener(Event.COMPLETE,onPngLoadComplete);
		_png=((evt.currentTarget as LoaderInfo).content as Bitmap).bitmapData;
		checkRes();
	}
	private function checkRes():void
	{
		if(_xml && _png){
			initBitdata(_png,_xml);
			_png.dispose();
			_png=null;
			_xml=null;
			
		}
	}
	private function onLoadeComplete(evt:Event):void
	{
		/*var xml:XML=LoaderMax.getContent(name+"xml") as XML;
		var imgLoade:ImageLoader=LoaderMax.getContent(name+"png");
//		imgLoade._context
		var o:Object=LoaderMax.getLoader(name+"png");
		var obj:Object=LoaderMax.getContent(name+"png");
		var bitmap:Bitmap=LoaderMax.getContent(name+"LoaderMax.getContent(name+"xml")") as Bitmap;
		
		initBitdata(bitmap.bitmapData,xml);
		
		(evt.target as LoaderMax).dispose();*/
	}
	
	private function initBitdata(holeData:BitmapData,xml:XML):void
	{
//		_bitVect=new Vector.<BitmapData>();
		for each(var subTexture:XML in xml.SubTexture)
		{
			var x:int=subTexture.@x;
			var y:int=subTexture.@y;
			var width:int=subTexture.@width;
			var height:int=subTexture.@height;
			
			var mtr:Matrix=new Matrix();
			mtr.tx=-x;
			mtr.ty=-y;
			
			var bitdata:BitmapData=new BitmapData(width,height,true,0);
			bitdata.draw(holeData,mtr);
			_bitVect.push(bitdata);
		}
		hasInit=true;
		initComplete_SN.dispatch();
	}
	
	public function updateDeathTime(passTime:int):void
	{
		_deathTime-=passTime;
		updateDeath();
	}
	
	public function resetDeathTime():void
	{
		_deathTime=chacheTime;
	}
	
	public function get deathTime():int
	{
		return _deathTime;
	}
	public function get bitVect():Vector.<BitmapData>
	{
		return _bitVect;
	}
	public function get referTick():int
	{
		return _referTick;
	}
	public function set referTick(value:int):void
	{
		if(value>0 && value>_referTick)
		{
			_deathTime=chacheTime;
		}
		_referTick=value;
		
	}
	
	private function updateDeath():void
	{
		if(!hasInit || hasDeath) return ;
		if(_referTick<=0 && _deathTime<=0)
		{
			for each(var bitdata:BitmapData in _bitVect)
			{
				bitdata.dispose();
			}
//			_bitVect.length=0;
			_bitVect=null;
		}
		initComplete_SN.removeAll();
		initComplete_SN=null;
		hasDeath=true;
	}
}