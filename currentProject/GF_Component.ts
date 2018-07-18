import {GF_GameObject} from "../GF_GameObject";
import {GF_EventDispatcher} from "../../events/GF_EventDispatcher";
import {IDestory} from "../IDestory";
import {HashObject} from "../HashObject";
import {GF_ComponentShowConfig} from "./GF_ComponentShowConfig";
import {GF_Argument} from "../argument/GF_Argument";
import {CompName} from "../CompName";
export class GF_Component extends HashObject implements IDestory
{
  protected hasDestory:boolean = false;
  public get compName():string
  {
    return '';
  }

  public constructor()
  {
    super();
    this._showConfig = new GF_ComponentShowConfig();
    this._showConfig.setTargetComponent(this);
    this.init();
  }

  protected _showConfig:GF_ComponentShowConfig;

  /**
   *  设置组建的显示配置
   */
  public resetShowConfig():void
  {
    this._showConfig.reset();
  }

  public get needShowConfig():boolean
  {
    if (this._showConfig && this._showConfig.visible && this.active)
    {
      return true;
    }
    return false;
  }

  public get showConfig():GF_ComponentShowConfig
  {
    return this._showConfig;
  }

  /** desc **/
  private _hostObj:GF_GameObject = null;
  public get hostObj():GF_GameObject { return this._hostObj;}

  public beforeHostRegisterComponent():void
  {
  }
  public onRegister(hostObj:GF_GameObject):void
  {
    this._hostObj = hostObj;
  }
  public afterHostRegisterComponent():void
  {
  }
  public onRemoveFromHost():void
  {
  }

  // public getComponent(cls:any):any
  // {
  //   if (this._hostObj)
  //     return this._hostObj.getComponent(cls);
  //   return null;
  // }

  public getComponentByName(compName:string):any
  {
    if (this._hostObj)
      return this._hostObj.getComponentByName(compName);
    return null;
  }

  // public getComponents(cls:any):any[]
  // {
  //   if (this._hostObj)
  //     return this._hostObj.getComponents(cls);
  //   return [];
  // }
  //
  // public getComponentsByName(compName:string):any[]
  // {
  //   if (this._hostObj)
  //     return this._hostObj.getComponentsByName(compName);
  //   return [];
  // }

  /** 是否激活 **/
  private _active:boolean = true;
  public get active():boolean { return this._active;}
  public set active(value:boolean){
      if (this._active != value){
          this._active = value;
      }
  }




  protected init():void
  {

  }
  public destory():void
  {
    this.hasDestory = true;
    if (this.hostObj)
      this._hostObj = null;
    if (this._showConfig)
    {
      this._showConfig.destory();
      this._showConfig = null;
    }
  }

  public loadData(data:any):void
  {

  }

  public dump(level:string):any
  {

  }


  public addArgumentToControl(arg:GF_Argument):void
  {
    let argControl:GF_Component = this.getComponentByName(CompName.ArgumentControl);
    if (argControl && argControl.active)
    {
      arg.compName = this.compName;
      argControl['addArgument'](arg);
    }
  }


}
