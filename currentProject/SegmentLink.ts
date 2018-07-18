import {MyMath} from "./MyMath";
/**
 *   线段 链表形式
 */
export class SegmentLink
{
  public isBlock:boolean = false;
  public start:number;
  public end:number;

  public next:SegmentLink;

  public id:string;
//		public var pre:SegmentLink;

  constructor($start:number, $end:number, $isBlock:boolean, id:string=null)
  {
    this.start = $start;
    this.end = $end;
    this.isBlock=$isBlock;
    this.id = id;
  }

  public clone():SegmentLink
  {
    var newSeg:SegmentLink = new SegmentLink(this.start, this.end, this.isBlock);
    return newSeg;
  }

  public union():void
  {
    if (this.next )
    {
      if (this.next.isBlock==this.isBlock)
      {
        this.end = this.next.end;
        this.next = this.next.next;
        this.union();
      }
      else
      {
        this.next.union();
      }
    }
  }

  public get length():number
  {
    return this.end-this.start;
  }

  public autoSetBlock():void
  {
    if (this.length<0 || MyMath.isNumberEqual(this.length, 0) )
    {
      this.isBlock=true;
    }
  }

  public clear():void
  {
    var _next:SegmentLink = this.next;
    var tmp:SegmentLink;
//			pre = null;
    while(_next)
    {
      tmp = _next;
//				_next.pre = null;
      _next = _next.next;
      tmp.next = null;
    }

  }
  /**
   *   给线段添加一段阻塞区域
   *  @pargram s 阻塞区域的开始位置
   *  @pargram e 阻塞区域的终止位置
   *  @pargram blickArray 产生新的阻塞线段放到 array里面
   */
  public addBlock(s:number, e:number, blockArray:any[], id:string=null):void
  {
    var tmpNext:SegmentLink = this.next ;
    if(!this.isBlock)
    {
      if( this.start>e || MyMath.isNumberEqual(this.start, e) )
      {
        return ;
      }
      var intersections:any[] = MyMath.calcSegmentIntersection(this.start, this.end, s, e);
      if(intersections)
      {
        var block:SegmentLink = new SegmentLink(intersections[0], intersections[1], true, id);
        blockArray.push(block.clone());
        var effect:SegmentLink = new SegmentLink(intersections[1], this.end, false);
        this.end = intersections[0];
        this.next = block;
//					block.pre = this;
        block.next = effect;
//					effect.pre = block;
        effect.next = tmpNext;

        this.autoSetBlock();
        effect.autoSetBlock();

      }
    }

    if(tmpNext)
    {
      tmpNext.addBlock(e, s, blockArray, id);
    }
  }


}
