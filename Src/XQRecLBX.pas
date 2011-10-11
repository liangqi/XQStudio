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

unit XQRecLBX;

interface
uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, dDelphiS, XQDataT, XQPNode;

type
  //-----------------------------------------------------------------------
  //
  //.......................................................................
  dTXQRecListBox = class
  public
    RecListBox  : TListBox;
    FirstStepNo : dTInt32;
    LastStepNO  : dTInt32;
    LastPNode   : dTXQPlayNode;
    IndexStepNO : dTInt32;
    IndexPNode  : dTXQPlayNode;
    PlayNodeRec : array [0..dCMaxRecNo] of dTXQPlayNode;

    constructor Create(RecLBX: TListBox);

    procedure dReset;
    procedure dLoadAllRecForPlayNode(PN:dTXQPlayNode);
    procedure dSetPlayIndexAtStepNo(StepNo: dTInt32);
    procedure dOnRecListBoxClick;
  end;

implementation

constructor dTXQRecListBox.Create(RecLBX: TListBox);
begin
  RecListBox  := RecLBX;
  dReset;
end;

procedure dTXQRecListBox.dReset;
var
  i: dTInt32;
begin
  if (RecListBox<>nil) then RecListBox.Items.Clear;
  FirstStepNo := -1;
  LastStepNo  := -1;
  LastPNode   := nil;
  IndexStepNo := -1;
  IndexPNode  := nil;
  for i:=0 to dCMaxRecNo do PlayNodeRec[i] := nil;
end;

procedure dTXQRecListBox.dLoadAllRecForPlayNode(PN:dTXQPlayNode);
var
  i: dTInt32;
  s: string;
begin
  if PN = nil then Exit;
  if (FirstStepNo > PN.StepNo) then dReset;
  if (LastStepNo< PN.StepNo) then dReset;

  // 先删除原来的走法(从显示的当前状况开始)
  for i:=LastStepNo downto PN.StepNo do
  begin
    RecListBox.Items.Delete(i-FirstStepNo);
  end;

  if (FirstStepNo < 0) then FirstStepNo := PN.StepNo;

  while PN <> nil do
  begin
    PlayNodeRec[PN.StepNo - FirstStepNo] := PN;
    case PN.StepNo mod 2 of
      1:
        begin
          s := IntToStr((PN.StepNo + 1) div 2);
          case Length(s) of
            1: s := '  ' + s;
            2: s := ' ' + s;
          end;
          s := s + '. ' + PN.StrRec;
        end;
      0:
        begin
          s := '     ' + PN.StrRec;
        end;
    end;
    RecListBox.Items.Add(s);                    // 显示本步棋
    LastStepNo := PN.StepNo;
    LastPNode  := PN;
    PN := PN.LChild;
  end;
end;

//----------------------------------------------------------------------
//
//......................................................................
procedure dTXQRecListBox.dSetPlayIndexAtStepNo(StepNo: dTInt32);
begin
  IndexStepNo          := StepNo;
  IndexPNode           := PlayNodeRec[StepNo -FirstStepNo];
  RecListBox.ItemIndex := StepNo -FirstStepNo;
end;

//----------------------------------------------------------------------
//
//......................................................................
procedure dTXQRecListBox.dOnRecListBoxClick;
begin
  dSetPlayIndexAtStepNo(PlayNodeRec[RecListBox.ItemIndex].StepNo);
end;


end.
