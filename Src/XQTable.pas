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

unit XQTable;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls, ExtCtrls,
  ComCtrls, SysUtils, Dialogs, XQSystem, dDelphiS, XQDataT, XQRecLBX, XQPNode,
  DBCtrls, Buttons, ImgList, ToolWin, ActnList, XQFileRW, Menus, ClipBrd;


const
  dCXQTableWidth  = 732;
  dCXQTableHeight = 454;

//-------------------------------------------------------------------------
//
//.........................................................................
type
  TfrmXQTable = class(TForm)            // "象棋对弈桌"类定义
    pnlLeft: TPanel;                    // 对弈桌的左边，放棋盘
    imgXQBoard: TImage;             // 状态条
    pnlRight: TPanel;                   // 对弈桌的右边，放置其它信息
    pnlRTop: TPanel;                 // 右边底部
    pgcInfoPage: TPageControl;
    tstXQInfoA: TTabSheet;               // 象棋对弈信息页
    imgRed1: TImage;                    // 红棋: 车
    imgRed2: TImage;                    // 红棋: 马
    imgRed3: TImage;                    // 红棋: 相
    imgRed4: TImage;                    // 红棋: 士
    imgRed5: TImage;                    // 红棋: 帅
    imgRed6: TImage;                    // 红棋: 炮
    imgRed7: TImage;                    // 红棋: 兵
    imgBlk1: TImage;                    // 黑棋: 车
    imgBlk2: TImage;                    // 黑棋: 马
    imgBlk3: TImage;                    // 黑棋: 象
    imgBlk4: TImage;                    // 黑棋: 士
    imgBlk5: TImage;                    // 黑棋: 将
    imgBlk6: TImage;                    // 黑棋: 炮
    imgBlk7: TImage;                    // 黑棋: 卒
    imgXY00: TImage;                    // 棋盘的交叉点定义
    imgXY10: TImage;                    // 变量后面的数字表示坐标
    imgXY20: TImage;
    imgXY30: TImage;
    imgXY40: TImage;
    imgXY50: TImage;
    imgXY60: TImage;
    imgXY70: TImage;
    imgXY80: TImage;
    imgXY01: TImage;
    imgXY11: TImage;
    imgXY21: TImage;
    imgXY31: TImage;
    imgXY41: TImage;
    imgXY51: TImage;
    imgXY61: TImage;
    imgXY71: TImage;
    imgXY81: TImage;
    imgXY02: TImage;
    imgXY12: TImage;
    imgXY22: TImage;
    imgXY32: TImage;
    imgXY42: TImage;
    imgXY52: TImage;
    imgXY62: TImage;
    imgXY72: TImage;
    imgXY82: TImage;
    imgXY03: TImage;
    imgXY13: TImage;
    imgXY23: TImage;
    imgXY33: TImage;
    imgXY43: TImage;
    imgXY53: TImage;
    imgXY63: TImage;
    imgXY73: TImage;
    imgXY83: TImage;
    imgXY04: TImage;
    imgXY14: TImage;
    imgXY24: TImage;
    imgXY34: TImage;
    imgXY44: TImage;
    imgXY54: TImage;
    imgXY64: TImage;
    imgXY74: TImage;
    imgXY84: TImage;
    imgXY05: TImage;
    imgXY15: TImage;
    imgXY25: TImage;
    imgXY35: TImage;
    imgXY45: TImage;
    imgXY55: TImage;
    imgXY65: TImage;
    imgXY75: TImage;
    imgXY85: TImage;
    imgXY06: TImage;
    imgXY16: TImage;
    imgXY26: TImage;
    imgXY36: TImage;
    imgXY46: TImage;
    imgXY56: TImage;
    imgXY66: TImage;
    imgXY76: TImage;
    imgXY86: TImage;
    imgXY07: TImage;
    imgXY17: TImage;
    imgXY27: TImage;
    imgXY37: TImage;
    imgXY47: TImage;
    imgXY57: TImage;
    imgXY67: TImage;
    imgXY77: TImage;
    imgXY87: TImage;
    imgXY08: TImage;
    imgXY18: TImage;
    imgXY28: TImage;
    imgXY38: TImage;
    imgXY48: TImage;
    imgXY58: TImage;
    imgXY68: TImage;
    imgXY78: TImage;
    imgXY88: TImage;
    imgXY09: TImage;
    imgXY19: TImage;
    imgXY29: TImage;
    imgXY39: TImage;
    imgXY49: TImage;
    imgXY59: TImage;
    imgXY69: TImage;
    imgXY79: TImage;
    imgXY89: TImage;
    imgQZMove: TImage;
    pnlRightMargin: TPanel;
    pnlPlayRec: TPanel;
    pgcRemark: TPageControl;
    pgcPlayRec: TPageControl;
    tstRecord: TTabSheet;
    lbxPlayRec: TListBox;
    tstRemark: TTabSheet;
    pnlTalk: TPanel;
    cbbTalk: TComboBox;
    tmrAutoPlay: TTimer;
    imgMovePosTo: TImage;
    pnlCtrlToolBar: TPanel;
    tlbPlayRec: TToolBar;
    tbtFirstStep: TToolButton;
    tbtPriorStep: TToolButton;
    tbtNextStep: TToolButton;
    tbtLastStep: TToolButton;
    tbtDelStep: TToolButton;
    pnlVarStepButtons: TPanel;
    pnlPlayRecMemo: TPanel;
    memPlayRec: TMemo;
    pnlVarStepListBox: TPanel;
    lblPlayVar: TLabel;
    lbxPlayVar: TListBox;
    aclXQTable: TActionList;
    actPlayRecFirst: TAction;
    actPlayRecPrior: TAction;
    actPlayRecNext: TAction;
    actPlayRecLast: TAction;
    actPlayRecDelete: TAction;
    pnlAddVarStepHint: TPanel;
    lblAddPlayVarHint: TLabel;
    lblBigHint: TLabel;
    imgBlkNum: TImage;
    imgRedNum: TImage;
    pnlPlayerInfo: TPanel;
    imgMovePosFrom: TImage;
    tlbPlayVar: TToolBar;
    tbtAddVarStep: TToolButton;
    tbtDelVarStep: TToolButton;
    tbtCancelAddVarStep: TToolButton;
    actPlayVarAdd: TAction;
    actPlayVarDelete: TAction;
    actPlayVarCancel: TAction;
    lblTitle: TLabel;
    lblPlayer: TLabel;
    lblTimeAddr: TLabel;
    Label1: TLabel;
    dlgSaveDialog: TSaveDialog;
    tbtPlayVarSpace: TToolButton;
    tbtPlayVarUp: TToolButton;
    tbtPlayVarDown: TToolButton;
    actPlayVarUp: TAction;
    actPlayVarDown: TAction;
    ppmPlayVar: TPopupMenu;
    ppm01: TMenuItem;
    ppm02: TMenuItem;
    ppmPlayRec: TPopupMenu;
    ppmAutoPlayStart: TMenuItem;
    ppmLine1: TMenuItem;
    ppmAutoPlayTime: TMenuItem;
    ppmAutoPlay041: TMenuItem;
    ppmAutoPlay01: TMenuItem;
    ppmAutoPlay02: TMenuItem;
    ppmAutoPlay03: TMenuItem;
    ppmAutoPlay04: TMenuItem;
    ppmAutoPlay05: TMenuItem;
    ppmAutoPlay06: TMenuItem;
    ppmAutoPlay07: TMenuItem;
    ppmAutoPlay08: TMenuItem;
    ppmLine2: TMenuItem;
    ppmAutoPlayStop: TMenuItem;
    ppmSoundOff: TMenuItem;
    ppmSoundOn: TMenuItem;
    tstXQInfoB: TTabSheet;
    pgcQiTu: TPageControl;
    tstQiTuText: TTabSheet;
    memQiTuText: TMemo;
    pnlQiTuTextToolBar: TPanel;
    tlbQiTuToolBar: TToolBar;
    tbtSelectQiTuText: TToolButton;
    tbtCopyQiTuText: TToolButton;
    tbtSaveQiTuText: TToolButton;
    pnlQiTuTextStyle: TPanel;
    rbtQiTuStyle01: TRadioButton;
    rbtQiTuStyle02: TRadioButton;
    lblQiTuTextStyle: TLabel;
    ppmLine3: TMenuItem;
    ppmPasteQipu: TMenuItem;
    tstXQInfoC: TTabSheet;
    pnlTextToolBar: TPanel;
    tlbTextToolBar: TToolBar;
    tbtSelectAllText: TToolButton;
    tbtCopySelectedText: TToolButton;
    tbtSaveTextIntoFile: TToolButton;
    memText: TMemo;
    pnlTextStyle: TPanel;
    Label2: TLabel;
    rbtTextStyle01: TRadioButton;
    rbtTextStyle02: TRadioButton;
    rbtTextStyle03: TRadioButton;
    tmrMoveBlink: TTimer;
    ppmImportQipu: TMenuItem;
    dlgOpenDialog: TOpenDialog;
    N1: TMenuItem;
    ppmCopy: TMenuItem;
    ppmSaveAsBmp: TMenuItem;
    ppmSearcnFile: TMenuItem;
    tstQituImage: TTabSheet;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    tbtCopyQituImage: TToolButton;
    tbtSaveQituImage: TToolButton;
    pnlQituImage: TPanel;
    imgQituImage: TImage;
    Label3: TLabel;
    chkBbsColor: TCheckBox;
    rbtTextStyle04: TRadioButton;
    N2: TMenuItem;
    ppmJavaXQ: TMenuItem;
    ppmTextXQ: TMenuItem;
    edtQipuInput: TEdit;
    ppmMergeXqf: TMenuItem;
    N3: TMenuItem;
    lbxPlayRecBak: TListBox;
    tstQituBitmap: TTabSheet;
    Panel2: TPanel;
    Label4: TLabel;
    ToolBar2: TToolBar;
    tbtCopyQituBitmap: TToolButton;
    tbtSaveQituBitmap: TToolButton;
    Panel3: TPanel;
    imgQituBitmap: TImage;
    ppmBitmapCopy: TMenuItem;
    ppmBitmapSaveAsBmp: TMenuItem;
    N6: TMenuItem;
    Label5: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

    // imgXY Events Handlers
    procedure imgXYClick(Sender: TObject);
    procedure imgXYDblClick(Sender: TObject);
    procedure imgXYDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure imgXYDragOver(Sender, Source: TObject; X, Y: Integer;
                            State: TDragState; var Accept: Boolean);
    procedure imgXYEndDock(Sender, Target: TObject; X, Y: Integer);
    procedure imgXYEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure imgXYMouseDown(Sender: TObject; Button: TMouseButton;
                             Shift: TShiftState; X, Y: Integer);
    procedure imgXYMouseMove(Sender: TObject; Shift: TShiftState; X,
                             Y: Integer);
    procedure imgXYMouseUp(Sender: TObject; Button: TMouseButton;
                           Shift: TShiftState; X, Y: Integer);
    procedure imgXYProgress(Sender: TObject; Stage: TProgressStage;
                            PercentDone: Byte; RedrawNow: Boolean;
                            const R: TRect; const Msg: String);
    procedure imgXYStartDock(Sender: TObject;
                             var DragObject: TDragDockObject);
    procedure imgXYStartDrag(Sender: TObject;
                             var DragObject: TDragObject);
    procedure lbxPlayRecClick(Sender: TObject);
    procedure tmrAutoPlayTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure memPlayRecChange(Sender: TObject);
    procedure lbxPlayVarDblClick(Sender: TObject);
    procedure lbxPlayVarClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure actPlayRecFirstExecute(Sender: TObject);
    procedure actPlayRecPriorExecute(Sender: TObject);
    procedure actPlayRecNextExecute(Sender: TObject);
    procedure actPlayRecLastExecute(Sender: TObject);
    procedure actPlayRecDeleteExecute(Sender: TObject);
    procedure pnlCtrlToolBarResize(Sender: TObject);
    procedure pnlVarStepButtonsResize(Sender: TObject);
    procedure pnlVarStepListBoxResize(Sender: TObject);
    procedure pnlAddVarStepHintResize(Sender: TObject);
    procedure pnlRTopResize(Sender: TObject);
    procedure pnlRightResize(Sender: TObject);
    procedure pgcInfoPageResize(Sender: TObject);
    procedure pnlRightMarginResize(Sender: TObject);
    procedure actPlayVarAddExecute(Sender: TObject);
    procedure actPlayVarDeleteExecute(Sender: TObject);
    procedure actPlayVarCancelExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure memPlayRecKeyPress(Sender: TObject; var Key: Char);
    procedure imgMovePosToDblClick(Sender: TObject);
    procedure pnlTextToolBarResize(Sender: TObject);
    procedure tbtSelectAllTextClick(Sender: TObject);
    procedure tbtSaveTextIntoFileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPlayVarUpExecute(Sender: TObject);
    procedure actPlayVarDownExecute(Sender: TObject);
    procedure ppmPlayVarPopup(Sender: TObject);
    procedure lbxPlayRecDblClick(Sender: TObject);
    procedure ppmAutoPlayStartClick(Sender: TObject);
    procedure ppmAutoPlayStopClick(Sender: TObject);
    procedure ppmAutoPlayTimeClick(Sender: TObject);
    procedure ppmPlayRecPopup(Sender: TObject);
    procedure ppmSoundOffClick(Sender: TObject);
    procedure ppmSoundOnClick(Sender: TObject);
    procedure pnlQiTuTextToolBarResize(Sender: TObject);
    procedure tbtSaveQiTuTextClick(Sender: TObject);
    procedure tstXQInfoBShow(Sender: TObject);
    procedure tbtSelectQiTuTextClick(Sender: TObject);
    procedure ppmPasteQipuClick(Sender: TObject);
    procedure tstXQInfoCShow(Sender: TObject);
    procedure tmrMoveBlinkTimer(Sender: TObject);
    procedure imgXQBoardMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ppmImportQipuClick(Sender: TObject);
    procedure ppmCopyClick(Sender: TObject);
    procedure ppmSaveAsBmpClick(Sender: TObject);
    procedure ppmSearcnFileClick(Sender: TObject);
    procedure tstQituImageShow(Sender: TObject);
    procedure tbtCopyQituImageClick(Sender: TObject);
    procedure tbtSaveQituImageClick(Sender: TObject);
    procedure ppmJavaXQClick(Sender: TObject);
    procedure ppmTextXQClick(Sender: TObject);
    procedure edtQipuInputKeyPress(Sender: TObject; var Key: Char);
    procedure edtQipuInputChange(Sender: TObject);
    procedure ppmMergeXqfClick(Sender: TObject);
    procedure tstQituBitmapShow(Sender: TObject);
    procedure tbtCopyQituBitmapClick(Sender: TObject);
    procedure tbtSaveQituBitmapClick(Sender: TObject);
    procedure ppmBitmapCopyClick(Sender: TObject);
    procedure ppmBitmapSaveAsBmpClick(Sender: TObject);
  private
    { Private declarations }
    FDragImgXY      : TImage;
    FReverseBoardH  : Boolean;
    procedure dSetupXQBoard;                            // 设置棋盘
    procedure dSetAddVarStepMode(tf: dTBoolean);
    function  imgGetImgXY(X, Y: Integer): TImage;       // 取(x,y)处交叉点
  public

    XQFileName : string;

    isPasteMsgEnabled : Boolean;

    imgXY           : dTXQPXY;                  // 棋盘上的交叉点
    XQ              : dTXiangQi;

    isShowBoardOnly : dTBoolean;
    isXQFileChange  : dTBoolean;
    isXQFileSaveOk  : dTBoolean;

    isDemoTable     : dTBoolean;                // 是推演棋盘吗？
    //---------------------------------------------------------------------
    iXQFType        : dTInt32;                  // 文件类型
                                                // 0-全局, 1-开局
                                                // 2-中局, 3-残局
    iWhoPlay        : dTInt32;                  // 谁先行
                                                // 0-红先, 1-黑先
    iResult         : dTInt32;                  // 比赛结果
                                                // 0-未知, 1-红胜
                                                // 2-黑胜, 3-和棋
    sTitle          : String[63];               // 标题
    sMatchName      : String[63];               // 比赛名称
    sMatchTime      : String[15];               // 比赛时间
    sMatchAddr      : String[15];               // 比赛地点
    sRedPlayer      : String[15];               // 红方姓名
    sBlkPlayer      : String[15];               // 黑方姓名
    sTimeRule       : String[63];               // 用时规则
    sRedTime        : String[15];               // 红方用时
    sBlkTime        : String[15];               // 黑方用时
    sRMKWriter      : String[15];               // 棋谱评论员
    sAuthor         : STring[15];               // 文件的作者
    //---------------------------------------------------------------------

    procedure dReverseBoardV;
    procedure dReverseBoardH;
    procedure dShowBoardOnly(tf: dTBoolean);
    procedure dBeforeSave;
    procedure dRefreshXQInfo;
    procedure dGetHeadInfoFromXQFHead(XQFHead: dTXQFHead);
    procedure dPutHeadInfoIntoXQFHead(var XQFHead: dTXQFHead);

    procedure dStartAutoPlay;
    procedure dStopAutoPlay;

    procedure dMakeJavaAppletCode;

    procedure dAddPlayRecordFromString(sLineStr: String);
    procedure dClearAllStep;
    function  dImportQipuFromFile(sFileName: String): Boolean;
  end;

procedure dPlayRecHook;
procedure dRefreshHook;

///////////////////////////////////////////////////////////////////////////

implementation

uses XQMain, XQWizard, XQSearch;

{$R *.DFM}

//-------------------------------------------------------------------------
//
//.........................................................................
procedure TfrmXQTable.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmMain.ActiveXQTable := nil;
  if (frmMain.MDIChildCount<=1) then frmMain.pnlXQStudioLogo.Visible:=True;
  frmMain.dEnableXQTableMenuItem(False);
  frmMain.Caption := dCVersionInfo;

  if rbtTextStyle01.Checked then  WriteRegStr('XqTable', 'TextColumn', '1');
  if rbtTextStyle02.Checked then  WriteRegStr('XqTable', 'TextColumn', '2');
  if rbtTextStyle03.Checked then  WriteRegStr('XqTable', 'TextColumn', '3');

  if isSetAutoPlayList then
  begin
    frmMain.dAutoPlayNextFile;
  end
  else
  begin
    if ((sImportFileName <> '')and(XQ.PlayStepNo>0)) then
    begin
      sImportFileName := '';
      frmMain.dAutoPlayNextFile;
    end;
  end;
end;

//-------------------------------------------------------------------------
// 取得坐标X, Y处'兵站'的坐标
//.........................................................................
function TfrmXQTable.imgGetImgXY(X, Y: Integer): TImage;
var
  i, j: Integer;
begin
  for i:=0 to 8 do for j:= 0 to 9 do    // 搜索所有的兵站
  begin
    if (X>imgXY[i,j].Left+4)and(X<imgXY[i,j].Left+imgXY[i,j].Width-4) and
       (Y>imgXY[i,j].Top+4)and(Y<imgXY[i,j].Top +imgXY[i,j].Height-4) then
    begin
      imgGetImgXY := imgXY[i, j];  Exit;
    end;
  end;
  imgGetImgXY := nil;
end;

//-------------------------------------------------------------------------
// 设置象棋盘
//.........................................................................
procedure TfrmXQTable.dSetupXQBoard;
var
  picQZ : dTXQZPIC;
  i, j  : dTInt32;
begin
  // 将所有棋子的原形关闭
  for i:=1 to 7 do
  begin
    with FindComponent('imgRed'+IntToStr(i)) as TImage do Visible := False;
    with FindComponent('imgBlk'+IntToStr(i)) as TImage do Visible := False;
  end;

  // 正在移动的棋子的变为不可以显示
  imgQZMove.Visible := False;

  // 设置 9 x 10 个'兵站'
  for i:=0 to 8 do for j:=0 to 9 do
  begin
    imgXY[i,j] := FindComponent('imgXY'+IntToStr(i)+IntToStr(j)) as TImage;
    if (imgXY[i,j]=nil) then ShowMessage('imgXY Error');
  end;

  for i:=0 to 8 do for j:=0 to 9 do
  begin
    imgXY[i,j].Left   := 4   + i*40;
    imgXY[i,j].Top    := 376 - j*40;
    imgXY[i,j].Width  := 34;
    imgXY[i,j].Height := 34;
    imgXY[i,j].PopupMenu := ppmPlayRec;
  end;
  imgXQBoard.PopupMenu   := ppmPlayRec;

  imgRedNum.Visible   := False;
  imgRedNum.Left      := imgXQBoard.Left;
  imgRedNum.Top       := imgXQBoard.Top;
  imgBlkNum.Visible   := False;
  imgBlkNum.Left      := imgXQBoard.Left;
  imgBlkNum.Top       := imgXQBoard.Top + 409;

  imgQZMove.Width      := 34;
  imgQZMove.Height     := 34;
  imgMovePosTo.Width   := 34;
  imgMovePosTo.Height  := 34;
  imgMovePosFrom.Width := 34;
  imgMovePosFrom.Height:= 34;


  // 设置所有棋子的图片
  picQZ[ 1] := ImgRed1.Picture;  picQZ[ 8] := ImgBlk1.Picture;
  picQZ[ 2] := ImgRed2.Picture;  picQZ[ 9] := ImgBlk2.Picture;
  picQZ[ 3] := ImgRed3.Picture;  picQZ[10] := ImgBlk3.Picture;
  picQZ[ 4] := ImgRed4.Picture;  picQZ[11] := ImgBlk4.Picture;
  picQZ[ 5] := ImgRed5.Picture;  picQZ[12] := ImgBlk5.Picture;
  picQZ[ 6] := ImgRed6.Picture;  picQZ[13] := ImgBlk6.Picture;
  picQZ[ 7] := ImgRed7.Picture;  picQZ[14] := ImgBlk7.Picture;

  // 建立象棋类
  XQ:=dTXIANGQI.Create(imgXQBoard,imgXY,imgQZMove,
                       imgMovePosFrom,imgMovePosTo,
                       picQZ,lbxPlayRec,lbxPlayVar,memPlayRec);
  if (XQ=nil) then Self.Close;
end;

//-------------------------------------------------------------------------
// 创建象棋桌
//.........................................................................
procedure TfrmXQTable.FormCreate(Sender: TObject);
begin
  isDemoTable        := False;

  isPasteMsgEnabled  := True;
  
  imgXQBoard.Picture := frmMain.imgXQBoard.Picture;

  // 设置棋桌的大小
  Self.Left   := 0;                 Self.Top := 0;
  Self.Height := dCXQTableHeight; Self.Width := dCXQTableWidth;

  imgXQBoard.Left := 0;
  imgXQBoard.Top  := 0;
  pnlLeft.Width        := imgXQBoard.Left + imgXQBoard.Width + 8;
  pnlRightMargin.Width := 3;

  XQ := nil;

  // 设置象棋盘
  dSetupXQBoard;

  tmrAutoPlay.Interval := iAutoPlayTime;

  case StrToIntDef(ReadRegStr('XqTable', 'TextColumn', '2'), 2) of
    1:   rbtTextStyle01.Checked := True;
    3:   rbtTextStyle03.Checked := True;
    else rbtTextStyle02.Checked := True;
  end;

  if (XQ=nil) then
  begin
    Self.Close;
    Exit;
  end;

  isXQFileChange := False;
  XQ.PlayRecHook := dPlayRecHook;
  XQ.RefreshHook := dRefreshHook;

  if isSetAutoPlayList then
  begin
    tmrAutoPlay.Interval := iAutoPlayTime;
    tmrAutoPlay.Enabled  := True;
    IsAutoPlaying        := True;
  end
  else
  begin
    if (sImportFileName <> '') then
    begin
      tmrAutoPlay.Interval := 1;
      tmrAutoPlay.Enabled  := True;
    end;
  end;

  FDragImgXY     := nil;
  FReverseBoardH := False;

  if (not frmMain.IsBitmapListLoaded) then
  begin
    tstQituBitmap.TabVisible   := False;
    ppmBitmapCopy.Enabled      := False;
    ppmBitmapSaveAsBmp.Enabled := False;
  end;
end;

//-------------------------------------------------------------------------
// imgXY 的事件处理程序
//.........................................................................
// Click
procedure TfrmXQTable.imgXYClick(Sender: TObject);
begin
  if (Sender=nil) then Exit;
  with Sender as TImage do
  begin

  end;
end;

// DblClick
procedure TfrmXQTable.imgXYDblClick(Sender: TObject);
var
  img: TImage;
begin
  if not imgMovePosTo.Visible then Exit;
  if (Sender=nil) then Exit;
  if not (Sender is TImage) then Exit;
  img := Sender as TImage;
  if img.Left <> imgMovePosTo.Left then Exit;
  if img.Top  <> imgMovePosTo.Top  then Exit;
  imgMovePosToDblClick(imgMovePosTo);
end;

// DragDrop
procedure TfrmXQTable.imgXYDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Sender=nil) then Exit;
  with Sender as TImage do
  begin

  end;
end;

// DragOver
procedure TfrmXQTable.imgXYDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Sender=nil) then Exit;
  Accept := True;
  with Sender as TImage do
  begin
    if (XQ.QiziMove <> nil) then        // 棋子跟着光标移动
    begin
      imgQZMove.Left := Left + X - 17;
      imgQZMove.Top  := Top  + Y - 17;
    end;
  end;
end;

// EndDock
procedure TfrmXQTable.imgXYEndDock(Sender, Target: TObject; X,
  Y: Integer);
begin
  if (Sender=nil) then Exit;
  with Sender as TImage do
  begin

  end;
end;

// EndDrag
procedure TfrmXQTable.imgXYEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
  imgQZTo     : TImage;                 // 棋子移动的终点位置
  iPlayStepNo : dTInt32;
begin
  tmrMoveBlink.Enabled := False;
  iPlayStepNo := XQ.PlayStepNo;
  imgQZTo     := nil;
  if (Target <> nil) then               // 搜索终点'兵站'
    with Target as TImage do begin imgQZTo:=imgGetImgXY(X+Left,Y+Top); end;

  if (imgQZTo = nil) then
    XQ.dUndoMove                        // 最后棋子不在'兵站'上，取消移动
  else
    XQ.dStopMoveAtXY(imgQZTo.Tag);      // 将棋子移动到'兵站'上
  if (iPlayStepNo <> XQ.PlayStepNo) then
  begin
    tmrMoveBlink.Enabled := False;
    isXQFileChange := True;
    if XQ.isAddVarStep then dSetAddVarStepMode(False);
  end
  else
  begin
    if (Sender = nil) then
    begin
      lbxPlayRecClick(lbxPlayRec);
    end
    else
    begin
      tmrMoveBlink.Enabled := True;
    end;
  end;
end;

// MouseDown
procedure TfrmXQTable.imgXYMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Sender=nil) then Exit;
  tmrMoveBlink.Enabled := False;
  if (FDragImgXY <> nil) and Assigned(FDragImgXY) then
  begin
    try
      imgMovePosTo.Visible := False;
      XQ.dStartMoveFromXY(FDragImgXY.Tag);
      imgXYEndDrag(nil, Sender, 16, 16); //X, Y);
    except
    end;
  end;
  FDragImgXY := nil;
end;

// MouseMove
procedure TfrmXQTable.imgXYMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender=nil) then Exit;
  with Sender as TImage do
  begin

  end;
end;

// MouseUp
procedure TfrmXQTable.imgXYMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Sender=nil) then Exit;
  with Sender as TImage do
  begin

  end;
end;

// Progress
procedure TfrmXQTable.imgXYProgress(Sender: TObject;
  Stage: TProgressStage; PercentDone: Byte; RedrawNow: Boolean;
  const R: TRect; const Msg: String);
begin
  if (Sender=nil) then Exit;
  with Sender as TImage do
  begin

  end;
end;

// StartDock
procedure TfrmXQTable.imgXYStartDock(Sender: TObject;
  var DragObject: TDragDockObject);
begin
  if (Sender=nil) then Exit;
  with Sender as TImage do
  begin

  end;
end;

// StartDrag
procedure TfrmXQTable.imgXYStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  if (Sender=nil) then Exit;
  // 从本'兵站'开始移动棋子
  tmrMoveBlink.Enabled := False;
  FDragImgXY := Sender as TImage;
  with Sender as TImage do begin XQ.dStartMoveFromXY(tag); end;
end;


//-------------------------------------------------------------------------
// 处理棋谱记录Click事件，显示指定的记录的盘面状况
//.........................................................................
procedure TfrmXQTable.lbxPlayRecClick(Sender: TObject);
begin
  tmrMoveBlink.Enabled := False;
  FDragImgXY := nil;
  dStopAutoPlay;
  XQ.dOnRecListBoxClick;
end;

procedure TfrmXQTable.tmrAutoPlayTimer(Sender: TObject);
begin
  if (sImportFileName <> '') then
  begin
    tmrAutoPlay.Enabled := False;
    dImportQipuFromFile(sImportFileName);
    frmMain.iSaveXQTable(ChangeFileExt(sImportFileName, '.XQF'), Self);    
    Self.Close;
    Exit;
  end;

  if actPlayRecNext.Enabled then
  begin
    actPlayRecNextExecute(nil);
    if isAutoPlaySoundOn then beep;
  end
  else
  begin
    tmrAutoPlay.Enabled := False;
    IsAutoPlaying       := False;
    if isSetAutoPlayList then Self.Close;
  end;
end;

//-------------------------------------------------------------------------
// 删除棋桌
//.........................................................................
procedure TfrmXQTable.FormDestroy(Sender: TObject);
begin
  XQ.Free;
end;

//-------------------------------------------------------------------------
// 棋桌变为当前棋桌后要做的事情
//.........................................................................
procedure TfrmXQTable.FormActivate(Sender: TObject);
begin
  frmMain.pnlXQStudioLogo.Visible  := False;
  frmMain.ActiveXQTable            := Self;
  frmMain.dEnableXQTableMenuItem(True);
  frmMain.Caption := dCVersionInfo + ' - ' + ExtractFileName(XQFileName);
  dRefreshXQInfo;
end;

procedure TfrmXQTable.memPlayRecChange(Sender: TObject);
begin
  XQ.dOnRecMemoChange;
end;

procedure TfrmXQTable.lbxPlayVarDblClick(Sender: TObject);
var
  nTopIndex: Integer;
begin
  nTopIndex               := lbxPlayRec.TopIndex;
  lbxPlayRecBak.Items     := lbxPlayRec.Items;
  lbxPlayRecBak.ItemIndex := lbxPlayRec.ItemIndex;
  lbxPlayRecBak.TopIndex  := lbxPlayRec.TopIndex;
  lbxPlayRecBak.Visible   := True;
  XQ.dOnVarListBoxDblClick;
  lbxPlayRec.TopIndex     := nTopIndex;
  lbxPlayRecBak.Visible   := False;
end;

procedure TfrmXQTable.lbxPlayVarClick(Sender: TObject);
begin
  if lbxPlayVar.ItemIndex >= 0 then
    actPlayVarDelete.Enabled := (not XQ.isHighlightVarStepActive)
  else
    actPlayVarDelete.Enabled := False;

  actPlayVarUp.Enabled   := (lbxPlayVar.ItemIndex > 0);
  actPlayVarDown.Enabled := (lbxPlayVar.ItemIndex>=0) and
                            (lbxPlayVar.ItemIndex<(lbxPlayVar.Items.Count-1));
end;

procedure TfrmXQTable.FormDeactivate(Sender: TObject);
begin
  frmMain.ActiveXQTable            := nil;
  frmMain.dEnableXQTableMenuItem(False);
end;

procedure TfrmXQTable.actPlayRecFirstExecute(Sender: TObject);
begin
  if (XQ=nil) then Exit;
  XQ.dDispQiziAtRecNo(0);
  XQ.dEnablePlayer(XQ.DispNode);
end;

procedure TfrmXQTable.actPlayRecPriorExecute(Sender: TObject);
var
  iIdx: dTInt32;
begin
  if (XQ=nil) then Exit;
  if XQ.DispStepNo=0 then Exit;
  iIdx := XQ.DispStepNo - 1;
  XQ.dDispQiziAtRecNo(iIdx);
  XQ.dEnablePlayer(XQ.DispNode);
end;

procedure TfrmXQTable.actPlayRecNextExecute(Sender: TObject);
var
  iIdx: dTInt32;
begin
  if (XQ=nil) then Exit;
  if XQ.DispStepNo=XQ.PlayStepNo then Exit;
  iIdx := XQ.DispStepNo + 1;
  XQ.dDispQiziAtRecNo(iIdx);
  XQ.dEnablePlayer(XQ.DispNode);
end;

procedure TfrmXQTable.actPlayRecLastExecute(Sender: TObject);
begin
  if (XQ=nil) then Exit;
  XQ.dDispQiziAtRecNo(XQ.PlayStepNo);
  XQ.dEnablePlayer(XQ.DispNode);
end;

procedure TfrmXQTable.actPlayRecDeleteExecute(Sender: TObject);
begin
  if (XQ=nil) then Exit;
  XQ.dDeleteOnePlayNode;
  isXQFileChange := True;
end;

var
  PlayNodeBeforeAddVarStep: dTXQPlayNode;
procedure TfrmXQTable.dSetAddVarStepMode(tf: dTBoolean);
var
  i      : dTInt32;
  sPlayer: string;
begin
  case tf of
    True:
      begin
        if (lbxPlayVar.Items.Count=dCMaxVarNo) then Exit;
        if XQ.DispStepNo = 0 then Exit;
        if XQ.isAddVarStep then Exit;
        XQ.isAddVarStep             := True;
        XQ.dDispQiziAtRecNo(XQ.DispStepNo);
        PlayNodeBeforeAddVarStep    := XQ.DispNode;
        if ((XQ.DispNode.StepNo mod 2)=0) then
          sPlayer := '黑方'
        else
          sPlayer := '红方';
        lblAddPlayVarHint.Caption   :=
          '    如左图形势，'+ sPlayer +'刚才一步走' +
          PlayNodeBeforeAddVarStep.StrRec +
          '，现在不走' + PlayNodeBeforeAddVarStep.StrRec +
          '，请输入新的变着（在棋盘上直接走子）。'+
          '按“取消”按钮可以停止这一操作。';
        lbxPlayRec.Visible := False;
        for i:=XQ.PlayStepNo downto XQ.DispStepNo do
          XQ.dDeleteOnePlayRec;
        lbxPlayRec.Visible := True;
        actPlayVarAdd.Enabled       := False;
        pnlAddVarStepHint.Visible   := True;
        actPlayVarDelete.Enabled    := False;
        actPlayVarCancel.Enabled    := True;

        actPlayVarUp.Enabled        := False;
        actPlayVarDown.Enabled      := False;

        lbxPlayVar.Enabled          := False;
        lbxPlayRec.Enabled          := False;
        memPlayRec.Enabled          := False;

        actPlayRecFirst.Enabled     := False;
        actPlayRecPrior.Enabled     := False;
        actPlayRecNext.Enabled      := False;
        actPlayRecLast.Enabled      := False;

        actPlayRecDelete.Enabled    := False;
        tlbPlayRec.Enabled          := False;
      end;

    False:
      begin
        XQ.isAddVarStep             := False;
        actPlayVarAdd.Enabled       := (lbxPlayRec.ItemIndex>0);
        pnlAddVarStepHint.Visible   := False;
        actPlayVarDelete.Enabled    := False;
        actPlayVarCancel.Enabled    := False;

        actPlayVarUp.Enabled        := False;
        actPlayVarDown.Enabled      := False;

        lbxPlayVar.Enabled          := True;
        lbxPlayRec.Enabled          := True;
        memPlayRec.Enabled          := True;
        tlbPlayRec.Enabled          := True;
      end;
  end;
end;

procedure TfrmXQTable.dReverseBoardV;
var
  i, j, iLeft, iTop: dTINT32;
begin
  imgMovePosTo.Visible   := False;
  imgMovePosFrom.Visible := False;
  for i:=0 to 8 do for j:=0 to 4 do
  begin
    iLeft                := imgXY[i, j].Left;
    iTop                 := imgXY[i, j].Top;
    imgXY[i, j].Left     := imgXY[8-i, 9-j].Left;
    imgXY[i, j].Top      := imgXY[8-i, 9-j].Top;
    imgXY[8-i, 9-j].Left := iLeft;
    imgXY[8-i, 9-j].Top  := iTop;
  end;
  imgRedNum.Visible := not imgRedNum.Visible;
  imgBlkNum.Visible := not imgBlkNum.Visible;
  XQ.dDispQiziAtRecNo(XQ.DispStepNo);    // 为了显示最后移动棋子的标记
end;

procedure TfrmXQTable.dReverseBoardH;
var
  i, j, iLeft, iTop: dTINT32;
begin
  FReverseBoardH         := not FReverseBoardH;
  XQ.ReverseH            := FReverseBoardH;
  imgMovePosTo.Visible   := False;
  imgMovePosFrom.Visible := False;
  for i:=0 to 3 do for j:=0 to 9 do
  begin
    iLeft                := imgXY[i, j].Left;
    iTop                 := imgXY[i, j].Top;
    imgXY[i, j].Left     := imgXY[8-i, j].Left;
    imgXY[i, j].Top      := imgXY[8-i, j].Top;
    imgXY[8-i, j].Left   := iLeft;
    imgXY[8-i, j].Top    := iTop;
  end;
//
  XQ.dRefreshRecStr;
//
  XQ.dDispQiziAtRecNo(XQ.DispStepNo);    // 为了显示最后移动棋子的标记
end;

procedure TfrmXQTable.pnlCtrlToolBarResize(Sender: TObject);
begin
  with Sender as TPanel do
  begin
    Height := 28;
    tlbPlayRec.Height := 28;
    tlbPlayRec.Width  := 121;
    tlbPlayRec.Left   := (Width  - tlbPlayRec.Width ) div 2;
    tlbPlayRec.Top    := (Height - tlbPlayRec.Height) div 2;
  end;
end;
procedure TfrmXQTable.pnlVarStepButtonsResize(Sender: TObject);
begin
  with Sender as TPanel do
  begin
    Height := 28;
    tlbPlayVar.Height := 28;
    tlbPlayVar.Width  := 123;
    tlbPlayVar.Left   := (Width  - tlbPlayVar.Width ) div 2;
    tlbPlayVar.Top    := 2;
  end;
end;

procedure TfrmXQTable.pnlVarStepListBoxResize(Sender: TObject);
begin
  with Sender as TPanel do
  begin
    Height := 95;
    pnlAddVarStepHint.Height := Height;
  end;
  lbxPlayVar.Height := 63;
  lblPlayVar.Top    := 13;
  lblPlayVar.Left   := 2;
end;

procedure TfrmXQTable.pnlAddVarStepHintResize(Sender: TObject);
begin
  lblBigHint.Left := 4;
  lblBigHint.Top  := 8;
  lblAddPlayVarHint.Left  := 8;
  lblAddPlayVarHint.Top   := lblBigHint.Top + lblBigHint.Height + 4;
  lblADdPlayVarHint.Width  := pnlAddVarStepHint.Width - 16;
  lblAddPlayVarHint.Height := pnlAddVarStepHint.Height -
                                lblAddPlayVarHint.Top;
end;

procedure TfrmXQTable.pnlRTopResize(Sender: TObject);
begin
  with Sender as TPanel do
  begin
    Height             := 0;
    //Height             := 50;
  end;
end;

procedure TfrmXQTable.pnlRightResize(Sender: TObject);
begin
  with Sender as TPanel do
  begin
    // Height := 
  end;
end;

procedure TfrmXQTable.pgcInfoPageResize(Sender: TObject);
begin
  with Sender as TPageControl do
  begin
    Height := imgXQBoard.Height - pnlRTop.Height; 
  end;
end;

procedure TfrmXQTable.pnlRightMarginResize(Sender: TObject);
begin
  with Sender as TPanel do
  begin
    width := 3;
  end;
end;

procedure dPlayRecHook;
begin
  if frmMain.ActiveXQTable = nil then Exit;
  with frmMain.ActiveXQTable do
  begin
    if XQ.isAddVarStep then Exit;
    actPlayRecFirst.Enabled := (XQ.DispStepNo<>0);
    actPlayRecPrior.Enabled := (XQ.DispStepNo<>0);
    actPlayRecNext.Enabled  := (XQ.DispStepNo<>XQ.PlayStepNo);
    actPlayRecLast.Enabled  := (XQ.DispStepNo<>XQ.PlayStepNo);
    edtQipuInput.Visible    := not actPlayRecLast.Enabled;
    actPlayRecDelete.Enabled:= (XQ.DispStepNo=xQ.PlayStepNo) and
                               (XQ.DispStepNo<>0);

    actPlayVarAdd.Enabled   := (XQ.DispStepNo>0) and (not XQ.isAddVarStep);
    if actPlayVarAdd.Enabled then
    begin
      actPlayVarDelete.Enabled := False;
      actPlayVarUp.Enabled     := False;
      actPlayVarDown.Enabled   := False;
    end;
  end;
end;

procedure dRefreshHook;
begin
  if frmMain.ActiveXQTable = nil then Exit;
  frmMain.ActiveXQTable.Refresh;
end;

procedure TfrmXQTable.actPlayVarAddExecute(Sender: TObject);
begin
  isXQFileChange := True;
  dSetAddVarStepMode(True);
end;

procedure TfrmXQTable.actPlayVarDeleteExecute(Sender: TObject);
begin
  isXQFileChange := True;
  XQ.dDeletePlayVar(XQ.PlayVar[XQ.VarListBox.ItemIndex]);
  XQ.dDispQiziAtRecNo(XQ.DispStepNo);
  actPlayVarDelete.Enabled := False;
  actPlayVarUp.Enabled     := False;
  actPlayVarDown.Enabled   := False;
end;

procedure TfrmXQTable.actPlayVarCancelExecute(Sender: TObject);
begin
  actPlayVarCancel.Enabled := False;
  XQ.dLoadAllRecForPlayNode(PlayNodeBeforeAddVarStep);
  dSetAddVarStepMode(False);
end;

procedure TfrmXQTable.dShowBoardOnly(tf: dTBoolean);
begin
  isShowBoardOnly := tf;
  if tf then
    Self.Width := pnlLeft.Width
  else
    Self.Width := dCXQTableWidth;
end;

procedure TfrmXQTable.dBeforeSave;
begin
  isXQFileSaveOK := False;
  XQ.dDispQiziAtRecNo(XQ.DispStepNo);
end;

procedure TfrmXQTable.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (not isXQFileChange) or isDemoTable then
  begin
    CanClose := True; Exit;
  end;

  case Application.MessageBox(
          PChar('是否保存对文件"'+ExtractFileName(XQFileName)
          +'"的修改？'),
          dCVersionInfo,
          MB_YESNOCANCEL + MB_ICONWARNING + MB_DEFBUTTON1) of
     IDYES:
       begin
         dBeforeSave;
         frmMain.actFileSaveExecute(nil);
         if isXQFileSaveOK then
         begin
           isXQFileChange := False;
         end
         else
         begin
           CanClose := False;  Exit;
         end;
       end;
     IDNO:
       begin
         CanClose:=True; Exit;
       end;
     else
       begin
         CanClose:=False; Exit;
       end;
  end;
end;

procedure TfrmXQTable.memPlayRecKeyPress(Sender: TObject; var Key: Char);
begin
  isXQFileChange := True;
end;

procedure TfrmXQTable.dRefreshXQInfo;
var
  s: string;
begin
  lblTitle.Caption   :=sTitle;
  case iXQFType of
    0:  // 全局
      begin
        s:='';
        if ((sRedPlayer<>'')and(sBlkPlayer<>'')) then
        begin
          s:='(红方) '+sRedPlayer;
          case iResult of
            0: begin s:=s+' 对 '; end;
            1: s:=s+' (红先胜) ';
            2: s:=s+' (红先负) ';
            3: s:=s+' (红先和) ';
          end;
          s:=s+'(黑方) '+sBlkPlayer;
        end;

        lblPlayer.Caption  :=s;

        lblTimeAddr.Caption:=sMatchTime;
        if (sMatchAddr<>'') then
          lblTimeAddr.Caption:=lblTimeAddr.Caption+'弈于'+sMatchAddr;
      end;

    1:  // 开局
      begin
        s:='';
        lblPlayer.Caption  :=s;
        lblTimeAddr.Caption:=s;
      end;

    2:  // 中局
      begin
        s:='';
        if ((sRedPlayer<>'')and(sBlkPlayer<>'')) then
        begin
          s:='(红方) '+sRedPlayer;
          case iResult of
            0: begin s:=s+' 对 '; end;
            1: s:=s+' (胜) ';
            2: s:=s+' (负) ';
            3: s:=s+' (和) ';
          end;
          s:=s+'(黑方) '+sBlkPlayer;
        end;

        lblPlayer.Caption  :=s;

        lblTimeAddr.Caption:=sMatchTime;
        if (sMatchAddr<>'') then
          lblTimeAddr.Caption:=lblTimeAddr.Caption+'弈于'+sMatchAddr;
      end;

    3:  // 残局
      begin
        s:='(着法: ';
        if (iWhoPlay=0) then s:=s+'红先' else s:=s+'黑先';
        case iResult of
          0: begin end;
          1: if (iWhoPlay =0) then s:=s+'胜' else s:=s+'红胜';
          2: if (iWhoPlay<>0) then s:=s+'胜' else s:=s+'黑胜';
          3: s:=s+'和';
        end;
        s:=s+')';
        lblPlayer.Caption := s;
        lblTimeAddr.Caption := '';
      end;
  end;

  if (lblTitle.Caption='') and
     (lblPlayer.Caption='') and
     (lblTimeAddr.Caption='') then
  begin
    pnlPlayerInfo.Caption := 'Welcome to use XQStudio';
  end
  else
    pnlPlayerInfo.Caption := '';
  begin

  end;

  frmMain.actEditChangePos.Enabled := (iXQFType > 1);
end;

procedure TfrmXQTable.imgMovePosToDblClick(Sender: TObject);
begin
  if actPlayRecDelete.Enabled then
  begin
    actPlayRecDeleteExecute(nil);
  end;
end;

procedure TfrmXQTable.dGetHeadInfoFromXQFHead(XQFHead: dTXQFHead);
begin
  iXQFType   := XQFHead.CodeA;
  iWhoPlay   := XQFHead.WhoPlay;
  iResult    := XQFHead.PlayResult;
  sTitle     := XQFHead.TitleA;
  sMatchName := XQFHead.MatchName;
  sMatchTime := XQFHead.MatchTime;
  sMatchAddr := XQFHead.MatchAddr;
  sRedPlayer := XQFHead.RedPlayer;
  sBlkPlayer := XQFHead.BlkPlayer;
  sTimeRule  := XQFHead.TimeRule;
  sRedTime   := XQFHead.RedTime;
  sBlkTime   := XQFHead.BlkTime;
  sRMKWriter := XQFHead.RMKWriter;
  sAuthor    := XQFHead.Author;
end;

procedure TfrmXQTable.dPutHeadInfoIntoXQFHead(Var XQFHead: dTXQFHead);
begin
  XQFHead.CodeA      := iXQFType;
  XQFHead.WhoPlay    := iWhoPlay;
  XQFHead.PlayResult := iResult;
  XQFHead.TitleA     := sTitle;
  XQFHead.MatchName  := sMatchName;
  XQFHead.MatchTime  := sMatchTime;
  XQFHead.MatchAddr  := sMatchAddr;
  XQFHead.RedPlayer  := sRedPlayer;
  XQFHead.BlkPlayer  := sBlkPlayer;
  XQFHead.TimeRule   := sTimeRule;
  XQFHead.RedTime    := sRedTime;
  XQFHead.BlkTime    := sBlkTime;
  XQFHead.RMKWriter  := sRMKWriter;
  XQFHead.Author     := sAuthor;
end;


//-------------------------------------------------------------------------
// 将棋谱转变成文本显示
//.........................................................................
procedure TfrmXQTable.pnlTextToolBarResize(Sender: TObject);
begin
  with Sender as TPanel do
  begin
    Height := 28;
    tlbTextToolBar.Height := 28;
    tlbTextToolBar.Left   :=
      (Width  - tlbTextToolBar.Width - pnlTextStyle.Width ) div 2 +
      pnlTextStyle.Width;
    tlbTextToolBar.Top    := 0;
  end;
end;

procedure TfrmXQTable.tbtSelectAllTextClick(Sender: TObject);
begin
  memText.SetFocus;
  memText.SelectAll;
end;

procedure TfrmXQTable.tbtSaveTextIntoFileClick(Sender: TObject);
var
  sFileName : String;
begin
  dlgSaveDialog.Title := '将棋谱文本保存为';
  if dlgSaveDialog.Execute then
  begin
    sFileName := dlgSaveDialog.FileName;
    if (Pos('.', sFileName)=0) then sFileName := sFileName + '.TXT';
    if FileExists(sFileName) then
    begin
      if (Application.MessageBox(
          PChar(Format('文件“%s”已经存在，要替换吗?', [sFileName])),
          '保存文件',
          MB_OKCANCEL + MB_ICONWARNING + MB_DEFBUTTON1) = IDCANCEL) then
      begin
        Exit;
      end;
    end;
    memText.Lines.SaveToFile(sFileName);
  end;
end;

procedure TfrmXQTable.FormShow(Sender: TObject);
begin
  tstXQInfoA.Show;
  tstRemark.Show;
  lbxPlayRec.SetFocus;
end;

procedure TfrmXQTable.actPlayVarUpExecute(Sender: TObject);
begin
  isXQFileChange := True;
  XQ.dMovePlayVarUp;
  lbxPlayVarClick(lbxPlayVar);
end;

procedure TfrmXQTable.actPlayVarDownExecute(Sender: TObject);
begin
  isXQFileChange := True;
  XQ.dMovePlayVarDown;
  lbxPlayVarClick(lbxPlayVar);
end;

procedure TfrmXQTable.ppmPlayVarPopup(Sender: TObject);
begin
  //dStopAutoPlay;
end;

procedure TfrmXQTable.lbxPlayRecDblClick(Sender: TObject);
begin
  dStartAutoPlay;
end;

procedure TfrmXQTable.ppmAutoPlayStartClick(Sender: TObject);
begin
  dStartAutoPlay;
end;

procedure TfrmXQTable.ppmAutoPlayStopClick(Sender: TObject);
begin
  dStopAutoPlay;
end;

procedure TfrmXQTable.dStartAutoPlay;
begin
  tmrAutoPlay.Interval := iAutoPlayTime;
  tmrAutoPlay.Enabled  := True;
  IsAutoPlaying        := True;
  sleep(1000);
  tmrAutoPlayTimer(tmrAutoPlay);
end;

procedure TfrmXQTable.dStopAutoPlay;
begin
  tmrAutoPlay.Enabled  := False;
  IsAutoPlaying        := False;
end;

procedure TfrmXQTable.ppmAutoPlayTimeClick(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    iAutoPlayTime := tag;
  end;
  tmrAutoPlay.Interval := iAutoPlayTime;
end;

procedure TfrmXQTable.ppmPlayRecPopup(Sender: TObject);
begin
  dStopAutoPlay;
  ppmAutoPlayStart.Enabled := not tmrAutoPlay.Enabled;
  ppmAutoPlayStop.Enabled  := tmrAutoPlay.Enabled;
  ppmSoundOn.Checked       := isAutoPlaySoundOn;
  ppmSoundOff.Checked      := not isAutoPlaySoundOn;

  ppmAutoPlay01.Checked    := (ppmAutoPlay01.Tag = iAutoPlayTime);
  ppmAutoPlay02.Checked    := (ppmAutoPlay02.Tag = iAutoPlayTime);
  ppmAutoPlay03.Checked    := (ppmAutoPlay03.Tag = iAutoPlayTime);
  ppmAutoPlay04.Checked    := (ppmAutoPlay04.Tag = iAutoPlayTime);
  ppmAutoPlay05.Checked    := (ppmAutoPlay05.Tag = iAutoPlayTime);
  ppmAutoPlay06.Checked    := (ppmAutoPlay06.Tag = iAutoPlayTime);
  ppmAutoPlay07.Checked    := (ppmAutoPlay07.Tag = iAutoPlayTime);
  ppmAutoPlay08.Checked    := (ppmAutoPlay08.Tag = iAutoPlayTime);

  // 检查是否有棋谱可以粘贴
  ppmPasteQipu.Enabled     := (Clipboard.HasFormat(CF_TEXT) and
                                (XQ.DispStepNo=XQ.PlayStepNo));
end;

procedure TfrmXQTable.ppmSoundOffClick(Sender: TObject);
begin
  isAutoPlaySoundOn := False;
end;

procedure TfrmXQTable.ppmSoundOnClick(Sender: TObject);
begin
  isAutoPlaySoundOn := True;
end;

procedure TfrmXQTable.pnlQiTuTextToolBarResize(Sender: TObject);
begin
  with Sender as TPanel do
  begin
    Height := 28;
    tlbQiTuToolBar.Height := 28;
    tlbQiTuToolBar.Left   :=
      (Width  - tlbQiTuToolBar.Width - pnlQiTuTextStyle.Width) div 2 +
      pnlQiTuTextStyle.Width;
    tlbQiTuToolBar.Top    := 0;
  end;
end;

procedure TfrmXQTable.tbtSaveQiTuTextClick(Sender: TObject);
var
  sFileName : String;
begin
  dlgSaveDialog.Title := '将棋图文本保存为';
  if dlgSaveDialog.Execute then
  begin
    sFileName := dlgSaveDialog.FileName;
    if (Pos('.', sFileName)=0) then sFileName := sFileName + '.TXT';
    if FileExists(sFileName) then
    begin
      if (Application.MessageBox('文件已经存在，要替换吗?', '保存文件',
          MB_OKCANCEL + MB_DEFBUTTON1) = IDCANCEL) then Exit;
    end;
    memQiTuText.Lines.SaveToFile(sFileName);
  end;
end;

// 显示棋图
procedure TfrmXQTable.tstXQInfoBShow(Sender: TObject);
var
  iQiTuMode : Integer;
  wp        : dTWhoPlay;
begin
  pgcQitu.ActivePage := tstQituText;
  memQiTuText.Visible := False;  memQiTuText.Lines.Clear;
  iQiTuMode := 0;  if rbtQiTuStyle02.Checked then iQiTuMode := 1;

  // 判断轮到哪方行棋
  case XQ.DispNode.XYt of
      0: wp := wpRed;
    $FF: wp := wpBlk;
    else
      begin
        case XQ.iQiziIndexAtXY(XQ.DispNode.XYt) of
          01..16: wp := wpBlk;
          17..32: wp := wpRed;
          else    wp := wpRed;
        end;
      end;
  end;

  dMakeQiTuText(memQiTuText, sRedPlayer, sBlkPlayer,
                XQ.DispNode.QiziXY, wp, iQiTuMode, XQ.ReverseH,
                chkBbsColor.Checked);
  memQiTuText.Visible := True;
  memQiTuText.SetFocus;
  memQituText.SelectAll;
end;

procedure TfrmXQTable.tbtSelectQiTuTextClick(Sender: TObject);
begin
  memQiTuText.SetFocus;
  memQiTuText.SelectAll;
end;

////////////////////////////////////////////////////////////////////////////////
// 取关键词后面的字符串
function sGetKeyString(sLine, sKey: string): string;
var
  iPos: Integer;
  i   : Integer;
begin
  Result := '';
  sLine  := Trim(sLine);
  sKey   := Trim(sKey);

  if (Length(sLine) <= Length(sKey)) then Exit;

  iPos := Pos(sKey, sLine);
  if (iPos<>1) then Exit;

  for i:=1 to Length(sKey) do
  begin
    sLine[i]:=' ';
  end;
  Result := Trim(sLine);
end;

////////////////////////////////////////////////////////////////////////////////
// 在StringList中寻找指定的关键词字符串
function sGetStrAfterKeyWord(sl: TStrings; sKey: string): string;
var
  i: Integer;
  s: string;
begin
  s := '';
  for i:=0 to (sl.Count-1) do
  begin
    s := sGetKeyString(sl.Strings[i], sKey);
    if (s<>'') then break;
  end;
  Result := s;
end;

function sGetXQVParam(s: string; sParam: string): string;
var
  sKeyStr, sResult: string;
  b1, b2          : Byte;
  i, iPos, iEnd: Integer;
begin
  Result := '';
  sKeyStr := Format('<PARAM name="%s" value="', [sParam]);
  iPos := Pos(sKeyStr, s);
  if (iPos = 0) then Exit;
  iPos := iPos + Length(sKeyStr);
  iEnd := iPos;
  while(iEnd < Length(s)) do
  begin
    if (s[iEnd] = char($22)) then break;
    Inc(iEnd);
  end;
  sResult := Copy(s, iPos, iEnd - iPos);

  if (sParam = 'Position') then
  begin
    if (Length(sResult) <> (32 * 3 - 1)) then Exit;
    for i:=1 to 32 do
    begin
      b1 := ord(sResult[(i-1)*3 + 1]);
      b2 := ord(sResult[(i-1)*3 + 2]);
      if ((b1 = ord('-'))and (b2 = ord('-'))) then continue;
      if ((b1 < ord('A')) or (b1 > ord('I'))) then Exit;
      if ((b2 < ord('0')) or (b2 > ord('9'))) then Exit;
    end;
  end;

  Result := sResult;
end;

var
  // 在以绝对坐标表示的棋谱中(如12-23)，X坐标的初始位置为0还是1
  QipuStrXFrom: Integer = 0;

// 将棋谱记录标准化
procedure dMakeStandardRecStr(var sRecStr: string);
var
  s: string;
begin
  s := sRecStr;

  s := StringReplace(s, ' ' , '', [rfReplaceAll]);

  // Big5-->GB繁体
  s := StringReplace(s,#$AB#$D3, '帅', [rfReplaceAll]);
  s := StringReplace(s,#$B1#$4E, '將', [rfReplaceAll]);
  s := StringReplace(s,#$A5#$4B, '仕', [rfReplaceAll]);
  s := StringReplace(s,#$A4#$68, '士', [rfReplaceAll]);
  s := StringReplace(s,#$AC#$DB, '相', [rfReplaceAll]);
  s := StringReplace(s,#$B6#$48, '象', [rfReplaceAll]);
  s := StringReplace(s,#$DA#$CF, '硨', [rfReplaceAll]);
  s := StringReplace(s,#$A8#$AE, '車', [rfReplaceAll]);
  s := StringReplace(s,#$D8#$58, '傌', [rfReplaceAll]);
  s := StringReplace(s,#$B0#$A8, '馬', [rfReplaceAll]);
  s := StringReplace(s,#$AF#$A5, '砲', [rfReplaceAll]);
  s := StringReplace(s,#$AC#$B6, '炮', [rfReplaceAll]);
  s := StringReplace(s,#$A5#$5D, '包', [rfReplaceAll]);
  s := StringReplace(s,#$A7#$4C, '兵', [rfReplaceAll]);
  s := StringReplace(s,#$A8#$F2, '卒', [rfReplaceAll]);
  s := StringReplace(s,#$A4#$40, '一', [rfReplaceAll]);
  s := StringReplace(s,#$A4#$47, '二', [rfReplaceAll]);
  s := StringReplace(s,#$A4#$54, '三', [rfReplaceAll]);
  s := StringReplace(s,#$A5#$7C, '四', [rfReplaceAll]);
  s := StringReplace(s,#$A4#$AD, '五', [rfReplaceAll]);
  s := StringReplace(s,#$A4#$BB, '六', [rfReplaceAll]);
  s := StringReplace(s,#$A4#$43, '七', [rfReplaceAll]);
  s := StringReplace(s,#$A4#$4B, '八', [rfReplaceAll]);
  s := StringReplace(s,#$A4#$45, '九', [rfReplaceAll]);
  s := StringReplace(s,#$B6#$69, '進', [rfReplaceAll]);
  s := StringReplace(s,#$B0#$68, '退', [rfReplaceAll]);
  s := StringReplace(s,#$A5#$AD, '平', [rfReplaceAll]);
  s := StringReplace(s,#$AB#$65, '前', [rfReplaceAll]);
  s := StringReplace(s,#$A4#$A4, '中', [rfReplaceAll]);
  s := StringReplace(s,#$AB#$E1, '後', [rfReplaceAll]);
  s := StringReplace(s,#$A6#$5A, '后', [rfReplaceAll]);
  
  s := StringReplace(s,#$A2#$B0, '１', [rfReplaceAll]);
  s := StringReplace(s,#$A2#$B1, '２', [rfReplaceAll]);
  s := StringReplace(s,#$A2#$B2, '３', [rfReplaceAll]);
  s := StringReplace(s,#$A2#$B3, '４', [rfReplaceAll]);
  s := StringReplace(s,#$A2#$B4, '５', [rfReplaceAll]);
  s := StringReplace(s,#$A2#$B5, '６', [rfReplaceAll]);
  s := StringReplace(s,#$A2#$B6, '７', [rfReplaceAll]);
  s := StringReplace(s,#$A2#$B7, '８', [rfReplaceAll]);
  s := StringReplace(s,#$A2#$B8, '９', [rfReplaceAll]);

  // GB繁体-->GB简体
  s := StringReplace(s, '車'   , '车', [rfReplaceAll]);
  s := StringReplace(s, '砗'   , '车', [rfReplaceAll]);
  s := StringReplace(s, '硨'   , '车', [rfReplaceAll]);
  s := StringReplace(s, '馬'   , '马', [rfReplaceAll]);
  s := StringReplace(s, '码'   , '马', [rfReplaceAll]);
  s := StringReplace(s, '傌'   , '马', [rfReplaceAll]);
  s := StringReplace(s, '相'   , '象', [rfReplaceAll]);
  s := StringReplace(s, '仕'   , '士', [rfReplaceAll]);
  s := StringReplace(s, '帅'   , '将', [rfReplaceAll]);
  s := StringReplace(s, '帥'   , '将', [rfReplaceAll]);
  s := StringReplace(s, '將'   , '将', [rfReplaceAll]);
  s := StringReplace(s, '砲'   , '炮', [rfReplaceAll]);
  s := StringReplace(s, '包'   , '炮', [rfReplaceAll]);
  s := StringReplace(s, '兵'   , '卒', [rfReplaceAll]);
  s := StringReplace(s, '上'   , '进', [rfReplaceAll]);
  s := StringReplace(s, '進'   , '进', [rfReplaceAll]);
  s := StringReplace(s, '下'   , '退', [rfReplaceAll]);
  s := StringReplace(s, '後'   , '后', [rfReplaceAll]);
  s := StringReplace(s, '叁'   , '三', [rfReplaceAll]);

  s := StringReplace(s, '前车' , 'R+', [rfReplaceAll]);
  s := StringReplace(s, '车前' , 'R+', [rfReplaceAll]);
  s := StringReplace(s, '前马' , 'H+', [rfReplaceAll]);
  s := StringReplace(s, '马前' , 'H+', [rfReplaceAll]);
  s := StringReplace(s, '前炮' , 'C+', [rfReplaceAll]);
  s := StringReplace(s, '炮前' , 'C+', [rfReplaceAll]);
  s := StringReplace(s, '前卒' , 'P+', [rfReplaceAll]);
  s := StringReplace(s, '卒前' , 'P+', [rfReplaceAll]);
  s := StringReplace(s, '前士' , 'A+', [rfReplaceAll]);
  s := StringReplace(s, '士前' , 'A+', [rfReplaceAll]);
  s := StringReplace(s, '前象' , 'E+', [rfReplaceAll]);
  s := StringReplace(s, '象前' , 'E+', [rfReplaceAll]);

  s := StringReplace(s, '后车' , 'R-', [rfReplaceAll]);
  s := StringReplace(s, '车后' , 'R-', [rfReplaceAll]);
  s := StringReplace(s, '后马' , 'H-', [rfReplaceAll]);
  s := StringReplace(s, '马后' , 'H-', [rfReplaceAll]);
  s := StringReplace(s, '后炮' , 'C-', [rfReplaceAll]);
  s := StringReplace(s, '炮后' , 'C-', [rfReplaceAll]);
  s := StringReplace(s, '后卒' , 'P-', [rfReplaceAll]);
  s := StringReplace(s, '卒后' , 'P-', [rfReplaceAll]);
  s := StringReplace(s, '后士' , 'A-', [rfReplaceAll]);
  s := StringReplace(s, '士后' , 'A-', [rfReplaceAll]);
  s := StringReplace(s, '后象' , 'E-', [rfReplaceAll]);
  s := StringReplace(s, '象后' , 'E-', [rfReplaceAll]);

  s := StringReplace(s, '车' , 'R', [rfReplaceAll]);
  s := StringReplace(s, '马' , 'H', [rfReplaceAll]);
  s := StringReplace(s, '象' , 'E', [rfReplaceAll]);
  s := StringReplace(s, '士' , 'A', [rfReplaceAll]);
  s := StringReplace(s, '将' , 'K', [rfReplaceAll]);
  s := StringReplace(s, '炮' , 'C', [rfReplaceAll]);
  s := StringReplace(s, '卒',  'P', [rfReplaceAll]);

  s := StringReplace(s, '１' , '1', [rfReplaceAll]);
  s := StringReplace(s, '２' , '2', [rfReplaceAll]);
  s := StringReplace(s, '３' , '3', [rfReplaceAll]);
  s := StringReplace(s, '４' , '4', [rfReplaceAll]);
  s := StringReplace(s, '５' , '5', [rfReplaceAll]);
  s := StringReplace(s, '６' , '6', [rfReplaceAll]);
  s := StringReplace(s, '７' , '7', [rfReplaceAll]);
  s := StringReplace(s, '８' , '8', [rfReplaceAll]);
  s := StringReplace(s, '９' , '9', [rfReplaceAll]);
  s := StringReplace(s, '一' , '1', [rfReplaceAll]);
  s := StringReplace(s, '二' , '2', [rfReplaceAll]);
  s := StringReplace(s, '三' , '3', [rfReplaceAll]);
  s := StringReplace(s, '四' , '4', [rfReplaceAll]);
  s := StringReplace(s, '五' , '5', [rfReplaceAll]);
  s := StringReplace(s, '六' , '6', [rfReplaceAll]);
  s := StringReplace(s, '七' , '7', [rfReplaceAll]);
  s := StringReplace(s, '八' , '8', [rfReplaceAll]);
  s := StringReplace(s, '九' , '9', [rfReplaceAll]);
  s := StringReplace(s, '进' , '+', [rfReplaceAll]);
  s := StringReplace(s, '退' , '-', [rfReplaceAll]);
  s := StringReplace(s, '平' , '.', [rfReplaceAll]);

  sRecStr := s;
end;

// 从字符串中粘贴棋谱记录到棋谱列表
procedure TfrmXQTable.dAddPlayRecordFromString(sLineStr: String);
var
  i, iSkip   : dTInt32;
  iStepNo    : dTInt32;
  XYf, XYt   : dTByte;
  XYft       : dTWord;
  sText, s   : string;
  sRecStr    : String;
  sICSStr    : String;
  sFxqStr    : String; // www.cchess.net 格式
  isQiPuStr  : Boolean;
begin
  iSkip   := 0;
  iStepNo := XQ.PlayStepNo;

  sText := sLineStr;
  dMakeStandardRecStr(sText);
  sText := sText + 'XQStudioQipuStr';

  for i:=1 to (Length(sText)-8) do
  begin
    XYft := $FFFF;

    if (iSkip > 0) then
    begin
      Dec(iSkip);
      Continue;
    end;

    iSkip      := 0;
    sRecStr    := 'C2.5';
    sICSStr    := 'E2-F2';
    isQiPuStr  := False;

    sRecStr[1] := sText[i + 0];
    sICSStr[1] := sText[i + 0];
    sRecStr[2] := sText[i + 1];
    sICSStr[2] := sText[i + 1];
    sRecStr[3] := sText[i + 2];
    sICSStr[3] := sText[i + 2];
    sRecStr[4] := sText[i + 3];
    sICSStr[4] := sText[i + 3];
    sICSStr[5] := sText[i + 4];

    s := UpperCase(sRecStr);
    if ((s[1] in ['K', 'R', 'H', 'N', 'E', 'M', 'A', 'G', 'C', 'P'])and
        (s[2] in ['1'..'9', '+', '-']) and
        (s[3] in ['+', '-', '=', '.']) and
        (s[4] in ['1'..'9'])) then          // 是wxf和axf文件格式
    begin
      case sRecStr[1] of
        'N': sRecStr[1] := 'H';
        'M': sRecStr[1] := 'E';
        'G': sRecStr[1] := 'A';
        'n': sRecStr[1] := 'h';
        'm': sRecStr[1] := 'e';
        'g': sRecStr[1] := 'a';
      end;
      if sRecStr[3] = '=' then sRecStr[3] := '.';
      iSkip   := 3;

      XYft := wGetPlayRecXY(XQ.PlayNode.QiziXY, XQ.WhoPlay, sRecStr);

      isQiPuStr := True;
    end
    else
    begin
      s := UpperCase(sICSStr);
      if ((s[1] in ['A'..'I']) and
          (s[2] in ['0'..'9']) and
          (s[3] = '-') and
          (s[4] in ['A'..'I']) and
          (s[5] in ['0'..'9'])) then          // 是ICCS文件格式
      begin
        iSkip     := 4;
        s         := UpperCase(sICSStr);
        XYft      := (Ord(s[1])-Ord('A'))*10+(Ord(s[2])-Ord('0'));
        XYft      := XYft shl 8;
        XYft      := XYft + (Ord(s[4])-Ord('A'))*10+(Ord(s[5])-Ord('0'));
        isQiPuStr := True;
      end
      else
      begin
        if ((s[1] in ['0'..'9']) and
            (s[2] in ['0'..'9']) and
            (s[3] = '-') and
            (s[4] in ['0'..'9']) and
            (s[5] in ['0'..'9'])) then          // 是CCK Java文件格式
        begin
          s[1] := chr(ord('A') + ord(s[1]) - ord('0') - QipuStrXFrom);
          s[2] := chr(ord('0') + (9 - (ord(s[2]) - ord('0'))));
          s[4] := chr(ord('A') + ord(s[4]) - ord('0') - QipuStrXFrom);
          s[5] := chr(ord('0') + (9 - (ord(s[5]) - ord('0'))));
          iSkip     := 4;
          XYft      := (Ord(s[1])-Ord('A'))*10+(Ord(s[2])-Ord('0'));
          XYft      := XYft shl 8;
          XYft      := XYft + (Ord(s[4])-Ord('A'))*10+(Ord(s[5])-Ord('0'));
          isQiPuStr := True;
        end
        else
        begin
          sFxqStr := Copy(sText, i, 8);
          s       := sFxqStr;
          if ((s[1] in ['1'..'2']) and
              (s[2] in ['1'..'7']) and
              (s[3] in ['0'..'8']) and
              (s[4] in ['0'..'9']) and
              (s[5] in ['0'..'8']) and
              (s[6] in ['0'..'9']) and
              (s[7] in ['0'..'2']) and
              (s[8] in ['0'..'7'])) then          // 是Fxq Java文件格式
          begin
            iSkip     := 7;
            XYft      := (Ord(s[3])-Ord('0'))*10+(9-(Ord(s[4])-Ord('0')));
            XYft      := XYft shl 8;
            XYft      := XYft + (Ord(s[5])-Ord('0'))*10+(9-(Ord(s[6])-Ord('0')));
            isQiPuStr := True;
          end;
        end;
      end;
    end;

    if isQiPuStr then
    begin
      XYf  := XYft shr 8;
      XYt  := XYft and $00FF;

      if Not ((XYf in [00..89]) and (XYt in [00..89])) then Break;

      XQ.dStartMoveFromXY(XYf);
      XQ.dStopMoveAtXY(XYt);

      if (XQ.PlayStepNo<>iStepNo) then
      begin
        isXQFileChange := True;
        XQ.dDispQiziAtRecNo(XQ.PlayStepNo);
        iStepNo := XQ.PlayStepNo;
      end;
    end;
  end; // end of for
end;

// 检查文本是否是由XQStudio自动生成的
function isTextIsXQFText(sText: String): Boolean;
begin

  if Pos('棋谱由XQStudio软件自动生成', sText) > 0 then
  begin
    Result := True;
    Exit;
  end;

  Result := (Pos('红方:', sText) > 0) and
            (Pos('黑方:', sText) > 0) and
            (Pos('结果:', sText) > 0) and
            (Pos('评论:', sText) > 0) and
            (Pos('----------------', sText) > 0);
end;

// 检查文本是否是由XQStudio自动生成的JavaXQ Html
function isTextIsXQVHtml(sText: String): Boolean;
begin
  Result := False;
  if Pos('<!GENERATOR name="XQStudio"', sText) > 0 then
  begin
    Result := True;
  end;
  if Pos('<!PARAM name="Position"', sText) > 0 then
  begin
    Result := True;
  end;
end;

// 检查是否是棋谱行
function isQiPuLine(sLine: string): Boolean;
var
  s: string;
begin
   Result := False;
   s := sLine;
   s := TrimLeft(s);
   if Length(s) < 1 then Exit;
   if not (pos('.', s) in [1..4]) then Exit;
   if s[1] in ['0'..'9'] then Result := True;
end;

// 粘贴棋图
procedure TfrmXQTable.ppmPasteQipuClick(Sender: TObject);
var
  s            : String;
  iXY          : Integer;
  i, iStepNo   : Integer;
  isXQFText    : Boolean;
  isXQVHtml    : Boolean;
  isCheckRemark: Boolean;
begin
  Screen.Cursor := crHourGlass;

  memQiTuText.ReadOnly := False;
  if Sender <> nil then
  begin
    memQiTuText.Clear;
    memQiTuText.PasteFromClipboard;
  end;

  // 查找标题、赛事等棋局的说明信息
  if (sTitle = '') then
    sTitle     := sGetStrAfterKeyWord(memQiTuText.Lines, '标题:');
  if (sMatchName = '') then
    sMatchName := sGetStrAfterKeyWord(memQiTuText.Lines, '赛事:');
  if (sMatchTime = '') then
    sMatchTime := sGetStrAfterKeyWord(memQiTuText.Lines, '日期:');
  if (sMatchTime = '') then
    sMatchTime := sGetStrAfterKeyWord(memQiTuText.Lines, '时间:');
  if (sMatchAddr = '') then
    sMatchAddr := sGetStrAfterKeyWord(memQiTuText.Lines, '地点:');
  if (sRedPlayer = '') then
    sRedPlayer := sGetStrAfterKeyWord(memQiTuText.Lines, '红方:');
  if (sBlkPlayer = '') then
    sBlkPlayer := sGetStrAfterKeyWord(memQiTuText.Lines, '黑方:');
  if (sRMKWriter = '') then
    sRMKWriter := sGetStrAfterKeyWord(memQiTuText.Lines, '评论:');
  if (sAuthor = '') then
    sAuthor    := sGetStrAfterKeyWord(memQiTuText.Lines, '作者:');
  if (iResult = 0) then
  begin
    s          := sGetStrAfterKeyWord(memQiTuText.Lines, '结果:');
    if (s = '红方胜') then iResult := 1;
    if (s = '黑方胜') then iResult := 2;
    if (s = '和棋')   then iResult := 3;
  end;

  //******2007-05-22 加入对象棋大师网导出棋谱的支持 ****************************
  // 查找标题、赛事等棋局的说明信息
  if (sTitle = '') then
    sTitle     := sGetStrAfterKeyWord(memQiTuText.Lines, '棋 局 名：');
  if (sMatchName = '') then
    sMatchName := sGetStrAfterKeyWord(memQiTuText.Lines, '比赛名称：');
  if (sMatchTime = '') then
    sMatchTime := sGetStrAfterKeyWord(memQiTuText.Lines, '比赛时间：');
  if (sMatchAddr = '') then
    sMatchAddr := sGetStrAfterKeyWord(memQiTuText.Lines, '比赛地点：');
  if (sRedPlayer = '') then
    sRedPlayer := sGetStrAfterKeyWord(memQiTuText.Lines, '红    方：');
  if (sBlkPlayer = '') then
    sBlkPlayer := sGetStrAfterKeyWord(memQiTuText.Lines, '黑    方：');
  if (iResult = 0) then
  begin
    s          := sGetStrAfterKeyWord(memQiTuText.Lines, '结    果：');
    if (s = '红胜') then iResult := 1;
    if (s = '黑胜') then iResult := 2;
    if (s = '和棋') then iResult := 3;
  end;
  //****************************************************************************

  dRefreshXQInfo;
  Self.Refresh;

  // 是否是由XQStudio自动生成的文件
  isXQFText     := isTextIsXQFText(memQiTuText.Text);
  isXQVHtml     := isTextIsXQVHtml(memQiTuText.Text);

  if (isXQVHtml) then
  begin
    s := (sGetXQVParam(memQiTuText.Text, 'Position'));
    if ((XQ.PlayStepNo<1)and (Length(s) = (32 * 3 - 1))) then
    begin
      iXQFType := 3;
      for i:=1 to 32 do
      begin
        iXY := $FF;
        if (s[(i-1)*3 + 1] <> '-') then
        begin
          iXY := (ord(s[(i-1)*3 + 1]) - ord('A'))*10 +
                 (ord(s[(i-1)*3 + 2]) - ord('0'));
        end;
        XQ.PlayTree.QiziXY[i] := iXY;
      end;
      lbxPlayRecClick(lbxPlayRec);      
    end;
  end;

  if ((Pos('-9', memQiTuText.Text) > 0) or
      (Pos(' 9', memQiTuText.Text) > 0)) then
  begin
    QipuStrXFrom := 1;
  end;
  if (Pos('-0', memQiTuText.Text) > 0) then
  begin
    QipuStrXFrom := 0;
  end;

  // 是否开始检查注解
  isCheckRemark := False;

  iStepNo := XQ.PlayStepNo;

  if not isXQFText then
  begin
    s := memQiTuText.Text;
    dAddPlayRecordFromString(s);
  end
  else
  begin
    for i:=0 to (memQiTuText.Lines.Count - 1) do
    begin
      s := memQiTuText.Lines[i];
      if isQiPuLine(s) then
      begin
        dAddPlayRecordFromString(s);
      end
      else
      begin
        if (not isCheckRemark) and (XQ.PlayStepNo=iStepNo) then
        begin
          // 启动注解检查的条件
          if XQ.PlayStepNo > iStepNo then isCheckRemark := True;
          if ((Pos('----------------', s)>0)and(i>3)) then
          begin
            isCheckRemark := True;
          end;
        end;

        // 停止注解检查的条件
        if ((Pos('----------------', s)>0)and(XQ.PlayStepNo>iStepNo)) then
        begin
          isCheckRemark := False;
        end;

        if isCheckRemark then
        begin
          if ((Length(Trim(s)) > 0)and(Pos('----------------', s)=0)) then
          begin
            memPlayRec.Lines.Add(s);
          end;
        end;
      end;
    end;
  end;

  memQiTuText.ReadOnly := True;
  Screen.Cursor := crDefault;

  dRefreshXQInfo;

  if (iStepNo = XQ.PlayStepNo) and (not isXQVHtml) and isPasteMsgEnabled then
  begin
    Application.MessageBox(
      '剪贴板或文件中的文本不是有效的棋谱记录(不是棋谱文本或不适用于'#13#10+
      '当前局势)，请确认将正确的棋谱记录选中并放入剪贴板。',
      '系统信息',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
  end;

  isPasteMsgEnabled := True;
end;

// 使字符串居中显示
function sAlignCenter(s: String; w: Integer): String;
var
  i: Integer;
begin
  s := Trim(s);
  Result := s;
  if (Length(s) >= w) then Exit;
  for i:=0 to (((w - Length(s)) div 2)) do Result := ' ' + Result;
  Result := TrimRight(Result);
end;


// 将棋谱转换为文本
procedure TfrmXQTable.tstXQInfoCShow(Sender: TObject);
var
  i, iStepNo, iColumn, iColumnCount  : dTInt32;
  sR, sB, sNum, sPlayRec, sLine      : String;
  bIsJavaApplet                      : Boolean;
begin
  Screen.Cursor := crHourGlass;
  memText.Visible := False;             // 先关掉显示

try
  iColumn := 0;             iColumnCount := 0;
  if rbtTextStyle01.Checked then iColumn := 1;
  if rbtTextStyle02.Checked then iColumn := 2;
  if rbtTextStyle03.Checked then iColumn := 3;

  bIsJavaApplet  := rbtTextStyle04.Checked;

  memText.Clear;                        // 将原来的内容清除

  if bIsJavaApplet then
  begin
    dMakeJavaAppletCode;
    Exit;
  end;

  // 一些标题信息
  memText.Lines.Add('');
  memText.Lines.Add('----------------------------------------------------');

  //if (lblTitle.Caption <> '') then
  //  memText.Lines.Add(sAlignCenter(lblTitle.Caption, 52));
  //if (lblPlayer.Caption <> '') then
  //  memText.Lines.Add(sAlignCenter(lblPlayer.Caption, 52));
  //if (lblTimeAddr.Caption <> '') then
  //  memText.Lines.Add(sAlignCenter(lblTimeAddr.Caption, 52));
  //memText.Lines.Add('');

  memText.Lines.Add('标题: ' + sTitle);
  memText.Lines.Add('赛事: ' + sMatchName);
  memText.Lines.Add('日期: ' + sMatchTime);
  memText.Lines.Add('地点: ' + sMatchAddr);
  memText.Lines.Add('红方: ' + sRedPlayer);
  memText.Lines.Add('黑方: ' + sBlkPlayer);
  case iResult of
    0: sPlayRec := '';
    1: sPlayRec := '红方胜';
    2: sPlayRec := '黑方胜';
    3: sPlayRec := '和棋';
  end;
  memText.Lines.Add('结果: ' + sPlayRec);
  memText.Lines.Add('评论: ' + sRMKWriter);
  memText.Lines.Add('作者: ' + sAuthor);
  memText.Lines.Add('----------------------------------------------------');

  if (XQ=nil) then Exit;

  if (XQ.PlayRec[0].Remark <> nil) then
  begin
    memText.Lines.Add('');
    memText.Lines.Add(XQ.PlayRec[0].Remark.Text);
    memText.Lines.Add('');
  end;

  sR := '';   sB := '';   sLine := '';
  for i:=1 to XQ.PlayStepNo do
  begin
    iStepNo  := (XQ.PlayRec[i].StepNo+1) div 2;
    sPlayRec := XQ.PlayRec[i].StrRec;
    case (i mod 2) of
      1: // 红方行棋子，需要着法的回合数显示
        begin
          sR := IntToStr(iStepNo);
          case Length(sR) of
            1: sR := '  ' + sR;
            2: sR := ' '  + sR;
          end;
          sNum  := sR + '. ';;
          sR    := sNum + sPlayRec;
          if (i = XQ.PlayStepNo) then
          begin
            sLine := sLine + sR;
            iColumnCount :=3;
          end
          else
          begin
            if (XQ.PlayRec[i].Remark <> nil) then
            begin
              sB           := '  …………';
              sLine        := sLine + sR + sB ;
              iColumnCount := 3;
            end;
          end;
        end;
      0:
        begin
          sB    := '  ' + sPlayRec + '  ';
          sLine := sLine + sR + sB;
          Inc(iColumnCount);
          if (XQ.PlayRec[i].Remark <> nil) then
          begin
            iColumnCount := 3;
          end;
        end;
    end;

//    if ((sB <> '') or (i=XQ.PlayStepNo)) then
//    begin
//      memText.Lines.Add(sR + sB);
//      sR := sNum + '…………';  sB := '';
//    end;

    if ((iColumnCount >=iColumn) or (i=XQ.PlayStepNo)) then
    begin
      iColumnCount := 0;
      sLine := TrimRight(sLine);
      memText.Lines.Add(sLine);
      sR := sNum + '…………';    sB := '';  sLine := '';
    end;

    if (XQ.PlayRec[i].Remark<>nil) then
    begin
      memText.Lines.Add('');
      memText.Lines.Add(XQ.PlayRec[i].Remark.Text);
      memText.Lines.Add('');
    end;
  end;

  if (XQ.PlayStepNo = 0) then
  begin
     memText.Lines.Add('    *** 没有棋谱记录!');
  end;

  memText.Lines.Add('----------------------------------------------------');
  memText.Lines.Add('棋谱由XQStudio生成 (http://www.qipaile.net/xqstudio)');
  memText.Lines.Add('');

finally
  memText.Visible := True;
  Screen.Cursor := crDefault;
end; // end of try

end;

procedure TfrmXQTable.tmrMoveBlinkTimer(Sender: TObject);
begin
  if not Assigned(FDragImgXY) then Exit;
  imgMovePosTo.Visible := not imgMovePosTo.Visible;
end;

procedure TfrmXQTable.imgXQBoardMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  tmrMoveBlink.Enabled := False;
  FDragImgXY := nil;
  lbxPlayRecClick(lbxPlayRec);
end;


function sReadMxqStr(fs: TFileStream): string;
var
  b: Byte;
  s: string[255];
begin
  Result := '';
  try
    fs.Read(b, 1);
    s[0] := chr(b);
    fs.Read(PChar(Addr(s[1]))^, b);
  except
    Exit;
  end;
  Result := s;
end;


procedure TfrmXQTable.ppmImportQipuClick(Sender: TObject);
var
  sFileName     : String;
begin
  sFileName := '';
  dlgOpenDialog.Options := dlgOpenDialog.Options - [ofAllowMultiSelect];
  dlgOpenDialog.Filter  := '文本文件 (*.txt)|*.TXT|QQ游戏存盘文件 (*.che)|*.CHE|联众象棋存盘文件 (*.chn)|*.CHN|弈天象棋存盘文件 (*.mxq)|*.MXQ|中国游戏中心象棋存盘文件 (*.ccm)|*.CCM|All files (*.*)|*.*';
  dlgOpenDialog.Title   := '打开要转入的棋谱文件';
  if dlgOpenDialog.Execute then
  begin
    sFileName := UpperCase(dlgOpenDialog.FileName);
    if not FileExists(sFileName) then Exit;
  end;
  if (sFileName = '') then Exit;
  if (Pos('.XQF', sFileName) = Length(sFileName) - 3) then
  begin
    Application.MessageBox('XQF文件请直接用XQStudio打开，' +
        '转入文件只能转入非XQF文件!', '系统信息',
        MB_OK + MB_ICONWARNING);
    Exit;
  end;

  dImportQipuFromFile(sFileName);
end;

procedure TfrmXQTable.ppmCopyClick(Sender: TObject);
begin
  frmXQWizard.QiziXY := XQ.DispNode.QiziXY;
  frmXQWizard.dRefreshQiziPosition;
  frmXQWizard.ppmCopyClick(frmXQWizard.ppmCopy);
end;

procedure TfrmXQTable.ppmSaveAsBmpClick(Sender: TObject);
begin
  frmXQWizard.QiziXY := XQ.DispNode.QiziXY;
  frmXQWizard.dRefreshQiziPosition;
  frmXQWizard.ppmSaveAsBmpClick(frmXQWizard.ppmSaveAsBmp);
end;

procedure TfrmXQTable.ppmSearcnFileClick(Sender: TObject);
begin
  if Assigned(frmXQSearch) then frmXQSearch.btnNewSearchClick(nil);
  frmMain.actFileSearchExecute(nil);
  frmXQSearch.dRefreshQiziXY(XQ.DispNode.QiziXY);
  frmXQSearch.edtStepNo.Text := IntToStr(XQ.DispStepNo);
end;

procedure TfrmXQTable.tstQituImageShow(Sender: TObject);
begin
  if (pgcInfoPage.ActivePage <> tstXQInfoB) then Exit;
  Screen.Cursor := crHourGlass;
  frmXQWizard.imgQituImage := imgQituImage;
  ppmCopyClick(ppmCopy);
  frmXQWizard.imgQituImage := nil;
  Screen.Cursor := crDefault;
end;

procedure TfrmXQTable.tbtCopyQituImageClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  ppmCopyClick(ppmCopy);
  Screen.Cursor := crDefault;
end;

procedure TfrmXQTable.tbtSaveQituImageClick(Sender: TObject);
begin
  ppmSaveAsBmpClick(ppmSaveAsBmp);
end;

procedure TfrmXQTable.dMakeJavaAppletCode;
var
  i, XYf, XYt    : Integer;
  s, sStep, sXY  : String;
begin
  memText.Lines.Add('<BR>');
  memText.Lines.Add('<CENTER>');
  memText.Lines.Add('<!GENERATOR name="XQStudio" version="1.6">');
  memText.Lines.Add('<APPLET width="249" height="301" codebase="http://www.qipaile.net/java/" code="JavaXQ.class">');

  if (iXQFType > 1) then
  begin
    s := '';
    for i:=1 to 32 do
    begin
      if (XQ.PlayTree.QiziXY[i] < 90) then
      begin
        sXY := Format('%.2d', [XQ.PlayTree.QiziXY[i]]);
        sXY[1] := chr(ord(sXY[1]) - ord('0') + ord('A'));
      end
      else
      begin
        sXY := '--';
      end;
      if (i = 16) then
      begin
        sXY := sXY + '|'
      end
      else if (i < 32) then
      begin
        sXY := sXY + ',';
      end;
      s := s + sXY;
    end;
    memText.Lines.Add('<PARAM name="Position" value="'+ s + '">');
  end;

  s := '';
  for i:=1 to XQ.PlayStepNo do
  begin
    XYf   := XQ.PlayRec[i].XYf;
    XYt   := XQ.PlayRec[i].XYt;
    sStep := Format('%.2d-%.2d', [XYf, XYt]);
    sStep[1] := chr(ord(sStep[1]) - ord('0') + ord('A'));
    sStep[4] := chr(ord(sStep[4]) - ord('0') + ord('A'));
    if (i<XQ.PlayStepNo) then sStep := sStep + ' ';
    s     := s + sStep;
  end;
  memText.Lines.Add('<PARAM name="MoveList" value="'+ s + '">');
  memText.Lines.Add('</APPLET>');
  memText.Lines.Add('<!Welcome to "http://www.qipaile.net">');
  memText.Lines.Add('</CENTER>');
  memText.Lines.Add('<BR>');
  Exit;
end;

procedure TfrmXQTable.ppmJavaXQClick(Sender: TObject);
begin
  rbtTextStyle04.Checked := True;
  tstXQInfoCShow(Self);
  memText.SelectAll;
  memText.CopyToClipboard;
end;

procedure TfrmXQTable.ppmTextXQClick(Sender: TObject);
begin
  rbtTextStyle02.Checked := True;
  tstXQInfoCShow(Self);
  memText.SelectAll;
  memText.CopyToClipboard;
end;

procedure TfrmXQTable.dClearAllStep;
begin
//
end;

var
  sNumToHz : array [0..9] of string =
             ('兵','帅','士','相','车','马','炮', '兵', '前', '后');
  sNumToFx : array [0..9] of string =
             ('进','进','平','退','进','平','退', '进', '平', '退');

procedure TfrmXQTable.edtQipuInputKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = chr(13))or(Key = '+')or(Key = '.')or(Key=' ') then
  begin
     if (Key <> '.')and(Key<>' ') then Key := chr(0);
    edtQipuInput.Text := '';
    edtQipuInput.SetFocus;
  end;

  if (Key = '.')or(Key = ' ') then
  begin
    Key := chr(0);
    if actPlayRecDelete.Enabled then actPlayRecDeleteExecute(actPlayRecDelete);
  end;
end;

procedure TfrmXQTable.edtQipuInputChange(Sender: TObject);
function GetPieceChar(c: Char): Char;
begin
  case c of
    'j', 'J': c := '1';    // 将
    's', 'S': c := 'S';    // 帅或士 留待以后处理
    'x', 'X': c := '3';    // 相,象
    'c', 'C': c := '4';    // 车
    'm', 'M': c := '5';    // 马
    'p', 'P': c := '6';    // 炮
    'b', 'B': c := '7';    // 兵
    'z', 'Z': c := '7';    // 卒
    'q', 'Q': c := '8';    // 前
    'h', 'H': c := '9';    // 后
    '1','2','3','4','5','6','7','8','9': c := c;
    else     c := '0';
  end;
  Result := c;
end;

function GetNumChar(c: Char): Char;
begin
  case c of        // '1'..'9'
    'q', 'Q': c := '1';
    'w', 'W': c := '2';
    'e', 'E': c := '3';
    'r', 'R': c := '4';
    't', 'T': c := '5';
    'y', 'Y': c := '6';
    'u', 'U': c := '7';
    'i', 'I': c := '8';
    'o', 'O': c := '9';
    '1','2','3','4','5','6','7','8','9': c := c;
    else      c := '0';
  end;
  Result := c;
end;

var
  s       : string;
  sQipuStr: string;
  i       : Integer;
begin
  s := edtQipuInput.Text;
  if (Length(s) = 4) then
  begin
    sQipuStr := '';

    s[4] := GetNumChar(s[4]);
    case s[3] of        // 进、退、平
      'j', 'J': s[3] := '1';
      'p', 'P': s[3] := '2';
      't', 'T': s[3] := '3';
      '1','2','3','4','5','6','7','8','9': s[3] := s[3];
      else      s[3] := '0';
    end;

    s[1] := GetPieceChar(s[1]);

    case s[1] of
      '8', '9':
        begin
          s[2] := GetPieceChar(s[2]);
        end;
      's', 'S': // 区分士还是帅
        begin
          case s[3] of
            '2', '5', '8': s[1] := '1';         // 帅
            else
              if (ord(s[4]) > ord('3')) then
                s[1] := '2'                     // 士
              else
                s[1] := '1';                    // 帅
          end;
          s[2] := GetNumChar(s[2]);
        end;
      else
        begin
          s[2] := GetNumChar(s[2]);
        end;
    end;
    for i:=1 to 4 do
    begin
      if not (ord(s[i]) in [$30..$39]) then break;
      case i of
        1: sQipuStr := sQipuStr + sNumToHz[ord(s[i])-$30];
        2: if (s[1]='8')or(s[1]='9') then
             sQipuStr := sQipuStr + sNumToHz[ord(s[i])-$30]
           else
             sQipuStr := sQipuStr + s[i];

        3: sQipuStr := sQipuStr + sNumToFx[ord(s[i])-$30];
        4: sQipuStr := sQipuStr + s[i];
      end;
    end;

    if (XQ.WhoPlay = wpRed) then
    begin
      for i:=1 to 9 do
      begin
        sQipuStr := StringReplace(sQipuStr, chr($30 + i), dCREDNUM[i], [rfReplaceAll]);
      end;
    end
    else
    begin
      for i:=1 to 9 do
      begin
        sQipuStr := StringReplace(sQipuStr, chr($30 + i), dCBLKNUM[i], [rfReplaceAll]);
      end;
      sQipuStr := StringReplace(sQipuStr, '帅', '将', [rfReplaceAll]);
      sQipuStr := StringReplace(sQipuStr, '相', '象', [rfReplaceAll]);
      sQipuStr := StringReplace(sQipuStr, '兵', '卒', [rfReplaceAll]);
    end;

    edtQipuInput.Text := sQipuStr;
    edtQipuInput.SelectAll;

    Clipboard.SetTextBuf(PChar(edtQipuInput.Text));
    isPasteMsgEnabled := False;
    ppmPasteQipuClick(ppmPasteQipu);
    edtQipuInput.SetFocus;
  end;
end;

procedure TfrmXQTable.ppmMergeXqfClick(Sender: TObject);
var
  i             : Integer;
  sFileName     : String;
begin
  sFileName := '';
  dlgOpenDialog.Options := dlgOpenDialog.Options + [ofAllowMultiSelect];
  dlgOpenDialog.Filter := 'XQStudio棋谱文件(*.xqf)|*.XQF';
  dlgOpenDialog.Title  := '打开要合并的棋谱文件';
  try
    if dlgOpenDialog.Execute then
    begin
      Screen.Cursor := crHourglass;
      frmMain.Refresh;
      Self.Refresh;
      with dlgOpenDialog.Files do
      begin
        for i := 0 to Count - 1 do
        begin
          dAddXqfToPlayTree(XQ.PlayTree, Strings[i]);
        end;
      end;
      XQ.dLoadAllRecForPlayNode(XQ.PlayTree);
      XQ.dDispQiziAtRecNo(0);
      XQ.dEnablePlayer(XQ.PlayTree);
      dRefreshXQInfo;
    end;
  except
  end;
  Screen.Cursor := crDefault;
end;

////////////////////////////////////////////////////////////////////////////////

function TfrmXQTable.dImportQipuFromFile(sFileName: String): Boolean;
var
  AInt          : Integer;
  i             : Integer;
  s, sEndStr    : String;
  fs            : TFileStream;
  iStepNo       : Integer;
  Xf, Yf, Xt, Yt: Word;
  sRecStr       : String;
  isChnReverse  : Boolean;
  b             : Byte;

// 从流中分析读出一个整数, 比如从 30 230 240 中读出30, 230, 240 等
function ReadIntFromFsStr(AFs: TFileStream; var AInt: Integer): Boolean;
var
  s: string[63];
  i: Integer;
  c: char;
begin
  s             := '';
  Result        := False;
  c             := ' ';
  i             := 0;
  while (AFs.Read(c, 1) = 1) and (c=' ') do continue;   // 跳过前面的空格
  while (c <> ' ') do
  begin
    if (not (c in ['0'..'9'])) then Exit; 
    Inc(i);
    s[i] := c;
    if (i > 10) then Break;
    if (AFs.Read(c, 1) <> 1) then Break;
  end;
  if (i=0) then Exit;
  s[0] := char(i);      // 设置长度
  AInt := StrToIntDef(s, 0);
  Result := True;
end;

begin
  Result := False;

  // 处理QQ游戏的象棋存盘文件 *.CHE
  if (Pos('.CHE', sFileName) = Length(sFileName) - 3) then
  begin
    fs := nil;
    try
      try
        memQiTuText.ReadOnly := False;
        memQiTuText.Clear;
        fs := TFileStream.Create(sFileName, fmOpenRead);

        // 跳过前面的5个数字
        if (not ReadIntFromFsStr(fs, AInt)) then Exit;
        if (not ReadIntFromFsStr(fs, AInt)) then Exit;
        if (not ReadIntFromFsStr(fs, AInt)) then Exit;
        if (not ReadIntFromFsStr(fs, AInt)) then Exit;
        if (not ReadIntFromFsStr(fs, AInt)) then Exit;


        while (fs.Position < fs.Size - 2) do
        begin
          if (not ReadIntFromFsStr(fs, AInt)) then Exit;
          Yf := AInt;
          if (not ReadIntFromFsStr(fs, AInt)) then Exit;
          Xf := AInt;
          if (not ReadIntFromFsStr(fs, AInt)) then Exit;
          Yt := AInt;
          if (not ReadIntFromFsStr(fs, AInt)) then Exit;
          Xt := AInt;
          ReadIntFromFsStr(fs, AInt);
          ReadIntFromFsStr(fs, AInt);
          ReadIntFromFsStr(fs, AInt);
          ReadIntFromFsStr(fs, AInt);
          ReadIntFromFsStr(fs, AInt);
          ReadIntFromFsStr(fs, AInt);

          // 转换成左上角为(0, 0)的坐标体系
          Yf := 9 - Yf;
          Yt := 9 - Yt;

          sRecStr := Format('%d%d-%d%d ', [Xf, Yf, Xt, Yt]);

          //ShowMessage(sRecStr);
          memQiTuText.Lines.Add(sRecStr);
        end;
      except
      end;
    finally
      if fs <> nil then fs.Free;
      ppmPasteQipuClick(nil);
    end;
    Exit;
  end;

  // 处理联众的象棋存盘文件 *.CHN
  if (Pos('.CHN', sFileName) = Length(sFileName) - 3) then
  begin
    fs := nil;
    isChnReverse := False;
    try
      try
        memQiTuText.ReadOnly := False;
        memQiTuText.Clear;
        fs := TFileStream.Create(sFileName, fmOpenRead);
        fs.Seek($0BC, soFromBeginning);
        while fs.Position < fs.Size - 10 do
        begin
          fs.Read(iStepNo, SizeOf(iStepNo));
          fs.Read(Xf,      Sizeof(Word));
          fs.Read(Yf,      Sizeof(Word));
          fs.Read(Xt,      Sizeof(Word));
          fs.Read(Yt,      Sizeof(Word));
          fs.Seek(20, soFromCurrent);
          if iStepNo = 1 then
          begin
            if (Yf < 5) then isChnReverse := True;
          end;
          if isChnReverse then
          begin
            Xf := 8 - Xf;  Yf := 9 - Yf;
            Xt := 8 - Xt;  Yt := 9 - Yt;
          end;
          sRecStr := Format('%d%d-%d%d ', [Xf, Yf, Xt, Yt]);
          //ShowMessage(sRecStr);
          memQiTuText.Lines.Add(sRecStr);
        end;
      except
      end;
    finally
      if fs <> nil then fs.Free;
      ppmPasteQipuClick(nil);
    end;
    Exit;
  end;

  // 处理弈天的象棋存盘文件 *.MXQ
  if (Pos('.MXQ', sFileName) = Length(sFileName) - 3) then
  begin
    fs := nil;
    try
      try
        memQiTuText.ReadOnly := False;
        memQiTuText.Clear;
        fs := TFileStream.Create(sFileName, fmOpenRead);
        sMatchAddr := '弈天网' + sReadMxqStr(fs);
        sMatchTime := sReadMxqStr(fs);
        sTitle     := sReadMxqStr(fs);


        if Pos('-胜-', sTitle) > 0 then
          iResult := 1
        else if Pos('-负-', sTitle) > 0 then
          iResult := 2
        else if Pos('-和-', sTitle) > 0 then
          iResult := 3;

        s := sTitle;

        for i:=1 to (Length(s) - 4) do
        begin
          if (s[i] = '-') and (s[i+3] = '-') then
          begin
            sRedPlayer := Copy(s, 1, i-1);
            sBlkPlayer := Copy(s, i+4, 128);
            break;
          end;
        end;

        sReadMxqStr(fs);                        // 红等级分
        sReadMxqStr(fs);                        // 黑等级分
        sTimeRule  := sReadMxqStr(fs)+'-'+sReadMxqStr(fs)+'-'+sReadMxqStr(fs);
        sReadMxqStr(fs);                        // 黑等级分
        sReadMxqStr(fs);                        // 红等级分
        sEndStr := sReadMxqStr(fs);             // 结束方式
        sReadMxqStr(fs);                        // Moves

        while fs.Position < fs.Size do
        begin
          s := sReadMxqStr(fs);
          if s = 'Ends' then break;
          if Length(s) <> 5 then break;
          Xf := ord(s[1]) - ord('0');
          Yf := ord(s[2]) - ord('A');
          Xt := ord(s[4]) - ord('0');
          Yt := ord(s[5]) - ord('A');

          // 转换成左上角为(0, 0)的坐标体系
          Yf := 9 - Yf;
          Yt := 9 - Yt;
          sRecStr := Format('%d%d-%d%d ', [Xf, Yf, Xt, Yt]);
          memQiTuText.Lines.Add(sRecStr);
        end;
      except
      end;
    finally
      if fs <> nil then fs.Free;
      ppmPasteQipuClick(nil);
      if XQ.DispStepNo <> 0 then memPlayRec.Text := sEndStr;
    end;
    Exit;
  end;

  // 处理中国游戏中心象棋存盘文件 *.CCM
  if (Pos('.CCM', sFileName) = Length(sFileName) - 3) then
  begin
    fs := nil;
    try
      try
        memQiTuText.ReadOnly := False;
        memQiTuText.Clear;
        fs := TFileStream.Create(sFileName, fmOpenRead);
        while fs.Position < fs.Size - 7 do
        begin
          fs.Read(b, SizeOf(Byte));
          fs.Read(b, SizeOf(Byte));
          fs.Read(b, SizeOf(Byte));
          fs.Read(b, Sizeof(Byte));
          Xf := b;
          fs.Read(b, Sizeof(Byte));
          Xt := b;
          fs.Read(b, Sizeof(Byte));
          Yf := b;
          fs.Read(b, Sizeof(Byte));
          Yt := b;
          //Yf := 9 - Yf;
          //Yt := 9 - Yt;

          if (Yf < 5) then
          begin
            Xf := 8 - Xf;  Yf := 9 - Yf;
            Xt := 8 - Xt;  Yt := 9 - Yt;
          end;

          sRecStr := Format('%d%d-%d%d ', [Xf, Yf, Xt, Yt]);
          //ShowMessage(sRecStr);
          memQiTuText.Lines.Add(sRecStr);
        end;
      except
      end;
    finally
      if fs <> nil then fs.Free;
      ppmPasteQipuClick(nil);
    end;
    Exit;
  end;

  // 按文本文件处理
  memQiTuText.ReadOnly := False;
  memQiTuText.Clear;
  memQiTuText.Lines.LoadFromFile(sFileName);
  ppmPasteQipuClick(nil);

  Result := True;
end;

procedure TfrmXQTable.tstQituBitmapShow(Sender: TObject);
begin
  if (pgcInfoPage.ActivePage <> tstXQInfoB) then Exit;

  Screen.Cursor := crHourGlass;
  frmMain.QiziXYtoBitmap(XQ.DispNode.QiziXY, imgQituBitmap);
  Screen.Cursor := crDefault;
end;

procedure TfrmXQTable.tbtCopyQituBitmapClick(Sender: TObject);
begin
  ppmBitmapCopyClick(ppmBitmapCopy);
end;

procedure TfrmXQTable.tbtSaveQituBitmapClick(Sender: TObject);
begin
  ppmBitmapSaveAsBmpClick(ppmBitmapSaveAsBmp);
end;

procedure TfrmXQTable.ppmBitmapCopyClick(Sender: TObject);
var
  AFormat     : Word;
  AData       : THandle;
  APalette    : HPalette;
begin
  Screen.Cursor := crHourGlass;

  frmMain.QiziXYtoBitmap(XQ.DispNode.QiziXY, imgQituBitmap);
  imgQituBitmap.Picture.SaveToClipboardFormat(AFormat, AData, APalette);
  ClipBoard.SetAsHandle(AFormat,AData);
  
  Screen.Cursor := crDefault;
end;

procedure TfrmXQTable.ppmBitmapSaveAsBmpClick(Sender: TObject);
var
  sFileName : String;
begin
  frmMain.QiziXYtoBitmap(XQ.DispNode.QiziXY, imgQituBitmap);

  if frmXQWizard.dlgSaveDialog.Execute then
  begin
    sFileName := frmXQWizard.dlgSaveDialog.FileName;
    if (Pos('.', sFileName)=0) then sFileName := sFileName + '.bmp';
    if FileExists(sFileName) then
    begin
      if (Application.MessageBox('文件已经存在，要替换吗?', '保存文件',
          MB_OKCANCEL + MB_DEFBUTTON1) = IDCANCEL) then Exit;
    end;
    imgQituBitmap.Picture.SaveToFile(sFileName);
  end;
end;

end.

