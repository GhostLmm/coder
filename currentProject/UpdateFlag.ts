
import {DebugConfig} from "../euler/DebugConfig";
/**
 * Created by kris on 2017/3/2.
 */

export class UpdateFlag
{
  /** 位置和形状标签 **/
  public static TAG_POSITION:string = "position";
  public static TAG_POLYGON:string = "polygon";
  /** 场景中的obj边界 **/
  public static TAG_BOUNDARY:string = "boundary";
  /** 物体所属房间信息标签 **/
  public static TAG_ROOM:string = "room";

  constructor()
  {
  }
  private tagPool:Object = {};
  // 记录父子关系 {父：[子]}
  private relationPool:Object={};
  /**
   *   添加tag，以及其父tag
   *   禁止出现循环标签
   *
   */
  public addTag(tag:string,parentTag:string=null,...parentTags):void
  {
    if(this.tagPool.hasOwnProperty(tag))
    {
      if (DebugConfig.traceLog) {
        console.log("添加重复，错误: "+tag );
      }
      return ;
    }
    this.tagPool[tag] = true;

    let ps:any[]=[];
    if(parentTag!=null)
      ps.push(parentTag);

    ps = ps.concat(parentTags);

    for ( let parent of ps)
    {
      if (!this.relationPool.hasOwnProperty(parent))
      {
        this.relationPool[parent] = [];
      }
      let relation:any[] = this.relationPool[parent];
      if (relation.indexOf(tag) == -1)
      {
        relation.push(tag);
      }
    }
  }

  public hasTag(tag:string):boolean
  {
    return this.tagPool.hasOwnProperty(tag);
  }
  /**
   *   获取tag 是否需要更新
   */
  public getValue(tag:string):boolean
  {
    return this.tagPool[tag];
  }
  /**
   *   设置标签， 如果value为true的话，就会设置其子类也都为true
   */
  public setValue(tag:string, value:boolean):void
  {
    if (!this.hasTag(tag))
    {
      if (DebugConfig.traceLog) {
        console.log("没有这个tag ： " + tag);
      }
      return ;
    }
    this.tagPool[tag] = value;
    // 设置child 也为需要更新
    if (value && this.relationPool.hasOwnProperty(tag) )
    {
      for (let childTag of this.relationPool[tag])
      {
        this.setValue(childTag,value);
      }
    }

  }
}
