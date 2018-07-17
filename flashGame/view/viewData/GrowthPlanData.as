package view.viewData
{
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_jihua;

	public class GrowthPlanData
	{
		public var xml:Node_jihua;
		public var isLingqu:Boolean=false;
		public function GrowthPlanData()
		{
		}
		public function levelCouldLingqu():Boolean
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userLevel>=xml.lv_limit)
			{
				return true;
			}
			return false;
		}
	}
}