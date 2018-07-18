import {GF_GameObject} from "../GF_GameObject";
import {CMP_Transform} from "../component/CMP_Transform";
import {CMP_ArgumentCtr} from "../component/CMP_ArgumentCtr";
import {CMP_SpaceDefine} from "../component/space/CMP_SpaceDefine";
import {CMP_EntitySerialize} from "../component/entity_serialize/CMP_EntitySerialize";
import {CompName} from "../CompName";
import {CMP_EntityInfo} from "../component/CMP_EntityInfo";
import {CMP_SizeProcess} from "../component/space/CMP_SizeProcess";
import {CMP_ThreeBuild} from "../component/three_build/CMP_ThreeBuild";
import {ClassUtil} from "../../../util/ClassUtil";
import {Vector3D} from "../../../util/geom/Vector3D";
import {GF_Argument} from "../argument/GF_Argument";
import {StringUtil} from "../../../util/StringUtil";
import {GF_Expression} from "../argument/GF_Expression";
import {CMP_Filter} from "../component/CMP_Filter";
import {CMP_ViewOperator} from "../component/view.operater/CMP_ViewOperator";
import {CMP_Update} from "../component/entity.update/CMP_Update";
import {CMP_SpaceSetting} from "../component/space/CMP_SpaceSetting";
import {CMP_Anchor} from "../component/CMP_Anchor";
import {CMP_DataVersion} from "../component/CMP_DataVersion";
export class GF_Entity extends GF_GameObject
{
  public constructor()
  {
    super();
    //this.uuid = this.entityInfo.name;
  }
  protected getComponentClassArray():any[]
  {
    return [
      CMP_Transform,
      CMP_ArgumentCtr,
      CMP_EntityInfo,
      CMP_SpaceDefine,
      CMP_SizeProcess,
      CMP_EntitySerialize,
      CMP_ThreeBuild,
      CMP_Filter,
      CMP_ViewOperator,
      CMP_Update,
      CMP_SpaceSetting,
      CMP_Anchor,
      CMP_DataVersion
    ];
  }



  public get threeBuild():CMP_ThreeBuild
  {
    return this.getComponentByName(CompName.ThreeBuild);
  }

  public getChildByClassType(classType:string):GF_Entity
  {
    for (let child of this.children)
    {
      if ((child as GF_Entity).entityInfo.class_type == classType)
        return child as GF_Entity;
    }
    return null;
  }

  public getChildrenByClassType(classType:string):GF_Entity[]
  {
    let re:GF_Entity[] = [];
    for (let child of this.children)
    {
      if ((child as GF_Entity).entityInfo.class_type == classType)
        re.push(child as GF_Entity);
    }
    return re;
  }

  public get entitySerialize():CMP_EntitySerialize
  {
    return this.getComponentByName(CompName.Serialize)
  }

  private _entityInfo:CMP_EntityInfo;
  public get entityInfo():CMP_EntityInfo
  {
    if (this._entityInfo == null)
      this._entityInfo = this.getComponentByName(CompName.EntityInfo);
    return this._entityInfo;
  }





  public destory():void
  {
    super.destory();
  }

  public createTestData():any
  {
    return null;
  }

  public toMaterialInfo(): string {
    let s:string = '';
    let entityInfo:CMP_EntityInfo = this.getComponentByName(CompName.EntityInfo);
    if (entityInfo && entityInfo.active )
    {
      s = s + "\tMT:" + entityInfo.productName.value;
    }
    return s;
  }
  public toPositionString():string
  {
    let t:CMP_Transform = this.transform;
    return " \tPos: "+new Vector3D(t.x,t.y,t.z).toString()+ " \tSize: "+new Vector3D(t.width, t.depth, t.height).toString()
      +" \tRotate: "+new Vector3D(t.rotate_x, t.rotate_y, t.rotate_z).toString()+
      " \tScale: "+new Vector3D(t.scale_x, t.scale_y, t.scale_z);
  }

  private toArgumentString():string
  {
    let map:Object = this.argumentCtrl.getArgumentDict();
    let re:string = '[参数]\t';
    for (let key in map)
    {
      let exp:GF_Expression = (map[key] as GF_Argument).exp;
      re +=  StringUtil.format("{key}:{exp}/{value} \t", {key:key, exp:exp.expSrc, value:exp.value});
    }
    return re;
  }

  public getFullInfoString(pre: string = null, fullList:string[] = null): string {
    if (pre == null) pre = "";
    if (fullList == null) fullList=[];
    let re: string = pre + "[" + ClassUtil.getSimpleClassName(this) + "] " +this.ID.toString()+" "+this.uuid+ " : " + this.toMaterialInfo() + " " + this.toPositionString();

    re += "\n"+ pre + this.toArgumentString();

    fullList.push(re);

    let s:string = re;
    pre += "  ";
    for (let i in this.children)
    {
      let child:GF_Entity = this.children[i] as GF_Entity;
      child.getFullInfoString(pre, fullList);
    }
    return s;
  }

  public traceFullInfo(pre: string): void {
    // console.log(this.getFullInfoString(pre));
    let fullList:string[] = [];
    this.getFullInfoString('', fullList);
    let s = '';
    for (let t of fullList)
    {
      s += t + '\n';
    }
    console.log(s);
  }

}
