import {BaseEntityFilter} from "./BaseEntityFilter";
import {FT_BodyBoard} from "./FT_BodyBoard";
import {FT_DoorBoard} from "./FT_DoorBoard";
import {FT_Handler} from "./FT_Handler";
import {FT_DoorLeafNoOnDrawer} from "./FT_DoorLeafNoOnDrawer";
import {FT_DoorLeafOnDrawer} from "./FT_DoorLeafOnDrawer";
import {FT_DrawerDoorBoard} from "./FT_DrawerDoorBoard";
import {FT_Board} from "./FT_Board";
import {FT_SlidingDoorFrameLine} from "./FT_SlidingDoorFrameLine";
import {FT_TableLine} from "./FT_TableLine";
import {CMP_Filter} from "../../../com.ghostlmm/frame/component/CMP_Filter";
import {CompName} from "../../../com.ghostlmm/frame/CompName";
import {FT_MapEntity} from "./FT_MapEntity";
import {GF_GameObject} from "../../../com.ghostlmm/frame/GF_GameObject";
import {FT_ComponentEntity} from "./FT_ComponentEntity";
import {FT_SlidingDoorLeaf} from "./FT_SlidingDoorLeaf";
import {FT_CupboardCategory} from "./FT_CupboardCategory";
import {FT_ClassType} from "./FT_ClassType";
import {FT_DoorBoardModel} from "./FT_DoorBoardModel";
import {FT_MouseCheckType} from "./FT_MouseCheckType";
import {FT_DoorLeaf} from "./FT_DoorLeaf";
/**
 * Created by Administrator on 2017/11/29.
 */
export class EntityFilterFactory
{
  public static Type_BodyBoard:string = 'bodyBoard';
  public static Type_DoorBoard:string = 'doorBoard';
  public static Type_DoorBoard_Model:string = 'doorBoard_Model';
  public static Type_DoorLeaf:string = 'doorLeaf';
  public static Type_DoorLeafNoOnDrawer:string = 'doorLeafNoOnDrawer';
  public static Type_DoorLeafOnDrawer:string = 'doorLeafOnDrawer';
  public static Type_DrawerDoorBoard:string = 'drawerDoorBoard';
  public static Type_Handler:string = 'handler';
  public static Type_Board:string = 'board';
  public static Type_SlidingDoorFrameLine:string = 'slidingDoorFrameLine';
  public static Type_SlidingDoorLeaf:string = 'slidingDoorLeaf';
  public static Type_TableLine:string = 'tableLine';

  public static Type_MapEntity:string = 'mapEntity';

  public static Type_ClassType:string = 'classType';

  public static Type_MouseCheckType:string = 'mouseCheckType';



  public static Type_Component:string = 'component';

  public static Type_CupboardCategory:string = 'cupboardCategory';//橱柜类别


  private static getClassByType(filterType:string,arg:any=null):BaseEntityFilter
  {
    let obj:any = {};
    // 在这里配置
    obj[ EntityFilterFactory.Type_BodyBoard ] = FT_BodyBoard;
    obj[ EntityFilterFactory.Type_DoorBoard ] = FT_DoorBoard;
    obj[ EntityFilterFactory.Type_DoorBoard_Model ] = FT_DoorBoardModel;
    obj[ EntityFilterFactory.Type_DoorLeaf ] = FT_DoorLeaf;
    obj[ EntityFilterFactory.Type_DoorLeafNoOnDrawer] = FT_DoorLeafNoOnDrawer;
    obj[ EntityFilterFactory.Type_DoorLeafOnDrawer] = FT_DoorLeafOnDrawer;
    obj[ EntityFilterFactory.Type_DrawerDoorBoard] = FT_DrawerDoorBoard;
    obj[ EntityFilterFactory.Type_Handler ] = FT_Handler;
    obj[ EntityFilterFactory.Type_Board] = FT_Board;
    obj[ EntityFilterFactory.Type_SlidingDoorFrameLine] = FT_SlidingDoorFrameLine;
    obj[ EntityFilterFactory.Type_TableLine] = FT_TableLine;
    obj[ EntityFilterFactory.Type_MapEntity] = FT_MapEntity;
    obj[ EntityFilterFactory.Type_Component] = FT_ComponentEntity;
    obj[ EntityFilterFactory.Type_SlidingDoorLeaf] = FT_SlidingDoorLeaf;
    obj[ EntityFilterFactory.Type_CupboardCategory] = FT_CupboardCategory;
    obj[ EntityFilterFactory.Type_ClassType] = FT_ClassType;
    obj[ EntityFilterFactory.Type_MouseCheckType] = FT_MouseCheckType;

    let cls:any = obj[filterType];
    let filter:BaseEntityFilter = new cls(arg);
    return filter;
  }

  public static applyFilterEnitys(entitys:GF_GameObject[], filterType:string, arg:any=null, recursion:boolean = true):BaseEntityFilter
  {
    let filter:BaseEntityFilter = EntityFilterFactory.getClassByType(filterType, arg);
    for (let entity of entitys)
    {
      let cmp_filter:CMP_Filter = entity.getComponentByName(CompName.Filter);
      if (cmp_filter && cmp_filter.active)
      {
        cmp_filter.applyFilter(filter, recursion);
      }
    }
    return filter;
  }

  public static applyFilterEnity(entity:GF_GameObject, filterType:string, arg=null, recursion:boolean = true):BaseEntityFilter
  {
    let filter:BaseEntityFilter = EntityFilterFactory.getClassByType(filterType, arg);
    let cmp_filter:CMP_Filter = entity.getComponentByName(CompName.Filter);
    if (cmp_filter && cmp_filter.active)
    {
      cmp_filter.applyFilter(filter, recursion);
    }
    return filter;
  }

  public static applyFilterComps<T>(entity:GF_GameObject, cmpName:string):T[]
  {
    let re:T[] = [];
    for (let e of EntityFilterFactory.applyFilterEnity(entity, EntityFilterFactory.Type_Component, cmpName).targetList)
    {
      re.push(e.getComponentByName(cmpName));
    }
    return re;
  }

  public static applyFilterCompFirst<T>(entity:GF_GameObject, cmpName:string):T
  {
    let list:T[] = EntityFilterFactory.applyFilterComps<T>(entity, cmpName);
    if (list.length) return list[0];
    return null;
  }

  public static applyFilterCompsForEntitys<T>(entitys:GF_GameObject[], cmpName:string, compList:T[]=null):T[]
  {
    if (compList==null) compList = [];
    for (let e of EntityFilterFactory.applyFilterEnitys(entitys, EntityFilterFactory.Type_Component, cmpName).targetList)
    {
      compList.push(e.getComponentByName(cmpName));
    }
    return compList;
  }
}
