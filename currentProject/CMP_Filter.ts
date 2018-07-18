import {GF_Component} from "./GF_Component";
import {CompName} from "../CompName";
import {BaseEntityFilter} from "../../../euler/core/filters/BaseEntityFilter";
import {GF_Entity} from "../entities/GF_Entity";
export class CMP_Filter extends GF_Component
{
  public get compName():string
  {
    return CompName.Filter;
  }

  public applyFilter(filter:BaseEntityFilter, recursion:boolean = true):void
  {
    this.applyFilterSelf(filter);
    if (recursion) {
      this.applyFilterChildren(filter);
    }
  }

  protected applyFilterSelf(filter:BaseEntityFilter):void
  {
    filter.applyFilter(this.hostObj as GF_Entity);
  }

  protected applyFilterChildren(filter:BaseEntityFilter):void
  {
    for (let child of this.hostObj.children)
    {
      let cmp:CMP_Filter = child.getComponentByName(CompName.Filter);
      if (cmp && cmp.active)
      {
        cmp.applyFilter(filter);
      }
    }
  }

}
