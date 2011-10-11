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

unit XQSystem;

//-------------------------------------------------------------------------
//
//.........................................................................
interface

//-------------------------------------------------------------------------
//
//.........................................................................
uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, dDelphiS, XQDataT, XQPNode, XQRecLBX;

//-------------------------------------------------------------------------
//  类型定义
//.........................................................................
type

  //-----------------------------------------------------------------------
  // 定义象棋子类
  //.......................................................................
  dTXQZ = class
    Index       : dTINT32;      // 棋子索引
    Name        : String[16];   // 棋子名称
    Picture     : TPicture;     // 棋子图像
    Arms        : 1..7;         // 兵种,依次为:车马象士将炮兵
    XYStart     : dTBYTE;       // 棋子的开局位置(指原始位置)
    XY          : dTBYTE;       // 棋子的位置(指棋子在棋盘上当前的位置)
   public
    constructor Create(iIdx:dTINT32; sName:String; pic:TPicture;
                       iArms:dTBYTE; bXYStart:dTBYTE);
  end;

  //-----------------------------------------------------------------------
  // 定义象棋计时钟
  //.......................................................................
  dTXQCLOCK = class
    Name        : String[16];
  public
    constructor Create;
    destructor Destroy; override;
  end;



  //-----------------------------------------------------------------------
  // 定义象棋类
  //.......................................................................
  dTXiangQi = class
  public
    BoardImage  : TImage;                       // 象棋盘图像
    BoardXY     : dTXQPXY;                      // 棋盘9x10个交叉点
    QiziMoveImg : TImage;                       // 移动中棋子的图像
                                                // 用来处理移动
    Qizi        : array [1..32] of dTXQZ;       // 32个象棋子
    QiziMove    : dTXQZ;                        // 被拿起移动的棋子
    MovePosFrom : TImage;                       // 最后移动过的棋子的位置
    MovePosTo   : TImage;                       //   用来显示走棋指示
    Clock       : dTXQCLOCK;                    // 计时钟
    RedPlayer   : String[32];                   // 红方棋手
    BlkPlayer   : String[32];                   // 黑方棋手
    RecListBox  : TListBox;                     // 棋谱记录列表框
    VarListBox  : TListBox;                     // 变着记录列表框
    isAddVarStep: dTBoolean;                    // 是否是加入变着状态
    RecMemo     : TMemo;                        // 注解备注
    isMemoEdit  : dTBoolean;
    PlayStepNo  : dTINT32;                      // 当前行棋的总步数
    DispStepNo  : dTINT32;                      // 当前显示的屏幕是第几步棋
    PlayNode    : dTXQPlayNode;                 // 当前最后一步棋的节点
    DispNode    : dTXQPlayNode;                 // 当前棋盘显示的棋的节点
    WhoPlay     : dTWHOPLAY;                    // 轮到谁下
    ReverseH    : Boolean;                      // 左右对换标志
    PlayRec     : array [0..dCMaxRecNo] of dTXQPlayNode; // 行棋记录(棋谱)
    PlayVar     : array [0..dCMaxVarNo] of dTXQPlayNode;
    PlayTree    : dTXQPlayNode;                 // 对弈树
    PlayRecHook : procedure;
    RefreshHook : procedure;

    //XQRecLBX    : dTXQRecListBox;
  private
    function sGetFMTRecStr(PN: dTXQPlayNode): string;

  public
    constructor Create(imgBoard: TImage; imgXY: dTXQPXY; imgQZMove: TImage;
                       imgMovePosF, imgMovePosT:TImage; picQZ:dTXQZPIC;
                       lbxRec,lbxOther:TListBox; memRec: TMemo); overload;
    constructor Create(imgBoard:TImage;imgXY:dTXQPXY;imgQZMove:TImage;
                       imgMovePosF, imgMovePosT:TImage;picQZ:dTXQZPIC;
                       lbxRec,lbxOther:TListBox;
                       memRec:TMemo;XQZXY:dTXQZXY); overload;
    destructor Destroy; override;

    procedure dStartMoveFromXY(XY:dTBYTE);      // 从XY处开始移动棋子
    procedure dStopMoveAtXY(XY:dTBYTE);         // 移动停止到XY处
    function  isMoveToValid(XY:dTBYTE; var sPlayRec:String):dTBOOLEAN;
                // 判断移动是否合乎规则, sPlayRec 记录本步棋谱

//    function  GetPlayRecStr(qzXY:dTXQZXY; WP:dTWhoPlay;
//                            XYf,XYt:dTBYTE):string;
    procedure dUndoMove;                        // 取消移动
    function  iQiziIndexAtXY(XY:dTBYTE):dTINT32;// 取XY处的棋子索引号
    function  isPlayOneStepOK(XYf, XYt: dTBYTE): dTBOOLEAN;
                // 判断从XYf移动到XYt是否合乎规则, 若合乎规则,真正执行
    procedure dEnablePlayer(WP:dTWHOPLAY); overload; // 允许一方走棋
    procedure dEnablePlayer(PN:dTXQPlayNode); overload;
    procedure dDeleteOnePlayRec(bRefresh: Boolean=True); // 删除最后一步对局记录
    procedure dDeleteOnePlayNode;               // 删除刚刚走过的一步棋的节点
    procedure dDeletePlayVar(PN:dTXQPlayNode);
    procedure dRefreshBoard(ReStart:Boolean);
                // 刷新当前棋局, Restart = True 表示从第0步开始(复位)
    procedure dDispQiziAtRecNo(iRec: dTINT32);  // 显示iRec步的棋局
    procedure dMoveMemoToRecNo(iRec:dTINT32);   // 将注解移入对局记录
    procedure dLoadMemoFromRecNo(iRec:dTINT32); // 将记录中的注解显示出来
    function  isHighlightVarStepActive: Boolean;
    procedure dMovePlayVarUp;
    procedure dMovePlayVarDown;

    procedure dDispVarStepAtRecNo(iRec:dTInt32);
    procedure dLoadAllRecForPlayNode(PN:dTXQPlayNode);
    procedure dAddPlayNodeIntoPlayRec(PN:dTXQPlayNode);
    procedure dOnRecListBoxClick;               // 响应单击棋局记录事件
    procedure dOnVarListBoxDblClick;
    procedure dOnRecMemoChange;
    procedure dRefreshRecStr;
//    procedure dReverseBoard;                    // 棋盘倒转180度
  end;

const
dCXqzXY: dTXQZXY = (80,70,60,50,40,30,20,10,00,72,12,83,63,43,23,03,
                      09,19,29,39,49,59,69,79,89,17,77,06,26,46,66,86);


var
  IsAutoPlaying: Boolean = False;

///////////////////////////////////////////////////////////////////////////
implementation

//-------------------------------------------------------------------------
//
//.........................................................................
constructor dTXQZ.Create(iIdx:dTINT32; sName:String; pic:TPicture;
                         iArms:dTBYTE; bXYStart:dTBYTE);
begin
  Name := sName;  Picture := pic;  Arms := iArms; XYStart := bXYStart;
end;

//-------------------------------------------------------------------------
//
//.........................................................................
constructor dTXQCLOCK.Create;
begin
  ShowMessage('XQCLOCK Create');
end;

destructor dTXQCLOCK.Destroy;
begin

end;


//-------------------------------------------------------------------------
// 象棋类的构造函数
//.........................................................................
constructor dTXIANGQI.Create(imgBoard:TImage;imgXY:dTXQPXY;imgQZMove:TImage;
                             imgMovePosF,imgMovePosT:TImage;picQZ:dTXQZPIC;
                             lbxRec,lbxOther:TListBox;
                             memRec:TMemo; XQZXY:dTXQZXY);
var
  i, j: dTINT32;
begin
  BoardImage := imgBoard;                       // 棋盘图片

  for i:=0 to 8 do for j:=0 to 9 do             // 创建象棋盘中的'兵站'
  begin
    BoardXY[i,j]         := imgXY[i, j];
    BoardXY[i,j].Tag     := i*10 + j;           // Tag 中存有'兵站'坐标
    BoardXY[i,j].Picture := nil;
  end;

  QiziMoveImg := imgQZMove;                     // 拿起移动的棋子的图片

  QiziMove    := nil;                           // 正在移动的棋子

  MovePosFrom         := imgMovePosF;
  MovePosTo           := imgMovePosT;           // 最后移动的棋子的指示
  MovePosTo.Visible   := False;                 // 关掉棋子指示
  MovePosFrom.Visible := False;

  // 创建32个象棋子(需要QiziPic数组)
  QiZi[ 1] := dTXQZ.Create( 1, '车', picQZ[ 1], 1, 80); // Red
  QiZi[ 2] := dTXQZ.Create( 2, '马', picQZ[ 2], 2, 70);
  QiZi[ 3] := dTXQZ.Create( 3, '相', picQZ[ 3], 3, 60);
  QiZi[ 4] := dTXQZ.Create( 4, '士', picQZ[ 4], 4, 50);
  QiZi[ 5] := dTXQZ.Create( 5, '帅', picQZ[ 5], 5, 40);
  QiZi[ 6] := dTXQZ.Create( 6, '士', picQZ[ 4], 4, 30);
  QiZi[ 7] := dTXQZ.Create( 7, '相', picQZ[ 3], 3, 20);
  QiZi[ 8] := dTXQZ.Create( 8, '马', picQZ[ 2], 2, 10);
  QiZi[ 9] := dTXQZ.Create( 9, '车', picQZ[ 1], 1, 00);
  QiZi[10] := dTXQZ.Create(10, '炮', picQZ[ 6], 6, 72);
  QiZi[11] := dTXQZ.Create(11, '炮', picQZ[ 6], 6, 12);
  QiZi[12] := dTXQZ.Create(12, '兵', picQZ[ 7], 7, 83);
  QiZi[13] := dTXQZ.Create(13, '兵', picQZ[ 7], 7, 63);
  QiZi[14] := dTXQZ.Create(14, '兵', picQZ[ 7], 7, 43);
  QiZi[15] := dTXQZ.Create(15, '兵', picQZ[ 7], 7, 23);
  QiZi[16] := dTXQZ.Create(16, '兵', picQZ[ 7], 7, 03);
  QiZi[17] := dTXQZ.Create(17, '车', picQZ[ 8], 1, 09); // Blk
  QiZi[18] := dTXQZ.Create(18, '马', picQZ[ 9], 2, 19);
  QiZi[19] := dTXQZ.Create(19, '象', picQZ[10], 3, 29);
  QiZi[20] := dTXQZ.Create(20, '士', picQZ[11], 4, 39);
  QiZi[21] := dTXQZ.Create(21, '将', picQZ[12], 5, 49);
  QiZi[22] := dTXQZ.Create(22, '士', picQZ[11], 4, 59);
  QiZi[23] := dTXQZ.Create(23, '象', picQZ[10], 3, 69);
  QiZi[24] := dTXQZ.Create(24, '马', picQZ[ 9], 2, 79);
  QiZi[25] := dTXQZ.Create(25, '车', picQZ[ 8], 1, 89);
  QiZi[26] := dTXQZ.Create(26, '炮', picQZ[13], 6, 17);
  QiZi[27] := dTXQZ.Create(27, '炮', picQZ[13], 6, 77);
  QiZi[28] := dTXQZ.Create(28, '卒', picQZ[14], 7, 06);
  QiZi[29] := dTXQZ.Create(29, '卒', picQZ[14], 7, 26);
  QiZi[30] := dTXQZ.Create(30, '卒', picQZ[14], 7, 46);
  QiZi[31] := dTXQZ.Create(31, '卒', picQZ[14], 7, 66);
  QiZi[32] := dTXQZ.Create(32, '卒', picQZ[14], 7, 86);

  PlayTree := dTXQPlayNode.Create(0,'========= ',0,0,XQZXY,nil,nil,nil,nil);
  PlayNode := PlayTree;

  // 32个棋子的当前位置
  for i:=1 to 32 do
  begin
    Qizi[i].XY           := $FF;        // 棋子均不在棋盘上
    PlayTree.QiziXY[i] := XQZXY[i];
  end;

  PlayRec[0] := PlayTree;

  RecListBox := lbxRec;
  VarListBox := lbxOther;
  RecMemo    := memRec;
  RecListBox.Items.Add(' ============ ');

  //  Clock       : dTXQCLOCK;                    // 计时钟

  RedPlayer := 'RedPlayer';
  BlkPlayer := 'BlkPlayer';

  PlayStepNo:= 0; // 当前行棋的总步数

  PlayRecHook := nil;
  RefreshHook := nil;

  ReverseH    := False;

  dDispQiziAtRecNo(0);
  dEnablePlayer(PlayTree);
end;

constructor dTXIANGQI.Create(imgBoard:TImage;imgXY:dTXQPXY;imgQZMove:TImage;
                             imgMovePosF,imgMovePosT:TImage;picQZ:dTXQZPIC;
                             lbxRec,lbxOther:TListBox;memRec:TMemo);
begin
  Create(imgBoard,imgXY,imgQZMove,imgMovePosF,imgMovePosT,picQZ,
         lbxRec,lbxOther,memRec,dCXQZXY);
end;

destructor dTXIANGQI.Destroy;
var
  i: dTINT32;
begin
  for i:=1 to 32 do Qizi[i].Destroy;
  //XQRecLBX.Free;
  PlayTree.Free;
  inherited Destroy;
end;

function dTXiangQi.sGetFMTRecStr(PN: dTXQPlayNode):string;
var
  s : string;
begin
  sGetFMTRecStr := '';
  if (PN=nil) then Exit;
  case PN.StepNo mod 2 of
    1:
      begin
        s := IntToStr((PN.StepNo + 1) div 2);
        case Length(s) of
          1: s := '  ' + s;
          2: s := ' ' + s;
        end;
        s := s + '. ' + PN.StrRec + ' ';
      end;
    0:
      begin
        s := '     ' + PN.StrRec + ' ';
      end;
  end;
  if (PN=PlayTree) then s := ' ============ ';

  if ((PN.LParent<>nil)or(PN.RChild<>nil)) then s := s + 'm';
  if PN.Remark <> nil then s := s + '*';

  sGetFMTRecStr := s;
end;


//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXIANGQI.dStartMoveFromXY(XY:dTBYTE);
var
  iIdx, X, Y: dTINT32;
begin
  QiziMove := nil;  X := XY div 10;  Y := XY mod 10;

  if(not((X in [0..8])and(Y in [0..9]))) then Exit;
  iIdx := iQiziIndexAtXY(XY);
  case iIdx of
    0     : Exit;
    01..16: if (WhoPlay <> wpRed) then Exit;
    17..32: if (WhoPlay <> wpBlk) then Exit;
  end;

  MovePosTo.Visible     := False;
  MovePosFrom.Visible   := False;
  
  QiziMove              := Qizi[iIdx];
  QiziMove.XY           := XY;

  QiziMoveImg.Picture   := QiziMove.Picture;
  QiziMoveImg.Left      := BoardXY[X,Y].Left;
  QiziMoveImg.Top       := BoardXY[X,Y].Top;
  QiziMoveImg.Visible   := True;
  BoardXY[X,Y].Cursor   := crDefault;
  BoardXY[X,Y].Picture  := nil;
  BoardXY[X,Y].DragMode := dmManual;
  MovePosFrom.Left := BoardXY[X,Y].Left;
  MovePosFrom.Top  := BoardXY[X,Y].Top;
end;

//-------------------------------------------------------------------------
//
//.........................................................................
function  dTXIANGQI.iQiziIndexAtXY(XY: dTBYTE): dTINT32;
var
  i: dTINT32;
begin
  for i:= 1 to 32 do
  begin
    if (XY = Qizi[i].XY) then
    begin
      iQiziIndexAtXY := i;
      Exit;
    end;
  end;
  iQiziIndexAtXY := 0;
end;

//-------------------------------------------------------------------------
// 变量定义
//.........................................................................
var
  dCREDNUM: array [1..9] of String[3] =         // 红方所用的数字系统
             ('一','二','三','四','五','六','七','八','九');
  dCBLKNUM: array [1..9] of String[3] =         // 黑方所用的数字系统
             ('１','２','３','４','５','６','７','８','９');
function dTXIANGQI.isMoveToValid(XY:dTBYTE; var sPlayRec:String):dTBOOLEAN;
var
  i    : dTINT32;
  qzXY : dTXQZXY;
  PN   : dTXQPlayNode;
begin
  isMoveToValid := False;
  for i:=1 to 32 do qzXY[i] := Qizi[i].XY;
  sPlayRec:=sGetPlayRecStr(qzXY, QiziMove.XY, XY, ReverseH);
  if (sPlayRec='') then Exit;
  if (isAddVarStep and (PlayNode.LChild<>nil)) then
  begin
    PN := PlayNode.LChild;
    while (PN<>nil) do
    begin
      if ((PN.XYf=QiziMove.XY)and(PN.XYt=XY)) then
      begin
        Application.MessageBox(
          '您刚才走的一步变着已经存在，请换一种走法作为变着。',
          '系统信息 - 增加新变着',
          MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        Exit;
      end;
      PN := PN.RChild;
    end;
  end;
  isMoveToValid := True; ;
end;

//-------------------------------------------------------------------------
//
//.........................................................................
function dTXIANGQI.isPlayOneStepOK(XYf, XYt: dTBYTE): dTBOOLEAN;
var
  iRecNo : dTINT32;
begin
  iRecNo := PlayStepNo;
  dStartMoveFromXY(XYf); dStopMoveAtXY(XYt);
  isPlayOneStepOK := (iRecNo <> PlayStepNo);
end;


//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXIANGQI.dUndoMove;
var
  X, Y: dTINT32;
begin
  X := QiziMove.XY div 10;  Y := QiziMove.XY mod 10;
  BoardXY[X,Y].Picture  := QiziMove.Picture;
  BoardXY[X,Y].Cursor   := crHandPoint;
  BoardXY[X,Y].DragMode := dmAutomatic;
  QiziMoveImg.Visible   := False;

  // 2001-02-15 : 解决点击走子问题。
  MovePosTo.Left := BoardXY[X,Y].Left;  MovePosTo.Top := BoardXY[X,Y].Top;
  MovePosTo.Visible := True;
end;

//-------------------------------------------------------------------------
// 移动结束处理
//.........................................................................
procedure dTXIANGQI.dStopMoveAtXY(XY:dTBYTE);
var
  i, X, Y: dTInt32;
  sPlayRec   : string;                          // 本步棋的文字记录
  qzXY       : dTXQZXY;
  XYFrom     : dTByte;
  PN, PNTemp : dTXQPlayNode;
begin
  if (QiziMove = nil) then Exit;                // 没有棋子移动，返回
  if ((PlayStepNo>(dCMaxRecNo-1))or
     (not isMoveToValid(XY, sPlayRec))) then    // 无效便取消移动
  begin
    dUndoMove;
    Exit;
  end;

  X := XY div 10;  Y := XY mod 10;              // 分解X, Y
  XYFrom := QiziMove.XY;                        // 棋子移动的起点

  i := iQiziIndexAtXY(XY);                      // 被吃掉的棋子
  if (i <> 0) then begin Qizi[i].XY := $FF; end;

  // 将棋子放下
  QiziMove.XY := XY;  BoardXY[X,Y].Picture := QiziMove.Picture;

  // 跟踪棋子的移动，放置移动指示
  MovePosTo.Left := BoardXY[X,Y].Left;  MovePosTo.Top := BoardXY[X,Y].Top;
  MovePosTo.Visible := True;
  MovePosFrom.Visible := True;

  // 棋子移动的'替身'的任务结束
  QiziMoveImg.Visible := False;  QiziMove := nil;

  dMoveMemoToRecNo(PlayStepNo);                 // 记录注解(移动前的注解)

  PlayStepNo := PlayStepNo + 1;                 // 行棋记录增加一步
  DispStepNo := PlayStepNo;

  for i:=1 to 32 do qzXY[i] := Qizi[i].XY;

  // 判断是否是增加变着状态
  if not isAddVarStep then
  begin
    // 不是增加变着状态, 则在对弈树中增加一个左孩子节点, 并将当前节点
    // 设置为该节点
    PN := dTXQPlayNode.Create(PlayStepNo, sPlayRec,
            XYFrom, XY, qzXY, nil, PlayNode, nil, PlayNode);
  end
  else
  begin
    // 是增加变着状态，则在对弈树中增加一个右孩子节点，并将当前节点
    // 设置为该节点, 该节点应加在当前节点的最右后代
    PN:= dTXQPlayNode.Create(PlayStepNo, sPlayRec,
           XYFrom, XY, qzXY, nil, DispNode, nil, nil);
    PNTemp := DispNode.LChild;
    if (PNTemp = nil) then begin ShowMessage('Error PNTemp'); Exit; end;
     // 寻找最右后代
    while (PNTemp.RChild <> nil) do PNTemp := PNTemp.RChild;
    PNTemp.dSetRChild(PN);
  end;

  dAddPlayNodeIntoPlayRec(PN);

  PlayNode := PN;
  DispNode := PN;
  // isAddVarStep := False;
  RecListBox.ItemIndex := PlayStepNo;
  dDispVarStepAtRecNo(PlayStepNo);

  dDispQiziAtRecNo(PlayStepNo);  //??

  dEnablePlayer(PlayNode);
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXIANGQI.dEnablePlayer(WP: dTWHOPLAY);
var
  i, j, X, Y, m, n: dTINT32;
begin
  if (WP <> wpPause) then WhoPlay := WP;  m := 0;  n := 0;

  for i:=0 to 8 do for j:=0 to 9 do
  begin
    BoardXY[i,j].Cursor   := crDefault;
    BoardXY[i,j].DragMode := dmManual;
  end;

  case WP of
  wpNone  : Exit;
  wpPause : Exit;
  wpRed   : begin m:=01; n:=16; end;
  wpBlk   : begin m:=17; n:=32; end;
  end;

  for i:=m to n do
  begin
    if (Qizi[i].XY = $FF) then Continue;
    X := Qizi[i].XY div 10;  Y := Qizi[i].XY mod 10;
    BoardXY[X,Y].Cursor   := crHandPoint;
    BoardXY[X,Y].DragMode := dmAutomatic;
  end;
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXIANGQI.dEnablePlayer(PN: dTXQPlayNode);
begin
  if (PN=nil) then begin dEnablePlayer(wpPause); Exit; end;
  if ((PN=PlayTree)and(PlayStepNo=0)and(PN.XYf=0)) then
  begin
    if (PN.XYt=0) then                  // 第0步的XYt指示了谁先行
      dEnablePlayer(wpRed)
    else
      dEnablePlayer(wpBlk);
    Exit;
  end;
  if (PN.StepNo<PlayStepNo) then begin dEnablePlayer(wpPause); Exit; end;
  case iQiziIndexAtXY(PN.XYt) of
    01..16: dEnablePlayer(wpBlk);
    17..32: dEnablePlayer(wpRed);
  end;
end;

//-------------------------------------------------------------------------
// 显示棋谱记录中某一步的盘面布局  (第0步为开局的盘面)
//.........................................................................
procedure dTXIANGQI.dDispQiziAtRecNo(iRec: dTINT32);
var
  i, Xf, Yf, Xt, Yt, iHeight: dTINT32;
begin
  if ((iRec<0)or(iRec>PlayStepNo)) then Exit;   // 检查步数的有效性

  MovePosFrom.Visible := False;

  if (IsAutoPlaying and (DispStepNo = (iRec - 1))) then
  begin
    Xf := PlayRec[iRec].XYf div 10;  Yf := PlayRec[iRec].XYf mod 10;
    with BoardXY[Xf, Yf] do
    begin
      iHeight := Height;
      Height  := 0;
      Repaint;
      Sleep(333);
      Height  := iHeight;
      Repaint;
      Sleep(333);
    end;
  end;

  MovePosTo.Visible   := False;                 // 关掉棋子指示
  
  for i:=1 to 32 do                             // 清掉无用的棋子
  begin
   if (Qizi[i].XY <> PlayRec[iRec].QiziXY[i]) then
   begin
     Xf := Qizi[i].XY div 10;  Yf := Qizi[i].XY mod 10;
     if (Xf < 10) then BoardXY[Xf, Yf].Picture := nil;
   end;
  end;

  for i:=1 to 32 do                             // 显示不一样的棋子
  begin
     if (PlayRec[iRec].QiziXY[i] <> Qizi[i].XY ) then
     begin
       Xt := PlayRec[iRec].QiziXY[i] div 10;
       Yt := PlayRec[iRec].QiziXY[i] mod 10;
       if (Xt in [0..8]) then BoardXY[Xt, Yt].Picture := Qizi[i].Picture;
       Qizi[i].XY := PlayRec[iRec].QiziXY[i];
     end;
  end;

  if (iRec > 0) then                            // 显示棋子走动指示
  begin
    Xf                  := PlayRec[iRec].XYf div 10;
    Yf                  := PlayRec[iRec].XYf mod 10;
    MovePosFrom.Left    := BoardXY[Xf,Yf].Left;
    MovePosFrom.Top     := BoardXY[Xf,Yf].Top;
    MovePosFrom.Visible := True;
    Xt                  := PlayRec[iRec].XYt div 10;
    Yt                  := PlayRec[iRec].XYt mod 10;
    MovePosTo.Left      := BoardXY[Xt,Yt].Left;
    MovePosTo.Top       := BoardXY[Xt,Yt].Top;
    MovePosTo.Visible   := True;
  end;

  dMoveMemoToRecNo(DispStepNo);                 // 将更新的注解记录下来
  dLoadMemoFromRecNo(iRec);                     // 显示本步棋的注解

  dDispVarStepAtRecNo(iRec);
  RecListBox.ItemIndex := iRec;
  DispStepNo := iRec;                           // 设置当前显示的记录
  DispNode   := PlayRec[DispStepNo];

  if(@PlayRecHook<>nil) then PlayRecHook;
end;

//-------------------------------------------------------------------------
// 将注解存入对局记录
//.........................................................................
procedure dTXIANGQI.dMoveMemoToRecNo(iRec:dTINT32);
var
  PN : dTXQPlayNode;
begin
  if (not isMemoEdit) then Exit;
  if ((iRec<0)or(iRec>PlayStepNo)) then Exit;   // 检查范围

  PN := PlayRec[iRec];

  if (PN.Remark <> nil) then                    // 先释放旧的记录
  begin
      PN.Remark.Free;  PN.Remark := nil;
  end;

  if (RecMemo.Lines.Count>0) then               // 有注解
    if (not ((RecMemo.Lines.Count=1) and (RecMemo.Lines[0]=''))) then
    begin
      PN.Remark      := TStringList.Create;
      PN.Remark.Text := RecMemo.Text;
    end;
  RecListBox.Items[iRec] := sGetFMTRecStr(PN);

  RecMemo.Lines.Clear;
end;

//-------------------------------------------------------------------------
// 将记录中的注解显示出来
//.........................................................................
procedure dTXIANGQI.dLoadMemoFromRecNo(iRec:dTINT32);
var
  PN : dTXQPlayNode;
begin
  RecMemo.Lines.Clear;

  PN := PlayRec[iRec];

  if (PN.Remark <> nil) then
  begin
    RecMemo.Text := PN.Remark.Text;
    RecMemo.SelStart := 0;  RecMemo.SelLength := 0;
  end;
end;

//-------------------------------------------------------------------------
// 变着记录是当前记录吗？
//.........................................................................
function dTXiangQi.isHighlightVarStepActive: Boolean;
var
  iRec : dTInt32;
  iVar : dTInt32;
begin
  Result := False;
  iRec := RecListBox.ItemIndex;
  iVar := VarListBox.ItemIndex;
  if ((iRec<1)or(iRec>dCMaxRecNo)) then Exit;
  if ((iVar<0)or(iVar>dCMaxVarNo)) then Exit;
  if PlayRec[iRec] = nil then Exit;
  if PlayVar[iVar] = nil then Exit;
  Result := (PlayRec[iRec] = PlayVar[iVar]);
end;


procedure dExchangePlayVar(var upNode, dnNode: dTXQPlayNode);
var
  tmpRChild: dTXQPlayNode;
begin
  if ((upNode=nil)or(dnNode=nil)) then Exit;

  tmpRChild  := dnNode.RChild;

  dnNode.LParent := upNode.LParent;
  dnNode.RParent := upNode.RParent;
  if (dnNode.RChild <> nil) then dnNode.RChild.LParent:=upNode;
  dnNode.RChild  := upNode;
  if (upNode.LParent <> nil) then upNode.Lparent.RChild := dnNode;
  if (upNode.RParent <> nil) then upNode.RParent.LChild := dnNode;

  upNode.LParent := dnNode;
  upNode.RParent := nil;  //tmpRParent;
  upNode.RChild  := tmpRChild;
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXiangQi.dMovePlayVarUp;
var
  iVar : dTInt32;
begin
  iVar := VarListBox.ItemIndex;
  if (iVar<1) then Exit;
  dExchangePlayVar(PlayVar[iVar-1], PlayVar[iVar]);
  dDispVarStepAtRecNo(RecListBox.ItemIndex);
  VarListBox.ItemIndex := (iVar-1);
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXiangQi.dMovePlayVarDown;
var
  iVar : dTInt32;
begin
  iVar := VarListBox.ItemIndex;
  if (iVar>=(VarListBox.Items.Count-1)) then Exit;
  dExchangePlayVar(PlayVar[iVar], PlayVar[iVar+1]);
  dDispVarStepAtRecNo(RecListBox.ItemIndex);
  VarListBox.ItemIndex := (iVar+1);
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXiangQi.dDispVarStepAtRecNo(iRec:dTInt32);
var
  PN    : dTXQPlayNode;
  n     : dTInt32;
  s     : string;
begin
  VarListBox.Items.Clear;

  if ((iRec<1)or(iRec>dCMaxRecNo)) then Exit;
  if PlayRec[iRec] = nil then Exit;

  // 在棋谱记录中找到当前的节点的上一步棋的节点的第一步应着
  PN := PlayRec[iRec].LastStepNode.LChild;  n := 0;
  while (PN <> nil) do
  begin
    s := '  A. ';  s[3] := chr(ord(s[3])+n);
    s := s + PN.StrRec;
    if (PN = PlayRec[iRec]) then  s := s + ' <--';
    VarListBox.Items.Add(s);
    PlayVar[n] := PN;
    n := n + 1;

    PN := PN.RChild;
  end;
  if n<>0 then
  begin
    RecListBox.Items[iRec]:=sGetFMTRecStr(PlayRec[iRec]);
  end;
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXiangQi.dLoadAllRecForPlayNode(PN:dTXQPlayNode);
var
  i, iDispStepNo :  dTInt32;
begin
  // 先删除原来的走法(从显示的当前状况开始)
  if (PN=nil) then Exit;
  iDispStepNo := DispStepNo;
  if (iDispStepNo<PN.StepNo) then iDispStepNo:=PN.StepNo;

  dMoveMemoToRecNo(DispStepNo);
  dLoadMemoFromRecNo(DispStepNo);

  for i:=PlayStepNo downto iDispStepNo do
  begin
    //为修正变着中注解显示的错误
    if i = iDispStepNo then
    begin
      dDeleteOnePlayRec;
    end
    else
    begin
      dDeleteOnePlayRec(False);
    end;
  end;
  if PN = PlayTree then
  begin
    iDispStepNo:=0; RecListBox.Items.Clear;
  end;
  while PN <> nil do
  begin
    dAddPlayNodeIntoPlayRec(PN);
    PlayStepNo := PN.StepNo;
    PlayNode   := PN;
    PN := PN.LChild;
  end;

  dDispQiziAtRecNo(iDispStepNo);
  dEnablePlayer(PlayNode);
end;

//-------------------------------------------------------------------------
// 将走棋节点加入棋谱列表
//.........................................................................
procedure dTXiangQi.dAddPlayNodeIntoPlayRec(PN:dTXQPlayNode);
begin
  if (PN=nil) then Exit;

  if (PN.StepNo <= dCMaxRecNo) then
  begin
    PlayRec[PN.StepNo] := PN;
    RecListBox.Items.Add(sGetFMTRecStr(PN));    // 显示本步棋
  end;
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXIANGQI.dOnRecListBoxClick;
begin
  if (RecListBox.Items.Count=0) then Exit;
  if (RecListBox.ItemIndex<0) then Exit;
  dDispQiziAtRecNo(RecListBox.ItemIndex);
  dEnablePlayer(DispNode);
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXIANGQI.dOnVarListBoxDblClick;
begin
  if (VarListBox.Items.Count=0) then Exit;
  if (VarListBox.ItemIndex<0) then Exit;
  if isHighlightVarStepActive then Exit;
  dLoadAllRecForPlayNode(PlayVar[VarListBox.ItemIndex]);
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXIANGQI.dOnRecMemoChange;
begin
  isMemoEdit := True;
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXIANGQI.dDeleteOnePlayNode;
var
  PN : dTXQPlayNode;
begin
  if ((PlayStepNo=0)or(PlayStepNo<>DispStepNo)) then Exit;
  PN := PlayRec[PlayStepNo];
  if (PN=nil) then Exit;
  if (not ((PN.LParent=nil)and(PN.RChild=nil))) then // 有变着
  begin
    case Application.MessageBox(
          '本步棋的记录有变着存在，如果您删除了本记录，所有的变着以及后'+
          '续变化都会被删除。'#13#10#13#10'真的要删除吗？',
          '删除棋谱记录',
          MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) of
      IDOK:
        begin end;
      else
        Exit;
    end;
  end;
  dDeleteOnePlayRec;
  if (PN <> nil) then PN.Free;
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXiangQi.dDeletePlayVar(PN:dTXQPlayNode);
begin
  if (PN=nil) then Exit;

  if (not (PN.LChild=nil)) then // 有后续变化
  begin
    case Application.MessageBox(
          '本步变着有后续变化，如果您删除了本记录，所有的后'+
          '续变化都会被删除。'#13#10#13#10'真的要删除吗？',
          '删除变着',
          MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) of
      IDOK:
        begin end;
      else
        Exit;
    end;
  end;

  if(PN.RParent<>nil) then
  begin
    PN.RParent.dSetLChild(PN.RChild);
  end;
  if(PN.LParent<>nil) then
  begin
    PN.LParent.dSetRChild(PN.RChild);
  end;
  PN.LParent:=nil;  PN.RParent:=nil; PN.LChild:=nil; PN.RChild:=nil;
  PN.Free;
end;

//-------------------------------------------------------------------------
// 删除一个棋谱记录，在RecListBox中
//.........................................................................
procedure dTXIANGQI.dDeleteOnePlayRec(bRefresh: Boolean);
begin
  if (PlayStepNo = 0) then Exit;
  RecListBox.Items.Delete(RecListBox.Items.Count-1);
  PlayStepNo := RecListBox.Items.Count - 1;    // 走棋步数-1
  PlayNode   := PlayNode.LastStepNode;
  RecListBox.ItemIndex := -1;
  if (bRefresh) then dDispQiziAtRecNo(PlayStepNo);
  RecListBox.ItemIndex := 0;
  RecListBox.ItemIndex := PlayStepNo;
  if (bRefresh) then dEnablePlayer(PlayNode);
end;

//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXIANGQI.dRefreshBoard(ReStart:Boolean);
var
  i, j, m, n: Integer;
begin
  if ReStart then
  begin
    for i:=1 to 32 do
    begin
      Qizi[i].XY := Qizi[i].XYStart;
    end;
    RecListBox.Items.Clear;
    PlayStepNo          := 0;
    DispStepNo          := 0;
    MovePosTo.Visible   := False;
    MovePosFrom.Visible := False;
  end;

  for i:=0 to 8 do for j:=0 to 9 do
  begin
    BoardXY[i, j].Picture  := nil;
    BoardXY[i, j].Cursor   := crDefault;
    BoardXY[i, j].DragMode := dmManual;
  end;

  for i:=1 to 32 do
  begin
    if (Qizi[i].XY = $FF) then Continue;
    m := Qizi[i].XY div 10;  n := Qizi[i].XY mod 10;
    BoardXY[m, n].Picture  := Qizi[i].Picture;
  end;
end;
{
//-------------------------------------------------------------------------
//
//.........................................................................
procedure dTXIANGQI.dReverseBoard;
var
  i, j, iLeft, iTop: dTINT32;
begin
  MovePosTo.Visible   := False;
  MovePosFrom.Visible := False;
  for i:=0 to 8 do for j:=0 to 4 do
  begin
    iLeft                  := BoardXY[i, j].Left;
    iTop                   := BoardXY[i, j].Top;
    BoardXY[i, j].Left     := BoardXY[8-i, 9-j].Left;
    BoardXY[i, j].Top      := BoardXY[8-i, 9-j].Top;
    BoardXY[8-i, 9-j].Left := iLeft;
    BoardXY[8-i, 9-j].Top  := iTop;
  end;
  dDispQiziAtRecNo(DispStepNo);         // 为了显示最后移动棋子的标记
end;
}

procedure dTXIANGQI.dRefreshRecStr;
var
  i: Integer;
procedure RefreshPNodeRecStr(APNode: dTXQPlayNode);
begin
  if APNode = nil then Exit;
  if APNode.LastStepNode = nil then
  begin
    APnode.StrRec := '';
  end
  else
  begin
    APNode.StrRec := sGetPlayRecStr(APNode.LastStepNode.QiZiXY,
       APNode.XYf, APNode.XYt, ReverseH, False);
  end;
  RefreshPNodeRecStr(APNode.LChild);
  RefreshPNodeRecStr(APNode.RChild);
end;
begin
  RefreshPNodeRecStr(PlayTree);
  for i:=1 to RecListBox.Items.Count do
  begin
    RecListBox.Items[i-1]:=sGetFMTRecStr(PlayRec[i-1]);
  end;
end;

end.
///////////////////////////////////////////////////////////////////////////