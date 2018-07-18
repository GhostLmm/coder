
import {GF_Entity} from "../../../com.ghostlmm/frame/entities/GF_Entity";
import {GF_GameObject} from "../../../com.ghostlmm/frame/GF_GameObject";
/**
 * Created by Administrator on 2017/11/29.
 */
export class BaseEntityFilter
{
  public targetList:GF_GameObject[] = [];

  protected argData:any ;
  public constructor(arg:any)
  {
    this.argData = arg;
  }

  public applyFilter(entity:GF_Entity):void
  {
    if(this.fileterFn(entity))
    {
      this.targetList.push(entity);
    }
  }

  protected fileterFn(entity:GF_Entity):boolean
  {
    return false;
  }
}
