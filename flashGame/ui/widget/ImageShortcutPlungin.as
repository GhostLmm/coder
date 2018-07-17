package ui.widget
{
	import com.ghostlmm.xmldata.Node_fnt_img_reflect;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.riaidea.text.plugins.ShortcutPlugin;

	public class ImageShortcutPlungin
	{
		public function ImageShortcutPlungin()
		{
		}
		
		private static var _shortcuts:Array;
		
		public static function createPlungin():ShortcutPlugin{
			if(_shortcuts==null){
				_shortcuts=[];
				for each(var node:Node_fnt_img_reflect in XMLDataManager.Node_fnt_img_reflectArray){
					if(node.biaozhi=="anim"){
						_shortcuts.push({ shortcut:node.id, src:node.image });
					}
					if(node.biaozhi=="img"){
						_shortcuts.push({ shortcut:node.id, src:BitdataChache.getBitdata(node.image) });
					}
				}
			}
			
			var _plungin:ShortcutPlugin=new ShortcutPlugin();
			_plungin.addShortcut(_shortcuts);
//			_plungin.enabled=true;
			return _plungin;
		}
		
		
		private static const Pre:String="/";
		
		public static function resetText(text:String):Array{
			var content:String="";
			var spArray:Array=[];
			var index:int=0;
			var contnetIndex:int=0;
			var char:String;
			var contentArray:Array=[];
			while(true){
				if(index<text.length){
					char=text.charAt(index);
					if(char==Pre){
						if(index+1<text.length){
							var key:String=Pre+text.charAt(index+1);
							var node:Node_fnt_img_reflect=XMLDataManager.getFnt_img_reflectById(key);
							if(node){
								if(node.biaozhi=="anim"){
									spArray.push({ index:contnetIndex, src:node.image });
									contentArray.push({ index:contnetIndex, src:node.image });
								}
								if(node.biaozhi=="img"){
									spArray.push({ index:contnetIndex, src:BitdataChache.getBitdata(node.image) });
									contentArray.push({ index:contnetIndex, src:BitdataChache.getBitdata(node.image) });
								}
								index+=2;
							}else{
								contentArray.push(char);
								content+=char;
								index++;
								contnetIndex++;
							}
						}
					}else{
						contentArray.push(char);
						content+=char;
						index++;
						contnetIndex++;
					}
				}else{
					break;
				}
			}
			return [content,spArray,contentArray];
		}
		
		
		
	}
}