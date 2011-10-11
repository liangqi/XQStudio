///////////////////////////////////////////////////////////////////////////////
//
// XQStduio Source Code (http://www.qipaile.net/xqstudio)
//
// Copyright (c) 1998-2008, DONG Shiwei (董世伟 or 过河象)
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
// 
//    1) Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//    2) Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer
//       in the documentation and/or other materials provided with the
//       distribution.
//    3) Neither the name of the XQStudio nor the names of its contributors
//       may be used to endorse or promote products derived from this
//       software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
// TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
// NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
///////////////////////////////////////////////////////////////////////////////
//
// Note: Some characters of this file are Simplified Chinese characters 
//       encoded with GB2312/GB18030 standard
//

unit XQPNode;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, dDelphiS, XQDataT;

type
  //-----------------------------------------------------------------------
  // 定义一步行棋记录节点(行棋记录树), 采用左孩子、右兄弟的表示方法
  // 即将走棋记录的多叉树，用左孩子右兄弟的二叉树表示。同时每个节点
  // 有一个指向原来对弈树父亲节点(即上一步棋)的指针。
  //.......................................................................
  dTXQPlayNode = class
  public
    StepNo      : dTInt32;                      // 第几步，开局状态为第0步
    StrRec      : String[10];                   // 本步的棋谱, 如'炮二平五'
    XYf         : dTBYTE;                       // 本步棋的起始位置XY
    XYt         : dTBYTE;                       // 本步棋的目的位置XY
    QiziXY      : dTXQZXY;                      // 本步棋走后32个子的位置
    Remark      : TStringList;                  // 本步棋的注解
    LastStepNode: dTXQPlayNode;                 // 上一步棋的节点
    LParent     : dTXQPlayNode;                 // 双亲节点
    RParent     : dTXQPlayNode;                 // LParent和RParent必须有
                                                // 一个为nil,  如果该节点
                                                // 是双亲的左孩子，则LP为
                                                // nil, 反之, RP为nil
    LChild      : dTXQPlayNode;                 // 左孩子
    LChildTag   : dTInt32;                      //   左孩子的标记
    RChild      : dTXQPlayNode;                 // 右孩子 (实际是兄弟)
    RChildTag   : dTInt32;                      //   右孩子的标记

    procedure dSetLChild(Node: dTXQPlayNode);   // 设置左孩子
    procedure dSetRChild(Node: dTXQPlayNode);   // 设置右孩子

    // 构造函数
    constructor Create(iStepNo:dTInt32; sStrRec:String; bXYf, bXYt:dTBYTE;
                       qzXY:dTXQZXY; slRMK:TStringList;
                       LN,LP,RP:dTXQPlayNode);
    // 析构函数
    destructor Destroy; override;
  end;

implementation
procedure dTXQPlayNode.dSetLChild(Node: dTXQPlayNode);
begin
  LChild := Node;
  if (Node <> nil) then begin Node.RParent:=Self; Node.LParent:=nil; end;
end;

procedure dTXQPlayNode.dSetRChild(Node: dTXQPlayNode);
begin
  RChild := Node;
  if (Node <> nil) then begin Node.LParent:=Self; Node.RParent:=nil; end;
end;

constructor dTXQPlayNode.Create(iStepNo:dTInt32; sStrRec:String;
                            bXYf,bXYt:dTBYTE; qzXY:dTXQZXY;
                            slRMK:TStringList; LN,LP,RP:dTXQPlayNode);
var
  i: dTInt32;
begin
  StepNo:=iStepNo; StrRec:=sStrRec; XYf:=bXYf; XYt:=bXYt;
  for i:=1 to 32 do QiziXY[i]:=qzXY[i];
  Remark:=slRMK; LastStepNode:=LN;
  LParent:=LP; RParent:=RP; LChild:=nil; RChild:=nil;
  if (LParent <> nil) then LParent.RChild := Self;
  if (RParent <> nil) then RParent.LChild := Self;
end;

destructor dTXQPlayNode.Destroy;
begin
  // 先断开与双亲的连接
  if (LParent <> nil) then LParent.RChild := nil;
  if (RParent <> nil) then RParent.LChild := nil;

  if (LChild <> nil) then LChild.Free;
  if (RChild <> nil) then RChild.Free;

  if (Remark <> nil) then Remark.Free;

  // ShowMessage(StrRec + 'Free');
end;

end.
