package view.viewData
{
	import com.fish.modules.core.gameVO.CopyboxVO;
	import com.ghostlmm.xmldata.Node_copy_box;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class CopyBoxData
	{
		public var copyBoxVo:CopyboxVO;
		public var copyBoxXml:Node_copy_box;
		public var itemXml:Node_item;
		public function CopyBoxData(_vo:CopyboxVO)
		{
			copyBoxVo=_vo;
			copyBoxXml=XMLDataManager.getCopy_boxById(copyBoxVo.id);
			itemXml=XMLDataManager.getItemById(copyBoxXml.reward_item);
		}
	}
}