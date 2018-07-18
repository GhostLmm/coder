import {GF_UnitEntity} from "./GF_UnitEntity";
import {CMP_Focus} from "../component/focus/CMP_Focus";
import {CompName} from "../CompName";
import {FocusType} from "../../../euler/core/enums/FocusType";
import {CMP_SlideDoorInstall} from "../component/sliding/CMP_SlideDoorInstall";
import {CMP_SlidingDoor} from "../component/sliding/CMP_SlidingDoor";
import {CMP_LineRoute_Unit} from "../component/lines/CMP_LineRoute_Unit";
/**
 * Created by Administrator on 2017-12-21.
 */
export class GF_SlideUnitEntity extends GF_UnitEntity
{

  protected getComponentClassArray():any[] {
    return super.getComponentClassArray().concat(
      CMP_SlideDoorInstall,
      CMP_SlidingDoor
    );
  }

  public get topTrackBoardHeight():number {
    let sld:CMP_SlidingDoor = this.getComponentByName(CompName.SlidingDoor);
    if (sld && sld.active) {
      return sld.height - sld.topTrackBoardPosZ;
    }
    return 0;
  }

  /**
   *  排除不需要的组建名称
   * @returns {Array}
   */
  protected getExcludeComponentNames():string[]
  {
    return super.getExcludeComponentNames().concat(CompName.LineRoute, CompName.HardwareInstall);
  }

  /**
   *  创建完组建后，可以针对组建的值做特殊调整
   */
  protected adjustComponentInitValue():void
  {
    super.adjustComponentInitValue();
    let cmp_focus:CMP_Focus = this.getComponentByName(CompName.Focus);
    if (cmp_focus && cmp_focus.active)
    {
      cmp_focus.enableFocus.setExpString('true');
      cmp_focus.focusType.setExpString(FocusType.SLIDE_FRAME);
    }
  }

  public static slideUnitData:any = {
    "class_type" : "sliding_unit",
    "args" : [
      {"name":"NAME", "exp":"到顶框架"},
      {"name": "SNO", "exp":"dc6cc0d08c3fa26efbd277fd2544927c"},
      {"name":"W", "type": "number", "exp":"200", "origin_exp":"200", "max":600, "min":120},
      {"name":"H", "type": "number", "exp":"280", "origin_exp":"280", "max":320, "min":240},
      {"name":"D", "type": "number", "exp":"60", "origin_exp":"60", "max":80, "min":50},
      {"name":"D1", "type": "number", "exp":"0", "origin_exp":"0", "max":5, "min":0},
      {"name":"D2", "type": "number", "exp":"0", "origin_exp":"0", "max":5, "min":0},
      {"name":"H1", "type": "number", "exp":"210", "origin_exp":"210", "max":230, "min":210},
      {"name":"H2", "type": "number", "exp":"10", "origin_exp":"10","max":15, "min":5},
      {"name":"D5", "type": "number", "exp":"10", "origin_exp":"10", "max":20, "min":1.8}
    ],
    "children": [
      {
        "class_type" : "board_struct",
        "args" : [
          {"name":"NAME", "exp":"左侧板下"},
          {"name":"INTYPE", "exp":"sdf_left"},
          {"name":"DIRE", "exp":2},
          {"name":"W", "exp":"1.8"},
          {"name":"D", "exp":"P.DEPTH - P.D1"},
          {"name":"H", "exp":"P.H1"},
          {"name":"X", "exp":"P.LEFT"},
          {"name":"Y", "exp":"P.BACK + P.D1"},
          {"name":"Z", "exp":"P.BOTTOM"}
        ]
      },
      {
        "class_type" : "board_struct",
        "args" : [
          {"name":"NAME", "exp":"左侧板上"},
          {"name":"INTYPE", "exp":"sdf_left"},
          {"name":"DIRE", "exp":2},
          {"name":"W", "exp":"1.8"},
          {"name":"D", "exp":"P.DEPTH - P.D1"},
          {"name":"H", "exp":"P.HEIGHT - P.H1"},
          {"name":"X", "exp":"P.LEFT"},
          {"name":"Y", "exp":"P.BACK + P.D1"},
          {"name":"Z", "exp":"P.BOTTOM + P.H1"}
        ]
      },
      {
        "class_type" : "board_struct",
        "args" : [
          {"name":"NAME", "exp":"右侧板下"},
          {"name":"INTYPE", "exp":"sdf_right"},
          {"name":"DIRE", "exp":2},
          {"name":"W", "exp":"1.8"},
          {"name":"D", "exp":"P.DEPTH - P.D2"},
          {"name":"H", "exp":"P.H1"},
          {"name":"X", "exp":"P.RIGHT-WIDTH"},
          {"name":"Y", "exp":"P.BACK + P.D2"},
          {"name":"Z", "exp":"P.BOTTOM"}
        ]
      },
      {
        "class_type" : "board_struct",
        "args" : [
          {"name":"NAME", "exp":"右侧板上"},
          {"name":"INTYPE", "exp":"sdf_right"},
          {"name":"DIRE", "exp":2},
          {"name":"W", "exp":"1.8"},
          {"name":"D", "exp":"P.DEPTH - P.D2"},
          {"name":"H", "exp":"P.HEIGHT - P.H1"},
          {"name":"X", "exp":"P.RIGHT-WIDTH"},
          {"name":"Y", "exp":"P.BACK + P.D2"},
          {"name":"Z", "exp":"P.BOTTOM+P.H1"}
        ]
      },
      {
        "class_type" : "board_struct",
        "args" : [
          {"name":"NAME", "exp":"顶封板"},
          {"name":"DIRE", "exp":3},
          {"name":"W", "exp":"P.WIDTH - 3.6"},
          {"name":"D", "exp":"1.8"},
          {"name":"H", "exp":"P.H2"},
          {"name":"X", "exp":"P.LEFT + 1.8"},
          {"name":"Y", "exp":"P.FRONT - 1.8"},
          {"name":"Z", "exp":"P.TOP - P.H2"}
        ]
      },
      {
        "class_type" : "board_struct",
        "args" : [
          {"name":"NAME", "exp":"上轨道板"},
          {"name":"INTYPE", "exp":"sdf_track_top"},
          {"name":"DIRE", "exp":1},
          {"name":"W", "exp":"P.WIDTH - 3.6"},
          {"name":"D", "exp":"8.2"},
          {"name":"H", "exp":"1.8"},
          {"name":"X", "exp":"P.LEFT + 1.8"},
          {"name":"Y", "exp":"P.FRONT - 10"},
          {"name":"Z", "exp":"P.TOP - P.H2"}
        ]
      },
      {
        "class_type" : "board_struct",
        "args" : [
          {"name":"NAME", "exp":"下轨道板"},
          {"name":"INTYPE", "exp":"sdf_track_bottom"},
          {"name":"DIRE", "exp":1},
          {"name":"W", "exp":"P.WIDTH - 3.6"},
          {"name":"D", "exp":"10"},
          {"name":"H", "exp":"1.8"},
          {"name":"X", "exp":"P.LEFT + 1.8"},
          {"name":"Y", "exp":"P.FRONT - 10"},
          {"name":"Z", "exp":"P.BOTTOM+P.D5"}
        ]
      },
      {
        "class_type" : "board_struct",
        "args" : [
          {"name":"NAME", "exp":"后地脚板"},
          {"name":"INTYPE", "exp":"sdf_foot"},
          {"name":"DIRE", "exp":3},
          {"name":"W", "exp":"P.WIDTH - 3.6"},
          {"name":"D", "exp":"1.8"},
          {"name":"H", "exp":"P.D5"},
          {"name":"X", "exp":"P.LEFT + 1.8"},
          {"name":"Y", "exp":"P.FRONT - 10"},
          {"name":"Z", "exp":"P.BOTTOM"}
        ]
      },
      {
        "class_type" : "board_struct",
        "args" : [
          {"name":"NAME", "exp":"前地脚板"},
          {"name":"INTYPE", "exp":"sdf_foot"},
          {"name":"DIRE", "exp":3},
          {"name":"W", "exp":"P.WIDTH - 3.6"},
          {"name":"D", "exp":"1.8"},
          {"name":"H", "exp":"P.D5"},
          {"name":"X", "exp":"P.LEFT + 1.8"},
          {"name":"Y", "exp":"P.FRONT - 1.8"},
          {"name":"Z", "exp":"P.BOTTOM"}
        ]
      }
    ]
  };
}
