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

unit XQView;

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, dDelphiS, XQDataT, XQPNode;

interface
  //-----------------------------------------------------------------------
  // 定义象棋类
  //.......................................................................
  dTXQView = class
  public
    BoardImage  : TImage;                       // 象棋盘图像
    BoardXY     : dTXQPXY;                      // 棋盘9x10个交叉点
    QiziMoveImg : TImage;                       // 移动中棋子的图像
                                                // 用来处理移动
    Qizi        : array [1..32] of dTXQZ;       // 32个象棋子
    QiziMove    : dTXQZ;                        // 被拿起移动的棋子
    MovePosFrom : TImage;                       // 最后移动过的棋子的位置
    MovePosTo   : TImage;                       //   用来显示走棋指示
  public
    constructor Create(imgBoard: TImage; imgXY: dTXQPXY; imgQZMove: TImage;
                       imgLastMovePos: TImage;  picQZ: dTXQZPIC);
    destructor Destroy; override;

    procedure dStartMoveFromXY(XY:dTBYTE);      // 从XY处开始移动棋子
    procedure dStopMoveAtXY(XY:dTBYTE);         // 移动停止到XY处
    procedure dUndoMove;                        // 取消移动
    procedure dRefreshBoard(ReStart:Boolean);
    procedure dDispQiziAtRecNo(iRec: dTINT32);  // 显示iRec步的棋局
    procedure dMoveMemoToRecNo(iRec:dTINT32);   // 将注解移入对局记录
    procedure dLoadMemoFromRecNo(iRec:dTINT32); // 将记录中的注解显示出来
    procedure dDispVarStepAtRecNo(iRec:dTInt32);
    procedure dLoadAllRecForVarStepNo(iVar:dTInt32);
    procedure dLoadAllRecForPlayNode(PN:dTXQPlayNode);
    procedure dAddPlayNodeIntoPlayRec(PN:dTXQPlayNode);
    procedure dOnRecListBoxClick;               // 响应单击棋局记录事件
    procedure dOnVarListBoxClick;
    procedure dReverseBoard;                    // 棋盘倒转180度
  end;

function  sGetPlayRecStr(var qzXY:dTXQZXY; XYf,XYt:dTBYTE):string;


implementation

end.
