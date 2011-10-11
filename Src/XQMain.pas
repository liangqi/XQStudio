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

unit XQMain;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, Mapi, ShellApi,

  dDelphiS, XQDataT, XQTable, XQPNode, XQSystem, XQFileRW,
  XQFileP, XQAbout, XQReadme, XQWizard;

type
  TfrmMain = class(TForm)
    mmuMain: TMainMenu;
    mnuFileGroup: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileCloseItem: TMenuItem;
    mnuWindowGroup: TMenuItem;
    mnuHelpGroup: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    OpenDialog: TOpenDialog;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    mnuEditGroup: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    aclMain: TActionList;
    actEditCut: TEditCut;
    actEditCopy: TEditCopy;
    actEditPaste: TEditPaste;
    actFileNew: TAction;
    actFileSave: TAction;
    actFileExit: TAction;
    actFileOpen: TAction;
    actFileSaveAs: TAction;
    actWinMinimizeAll: TWindowMinimizeAll;
    actHelpAbout: TAction;
    actFileClose: TWindowClose;
    ToolBar2: TToolBar;
    tbtFileOpen: TToolButton;
    tbtFileSave: TToolButton;
    ToolButton3: TToolButton;
    tbtEditCut: TToolButton;
    tbtEditCopy: TToolButton;
    tbtEditPaste: TToolButton;
    tbtFileNew: TToolButton;
    ToolButton7: TToolButton;
    imlMain: TImageList;
    mnuViewGroup: TMenuItem;
    dlgSaveDialog: TSaveDialog;
    ContentsItem: TMenuItem;
    H1: TMenuItem;
    actFileP: TAction;
    ReverseVItem: TMenuItem;
    actViewReverseV: TAction;
    pnlXQStudioLogo: TPanel;
    imgLogo: TImage;
    lblVersion: TLabel;
    lblReleaseDate: TLabel;
    Label6: TLabel;
    lblCopyright: TLabel;
    Label9: TLabel;
    BoardOnlyItem: TMenuItem;
    actViewBoardOnly: TAction;
    N2: TMenuItem;
    FileProperty: TMenuItem;
    tbtFileP: TToolButton;
    imlToolButtons: TImageList;
    pnlResource: TPanel;
    imgXQBoard: TImage;
    pnlPlayList: TPanel;
    lblTextLine0: TLabel;
    lbxPlayList: TListBox;
    btnAutoPlay: TButton;
    btnPlayListClose: TButton;
    gbxAutoPlaySetup: TGroupBox;
    N1b: TMenuItem;
    FilePlayListItem: TMenuItem;
    btnAddFile: TButton;
    btnDelFile: TButton;
    tmrPlayList: TTimer;
    bvlAutoPlayFrame: TBevel;
    btnClearPlayList: TButton;
    btnStopAutoPlay: TButton;
    Label4: TLabel;
    cbxAutoPlayTime: TComboBox;
    Label5: TLabel;
    Label10: TLabel;
    cbxAutoPlaySound: TComboBox;
    lblTextLine1: TLabel;
    lblTextLine2: TLabel;
    lblTextLine3: TLabel;
    imgXQstudio: TImage;
    btnSavePlayList: TButton;
    bvlTitleLine: TBevel;
    btnUpgrade: TButton;
    cbxDisableRemark: TCheckBox;
    tbtViewReverseV: TToolButton;
    ToolButton2: TToolButton;
    actViewReverseH: TAction;
    reverseHItem: TMenuItem;
    tbtViewReverseH: TToolButton;
    actFileSearch: TAction;
    FileSearchItem: TMenuItem;
    tbtFileSearch: TToolButton;
    ToolButton6: TToolButton;
    N3: TMenuItem;
    HelpTips: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    actToolsAutoPlay: TAction;
    mnuToolsGroup: TMenuItem;
    ToolsAutoPlayItem: TMenuItem;
    actToolsStopPlay: TAction;
    actEditPasteQipu: TAction;
    ToolsStopPlayItem: TMenuItem;
    N6: TMenuItem;
    actEditOpenQipu: TAction;
    actToolsImgToClip: TAction;
    actToolsImgToFile: TAction;
    actToolsPosSearch: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    actFileNewBlank: TAction;
    B1: TMenuItem;
    ToolButton1: TToolButton;
    actToolsNewCopy: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    N10: TMenuItem;
    N11: TMenuItem;
    actToolsApplet: TAction;
    N12: TMenuItem;
    JavaApple1: TMenuItem;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    N15: TMenuItem;
    N16: TMenuItem;
    FileList1: TMenuItem;
    FileList2: TMenuItem;
    FileList3: TMenuItem;
    FileList4: TMenuItem;
    FileList5: TMenuItem;
    FileList6: TMenuItem;
    FileList7: TMenuItem;
    FileList8: TMenuItem;
    FileList9: TMenuItem;
    N18: TMenuItem;
    FileListClear: TMenuItem;
    actFileSend: TAction;
    N20: TMenuItem;
    N21: TMenuItem;
    actHelpMailToXQStudio: TAction;
    N22: TMenuItem;
    EMailM1: TMenuItem;
    actHelpHttpXQStudio: TAction;
    XQStudioH1: TMenuItem;
    actToolsText: TAction;
    ToolButton10: TToolButton;
    actToolsText1: TMenuItem;
    actHelpHttpQipaile: TAction;
    actHelpHttpXqf: TAction;
    httpwwwqipailenet1: TMenuItem;
    httpwwwqipailenetxqf1: TMenuItem;
    actEditChangePos: TAction;
    N17: TMenuItem;
    N19: TMenuItem;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    N7: TMenuItem;
    N23: TMenuItem;
    XQFchntxt1: TMenuItem;
    ToolButton13: TToolButton;
    actEditPasteQipuToFile: TAction;
    N24: TMenuItem;
    ToolButton14: TToolButton;
    actEditMergeXqf: TAction;
    N25: TMenuItem;
    jxqfxqf1: TMenuItem;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    FileImportItem: TMenuItem;
    btnImport: TButton;
    btnStopImport: TButton;
    Bevel1: TBevel;
    imgXQBoardBmp: TImage;
    imgRed1Bmp: TImage;
    imgRed2Bmp: TImage;
    imgRed3Bmp: TImage;
    imgRed4Bmp: TImage;
    imgRed5Bmp: TImage;
    imgRed6Bmp: TImage;
    imgRed7Bmp: TImage;
    imgBlk1Bmp: TImage;
    imgBlk2Bmp: TImage;
    imgBlk3Bmp: TImage;
    imgBlk4Bmp: TImage;
    imgBlk5Bmp: TImage;
    imgBlk6Bmp: TImage;
    imgBlk7Bmp: TImage;
    imgXQQituBmp: TImage;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    actToolsBmpToClip: TAction;
    actToolsBmpToFile: TAction;
    procedure actFileNewExecute(Sender: TObject);
    procedure actFileOpenExecute(Sender: TObject);
    procedure actHelpAboutExecute(Sender: TObject);
    procedure actFileExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actFileSaveExecute(Sender: TObject);
    procedure actFileSaveAsExecute(Sender: TObject);
    procedure actFilePExecute(Sender: TObject);
    procedure actViewReverseVExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure actViewBoardOnlyExecute(Sender: TObject);
    procedure ContentsItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPlayListCloseClick(Sender: TObject);
    procedure FilePlayListItemClick(Sender: TObject);
    procedure btnAddFileClick(Sender: TObject);
    procedure btnDelFileClick(Sender: TObject);
    procedure btnAutoPlayClick(Sender: TObject);
    procedure tmrPlayListTimer(Sender: TObject);
    procedure btnClearPlayListClick(Sender: TObject);
    procedure lbxPlayListClick(Sender: TObject);
    procedure btnStopAutoPlayClick(Sender: TObject);
    procedure btnSavePlayListClick(Sender: TObject);
    procedure cbxAutoPlayTimeChange(Sender: TObject);
    procedure cbxAutoPlaySoundChange(Sender: TObject);
    procedure lbxPlayListDblClick(Sender: TObject);
    procedure btnUpgradeClick(Sender: TObject);
    procedure imgXQstudioMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actViewReverseHExecute(Sender: TObject);
    procedure actFileSearchExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure HelpTipsClick(Sender: TObject);
    procedure actToolsAutoPlayExecute(Sender: TObject);
    procedure actToolsStopPlayExecute(Sender: TObject);
    procedure actEditPasteQipuExecute(Sender: TObject);
    procedure actEditOpenQipuExecute(Sender: TObject);
    procedure actToolsImgToClipExecute(Sender: TObject);
    procedure actToolsImgToFileExecute(Sender: TObject);
    procedure actToolsPosSearchExecute(Sender: TObject);
    procedure actFileNewBlankExecute(Sender: TObject);
    procedure actToolsNewCopyExecute(Sender: TObject);
    procedure actToolsAppletExecute(Sender: TObject);
    procedure actFileSendExecute(Sender: TObject);
    procedure actHelpHttpXQStudioExecute(Sender: TObject);
    procedure actHelpMailToXQStudioExecute(Sender: TObject);
    procedure actToolsTextExecute(Sender: TObject);
    procedure FileListClearClick(Sender: TObject);
    procedure FileListItemClick(Sender: TObject);
    procedure actHelpHttpQipaileExecute(Sender: TObject);
    procedure actHelpHttpXqfExecute(Sender: TObject);
    procedure actEditChangePosExecute(Sender: TObject);
    procedure actEditPasteQipuToFileExecute(Sender: TObject);
    procedure actEditMergeXqfExecute(Sender: TObject);
    procedure FileImportItemClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure btnStopImportClick(Sender: TObject);
    procedure actToolsBmpToClipExecute(Sender: TObject);
    procedure actToolsBmpToFileExecute(Sender: TObject);
  private
    FIsOpenFromClipBoard: Boolean;
    FXqfDir     : String;
    FFirstActive: Boolean;
    XqfPlayTree : dTXQPlayNode;
    XqfQzXY     : dTXQZXY;
    IsFileListLoaded: Boolean;
    FFileList   : array [1..9] of string;

    procedure dCreateXQTable(const Name: string);
    procedure dUpgradeXQFFile(sFileName: string);

    procedure dHandleOpenXqfMsg(var Msg: TMessage); message dCWMOPENXQF;

  public
    // QiziXY : dTXQZXY;
    ActiveXQTable   : TfrmXQTable;
    isCreateTableOK : Boolean;
    isCreateSearchOk: Boolean;

    IsBitmapListLoaded: Boolean;

    FImgXQBitmapList: array [0..14] of TImage;  // 0 - Board
                                                // 1 - 7  Red
                                                // 8 - 14 Blk
    FImgXQQiziBmp   : array [1..32] of TImage;  // 棋子的Img;
    FXQTopLeftX     : Integer;
    FXQTopLeftY     : Integer;
    FXQColW, FXQRowH: Integer;

    procedure dAutoPlayNextFile;
    function  OpenXQF(const Name: String): Boolean;
    procedure dEnableXQTableMenuItem(ABool: Boolean);
    procedure dLoadFileList;
    procedure dSaveFileList;
    procedure dLoadBitmapList;
    procedure dSaveBitmapList;
    function  iSaveXQTable(sFName:String; XQTable: TFrmXQTable):dTInt32;
    procedure dAddFileListItem(sFileName: String);
    procedure QiziXYtoBitmap(qzXY: dTXQZXY; img: TImage);
  end;

var
  frmMain           : TfrmMain;
  iAutoPlayTime     : dTInt32 = 3000;
  isAutoPlaySoundOn : dTBoolean = False;
  isSetAutoPlayList : dTBoolean = False;
  isSetAutoImport   : dTBoolean = False;
  sImportFileName   : String = '';
  iPlayListIndex    : dTInt32 = 100;

implementation

uses XQSearch, XQTipsDlg;
{$R *.DFM}

//-------------------------------------------------------------------------
// 创建一个象棋桌
//.........................................................................
procedure TfrmMain.dCreateXQTable(const Name: string);
var
  XQFile     : dTXQFile;
  sName      : string;
  NewXQTable : TfrmXQTable;
  bIsNew     : Boolean;
begin
  bIsNew := (Name = '');
  FFirstActive := False;
  sName := Name;  if (sName='') then sName := 'NoName'+'.XQF';

  isCreateTableOK := False;
  try
    NewXQTable := TfrmXQTable.Create(Application);
    if NewXQTable = nil then
    begin
      Exit;
    end;
  except
  else
    Exit;
  end;

  isCreateTableOK := True;

  NewXQTable.Caption    := ChangeFileExt(ExtractFileName(sName), '');
  NewXQTable.XQFileName := sName;

  frmMain.Caption := dCVersionInfo + ' - '
                     + ChangeFileExt(ExtractFileName(sName), '');

  NewXQTable.Refresh;
  Screen.Cursor := crHourglass;

  if (bIsNew and FIsOpenFromClipBoard) then
  begin
    FIsOpenFromClipBoard := False;
    NewXQTable.isPasteMsgEnabled := False;
    NewXQTable.ppmPasteQipuClick(NewXQTable.ppmPasteQipu);
    NewXQTable.actPlayRecFirstExecute(NewXQTable.actPlayRecFirst);
  end;

  if FileExists(Name) then              // 判断文件是否存在？
  begin
    XQFile := dTXQFILE.Create(Name, NewXQTable.XQ.PlayTree);
    if (XQFile=nil) then
    begin
      Screen.Cursor := crDefault;
      Exit;
    end;

    case XQFile.iLoadXQFile of          // 读入XQF文件
      0:
        begin
          with NewXQTable do
          begin
            XQ.dLoadAllRecForPlayNode(XQ.PlayTree);
            XQ.dDispQiziAtRecNo(0);
            XQ.dEnablePlayer(XQ.PlayTree);
            dGetHeadInfoFromXQFHead(XQFile.XQFHead);
            dRefreshXQInfo;
          end;
          if (not bIsNew) then dAddFileListItem(sName);
          Screen.Cursor := crDefault;
        end;
      else
        begin
          btnStopAutoPlayClick(nil);
          Application.MessageBox(
            '打开文件出错，可能的原因有：'+chr($0D)+chr($0A)+
            '    1.该文件不是XQF格式文件(扩展名为.XQF)；'+chr($0D)+chr($0A)+
            '    2.磁盘物理故障；'+chr($0D)+chr($0A)+
            '    3.该文件的内容被破坏；'+chr($0D)+chr($0A)+
            '    4.该文件需要更高版本的XQStudio的支持。'+chr($0D)+chr($0A)+
            chr($0D)+chr($0A)+
            '按“确定”按钮返回XQStudio。',
            '系统信息',
            MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
          XQFile.Free;
          NewXQTable.Close;
          Screen.Cursor := crDefault;
          Exit;
        end;
    end;
    XQFile.Free;
    Screen.Cursor := crDefault;
  end
  else
  begin                                 // 要打开的文件不存在？
    Screen.Cursor := crDefault;
    if (Name<>'') then
    begin
      btnStopAutoPlayClick(nil);
      Application.MessageBox(
        '打开文件出错，出错原因：'+chr($0D)+chr($0A)+
        '    找不到指定的文件。'+chr($0D)+chr($0A)+
                                 chr($0D)+chr($0A)+
        '按“确定”按钮返回XQStudio。',
        '系统信息',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      NewXQTable.Close;
    end;
  end;
  Screen.Cursor := crDefault;
end;

//-------------------------------------------------------------------------
// 新建一个象棋桌
//.........................................................................
procedure TfrmMain.actFileNewExecute(Sender: TObject);
var
  i: dTInt32;
begin
  if (MDIChildCount>=10) then
  begin
    Application.MessageBox(
      '打开的窗口个数太多，请先关闭一些没有用的窗口再进行本操作。',
      '系统信息',
      MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      Exit;
  end;

  btnPlayListCloseClick(nil);
  try
    if (frmXQWizard<>nil) then frmXQWizard.Release;
    frmXQWizard.Free;
    frmXQWizard := nil;
  except
  end;
try
  frmXQWizard := TfrmXQWizard.Create(Application);
  if (frmXQWizard=nil) then Exit;

  // 打开“向导”窗口
  case frmXQWizard.ShowModal of
    mrOK:
      begin
        dCreateXQTable('');             // 建立一个空的象棋桌
        if (not isCreateTableOK) then Exit;
        if (ActiveXQTable=nil) then Exit;
        with ActiveXQTable do
        begin
          iXQFType   := 0;                      // 棋局类型
          if frmXQWizard.rbtPlayType0.Checked then iXQFType := 0;
          if frmXQWizard.rbtPlayType1.Checked then iXQFType := 1;
          if frmXQWizard.rbtPlayType2.Checked then iXQFType := 2;
          if frmXQWizard.rbtPlayType3.Checked then iXQFType := 3;
          iWhoPlay   := 0;                      // 假定红方先行
          iResult    := 0;                      // 对局结果
          if frmXQWizard.rbtResult0.Checked then iResult := 0;
          if frmXQWizard.rbtResult1.Checked then iResult := 1;
          if frmXQWizard.rbtResult2.Checked then iResult := 2;
          if frmXQWizard.rbtResult3.Checked then iResult := 3;
          sTitle     := Trim(frmXQWizard.edtTitle.Text);
          sMatchName := Trim(frmXQWizard.edtMatchName.Text);
          sMatchTime := Trim(frmXQWizard.edtMatchTime.Text);
          sMatchAddr := Trim(frmXQWizard.edtMatchAddr.Text);
          sRedPlayer := Trim(frmXQWizard.edtRedPlayer.Text);
          sBlkPlayer := Trim(frmXQWizard.edtBlkPlayer.Text);
          sTimeRule  := Trim(frmXQWizard.edtTimeRule.Text);
          sRedTime   := Trim(frmXQWizard.edtRedTime.Text);
          sBlkTime   := Trim(frmXQWizard.edtBlkTime.Text);
          sRMKWriter := Trim(frmXQWizard.edtRMKWriter.Text);
          sAuthor    := Trim(frmXQWizard.edtAuthor.Text);
        end;

        if (frmXQWizard.rbtPlayType2.Checked or    // 中局或残局
            frmXQWizard.rbtPlayType3.Checked)then
        begin
          for i:=1 to 32 do                     // 设置棋子位置
          begin
            ActiveXQTable.XQ.PlayTree.QiziXY[i] := frmXQWizard.QiziXY[i];
          end;
          if frmXQWizard.rbtWhoPlay1.Checked then  // 黑方先行
          begin
            ActiveXQTable.XQ.PlayTree.XYt := $FF;
            ActiveXQTable.iWhoPlay        := 1;
          end;
                                                // 设置对局结果
          if frmXQWizard.rbtRst0.Checked then ActiveXQTable.iResult := 0;
          if frmXQWizard.rbtRst1.Checked then ActiveXQTable.iResult := 1;
          if frmXQWizard.rbtRst2.Checked then ActiveXQTable.iResult := 2;
          if frmXQWizard.rbtRst3.Checked then ActiveXQTable.iResult := 3;
          ActiveXQTable.XQ.dDispQiziAtRecNo(0);
          ActiveXQTable.XQ.dEnablePlayer(ActiveXQTable.XQ.PlayTree);
        end;

        ActiveXQTable.dRefreshXQInfo;
      end;
    else
      begin

      end;
  end;
finally
end; // try;
end;

function TFrmMain.OpenXQF(const Name: String): Boolean;
begin
  Result := False;
  if (MDIChildCount>=10) then
  begin
    Application.MessageBox(
      '打开的窗口个数太多，请先关闭一些没有用的窗口再进行本操作。',
      '系统信息',
      MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      Exit;
  end;

  dCreateXQTable(Name);
  if ((not isCreateTableOK) or (MDIChildCount>=11)) then
  begin
    Application.MessageBox(
      '打开文件出错，可能的原因有：'+chr($0D)+chr($0A)+
      '    1.打开文件的个数或窗口太多(最多10个)；'+chr($0D)+chr($0A)+
      '    2.系统内存空间太小。'+chr($0D)+chr($0A)+
      chr($0D)+chr($0A)+
      '按“确定”按钮返回XQStudio。',
      '系统信息',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      Exit;
  end;
  if (ActiveXQTable<>nil) then ActiveXQTable.dRefreshXQInfo;

  Result := True;
end;

//-------------------------------------------------------------------------
// 打开一个XQF文件并创建象棋桌
//.........................................................................
procedure TfrmMain.actFileOpenExecute(Sender: TObject);
var
  i: dTInt32;
begin
  if (MDIChildCount>=10) then
  begin
    Application.MessageBox(
      '打开的窗口个数太多，请先关闭一些没有用的窗口再进行本操作。',
      '系统信息',
      MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      Exit;
  end;
  btnPlayListCloseClick(nil);
  OPenDialog.Filter  := 'Xiangqi files (*.XQF)|*.XQF|All files (*.*)|*.*';
  OpenDialog.Options := OpenDialog.Options + [ofAllowMultiSelect];
  if OpenDialog.Execute then
  begin
    with OpenDialog.Files do
    begin
      for i := 0 to Count - 1 do
      begin
        if (i = 0) then
        begin
          if FileExists(Strings[i]) then
          begin
            FXqfDir := ExtractFilePath(Strings[i]);
          end;
        end;
        dCreateXQTable(Strings[i]);
        if ((not isCreateTableOK) or (MDIChildCount>=11)) then
        begin
          Application.MessageBox(
            '打开文件出错，可能的原因有：'+chr($0D)+chr($0A)+
            '    1.打开文件的个数或窗口太多(最多10个)；'+chr($0D)+chr($0A)+
            '    2.系统内存空间太小。'+chr($0D)+chr($0A)+
            chr($0D)+chr($0A)+
            '按“确定”按钮返回XQStudio。',
            '系统信息',
            MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
          break;
        end;
      end;
    end;
  end;
end;

//-------------------------------------------------------------------------
// 打开一个帮助文件
//.........................................................................
procedure TfrmMain.actHelpAboutExecute(Sender: TObject);
begin
  frmXQAbout.ShowModal;
end;

//-------------------------------------------------------------------------
// 退出系统
//.........................................................................
procedure TfrmMain.actFileExitExecute(Sender: TObject);
begin
  Close;
end;

//-------------------------------------------------------------------------
// 系统初始化
//.........................................................................
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FIsOpenFromClipBoard := False;
  IsFileListLoaded := False;
  IsBitmapListLoaded:= False;
  FFirstActive     := True;
  Self.Width       := 800;
  Self.Height      := 572;

  If Screen.Width >= 801 then
  begin
    Self.Left := (Screen.Width  - Self.Width ) div 2;
    Self.Top  := (Screen.Height - Self.Height) div 2;
  end
  else
  begin
    Self.Left   := 0;
    Self.Top    := 0;
  end;

  lblVersion.Caption := dCVersionInfo;
  Self.Caption       := dCVersionInfo;

  InitializeReg;

  iAutoPlayTime        := StrToIntDef(ReadRegStr('AutoPlay','Interval','3'),3);
  iAutoPlayTime        := iAutoPlayTime * 1000;
  isAutoPlaySoundOn    := (ReadRegStr('AutoPlay', 'Sound', 'Off')='On');

  FImgXQBitmapList[ 0] := imgXQBoardBmp;
  FImgXQBitmapList[ 1] := imgRed1Bmp;
  FImgXQBitmapList[ 2] := imgRed2Bmp;
  FImgXQBitmapList[ 3] := imgRed3Bmp;
  FImgXQBitmapList[ 4] := imgRed4Bmp;
  FImgXQBitmapList[ 5] := imgRed5Bmp;
  FImgXQBitmapList[ 6] := imgRed6Bmp;
  FImgXQBitmapList[ 7] := imgRed7Bmp;
  FImgXQBitmapList[ 8] := imgBlk1Bmp;
  FImgXQBitmapList[ 9] := imgBlk2Bmp;
  FImgXQBitmapList[10] := imgBlk3Bmp;
  FImgXQBitmapList[11] := imgBlk4Bmp;
  FImgXQBitmapList[12] := imgBlk5Bmp;
  FImgXQBitmapList[13] := imgBlk6Bmp;
  FImgXQBitmapList[14] := imgBlk7Bmp;

  FXQTopLeftX          := 1;            // 左上角X坐标
  FXQTopLeftY          := 19;            // 左上角Y坐标
  FXQColW              := 41;            // 列宽
  FXQRowH              := 41;            // 行高

  FImgXQQiziBmp[01]    := imgRed1Bmp;
  FImgXQQiziBmp[02]    := imgRed2Bmp;
  FImgXQQiziBmp[03]    := imgRed3Bmp;
  FImgXQQiziBmp[04]    := imgRed4Bmp;
  FImgXQQiziBmp[05]    := imgRed5Bmp;
  FImgXQQiziBmp[06]    := imgRed4Bmp;
  FImgXQQiziBmp[07]    := imgRed3Bmp;
  FImgXQQiziBmp[08]    := imgRed2Bmp;
  FImgXQQiziBmp[09]    := imgRed1Bmp;
  FImgXQQiziBmp[10]    := imgRed6Bmp;
  FImgXQQiziBmp[11]    := imgRed6Bmp;
  FImgXQQiziBmp[12]    := imgRed7Bmp;
  FImgXQQiziBmp[13]    := imgRed7Bmp;
  FImgXQQiziBmp[14]    := imgRed7Bmp;
  FImgXQQiziBmp[15]    := imgRed7Bmp;
  FImgXQQiziBmp[16]    := imgRed7Bmp;
  FImgXQQiziBmp[17]    := imgBlk1Bmp;
  FImgXQQiziBmp[18]    := imgBlk2Bmp;
  FImgXQQiziBmp[19]    := imgBlk3Bmp;
  FImgXQQiziBmp[20]    := imgBlk4Bmp;
  FImgXQQiziBmp[21]    := imgBlk5Bmp;
  FImgXQQiziBmp[22]    := imgBlk4Bmp;
  FImgXQQiziBmp[23]    := imgBlk3Bmp;
  FImgXQQiziBmp[24]    := imgBlk2Bmp;
  FImgXQQiziBmp[25]    := imgBlk1Bmp;
  FImgXQQiziBmp[26]    := imgBlk6Bmp;
  FImgXQQiziBmp[27]    := imgBlk6Bmp;
  FImgXQQiziBmp[28]    := imgBlk7Bmp;
  FImgXQQiziBmp[29]    := imgBlk7Bmp;
  FImgXQQiziBmp[30]    := imgBlk7Bmp;
  FImgXQQiziBmp[31]    := imgBlk7Bmp;
  FImgXQQiziBmp[32]    := imgBlk7Bmp;


  dLoadFileList;
  dLoadBitmapList;

  FXqfDir              := ReadRegStr('RecentFileList', 'XqfInitialDir', '');
  OpenDialog.InitialDir:= FXqfDir;
end;

//-------------------------------------------------------------------------
//  保存象棋文件
//.........................................................................
procedure TfrmMain.actFileSaveExecute(Sender: TObject);
begin
  if (ActiveXQTable=nil) then Exit;
  if (ActiveXQTable.XQFileName = 'NoName.XQF') then
  begin
    actFileSaveAsExecute(nil);
  end
  else
  begin
    iSaveXQTable(ActiveXQTable.XQFileName, ActiveXQTable);
  end;
end;

//-------------------------------------------------------------------------
//  换名保存象棋文件
//.........................................................................
procedure TfrmMain.actFileSaveAsExecute(Sender: TObject);
var
  XQFName : string;
begin
  if (ActiveXQTable=nil) then Exit;
  XQFName := ActiveXQTable.XQFileName;
  if (XQFName = 'NoName.XQF') then
  begin
    if (ActiveXQTable.sTitle<>'') then
    begin
      XQFName := ActiveXQTable.sTitle + '.XQF';
    end;
  end;

  dlgSaveDialog.FileName := XQFName;
  if dlgSaveDialog.Execute then
  begin
    XQFName := dlgSaveDialog.FileName;
    if (Pos('.', XQFName)=0) then XQFName := XQFName + '.XQF';
    if FileExists(XQFName) then
    begin
      if (Application.MessageBox(
          PChar(Format('文件“%s”已经存在，要替换吗?', [XQFName])),
          '另存为',
          MB_OKCANCEL + MB_ICONWARNING + MB_DEFBUTTON1) = IDCANCEL) then
      begin
        Exit;
      end;
    end;

    case iSaveXQTable(XQFName, ActiveXQTable) of
      0:
        begin
          ActiveXQTable.Caption    := ChangeFileExt(ExtractFileName(XQFName), '');
          ActiveXQTable.XQFileName := XQFName;
          ActiveXQTable.isXQFileChange := False;
          frmMain.Caption := dCVersionInfo+' - '+ChangeFileExt(ExtractFileName(XQFName), '');
          dAddFileListItem(XQFName);
        end;
      else
        begin

        end;
    end;
  end;
end;

//-------------------------------------------------------------------------
//  查看/设置象棋文件属性
//.........................................................................
procedure TfrmMain.actFilePExecute(Sender: TObject);
var
  XQFileP : TfrmXQFileP;
begin
  if (ActiveXQTable=nil) then Exit;

  XQFileP := TfrmXQFileP.Create(Application);
  if (XQFileP=nil) then Exit;

  with ActiveXQTable do
  begin
    XQFileP.edtTitle.Text := sTitle;

    case iXQFType of
      0: XQFileP.lblType.Caption := '全局或对局';
      1: XQFileP.lblType.Caption := '布局或开局';
      2: XQFileP.lblType.Caption := '实战中局或残局';
      3: XQFileP.lblType.Caption := '中局或残局';
      else XQFileP.lblType.Caption := '';
    end;

    case iResult of
      0: XQFileP.rbtResult0.Checked := True;
      1: XQFileP.rbtResult1.Checked := True;
      2: XQFileP.rbtResult2.Checked := True;
      3: XQFileP.rbtResult3.Checked := True;
    end;

    XQFileP.edtMatchName.Text  := sMatchName;
    XQFileP.edtMatchTime.Text  := sMatchTime;
    XQFileP.edtMatchAddr.Text  := sMatchAddr;
    XQFileP.edtRedPlayer.Text  := sRedPlayer;
    XQFileP.edtBlkPlayer.Text  := sBlkPlayer;
    XQFileP.edtTimeRule.Text   := sTimeRule;
    XQFileP.edtRedTime.Text    := sRedTime;
    XQFileP.edtBlkTime.Text    := sBlkTime;
    XQFileP.edtRMKWriter.Text  := sRMKWriter;
    XQFileP.edtAuthor.Text     := sAuthor;
  end;

  XQFileP.isUpdate := False;

  case XQFileP.ShowModal of
    mrOK:
      begin
        if XQFileP.isUpdate then
        begin
          with ActiveXQTable do
          begin
            sTitle := Trim(XQFileP.edtTitle.Text);

            if XQFileP.rbtResult0.Checked then iResult := 0;
            if XQFileP.rbtResult1.Checked then iResult := 1;
            if XQFileP.rbtResult2.Checked then iResult := 2;
            if XQFileP.rbtResult3.Checked then iResult := 3;

            sMatchName := Trim(XQFileP.edtMatchName.Text);
            sMatchTime := Trim(XQFileP.edtMatchTime.Text);
            sMatchAddr := Trim(XQFileP.edtMatchAddr.Text);
            sRedPlayer := Trim(XQFileP.edtRedPlayer.Text);
            sBlkPlayer := Trim(XQFileP.edtBlkPlayer.Text);
            sTimeRule  := Trim(XQFileP.edtTimeRule.Text);
            sRedTime   := Trim(XQFileP.edtRedTime.Text);
            sBlkTime   := Trim(XQFileP.edtBlkTime.Text);
            sRMKWriter := Trim(XQFileP.edtRMKWriter.Text);
            sAuthor    := Trim(XQFileP.edtAuthor.Text);

            isXQFileChange := True;

            dRefreshXQInfo;
          end;
        end;
      end;
    else
      begin

      end;
  end;

  XQFileP.Release;
  XQFileP.Free;
end;

//-------------------------------------------------------------------------
// 棋盘倒置
//.........................................................................
procedure TfrmMain.actViewReverseVExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.dReverseBoardV;
end;

//-------------------------------------------------------------------------
// 左右调换
//.........................................................................
procedure TfrmMain.actViewReverseHExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.dReverseBoardH;
end;

//-------------------------------------------------------------------------
// 调整窗口
//.........................................................................
procedure TfrmMain.FormResize(Sender: TObject);
var
  iTop : dTInt32;
begin
  with Sender as TForm do
  begin
    pnlXQStudioLogo.Left := (Width  - pnlXQStudioLogo.Width ) div 2;
    iTop := (Height - pnlXQStudioLogo.Height) div 2 - 64;
    if (iTop < 64) then iTop := 64;
    pnlXQStudioLogo.Top  := iTop;

    pnlPlayList.Left := (Width  - pnlPlayList.Width ) div 2;
    iTop := (Height - pnlPlayList.Height) div 2 - 32;
    if (iTop < 64) then iTop := 64;
    pnlPlayList.Top  := iTop;
  end;
end;

//-------------------------------------------------------------------------
//  只显示棋盘
//.........................................................................
procedure TfrmMain.actViewBoardOnlyExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.dShowBoardOnly(not actViewBoardOnly.Checked);
  actViewBoardOnly.Checked := not actViewBoardOnly.Checked;
end;


//-------------------------------------------------------------------------
//  查看/设置象棋文件属性
//.........................................................................
procedure TfrmMain.ContentsItemClick(Sender: TObject);
begin
  TfrmXQReadme.Create(Application);
end;

//-------------------------------------------------------------------------
//  保存象棋文件
//.........................................................................
function TfrmMain.iSaveXQTable(sFName:String; XQTable:TFrmXQTable):dTInt32;
var
  XQFile : dTXQFILE;
begin
  iSaveXQTable := -1;

  if (XQTable=nil) then Exit;

  XQFile := dTXQFILE.Create(sFName, XQTable.XQ.PlayTree);
  XQFile.isReverseH := XQTable.XQ.ReverseH;
  XQTable.dPutHeadInfoIntoXQFHead(XQFile.XQFHead);
  XQTable.dBeforeSave;

  case XQFile.iSaveXQFile of
    0: // ok
      begin
        XQTable.isXQFileChange := False;
        iSaveXQTable           := 0;
        XQTable.isXQFileSaveOK := True;
      end;
    else
      begin

      end;
  end;
  XQFile.Free;
end;

//-------------------------------------------------------------------------
//  检查命令行，自动打开文件
//.........................................................................
procedure TfrmMain.FormShow(Sender: TObject);
var
  s       : string;
  sCmdLine: String;
  iPos    : Integer;
begin
   s := ParamStr(1);
   if (s<>'') then
   begin
     if FileExists(s) then
     begin
       dCreateXQTable(s);
     end
     else
     begin
       sCmdLine := UpperCase(CmdLine);
       iPos := Pos('.EXE', sCmdLine);
       if (iPos > 0) then
       begin
         s := Trim(Copy(sCmdLine, iPos + 4, 512));
         s := StringReplace(s, '"', '', [rfReplaceAll]);
         if FileExists(s) then
         begin
           dCreateXQTable(s);
         end;
       end;
     end;
     Exit;
   end
   else // s='';
   begin
     if IsClipBoardTextQipu then
     begin
       FIsOpenFromClipBoard := True;
       OpenXQF('');
       FIsOpenFromClipBoard := False;
     end;
   end;

   if FileExists('AutoPlay.Lst') then
   begin
     FilePlayListItemClick(nil);
   end;
end;

//-------------------------------------------------------------------------
//  自动播放列表
//.........................................................................
procedure TfrmMain.dAutoPlayNextFile;
var
  f1, f2: String;
begin
  if (pnlPlayList.Tag = 1) then
  begin
    if (not isSetAutoImport) then Exit;
    if ((lbxPlayList.ItemIndex >=0) and (lbxPlayList.ItemIndex < lbxPlayList.Items.Count)) then
    begin
      f1 := lbxPlayList.Items[lbxPlayList.ItemIndex];
      f2 := ChangeFileExt(f1, '.xqf');
      if (FileExists(f2)) then
      begin
        lbxPlayList.Items[lbxPlayList.ItemIndex] := '> OK! ' + f2;
      end;
    end;
  end;

  pnlPlayList.Visible := True;
  pnlPlayList.Refresh;
  If (lbxPlayList.ItemIndex>=(lbxPlayList.Items.Count-1)) then
  begin
    isSetAutoPlayList := False;
    tmrPlayList.Enabled := False;
    btnStopAutoPlay.Enabled := False;
    btnAutoPlay.Enabled := True;

    btnStopImport.Enabled  := False;
    btnImport.Enabled      := True;

    btnAddFile.Enabled       := True;
    btnDelFile.Enabled       := True;
    btnClearPlayList.Enabled := True;
    btnSavePlayList.Enabled := True;
    lbxPlayListClick(lbxPlayList);
    Exit;
  end;
  tmrPlayList.Enabled := True;
  lbxPlayList.ItemIndex := lbxPlayList.ItemIndex + 1;
  if (pnlPlayList.Tag = 1) then btnImportClick(btnImport);
end;

//-------------------------------------------------------------------------
//  关闭，退出系统
//.........................................................................
procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
{
var
  XQStudioAtom : ATOM;
}
begin
  WriteRegStr('AutoPlay','Interval',IntToStr(iAutoPlayTime div 1000));
  if isAutoPlaySoundOn then
    WriteRegStr('AutoPlay','Sound', 'On')
  else
    WriteRegStr('AutoPlay','Sound', 'Off');

  dSaveFileList;
  dSaveBitmapList;

  WriteRegStr('RecentFileList', 'XqfInitialDir', FXqfDir);  

  FinalizeReg;
{
  XQStudioAtom := GlobalFindAtom('XQStudio is writen by Mr. Dong Shiwei.');
  if (XQStudioAtom <> 0) then
  begin
    GlobalDeleteAtom(XQStudioAtom);
  end;
}
end;

procedure TfrmMain.btnPlayListCloseClick(Sender: TObject);
begin
  if (pnlPlayList.Tag <> 0) then
  begin
    isSetAutoImport := False;
    sImportFileName := '';
    btnImport.Enabled := True;
    btnStopImport.Enabled := False;
  end;
  pnlPlayList.Visible := False;
  isSetAutoPlayList   := False;
end;

procedure TfrmMain.FilePlayListItemClick(Sender: TObject);
var
  ABool: Boolean;
begin
  sImportFileName := '';
  isSetAutoImport := False;
  lblTextLine0.Caption := StringReplace(lblTextLine0.Caption, '转换', '播放', [rfReplaceAll]);
  lblTextLine1.Caption := StringReplace(lblTextLine1.Caption, '转换', '播放', [rfReplaceAll]);
  lblTextLine2.Caption := StringReplace(lblTextLine2.Caption, '转换', '播放', [rfReplaceAll]);
  lblTextLine3.Caption := StringReplace(lblTextLine3.Caption, '转换', '播放', [rfReplaceAll]);
  lbxPlayList.Height   := 129;

  pnlPlayList.Visible  := True;
  pnlPlayList.Tag      := 0;

  ABool := (pnlPlayList.Tag = 0);
  gbxAutoPlaySetup.Visible := ABool;
  btnAutoPlay.Visible      := ABool;
  btnStopAutoPlay.Visible  := ABool;
  btnImport.Visible        := not ABool;
  btnStopImport.Visible    := not ABool;

  btnAddFile.Enabled       := True;
  btnDelFile.Enabled       := False;
  btnClearPlayList.Enabled := False;

  case (iAutoPlayTime div 1000) of
    1..5: cbxAutoPlayTime.ItemIndex := (iAutoPlayTime div 1000) - 1;
    10  : cbxAutoPlayTime.ItemIndex := 5;
    15  : cbxAutoPlayTime.ItemIndex := 6;
    20  : cbxAutoPlayTime.ItemIndex := 7;
  end;

  case isAutoPlaySoundOn of
    True : cbxAutoPlaySound.ItemIndex := 0;
    False: cbxAutoPlaySound.ItemIndex := 1;
  end;

  lbxPlayList.Items.Clear;
  
  if FileExists('AutoPlay.Lst') then
  begin
    lbxPlayList.Items.LoadFromFile('AutoPlay.Lst');
    lbxPlayList.ItemIndex := 0;
    lbxPlayListClick(nil);
    lbxPlayList.ItemIndex := 0;
  end;
end;

procedure TfrmMain.btnAddFileClick(Sender: TObject);
var
  i: dTInt32;
begin
  if (pnlPlayList.Tag = 0) then
  begin
    OPenDialog.Filter  := 'Xiangqi files (*.XQF)|*.XQF|All files (*.*)|*.*';
  end
  else
  begin
    OPenDialog.Filter  := '文本文件 (*.txt)|*.TXT|QQ游戏存盘文件 (*.che)|*.CHE|联众象棋存盘文件 (*.chn)|*.CHN|弈天象棋存盘文件 (*.mxq)|*.MXQ|中国游戏中心象棋存盘文件 (*.ccm)|*.CCM|All files (*.*)|*.*';
  end;

  OpenDialog.Options := OpenDialog.Options + [ofAllowMultiSelect];
  if (OpenDialog.Execute) then
  begin
    with OpenDialog.Files do
    begin
      for i := 0 to Count - 1 do
      begin
        if (pnlPlayList.Tag = 0) then
        begin
          lbxPlayList.Items.Add(ChangeFileExt(ExtractFileName(Strings[i]),''));
        end
        else
        begin
          lbxPlayList.Items.Add(ExtractFileName(Strings[i]));
        end;
      end;
    end;
    lbxPlayList.SetFocus;
    if (lbxPlayList.ItemIndex < 0) then lbxPlayList.ItemIndex := 0;
    lbxPlayList.ItemIndex := lbxPlayList.ItemIndex;
    lbxPlayList.Refresh;
    btnDelFile.Enabled := True;
    btnClearPlayList.Enabled := True;
    btnSavePlayList.Enabled := True;
    btnAutoPlay.Enabled := not isSetAutoPlayList;
    btnStopAutoPlay.Enabled := False;
    btnImport.Enabled := True;
    btnStopImport.Enabled := False;
  end;
  lbxPlayListClick(lbxPlayList);
end;

procedure TfrmMain.btnDelFileClick(Sender: TObject);
var
  iIdx : integer;
begin
  iIdx := lbxPlayList.ItemIndex;
  lbxPlayList.Items.Delete(iIdx);
  if (lbxPlayList.Items.Count > 0) then
  begin
    lbxPlayList.SetFocus;
    iIdx := iIdx - 1;
    if iIdx < 0 then iIdx := 0;
    lbxPlayList.ItemIndex := iIdx;
    lbxPlayList.Refresh;
    Exit;
  end;
  btnDelFile.Enabled := False;
  btnClearPlayList.Enabled := False;
  btnSavePlayList.Enabled := False;
end;

procedure TfrmMain.btnAutoPlayClick(Sender: TObject);
begin
  if (lbxPlayList.Items.Count < 1) then Exit;
  if (lbxPlayList.ItemIndex < 0) then lbxPlayList.ItemIndex := 0;
  btnAutoPlay.Enabled      := False;
  btnStopAutoPlay.Enabled  := True;
  btnAddFile.Enabled       := False;
  btnDelFile.Enabled       := False;
  btnClearPlayList.Enabled := False;
  btnSavePlayList.Enabled  := False;


  iAutoPlayTime     := StrToInt(cbxAutoPlayTime.Text)*1000;
  isAutoPlaySoundOn := (cbxAutoPlaySound.Text = '有');

  isSetAutoPlayList := True;
  dCreateXQTable(lbxPlayList.Items[lbxPlayList.ItemIndex]+'.XQF');
  pnlPlayList.Visible := False;
end;

procedure TfrmMain.btnStopAutoPlayClick(Sender: TObject);
begin
  tmrPlayList.Enabled     := False;
  btnAutoPlay.Enabled     := True;
  btnStopAutoPlay.Enabled := False;
  isSetAutoPlayList       := False;

  btnAddFile.Enabled       := True;
  btnDelFile.Enabled       := True;
  btnClearPlayList.Enabled := True;
  btnSavePlayList.Enabled  := True;
end;

procedure TfrmMain.tmrPlayListTimer(Sender: TObject);
begin
  if not isSetAutoPlayList then
  begin
    tmrPlayList.Enabled := False;
    Exit;
  end;
  pnlPlayList.Visible := False;
  dCreateXQTable(lbxPlayList.Items[lbxPlayList.ItemIndex]+'.XQF');
  tmrPlayList.Enabled := False;
end;

procedure TfrmMain.btnClearPlayListClick(Sender: TObject);
begin
  lbxPlayList.Items.Clear;
  btnDelFile.Enabled := False;
  btnClearPlayList.Enabled := False;
  btnSavePlayList.Enabled := False;
  btnAutoPlay.Enabled := False;
  btnStopAutoPlay.Enabled := False;
  btnImport.Enabled := False;
  btnStopImport.Enabled := False;
end;

procedure TfrmMain.lbxPlayListClick(Sender: TObject);
var
  s: String;
begin
  if lbxPlayList.ItemIndex < 0 then Exit;
  btnDelFile.Enabled := True;
  btnClearPlayList.Enabled := True;
  btnSavePlayList.Enabled := True;
  btnAutoPlay.Enabled := not isSetAutoPlayList;;

  s := UpperCase(lbxPlayList.Items[lbxPlayList.ItemIndex]);
  btnImport.Enabled   := (pos('> OK', s) = 0);
end;

procedure TfrmMain.btnSavePlayListClick(Sender: TObject);
begin
  lbxPlayList.Items.SaveToFile('AutoPlay.Lst');
end;

procedure TfrmMain.cbxAutoPlayTimeChange(Sender: TObject);
begin
  iAutoPlayTime     := StrToInt(cbxAutoPlayTime.Text)*1000;
end;

procedure TfrmMain.cbxAutoPlaySoundChange(Sender: TObject);
begin
  isAutoPlaySoundOn := (cbxAutoPlaySound.Text = '有');
end;

procedure TfrmMain.lbxPlayListDblClick(Sender: TObject);
begin
  if (pnlPlayList.Tag <> 0) then Exit;
  if btnAutoPlay.Enabled then
  begin
    btnAutoPlayClick(nil);
  end;
end;

procedure TfrmMain.dUpgradeXQFFile(sFileName: string);
var
  XQFile : dTXQFile;
begin
  XqfPlayTree := nil;
  XqfPlayTree := dTXQPlayNode.Create(0,'========= ',0,0,XqfQzXY,
                                     nil,nil,nil,nil);
  if (XqfPlayTree = nil) then Exit;

  XQFile := dTXQFILE.Create(sFileName, XqfPlayTree);
  if (XQFile=nil) then Exit;

  case XQFile.iLoadXQFile of          // 读入XQF文件
    0:
      begin
        XQFile.isDisableRmk := cbxDisableRemark.Checked;
        XQFile.iSaveXQFile;
      end;
  end;
  XQFile.Free;
  XqfPlayTree.Free;
  XqfPlayTree := nil;
end;

procedure TfrmMain.btnUpgradeClick(Sender: TObject);
var
  i: integer;
begin
  if (lbxPlayList.Items.Count < 1) then Exit;
  lbxPlayList.Visible := False;
  for i:= 0 to (lbxPlayList.Items.Count - 1) do
  begin
    lbxPlayList.ItemIndex := i;
    dUpgradeXQFFile(lbxPlayList.Items[lbxPlayList.ItemIndex]+'.XQF');
  end;
  lbxPlayList.Visible := True;
end;

procedure TfrmMain.imgXQstudioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ((ssLeft in Shift) and (ssCtrl in Shift) and (ssAlt in Shift) and
     (ssShift in Shift)) then
  begin
    btnSavePlayList.Visible  := not btnSavePlayList.Visible;
    btnUpgrade.Visible       := not btnUpgrade.Visible;
    cbxDisableRemark.Visible := not cbxDisableRemark.Visible;
  end;
end;


procedure TfrmMain.actFileSearchExecute(Sender: TObject);
begin
  if not isCreateSearchOk then
  begin
    if Assigned(frmXQSearch) then
    begin
      frmXQSearch.Free;
      frmXQSearch := nil;
    end;
    Application.CreateForm(TfrmXQSearch, frmXQSearch);
    isCreateSearchOk := True;
  end
  else
  begin
    if not Assigned(frmXQSearch) then Exit;
    frmXQSearch.BringToFront;
  end;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  if FFirstActive then
  begin
    FFirstActive := False;
    if (ReadRegStr('Help', 'ShowTips', 'Yes')='Yes') then
    begin
      frmXQTipsDlg.ShowModal;
    end;
  end;
end;

procedure TfrmMain.HelpTipsClick(Sender: TObject);
begin
  frmXQTipsDlg.ShowModal;
end;

procedure TFrmMain.dEnableXQTableMenuItem(ABool: Boolean);
begin
  actFileSave.Enabled           := ABool;
  actFileSaveAs.Enabled         := ABool;
  actFileP.Enabled              := ABool;
  actFileSend.Enabled           := ABool;
  actToolsNewCopy.Enabled       := ABool;

  actEditChangePos.Enabled      := ABool;
  actEditPasteQipu.Enabled      := ABool;
  actEditOpenQipu.Enabled       := ABool;
  actEditMergeXqf.Enabled       := ABool;

  actViewReverseV.Enabled       := ABool;
  actViewReverseH.Enabled       := ABool;
  actViewBoardOnly.Enabled      := ABool;

  actToolsAutoPlay.Enabled      := ABool;
  actToolsStopPlay.Enabled      := ABool;
  actToolsImgToClip.Enabled     := ABool;
  actToolsImgToFile.Enabled     := ABool;
  actToolsBmpToClip.Enabled     := ABool and IsBitmapListLoaded;
  actToolsBmpToFile.Enabled     := ABool and IsBitmapListLoaded;
  actToolsText.Enabled          := ABool;
  actToolsApplet.Enabled        := ABool;
  actToolsPosSearch.Enabled     := ABool;

  if ActiveXQTable <> nil then
  begin
    actViewBoardOnly.Checked    := ActiveXQTable.isShowBoardOnly;
  end;
end;

procedure TfrmMain.actToolsAutoPlayExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.ppmAutoPlayStartClick(nil);
end;

procedure TfrmMain.actToolsStopPlayExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.ppmAutoPlayStopClick(nil);
end;

procedure TfrmMain.actEditPasteQipuExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  if ActiveXQTable.ppmPasteQipu.Enabled then
  begin
    ActiveXQTable.ppmPasteQipuClick(ActiveXQTable.ppmPasteQipu);
  end;
end;

procedure TfrmMain.actEditOpenQipuExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.ppmImportQipuClick(ActiveXQTable.ppmImportQipu);
end;

procedure TfrmMain.actToolsImgToClipExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.ppmCopyClick(nil);
end;

procedure TfrmMain.actToolsImgToFileExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.ppmSaveAsBmpClick(nil);
end;

procedure TfrmMain.actToolsPosSearchExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.ppmSearcnFileClick(nil);
end;

procedure TfrmMain.actFileNewBlankExecute(Sender: TObject);
begin
  OpenXQF('');
end;

procedure TfrmMain.actToolsNewCopyExecute(Sender: TObject);
var
  CurrentXQTable : TfrmXQTable;
begin
  if (ActiveXQTable = nil) then Exit;
  CurrentXQTable := ActiveXQTable;
  OpenXQF('');
  if (ActiveXQTable = CurrentXQTable) then Exit;
  ActiveXQTable.XQ.PlayTree.QiziXY := CurrentXQTable.XQ.DispNode.QiziXY;
  ActiveXQTable.iWhoPlay           := CurrentXQTable.iWhoPlay;
  ActiveXQTable.XQ.WhoPlay         := CurrentXQTable.XQ.WhoPlay;
  ActiveXQTable.XQ.PlayTree.XYf    := CurrentXQTable.XQ.DispNode.XYf;
  ActiveXQTable.XQ.PlayTree.XYt    := CurrentXQTable.XQ.DispNode.XYt;
  ActiveXQTable.dShowBoardOnly(True);
  ActiveXQTable.lbxPlayRecClick(ActiveXQTable.lbxPlayRec);
  ActiveXQTable.Left  := 406;
  ActiveXQTable.Caption     := '推演棋盘 - ' + CurrentXQTable.Caption;
  ActiveXQTable.isDemoTable := True;
  ActiveXQTable.FormActivate(ActiveXQTable);  
end;

procedure TfrmMain.actToolsAppletExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.ppmJavaXQClick(nil);
end;

procedure TfrmMain.actFileSendExecute(Sender: TObject);
var
  MapiMessage: TMapiMessage;
begin
  ActiveXQTable.ppmTextXQClick(nil);
  with MapiMessage do
  begin
    ulReserved := 0;
    lpszSubject := nil;
    lpszNoteText := PChar(ActiveXQTable.memText.Text);
    lpszMessageType := nil; 
    lpszDateReceived := nil; 
    lpszConversationID := nil; 
    flFlags := 0;
    lpOriginator := nil; 
    nRecipCount := 0;
    lpRecips := nil; 
    nFileCount := 0;
    lpFiles := nil; 
  end;
  
  MapiSendMail(0, 0, MapiMessage,
    MAPI_DIALOG or MAPI_LOGON_UI or MAPI_NEW_SESSION, 0);
end;

procedure TfrmMain.actHelpHttpXQStudioExecute(Sender: TObject);
begin
  ShellExecute(Self.Handle, nil, PChar('http://www.qipaile.net/xqstudio'),
      nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.actHelpMailToXQStudioExecute(Sender: TObject);
begin
  ShellExecute(Self.Handle, nil, PChar('mailto:xqstudio@qipaile.net'),
      nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.dLoadFileList;
var
  i: Integer;
begin
  if not IsFileListLoaded then
  begin
    for i:=1 to 9 do
    begin
      FFileList[i] := ReadRegStr('RecentFileList',
          Format('XqfListItem%d', [i]), '');
    end;
    IsFileListLoaded := True;
  end;
  FileList1.Caption := '&1. ' + ChangeFileExt(ExtractFileName(FFileList[1]), '');
  FileList1.Hint    := FFileList[1];

  FileList2.Caption := '&2. ' + ChangeFileExt(ExtractFileName(FFileList[2]), '');
  FileList2.Hint    := FFileList[2];

  FileList3.Caption := '&3. ' + ChangeFileExt(ExtractFileName(FFileList[3]), '');
  FileList3.Hint    := FFileList[3];

  FileList4.Caption := '&4. ' + ChangeFileExt(ExtractFileName(FFileList[4]), '');
  FileList4.Hint    := FFileList[4];

  FileList5.Caption := '&5. ' + ChangeFileExt(ExtractFileName(FFileList[5]), '');
  FileList5.Hint    := FFileList[5];

  FileList6.Caption := '&6. ' + ChangeFileExt(ExtractFileName(FFileList[6]), '');
  FileList6.Hint    := FFileList[6];

  FileList7.Caption := '&7. ' + ChangeFileExt(ExtractFileName(FFileList[7]), '');
  FileList7.Hint    := FFileList[7];

  FileList8.Caption := '&8. ' + ChangeFileExt(ExtractFileName(FFileList[8]), '');
  FileList8.Hint    := FFileList[8];

  FileList9.Caption := '&9. ' + ChangeFileExt(ExtractFileName(FFileList[9]), '');
  FileList9.Hint    := FFileList[9];
end;

procedure TfrmMain.dSaveFileList;
begin
  WriteRegStr('RecentFileList', 'XqfListItem1', FileList1.Hint);
  WriteRegStr('RecentFileList', 'XqfListItem2', FileList2.Hint);
  WriteRegStr('RecentFileList', 'XqfListItem3', FileList3.Hint);
  WriteRegStr('RecentFileList', 'XqfListItem4', FileList4.Hint);
  WriteRegStr('RecentFileList', 'XqfListItem5', FileList5.Hint);
  WriteRegStr('RecentFileList', 'XqfListItem6', FileList6.Hint);
  WriteRegStr('RecentFileList', 'XqfListItem7', FileList7.Hint);
  WriteRegStr('RecentFileList', 'XqfListItem8', FileList8.Hint);
  WriteRegStr('RecentFileList', 'XqfListItem9', FileList9.Hint);
end;

procedure TfrmMain.dLoadBitmapList;
procedure GetXQBoardXYWH(ATxtFile: string; var X, Y, W, H: Integer);
var
  F: TextFile;
  S: string;
begin
  X := 0;
  Y := 0;
  W := 0;
  H := 0;
  if (not FileExists(ATxtFile)) then Exit;
  AssignFile(F, ATxtFile);
  Reset(F);
  Readln(F, S);
  X := StrToIntDef(Trim(S), 0);
  Readln(F, S);
  Y := StrToIntDef(Trim(S), 0);
  Readln(F, S);
  W := StrToIntDef(Trim(S), 0);
  Readln(F, S);
  H := StrToIntDef(Trim(S), 0);
  CloseFile(F);
end;

var
  i: Integer;
begin
  imgXQBoardBmp.Hint := ReadRegStr('Bitmap', 'XQBoard', '');
  imgRed1Bmp.Hint    := ReadRegStr('Bitmap', 'XQRed1',  '');
  imgRed2Bmp.Hint    := ReadRegStr('Bitmap', 'XQRed2',  '');
  imgRed3Bmp.Hint    := ReadRegStr('Bitmap', 'XQRed3',  '');
  imgRed4Bmp.Hint    := ReadRegStr('Bitmap', 'XQRed4',  '');
  imgRed5Bmp.Hint    := ReadRegStr('Bitmap', 'XQRed5',  '');
  imgRed6Bmp.Hint    := ReadRegStr('Bitmap', 'XQRed6',  '');
  imgRed7Bmp.Hint    := ReadRegStr('Bitmap', 'XQRed7',  '');
  imgBlk1Bmp.Hint    := ReadRegStr('Bitmap', 'XQBlk1',  '');
  imgBlk2Bmp.Hint    := ReadRegStr('Bitmap', 'XQBlk2',  '');
  imgBlk3Bmp.Hint    := ReadRegStr('Bitmap', 'XQBlk3',  '');
  imgBlk4Bmp.Hint    := ReadRegStr('Bitmap', 'XQBlk4',  '');
  imgBlk5Bmp.Hint    := ReadRegStr('Bitmap', 'XQBlk5',  '');
  imgBlk6Bmp.Hint    := ReadRegStr('Bitmap', 'XQBlk6',  '');
  imgBlk7Bmp.Hint    := ReadRegStr('Bitmap', 'XQBlk7',  '');
  imgXQQituBmp.Hint  := ReadRegStr('Bitmap', 'XQXYWH',  '');

  if (imgXQBoardBmp.Hint='') then imgXQBoardBmp.Hint:='C:\XQBitmap\XQBoard.BMP';
  if (imgRed1Bmp.Hint   ='') then imgRed1Bmp.Hint   :='C:\XQBitmap\XQRed1.BMP';
  if (imgRed2Bmp.Hint   ='') then imgRed2Bmp.Hint   :='C:\XQBitmap\XQRed2.BMP';
  if (imgRed3Bmp.Hint   ='') then imgRed3Bmp.Hint   :='C:\XQBitmap\XQRed3.BMP';
  if (imgRed4Bmp.Hint   ='') then imgRed4Bmp.Hint   :='C:\XQBitmap\XQRed4.BMP';
  if (imgRed5Bmp.Hint   ='') then imgRed5Bmp.Hint   :='C:\XQBitmap\XQRed5.BMP';
  if (imgRed6Bmp.Hint   ='') then imgRed6Bmp.Hint   :='C:\XQBitmap\XQRed6.BMP';
  if (imgRed7Bmp.Hint   ='') then imgRed7Bmp.Hint   :='C:\XQBitmap\XQRed7.BMP';
  if (imgBlk1Bmp.Hint   ='') then imgBlk1Bmp.Hint   :='C:\XQBitmap\XQBlk1.BMP';
  if (imgBlk2Bmp.Hint   ='') then imgBlk2Bmp.Hint   :='C:\XQBitmap\XQBlk2.BMP';
  if (imgBlk3Bmp.Hint   ='') then imgBlk3Bmp.Hint   :='C:\XQBitmap\XQBlk3.BMP';
  if (imgBlk4Bmp.Hint   ='') then imgBlk4Bmp.Hint   :='C:\XQBitmap\XQBlk4.BMP';
  if (imgBlk5Bmp.Hint   ='') then imgBlk5Bmp.Hint   :='C:\XQBitmap\XQBlk5.BMP';
  if (imgBlk6Bmp.Hint   ='') then imgBlk6Bmp.Hint   :='C:\XQBitmap\XQBlk6.BMP';
  if (imgBlk7Bmp.Hint   ='') then imgBlk7Bmp.Hint   :='C:\XQBitmap\XQBlk7.BMP';
  if (imgXQQituBmp.Hint ='') then imgXQQituBmp.Hint :='C:\XQBitmap\XQXYWH.TXT';

  if (FileExists(imgXQBoardBmp.Hint)) then
  try
    for i:=0 to 14 do
    begin
      FImgXQBitmapList[i].Picture.LoadFromFile(FImgXQBitmapList[i].Hint);
    end;

    imgXQQituBmp.Picture.LoadFromFile(imgXQBoardBmp.Hint);

    GetXQBoardXYWH(imgXQQituBmp.Hint,FXQTopLeftX,FXQTopLeftY,FXQColW,FXQRowH);

    IsBitmapListLoaded := True;
  except
  end;

end;

procedure TfrmMain.dSaveBitmapList;
begin
  WriteRegStr('Bitmap', 'XQBoard', imgXQBoardBmp.Hint);
  WriteRegStr('Bitmap', 'XQRed1' , imgRed1Bmp.Hint);
  WriteRegStr('Bitmap', 'XQRed2' , imgRed2Bmp.Hint);
  WriteRegStr('Bitmap', 'XQRed3' , imgRed3Bmp.Hint);
  WriteRegStr('Bitmap', 'XQRed4' , imgRed4Bmp.Hint);
  WriteRegStr('Bitmap', 'XQRed5' , imgRed5Bmp.Hint);
  WriteRegStr('Bitmap', 'XQRed6' , imgRed6Bmp.Hint);
  WriteRegStr('Bitmap', 'XQRed7' , imgRed7Bmp.Hint);
  WriteRegStr('Bitmap', 'XQBlk1' , imgBlk1Bmp.Hint);
  WriteRegStr('Bitmap', 'XQBlk2' , imgBlk2Bmp.Hint);
  WriteRegStr('Bitmap', 'XQBlk3' , imgBlk3Bmp.Hint);
  WriteRegStr('Bitmap', 'XQBlk4' , imgBlk4Bmp.Hint);
  WriteRegStr('Bitmap', 'XQBlk5' , imgBlk5Bmp.Hint);
  WriteRegStr('Bitmap', 'XQBlk6' , imgBlk6Bmp.Hint);
  WriteRegStr('Bitmap', 'XQBlk7' , imgBlk7Bmp.Hint);
  WriteRegStr('Bitmap', 'XQXYWH' , imgXQQituBmp.Hint);
end;

procedure TfrmMain.actToolsTextExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.ppmTextXQClick(nil);
end;

procedure TfrmMain.FileListClearClick(Sender: TObject);
var
  i: Integer;
begin
  if (Application.MessageBox(
      PChar('本操作将清除所有的文件打开历史，确实要清除吗?'),
      '清除文件历史',
      MB_OKCANCEL + MB_ICONWARNING + MB_DEFBUTTON1) = IDCANCEL) then
  begin
    Exit;
  end;

  for i:=1 to 9 do FFileList[i] := '';

  dLoadFileList;
end;

procedure TfrmMain.dAddFileListItem(sFileName: String);
var
  i, iIdx  : Integer;
  sFullName: String;
begin
  sFullName := ExpandFileName(sFileName);
  if not FileExists(sFullName) then Exit;

  iIdx := 9;
  for i:=1 to 9 do
  begin
    if (CompareText(FFileList[i] , sFullName)<>0) then continue;
    iIdx := i;
    break;
  end;

  for i:=iIdx downto 2 do
  begin
    FFileList[i] := FFileList[i-1];
  end;

  FFileList[1] := sFullName;
  
  dLoadFileList;
end;

procedure TfrmMain.FileListItemClick(Sender: TObject);
var
  m: TMenuItem;
begin
  if not (Sender is TMenuItem) then Exit;
  m := Sender as TMenuItem;
  if (m.Hint = '') then Exit;
  OpenXQF(m.Hint);
end;

procedure TfrmMain.actHelpHttpQipaileExecute(Sender: TObject);
begin
  ShellExecute(Self.Handle, nil, PChar('http://www.qipaile.net'),
      nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.actHelpHttpXqfExecute(Sender: TObject);
begin
  ShellExecute(Self.Handle, nil, PChar('http://www.qipaile.net/xqf'),
      nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.actEditChangePosExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  try
    if (frmXQWizard<>nil) then frmXQWizard.Release;
    frmXQWizard.Free;
    frmXQWizard := nil;
    frmXQWizard := TfrmXQWizard.Create(Application);
    if (frmXQWizard=nil) then Exit;
  except
  end;
  with ActiveXQTable do
  begin
    lbxPlayRec.ItemIndex := 0;
    lbxPlayRecClick(nil);
  end;

  frmXQWizard.QiziXY := ActiveXQTable.XQ.PlayTree.QiziXY;
  frmXQWizard.dRefreshQiziPosition;

  frmXQWizard.dEditPosition;
  if (frmXQWizard.ShowModal <> mrOk) then Exit;
  if (IsQzXYSame(ActiveXQTable.XQ.PlayTree.QiziXY,frmXQWizard.QiziXY, false, false))then Exit;

  if (ActiveXQTable.XQ.PlayStepNo > 0) then
  begin
    if (Application.MessageBox(
        PChar('初始棋图已经被修改，本操作将清除所有的行棋记录，确实要继续吗?'),
        '修改初始棋图',
        MB_OKCANCEL + MB_ICONWARNING + MB_DEFBUTTON1) <> IDOK) then
    begin
      Exit;
    end;
  end;

  ActiveXQTable.actPlayRecLastExecute(nil);
  while (ActiveXQTable.actPlayRecDelete.Enabled) do
  begin
    ActiveXQTable.actPlayRecDeleteExecute(nil);
  end;

  with ActiveXQTable do
  begin
    if (XQ.PlayStepNo<1) then
    begin
      iXQFType := 3;
      XQ.PlayTree.QiziXY := frmXQWizard.QiziXY;
      lbxPlayRecClick(lbxPlayRec);
    end;
  end;
end;

procedure TfrmMain.actEditPasteQipuToFileExecute(Sender: TObject);
begin
  if IsClipBoardTextQipu then
  begin
    FIsOpenFromClipBoard := True;
    OpenXQF('');
    FIsOpenFromClipBoard := False;
  end;
end;

procedure TfrmMain.dHandleOpenXqfMsg(var Msg: TMessage);
var
  s: string;
  a: ATOM;
  sFilename: string;
begin
  a := ATOM(Msg.lParam);
  SetLength(s, 256);
  GlobalGetAtomName(a, PChar(s), 255);
  try
    GlobalDeleteAtom(a);
  except
  end;
  sFilename := ExpandFileName(s);

  if FileExists(sFilename) then OpenXQF(sFilename);
end;


procedure TfrmMain.actEditMergeXqfExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.ppmMergeXqfClick(ActiveXQTable.ppmMergeXqf);
end;

procedure TfrmMain.FileImportItemClick(Sender: TObject);
var
  ABool: Boolean;
begin
  lblTextLine0.Caption := StringReplace(lblTextLine0.Caption, '播放', '转换', [rfReplaceAll]);
  lblTextLine1.Caption := StringReplace(lblTextLine1.Caption, '播放', '转换', [rfReplaceAll]);
  lblTextLine2.Caption := StringReplace(lblTextLine2.Caption, '播放', '转换', [rfReplaceAll]);
  lblTextLine3.Caption := StringReplace(lblTextLine3.Caption, '播放', '转换', [rfReplaceAll]);
  lbxPlayList.Height   := 173;

  pnlPlayList.Visible := True;
  pnlPlayList.Tag     := 1;


  ABool := (pnlPlayList.Tag = 0);
  gbxAutoPlaySetup.Visible := ABool;
  btnAutoPlay.Visible      := ABool;
  btnStopAutoPlay.Visible  := ABool;
  btnImport.Visible        := not ABool;
  btnStopImport.Visible    := not ABool;

  btnAddFile.Enabled       := True;
  btnDelFile.Enabled       := False;
  btnClearPlayList.Enabled := False;

  lbxPlayList.Items.Clear;
end;

procedure TfrmMain.btnImportClick(Sender: TObject);
begin
  isSetAutoImport := False;
  if (lbxPlayList.Items.Count < 1) then Exit;
  if (lbxPlayList.ItemIndex < 0) then lbxPlayList.ItemIndex := 0;
  sImportFileName := UpperCase(lbxPlayList.Items[lbxPlayList.ItemIndex]);
  if (pos('> OK', sImportFileName) > 0) then
  begin
    sImportFileName := '';
    Exit;
  end;
  isSetAutoImport := True;
  btnImport.Enabled := False;
  btnStopImport.Enabled := True;
  OpenXQF('');
end;

procedure TfrmMain.btnStopImportClick(Sender: TObject);
begin
  isSetAutoImport := False;
  sImportFileName := '';
  btnImport.Enabled := True;
  btnStopImport.Enabled := False;
end;

procedure TfrmMain.QiziXYtoBitmap(qzXY: dTXQZXY; img: TImage);
var
  RectS, RectD: TRect;
  i           : dTInt32;
  X, Y        : Integer;
begin
  if (not IsBitmapListLoaded) then Exit;

  try
    imgXQQituBmp.Canvas.CopyRect(       // 重新复制棋图
          Bounds(0, 0, imgXQQituBmp.Width, imgXQQituBmp.Height),
          imgXQBoardBmp.Canvas,
          Bounds(0, 0, imgXQQituBmp.Width, imgXQQituBmp.Height));

    for i:=1 to 32 do
    begin
      if (qzXY[i]=$FF) then Continue;

      X := (qzXY[i] div 10)       * FXQColW + FXQTopLeftX;
      Y := (9 - (qzXY[i] mod 10)) * FXQRowH + FXQTopLeftY;

      RectD := Bounds(X, Y, FImgXQQiziBmp[i].Width, FImgXQQiziBmp[i].Height);
      RectS := Bounds(0, 0, FImgXQQiziBmp[i].Width, FImgXQQiziBmp[i].Height);

      imgXQQituBmp.Canvas.CopyRect(RectD, FImgXQQiziBmp[i].Canvas, RectS);
    end;

    img.Picture := imgXQQituBmp.Picture;
  except
  end;
end;

procedure TfrmMain.actToolsBmpToClipExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.ppmBitmapCopyClick(nil);
end;

procedure TfrmMain.actToolsBmpToFileExecute(Sender: TObject);
begin
  if (ActiveXQTable = nil) then Exit;
  ActiveXQTable.ppmBitmapSaveAsBmpClick(nil);
end;

end.



