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

unit XQSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, XQDataT, Clipbrd, ComCtrls, FileCtrl, XQPNode, XQSystem, XQFileRW,
  XQFileP, Menus, dDelphiS;

type
  TfrmXQSearch = class(TForm)
    pnlWorkSpace: TPanel;
    grbXqfInfo: TGroupBox;
    Bevel1: TBevel;
    grbSearchResult: TGroupBox;
    imgXQBoard: TImage;
    btnStartSearch: TButton;
    btnNewSearch: TButton;
    lvwResult: TListView;
    Label1: TLabel;
    edtFileName: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    chkResultA: TCheckBox;
    chkResultB: TCheckBox;
    chkResultC: TCheckBox;
    chkResultD: TCheckBox;
    chkSubDir: TCheckBox;
    btnBrowse: TButton;
    cmbRedPlayer: TComboBox;
    cmbBlkPlayer: TComboBox;
    edtDir: TEdit;
    lblOpenHint: TLabel;
    lblResultCount: TLabel;
    aniSearch: TAnimate;
    lblTitle: TLabel;
    lblPlayer: TLabel;
    lblTimeAddr: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    lblStepNo: TLabel;
    edtStepNo: TEdit;
    bvlStepInfo: TBevel;
    updStepNo: TUpDown;
    lblBlkName: TLabel;
    lblRedName: TLabel;
    lblFileCount: TLabel;
    lblStepInfo: TLabel;
    chkAppend: TCheckBox;
    lblXqfEndHint: TLabel;
    dlbDirTree: TDirectoryListBox;
    rbtFindFile: TRadioButton;
    rbtBrowFile: TRadioButton;
    lblSelectDriver: TLabel;
    dcbDriver: TDriveComboBox;
    chkSearchQzXY: TCheckBox;
    Label7: TLabel;
    chkOnlyInitPos: TCheckBox;
    ppmBoard: TPopupMenu;
    ppmCopy: TMenuItem;
    ppmSaveAsBmp: TMenuItem;
    ppmLine1: TMenuItem;
    ppmPastePosition: TMenuItem;
    imgQZMove: TImage;
    chkDisplayQizi: TCheckBox;
    imgClient: TImage;
    N1: TMenuItem;
    ppm32Qizi: TMenuItem;
    ppm1Ma: TMenuItem;
    ppm2Ma: TMenuItem;
    chkResultSearch: TCheckBox;
    ppmResult: TPopupMenu;
    ppmCopyAll: TMenuItem;
    ppmMoveAll: TMenuItem;
    ppmCopySelected: TMenuItem;
    ppmMoveSelected: TMenuItem;
    N4: TMenuItem;
    chkSearchVar: TCheckBox;
    chkQzNumOnly: TCheckBox;
    chkIgnoreYz: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure imgXQBoardClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnStartSearchClick(Sender: TObject);
    procedure lvwResultDblClick(Sender: TObject);
    procedure btnNewSearchClick(Sender: TObject);
    procedure lvwResultChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvwResultClick(Sender: TObject);
    procedure edtStepNoChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure rbtFindBrowClick(Sender: TObject);
    procedure dcbDriverChange(Sender: TObject);
    procedure dlbDirTreeChange(Sender: TObject);
    procedure chkSearchQzXYClick(Sender: TObject);
    procedure ppmBoardPopup(Sender: TObject);
    procedure ppmPastePositionClick(Sender: TObject);
    procedure ppmSaveAsBmpClick(Sender: TObject);
    procedure ppmCopyClick(Sender: TObject);
    procedure imgXQBoardDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure QiziEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure QiziStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure chkDisplayQiziClick(Sender: TObject);
    procedure ppm32QiziClick(Sender: TObject);
    procedure ppm1MaClick(Sender: TObject);
    procedure ppm2MaClick(Sender: TObject);
    procedure chkResultSearchClick(Sender: TObject);
    procedure ppmCopyAllClick(Sender: TObject);
    procedure ppmCopySelectedClick(Sender: TObject);
    procedure ppmMoveAllClick(Sender: TObject);
    procedure ppmMoveSelectedClick(Sender: TObject);
  private
    { Private declarations }
    FXqFile     : dTXQFile;
    FXqTree     : dTXQPlayNode;
    FXqfQzXY    : dTXQZXY;
    FCurQzXY    : dTXQZXY;
    FOpenFile   : Boolean;
    FOpenTree   : Boolean;
    FXqfEnd     : Boolean;
    FFileNum    : integer;
    FCurItem    : TListItem;
    FCurStep    : Integer;
    FCurDrive   : Char;
    imgQizi     : array [1..32] of TImage;
    QiziXYRect  : array [0..8, 0..9] of TRect;
    pntQizi     : array [1..32] of TPoint;              // 棋盘外的位置
    StartMoveLeft, StartMoveTop : Integer;
    FSearchEnabled  : Boolean;
    FSearching      : Boolean;
    FBrowseResultDir: String;
    FFileList   : TStringList;

    procedure ReSearch;
    procedure AddFileNames(ADir: String);
    procedure dRefreshXqfInfo;
    function  IsXqfMatched(AName: String): Boolean;
    function  GetQzXYStepNo(ATree: dTXQPlayNode; var AQzXY: dTXQZXY): Integer;
    procedure GetFileListFromResult;
    procedure copyFileList(ADir: String; OnlySelected: Boolean = False;
                           DeleteSource: Boolean = False);
  public
    QiziXY : dTXQZXY;


    procedure dRefreshQiziXY(AQzXY: dTXQZXY);
    function  OpenXQF(AName: String): Boolean;
    function  OpenFocused: Boolean;

    function  getDestDir: String;
    function  getCopyMoveAnswer(AHint, ADir: String): Boolean;
    function  getReplaceAnswer(AFile: String): Integer;

    { Public declarations }
  end;

var
  frmXQSearch: TfrmXQSearch;

implementation

uses XQMain, XQWizard;

{$R *.DFM}

procedure TfrmXQSearch.FormCreate(Sender: TObject);
var
  i, j, ATop, ALeft, ADx, ADy, X, Y: Integer;
  s: String;
begin
  FFileList := TStringList.Create;

  Self.Left := 0;  Self.Top := 0;
  Self.Height := 454;
  Self.Width := 732;
  imgXQBoard.Canvas.CopyRect(Rect(0,0,imgXQBoard.Width,imgXQBoard.Height),
     frmXQWizard.imgXQBoard.Canvas,
     Rect(0,0,imgXQBoard.Width,imgXQBoard.Height));
  lblTitle.Caption    := '';
  lblTimeAddr.Caption := '';

  // 复制棋子的图象
  for i:=1 to 32 do
  begin
    imgQizi[i] := TImage.Create(Self);
    imgQizi[i].Parent := grbXqfInfo;
    imgQizi[i].Width  := frmXQWizard.imgQizi[i].Width;
    imgQizi[i].Height := frmXQWizard.imgQizi[i].Height;
    imgQizi[i].Canvas.CopyRect(
        Rect(0,0,imgQizi[i].Width,imgQizi[i].Height),
        frmXQWizard.imgQizi[i].Canvas,
        Rect(0,0,imgQizi[i].Width,imgQizi[i].Height));
    imgQizi[i].Visible := False;
    imgQizi[i].OnDragOver := imgXQBoardDragOver;
    imgQizi[i].OnStartDrag:= QiziStartDrag;
    imgQizi[i].OnEndDrag  := QiziEndDrag;
    imgQizi[i].DragMode   := dmAutomatic;
    imgQizi[i].Cursor     := crHandPoint;
    imgQizi[i].DragCursor := crHandPoint;
    imgQizi[i].Transparent:= True;
    imgQizi[i].Tag        := i;
  end;
  imgQzMove.BringToFront;

  // 设置棋盘上的兵站
  for i:=0 to 8 do for j:=0 to 9 do
  begin
    with QiziXYRect[i, j] do
    begin
      Left   := imgXQBoard.Left +   9 + i*22;
      Top    := imgXQBoard.Top  + 236 - j*22;
      Right  := Left + 18;
      Bottom := Top  + 18;
    end;
  end;

  // 设置死子的位置
  ALeft := imgXQBoard.Left + 2;
  ATop  := imgXQBoard.Top  + imgXQBoard.Height - 24;
  ADx   := 24;
  ADy   := 22;

  // 红死子位置
  X := ALeft + ADx;  Y := ATop + ADy;
  pntQizi[ 1].x := X;   pntQizi[ 1].y := Y;
  pntQizi[ 9].x := X;   pntQizi[ 9].y := Y;
  X := X + ADx;
  pntQizi[ 2].x := X;   pntQizi[ 2].y := Y;
  pntQizi[ 8].x := X;   pntQizi[ 8].y := Y;
  X := X + ADx;
  pntQizi[ 3].x := X;   pntQizi[ 3].y := Y;
  pntQizi[ 7].x := X;   pntQizi[ 7].y := Y;
  X := X + ADx;
  pntQizi[ 4].x := X;   pntQizi[ 4].y := Y;
  pntQizi[ 6].x := X;   pntQizi[ 6].y := Y;
  X := X + ADx;
  pntQizi[ 5].x := X;   pntQizi[ 5].y := Y;
  X := X + ADx;
  pntQizi[10].x := X;   pntQizi[10].y := Y;
  pntQizi[11].x := X;   pntQizi[11].y := Y;
  X := X + ADx;
  pntQizi[12].x := X;   pntQizi[12].y := Y;
  pntQizi[13].x := X;   pntQizi[13].y := Y;
  pntQizi[14].x := X;   pntQizi[14].y := Y;
  pntQizi[15].x := X;   pntQizi[15].y := Y;
  pntQizi[16].x := X;   pntQizi[16].y := Y;

  // 黑死子位置
  X := ALeft + ADx;  Y := Y + ADy;
  pntQizi[17].x := X;   pntQizi[17].y := Y;
  pntQizi[25].x := X;   pntQizi[25].y := Y;
  X := X + ADx;
  pntQizi[18].x := X;   pntQizi[18].y := Y;
  pntQizi[24].x := X;   pntQizi[24].y := Y;
  X := X + ADx;
  pntQizi[19].x := X;   pntQizi[19].y := Y;
  pntQizi[23].x := X;   pntQizi[23].y := Y;
  X := X + ADx;
  pntQizi[20].x := X;   pntQizi[20].y := Y;
  pntQizi[22].x := X;   pntQizi[22].y := Y;
  X := X + ADx;
  pntQizi[21].x := X;   pntQizi[21].y := Y;
  X := X + ADx;
  pntQizi[26].x := X;   pntQizi[26].y := Y;
  pntQizi[27].x := X;   pntQizi[27].y := Y;
  X := X + ADx;
  pntQizi[28].x := X;   pntQizi[28].y := Y;
  pntQizi[29].x := X;   pntQizi[29].y := Y;
  pntQizi[30].x := X;   pntQizi[30].y := Y;
  pntQizi[31].x := X;   pntQizi[31].y := Y;
  pntQizi[32].x := X;   pntQizi[32].y := Y;

  for i:=1 to 32 do FCurQzXY[i] := $FF;
  dRefreshQiziXY(FCurQzXY);

  FSearchEnabled := False;
  try
    s := ReadRegStr('RecentFileList', 'XqfBrowserDrive', 'C');
    dcbDriver.Drive := s[1];
  except
    dcbDriver.Drive := 'C';
  end;

  try
    s := ReadRegStr('RecentFileList', 'XqfBrowserDir', '\');
    dlbDirTree.Directory := s;
  except
    dlbDirTree.Directory := '\';
  end;

  edtDir.Text := ReadRegStr('RecentFileList', 'XqfFinderDir', 'C:\XqfFiles');
  FSearchEnabled := True;
end;

procedure TfrmXQSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Screen.Cursor := crHourglass;
  lvwResult.Items.Clear;
  Screen.Cursor := crDefault;

  FFileList.Free;

  Action := caFree;
  if (frmMain.MDIChildCount<=1) then frmMain.pnlXQStudioLogo.Visible:=True;
  frmMain.isCreateSearchOk := False;
  frmXQSearch := nil;
  WriteRegStr('RecentFileList', 'XqfBrowserDrive', dcbDriver.Drive);
  WriteRegStr('RecentFileList', 'XqfBrowserDir', dlbDirTree.Directory);
  WriteRegStr('RecentFileList', 'XqfFinderDir', edtDir.Text);
end;

procedure TfrmXQSearch.FormActivate(Sender: TObject);
begin
  frmMain.pnlXQStudioLogo.Visible := False;
end;

procedure TfrmXQSearch.imgXQBoardClick(Sender: TObject);
{var
  slTxt: TStringList;}
begin
{  slTxt := TStringList.Create;
  slTxt.Text := ClipBoard.AsText;
  try
  if not (frmXQWizard.isStringListToQiziXYOK(slTxt, QiziXY)) then Exit;

  frmXQWizard.QiziXYtoImage(QiziXY, imgXQBoard);
  finally
    slTxt.Free;
  end;}
end;

procedure TfrmXQSearch.btnBrowseClick(Sender: TObject);
var
  DirStr: string;
begin
  DirStr := '';
  if SelectDirectory('请选择棋谱文件(*.XQF)所在的目录', '', DirStr) then
  begin
    edtDir.Text := DirStr;
  end;
end;

procedure TFrmXQSearch.ReSearch;
var
  AItem: TListItem;
  i    : Integer;
  s    : String;
begin
  for i:=0 to (FFileList.Count-1) do
  begin
    Inc(FFileNum);
    lblFileCount.Caption := IntToStr(FFileNum);
    lblFileCount.Refresh;

    s := FFileList.Strings[i];

    // 检查文件名的条件
    if (edtFileName.Text <> '') then
    begin
      if (Pos(edtFileName.Text, s) < 1) then continue;
    end;

    // 检查文件内容条件
    if not IsXqfMatched(s) then continue;

    AItem := lvwResult.Items.Add;
    AItem.Caption     := ChangeFileExt(ExtractFileName(s), '');
    AItem.SubItems.Add(ExtractFileDir(s));
    AItem.ImageIndex := 6;
  end;
end;

procedure TFrmXQSearch.AddFileNames(ADir: String);
var
  sr: TSearchRec;
  AItem: TListItem;
begin
  if FindFirst(ADir+'\*.*', faAnyFile, sr) <> 0 then Exit;
  repeat
    if (sr.Attr = faDirectory) and ((sr.Name<>'.') and (sr.Name<>'..')) then
    begin
      if chkSubDir.Checked then AddFileNames(ADir+'\'+sr.Name);
    end
    else
    begin
      Inc(FFileNum);
      lblFileCount.Caption := IntToStr(FFileNum);
      lblFileCount.Refresh;

      // 必须是XQF文件
      if(UpperCase(ExtractFileExt(sr.Name))<>'.XQF') then continue;

      // 检查文件名的条件
      if (edtFileName.Text <> '') then
      begin
        if (Pos(edtFileName.Text, sr.Name) < 1) then continue;
      end;

      // 检查文件内容条件
      if not IsXqfMatched(ADir + '\' + sr.Name) then continue;

      AItem := lvwResult.Items.Add;
      AItem.Caption     := ChangeFileExt(sr.Name, '');
      AItem.SubItems.Add(ADir);
      AItem.ImageIndex := 6;
    end;
  until  (FindNext(sr) <> 0);
  FindClose(sr);
end;

procedure TFrmXQSearch.GetFileListFromResult;
var
  i: Integer;
begin
  FFileList.Clear;
  for i:=0 to lvwResult.Items.Count - 1 do
  begin
    FFileList.Add(lvwResult.Items[i].SubItems[0] + '\' +
                  lvwResult.Items[i].Caption + '.XQF');
  end;
end;

procedure TFrmXQSearch.copyFileList(ADir: String;
                         OnlySelected, DeleteSource: Boolean);
var
  i     : Integer;
  f1, f2: String;
  ABool : Boolean;
begin
  for i:=0 to lvwResult.Items.Count - 1 do
  begin
    if OnlySelected then
    begin
      if not lvwResult.Items[i].Selected then continue;
    end;
    f1 := lvwResult.Items[i].SubItems[0]+'\'+lvwResult.Items[i].Caption+'.XQF';
    f2 := ADir+'\'+lvwResult.Items[i].Caption+'.XQF';
    ABool := False;
    if FileExists(f2) then
    begin
      case getReplaceAnswer(lvwResult.Items[i].Caption) of
        IDYES:
          ABool := False;
        IDNO:
          ABool := True;
        else Exit;
      end;
    end;
    if CopyFile(PChar(f1), PChar(f2), ABool) then
    begin
      if DeleteSource then
      begin
        DeleteFile(f1);
        lvwResult.Items[i].SubItems[0] := ADir;
      end;
    end;
  end;
end;

procedure TfrmXQSearch.btnStartSearchClick(Sender: TObject);
var
  DirStr: String;
  DirLen: Integer;
begin
  if (pos('.', edtFileName.Text)>0) then
  begin
    Application.MessageBox(
      '请注意，文件名中不能有扩展名，XQStudio会自动处理“.XQF”文件。',
      '系统信息', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  FBrowseResultDir  := '';

  edtFileName.Text  := Trim(edtFileName.Text);
  cmbRedPlayer.Text := Trim(cmbRedPlayer.Text);
  cmbBlkPlayer.Text := Trim(cmbBlkPlayer.Text);

  FCurItem  := nil;
  FCurStep  := -1;
  FFileNum  := 0;
  FOpenFile := (cmbRedPlayer.Text <> '') or
               (cmbBlkPlayer.Text <> '') or
               (chkResultA.Checked or chkResultB.Checked or
                     chkResultC.Checked or chkResultD.Checked) or
               chkSearchQzXY.Checked;
  FOpenTree := chkSearchQzXY.Checked and (not chkOnlyInitPos.Checked);
  FSearching := True;
  try
    Screen.Cursor := crHourglass;
    btnStartSearch.Enabled := False;
    btnNewSearch.Visible   := False;
    btnBrowse.Visible      := False;
    aniSearch.Visible      := True;
    aniSearch.Active       := True;
    lblResultCount.Caption := '正在查找...';
    lblResultCount.Refresh;
    lblFileCount.Caption   := '0';
    lblFileCount.Visible   := True;
    lblFileCount.Refresh;

    if chkResultSearch.Checked then
    begin
      GetFileListFromResult;
      {
      FFileList.Clear;
      for i:=0 to lvwResult.Items.Count - 1 do
      begin
        FFileList.Add(lvwResult.Items[i].SubItems[0] + '\' +
                      lvwResult.Items[i].Caption + '.XQF');
      end;
      }
    end;

    if not chkAppend.Checked then
    begin
      lvwResult.Items.Clear;
      lvwResult.Refresh;
    end;

    if chkResultSearch.Checked then
    begin
      ReSearch;
    end
    else
    begin
      DirStr := Trim(edtDir.Text);
      DirLen := Length(DirStr);
      if DirLen < 1 then
      begin
        Exit;
      end;
      if (DirStr[DirLen] = '\') then SetLength(DirStr, DirLen-1);
      AddFileNames(DirStr);
    end;
  finally
    aniSearch.Active       := False;
    aniSearch.Visible      := False;
    btnStartSearch.Enabled := True;
    btnNewSearch.Visible   := True;
    btnBrowse.Visible      := True;
    lblFileCount.Visible   := False;
    lblResultCount.Caption := IntToStr(lvwResult.Items.Count);
    Screen.Cursor := crDefault;
    Self.Caption := '查找浏览XQF文件 - ' + DirStr;
    chkDisplayQizi.Checked := False;
    FSearching := False;
  end;
end;

procedure TfrmXQSearch.lvwResultDblClick(Sender: TObject);
var
  AFileName: String;
begin
  if (lvwResult.ItemFocused = nil) then Exit;
  AFileName := lvwResult.ItemFocused.SubItems[0] + '\' +
               lvwResult.ItemFocused.Caption + '.XQF';
  frmMain.OpenXQF(AFileName);
end;

procedure TfrmXQSearch.btnNewSearchClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  FBrowseResultDir  := '';
  edtFileName.Text  := '';
  cmbRedPlayer.Text := '';
  cmbBlkPlayer.Text := '';
  chkResultA.Checked:= False;
  chkResultB.Checked:= False;
  chkResultC.Checked:= False;
  chkResultD.Checked:= False;
  chkSearchQzXY.Checked  := False;
  chkOnlyInitPos.Checked := False;
  chkOnlyInitPos.Enabled := False;
  chkSearchVar.Checked   := False;
  chkSearchVar.Enabled   := False;
  chkQzNumOnly.Checked   := False;
  chkQzNumOnly.Enabled   := False;
  chkIgnoreYz.Checked    := False;
  chkIgnoreYz.Enabled    := False;
  chkResultSearch.Checked:= False;
  lvwResult.Items.Clear;
  lblResultCount.Caption := IntToStr(lvwResult.Items.Count);
  Screen.Cursor := crDefault;  
end;

procedure TfrmXQSearch.lvwResultChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  AStepNo : Integer;
begin
  lblResultCount.Caption := IntToStr(lvwResult.Items.Count);
  lblResultCount.Refresh;
  if FSearching then Exit;
  AStepNo := StrToIntDef(edtStepNo.Text, -1);
  if ((FCurItem=lvwResult.ItemFocused) and (FCurStep=AStepNo)) then Exit;
  OpenFocused;
end;

procedure TfrmXQSearch.lvwResultClick(Sender: TObject);
begin
  OpenFocused;
end;

function TfrmXQSearch.OpenXQF(AName: String): Boolean;
var
  AStepNum: Integer;
  AStepNo : Integer;
  APNode  : dTXQPlayNode;
begin
  Result        := False;
  FXqfEnd       := False;
  FXqTree.Free;
  FXqTree       := nil;
  FXqTree       := dTXQPlayNode.Create(0,'========= ',0,0,FXqfQzXY,
                                     nil,nil,nil,nil);
  if (FXqTree = nil) then Exit;

  FXqFile.Free;
  FXqFile := nil;
  FXqFile := dTXQFILE.Create(AName, FXqTree);
  if (FXqFile = nil) then
  begin
    FXqTree.Free;
    Exit;
  end;

  AStepNo := 0;

  case FXqFile.iLoadXQFile of           // 读入XQF文件
    0:
      begin
        AStepNum := StrToIntDef(edtStepNo.Text, 0);
        if (AStepNum < 0) then AStepNum := 0;
        if (AStepNum = 0) then
        begin
          QiziXY := FXqTree.QiziXY;
        end
        else
        begin
          APNode  := FXqTree;
          while (APNode.LChild <> nil) do
          begin
            Inc(AStepNo);
            APNode := APNode.LChild;
            if (AStepNo = AStepNum) then break;
          end;
          QiziXY := APNode.QiziXY;
          if (APNode.LChild = nil) then FXqfEnd := True;
        end;

        // 显示棋子位置
        //frmXQWizard.QiziXYtoImage(QiziXY, imgXQBoard);
        dRefreshQiziXY(QiziXY);
        dRefreshXqfInfo;
      end;
  end;

  lblXqfEndHint.Visible := FXqfEnd;
  updStepNo.Max         := 999;
  if FXqfEnd then
  begin
    lblXqfEndHint.Caption := Format('终局!(本盘共%d步)',  [AStepNo]);
    updStepNo.Max         := AStepNo;
  end;

  FXqFile.Free;  FXqFile := nil;
  FXqTree.Free;  FXqTree := nil;

  Result := True;
end;

procedure TfrmXQSearch.edtStepNoChange(Sender: TObject);
var
  AStepNo: Integer;
begin
  AStepNo := StrToIntDef(edtStepNo.Text, 0);
  if (AStepNo <> edtStepNo.Tag) then
  begin
    if (lvwResult.ItemFocused <> nil) then
    begin
      lvwResultClick(lvwResult);
    end;
  end;

  edtStepNo.Tag := AStepNo;
  if ((edtStepNo.Tag = 0) and (edtStepNo.Text <> '0')) then
  begin
    edtStepNo.Text := '0';
  end;
end;

procedure TfrmXQSearch.FormResize(Sender: TObject);
begin
  Self.Left := 0;  Self.Top := 0;
end;

procedure TfrmXQSearch.dRefreshXqfInfo;
var
  s: string;
  iWhoPlay        : Integer;                  // 谁先行
                                              // 0-红先, 1-黑先
  iResult         : Integer;                  // 比赛结果
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
begin
  if ((FCurItem <> nil) and (FCurItem = lvwResult.ItemFocused)) then Exit;
  FCurStep   := StrToIntDef(edtStepNo.Text, -1);
  FCurItem   := lvwResult.ItemFocused;

  chkDisplayQizi.Checked := False;
  iWhoPlay   := FXqFile.XQFHead.WhoPlay;
  iResult    := FXqFile.XQFHead.PlayResult;
  sTitle     := FXqFile.XQFHead.TitleA;
  sMatchName := FXqFile.XQFHead.MatchName;
  sMatchTime := FXqFile.XQFHead.MatchTime;
  sMatchAddr := FXqFile.XQFHead.MatchAddr;
  sRedPlayer := FXqFile.XQFHead.RedPlayer;
  sBlkPlayer := FXqFile.XQFHead.BlkPlayer;
  sTimeRule  := FXqFile.XQFHead.TimeRule;
  sRedTime   := FXqFile.XQFHead.RedTime;
  sBlkTime   := FXqFile.XQFHead.BlkTime;
  sRMKWriter := FXqFile.XQFHead.RMKWriter;
  sAuthor    := FXqFile.XQFHead.Author;

  lblTitle.Caption   := FXqFile.XQFHead.TitleA;

  lblRedName.Visible := False;
  lblBlkName.Visible := False;

  case FXqFile.XQFHead.CodeA of
    0:  // 全局
      begin
        s:='';
        if ((sRedPlayer<>'')and(sBlkPlayer<>'')) then
        begin
          s:={'(红方) '+}sRedPlayer;
          case iResult of
            0: begin s:=s+' 对 '; end;
            1: s:=s+' (红先胜) ';
            2: s:=s+' (红先负) ';
            3: s:=s+' (红先和) ';
          end;
          s:=s+{'(黑方) '+}sBlkPlayer;
        end;

        lblPlayer.Caption  :=s;

        if (sRedPlayer<>'') then
        begin
          lblRedName.Visible := True;
          lblRedName.Caption := sRedPlayer;
        end;
        if (sBlkPlayer<>'') then
        begin
          lblBlkName.Visible := True;
          lblBlkName.Caption := sBlkPlayer;
        end;

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
          s:={'(红方) '+}sRedPlayer;
          case iResult of
            0: begin s:=s+' 对 '; end;
            1: s:=s+' (胜) ';
            2: s:=s+' (负) ';
            3: s:=s+' (和) ';
          end;
          s:=s+{'(黑方) '+}sBlkPlayer;
        end;

        lblPlayer.Caption  :=s;

        if (sRedPlayer<>'') then
        begin
          lblRedName.Visible := True;
          lblRedName.Caption := sRedPlayer;
        end;
        if (sBlkPlayer<>'') then
        begin
          lblBlkName.Visible := True;
          lblBlkName.Caption := sBlkPlayer;
        end;

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
    lblPlayer.Caption := 'Welcome to use XQStudio';
  end;
end;

procedure TfrmXQSearch.dRefreshQiziXY(AQzXY: dTXQZXY);
var
  i,xy, x, y: Integer;
begin
  // 全部的棋子不在盘上
  for i:=1 to 32 do
  begin
    if (AQzXY[i] = $FF) then
    begin
      imgQizi[i].Left    := pntQizi[i].X;
      imgQizi[i].Top     := pntQizi[i].Y;
      imgQizi[i].Visible := chkDisplayQizi.Checked;
      Continue;
    end;
    xy := AQzXY[i];
    x  := xy div 10;
    y  := xy mod 10;
    imgQizi[i].Left := QiziXYRect[x, y].Left;
    imgQizi[i].Top  := QiziXYRect[x, y].Top;
    imgQizi[i].Visible := True;
    imgQizi[i].Tag  := i;
    FCurQzXY := AQzXY;
  end;
end;

procedure TfrmXQSearch.rbtFindBrowClick(Sender: TObject);
begin
  lblSelectDriver.Visible := rbtBrowFile.Checked;
  dcbDriver.Visible       := lblSelectDriver.Visible;
  dlbDirTree.Visible      := lblSelectDriver.Visible;
  chkSubDir.Checked       := not rbtBrowFile.Checked;
  if rbtBrowFile.Checked and (FBrowseResultDir <> dlbDirTree.Directory) then
  begin
    dlbDirTree.Refresh;
    dlbDirTreeChange(dlbDirTree);    
  end;
end;

procedure TfrmXQSearch.dcbDriverChange(Sender: TObject);
var
  AOldDrive : Char;
begin
  if (FCurDrive = dcbDriver.Drive) then Exit;
  AOldDrive := FCurDrive;
  try
    dlbDirTree.Drive := dcbDriver.Drive;
  except
    dcbDriver.Drive := AOldDrive;
  end;
  FCurDrive := dcbDriver.Drive;
end;

procedure TfrmXQSearch.dlbDirTreeChange(Sender: TObject);
begin
  chkAppend.Checked       := False;
  chkResultSearch.Checked := False;
  edtDir.Text := dlbDirTree.Directory;
  if FSearchEnabled then
  begin
    btnNewSearchClick(btnNewSearch);
    btnStartSearchClick(btnStartSearch);
    FBrowseResultDir := edtDir.Text;
  end;
end;

function TFrmXQSearch.IsXqfMatched(AName: String): Boolean;
var
  AStepNo : Integer;
begin
  if (not FOpenFile) then
  begin
    Result := True;
    Exit;
  end;

  Result := False;

  FXqTree.Free;
  FXqTree       := nil;
  FXqTree       := dTXQPlayNode.Create(0,'========= ',0,0,FXqfQzXY,
                                     nil,nil,nil,nil);
  if (FXqTree = nil) then Exit;

  FXqFile.Free;
  FXqFile := nil;
  FXqFile := dTXQFILE.Create(AName, FXqTree);
  if (FXqFile = nil) then
  begin
    FXqTree.Free;
    Exit;
  end;

  Result := False;
  if (FXqFile.iLoadXQFile(not FOpenTree)=0) then
  repeat
    if (cmbRedPlayer.Text <> '') then // 红方条件
    begin
      if (Pos(cmbRedPlayer.Text, FXqFile.XQFHead.RedPlayer) < 1) then break;
    end;
    if (cmbBlkPlayer.Text <> '') then // 黑方条件
    begin
      if (Pos(cmbBlkPlayer.Text, FXqFile.XQFHead.BlkPlayer) < 1) then break;
    end;
    // 结果条件
    if (chkResultA.Checked or chkResultB.Checked or
        chkResultC.Checked or chkResultD.Checked) then
    begin
      if ((not chkResultA.Checked)and(FXqFile.XQFHead.PlayResult=1)) or
         ((not chkResultB.Checked)and(FXqFile.XQFHead.PlayResult=2)) or
         ((not chkResultC.Checked)and(FXqFile.XQFHead.PlayResult=3)) or
         ((not chkResultD.Checked)and(FXqFile.XQFHead.PlayResult=0)) then
      begin
        break;
      end;
    end;

    // 搜索局面
    if chkSearchQzXY.Checked then
    begin
      dSetSearchQzXYParam(FCurQzXY);
      if chkOnlyInitPos.Checked then    // 只在初始局面查
      begin
        if not IsQzXYSame(FCurQzXY, FXqTree.QiziXY, chkQzNumOnly.Checked, chkIgnoreYz.Checked) then break;
      end
      else                              // 深入棋局内部查
      begin
        AStepNo := GetQzXYStepNo(FXqTree, FCurQzXY);
        if AStepNo < 0 then break;
      end;
    end;
    Result := True;
  until True;
  FXqFile.Free;  FXqFile := nil;
  FXqTree.Free;  FXqTree := nil;
end;


procedure TfrmXQSearch.chkSearchQzXYClick(Sender: TObject);
begin
  chkOnlyInitPos.Enabled := chkSearchQzXY.Checked;
  chkSearchVar.Enabled   := chkSearchQzXY.Checked;
  chkQzNumOnly.Enabled   := chkSearchQzXY.Checked;
  chkIgnoreYz.Enabled    := chkSearchQzXY.Checked;
  if not chkSearchQzXY.Checked then
  begin
    chkOnlyInitPos.Checked := False;
    chkSearchVar.Checked   := False;
    chkQzNumOnly.Enabled   := False;
    chkIgnoreYz.Enabled    := False;
  end;
end;

function TFrmXQSearch.GetQzXYStepNo(ATree: dTXQPlayNode;
                                    var AQzXY: dTXQZXY): Integer;
begin
  Result := -1;
  if (ATree = nil) then Exit;
  if IsQzXYSame(AQzXY, ATree.QiziXY, chkQzNumOnly.Checked, chkIgnoreYz.Checked) then
  begin
    Result    := ATree.StepNo;
    
    Exit;
  end;

  Result := GetQzXYStepNo(ATree.LChild, AQzXY);
  if (Result >= 0) then Exit;

  if chkSearchVar.Checked then
  begin
    Result := GetQzXYStepNo(ATree.RChild, AQzXY);
    if (Result >=0 ) then Exit;
  end;

  Result := -1;
end;

procedure TfrmXQSearch.ppmBoardPopup(Sender: TObject);
begin
  // 判断是否是文本，以决定是否允许粘贴
  ppmPastePosition.Enabled := Clipboard.HasFormat(CF_TEXT);
end;

procedure TfrmXQSearch.ppmPastePositionClick(Sender: TObject);
begin
  frmXQWizard.ppmPastePositionClick(frmXQWizard.ppmPastePosition);
  if not frmXQWizard.IsPasteQituOk then Exit;
  chkDisplayQizi.Checked := True;
  dRefreshQiziXY(frmXQWizard.QiziXY)
end;

procedure TfrmXQSearch.ppmSaveAsBmpClick(Sender: TObject);
begin
  frmXQWizard.QiziXY := FCurQzXY;
  frmXQWizard.dRefreshQiziPosition;
  frmXQWizard.ppmSaveAsBmpClick(frmXQWizard.ppmSaveAsBmp);
end;

procedure TfrmXQSearch.ppmCopyClick(Sender: TObject);
begin
  frmXQWizard.QiziXY := FCurQzXY;
  frmXQWizard.dRefreshQiziPosition;
  frmXQWizard.ppmCopyClick(frmXQWizard.ppmCopy);
end;

procedure TfrmXQSearch.imgXQBoardDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  iLeft, iTop: Integer;
begin
  with Sender as TImage do
  begin
    iLeft := Left;
    iTop  := Top;
  end;
  imgQZMove.Left := X + iLeft - 9;
  imgQZMove.Top  := Y + iTop  - 9;
end;

procedure TfrmXQSearch.QiziEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
  iIdx, Cx, Cy: Integer;
function isPointInQiziXY(var Px, Py: Integer): Boolean;
var
  i, j: Integer;
begin
  for i:=0 to 8 do for j:=0 to 9 do
  begin
    with QiziXYRect[i,j] do
    begin
      if ((Px>Left) and (Px<Right) and (Py>Top) and (Py<Bottom)) then
      begin
        isPointInQiziXY := True;
        Px := i;  Py := j;
        Exit;
      end;
    end;
  end;
  isPointInQiziXY := False;
end;

function iQiziIdxAtXY(XYx, XYy: Integer): Integer;
var
  i: Integer;
begin
  for i:=1 to 32 do if (FCurQzXY[i]=(XYx*10+XYy)) then
  begin
    iQiziIdxAtXY := i;
    Exit;
  end;
  iQiziIdxAtXY := 0;
end;
begin
  imgQZMove.Visible := False;
  with Sender as TImage do
  begin
    Visible := True;
    Cx   := imgQZMove.Left + (Width  div 2);
    Cy   := imgQZMove.Top  + (Height div 2);
    if not isPointInQiziXY(Cx, Cy) then
    begin
      //if ((Tag=05) or (Tag=21)) then Exit;      // 帅、将不可以移出宫外
      if (Cx > (imgXQBoard.Left + imgXQBoard.Width - 6)) or
         (Cx < (imgXQBoard.Left + 6)) or
         (Cy > (imgXQBoard.Top  + imgXQBoard.Height - 32)) or
         (Cy < (imgXQBoard.Top  + 32)) then
      begin
        chkDisplayQizi.Checked := True;
        FCurQzXY[Tag] := $FF;
        Left := pntQizi[tag].X;
        Top  := pntQizi[tag].Y;
      end;
      Exit;
    end;
    iIdx := iQiziIdxAtXY(Cx, Cy);
    if (iIdx>0) then
    begin
      if (((Tag<17)and(iIdx>16))or((Tag>16)and(iIdx<17))) then
      begin
        FCurQzXY[iIdx]    := $FF;
        imgQizi[iIdx].Left:= pntQizi[iIdx].X;
        imgQizi[iIdx].Top := pntQizi[iIdx].Y;
        imgQizi[iIdx].Visible := chkDisplayQizi.Checked;
      end
      else
      begin
        Exit;
      end;
    end;
    if not isQiziCanAtXY(tag, Cx, Cy) then Exit;
    FCurQzXY[Tag] := Cx*10 + Cy;
    Left := QiziXYRect[Cx, Cy].Left;
    Top  := QiziXYRect[Cx, Cy].Top;
  end;;
end;

procedure TfrmXQSearch.QiziStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  with Sender as TImage do
  begin
    StartMoveLeft     := Left;
    StartMoveTop      := Top;
    Visible           := False;
    imgQZMove.Picture := Picture;
    imgQZMove.Left    := Left;
    imgQZMove.Top     := Top;
    imgQZMove.Visible := True;
  end;
end;

procedure TfrmXQSearch.chkDisplayQiziClick(Sender: TObject);
var
  ABool: Boolean;
  i    : Integer;
begin
  ABool := not chkDisplayQizi.Checked;
  bvlStepInfo.Visible   := ABool;
  lblStepNo.Visible     := ABool;
  edtStepNo.Visible     := ABool;
  updStepNo.Visible     := ABool;
  lblStepInfo.Visible   := ABool;
  if chkDisplayQizi.Checked then
  begin
    lblBlkName.Visible    := False;
    lblRedName.Visible    := False;
    lblXqfEndHint.Visible := False;
    lblTitle.Caption      := '拖拽棋子摆放不同的局面';
    lblPlayer.Caption     := '不用的棋子可拖拽到棋盘下方空的地方';
    lblTimeAddr.Caption   := '棋盘上单击右键可弹出选单';
  end
  else
  begin
    lblTitle.Caption      := '';
    lblPlayer.Caption     := '没有指定XQF文件';
    lblTimeAddr.Caption   := '';
  end;

  for i:=1 to 32 do
  begin
    if (FCurQzXY[i] = $FF) then
    begin
      imgQizi[i].Visible := chkDisplayQizi.Checked;
    end;
  end;
end;

procedure TfrmXQSearch.ppm32QiziClick(Sender: TObject);
begin
  chkDisplayQizi.Checked := True;
  dRefreshQiziXY(dCXqzXY);
end;

procedure TfrmXQSearch.ppm1MaClick(Sender: TObject);
begin
  chkDisplayQizi.Checked := True;
  FCurQzXY := dCXqzXY;
  FCurQzXY[2] := $FF;
  dRefreshQiziXY(FCurQzXY);
end;

procedure TfrmXQSearch.ppm2MaClick(Sender: TObject);
begin
  chkDisplayQizi.Checked := True;
  FCurQzXY := dCXqzXY;
  FCurQzXY[2] := $FF;
  FCurQzXY[8] := $FF;
  dRefreshQiziXY(FCurQzXY);
end;

function TFrmXQSearch.OpenFocused: Boolean;
var
  AFileName: String;
begin
  Result := False;
  if (lvwResult.ItemFocused = nil) then Exit;
  AFileName := lvwResult.ItemFocused.SubItems[0] + '\' +
               lvwResult.ItemFocused.Caption + '.XQF';
  Result := Self.OpenXQF(AFileName);
end;

procedure TfrmXQSearch.chkResultSearchClick(Sender: TObject);
begin
  if chkResultSearch.Checked then chkAppend.Checked := False;
end;


function TFrmXQSearch.getDestDir: String;
var
  DirStr: string;
  DirLen: integer;
begin
  DirStr := '';
  if SelectDirectory('请选择目标文件夹', '', DirStr) then
  begin
    DirLen := Length(DirStr);  if DirLen < 1 then Exit;
    if (DirStr[DirLen] = '\') then SetLength(DirStr, DirLen-1);
  end;
  Result := DirStr;
end;

function TFrmXQSearch.getCopyMoveAnswer(AHint, ADir: String): Boolean;
begin
  Result :=
    (Application.MessageBox(PChar(
      '确实把指定的文件'+AHint+'到文件夹“'+ADir+'”中吗？') ,
      PChar(AHint+'指定的文件?'),
      MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON1) = IDOK);
end;

function TFrmXQSearch.getReplaceAnswer(AFile: String): Integer;
begin
  Result := Application.MessageBox(PChar(
             '文件“'+AFile+'”已经存在于'+
             '指定的文件夹中，是否替换该文件？'),
             '替换文件吗？',
             MB_YESNOCANCEL + MB_ICONQUESTION);
end;

procedure TfrmXQSearch.ppmCopyAllClick(Sender: TObject);
var
  DirStr: string;
begin
  DirStr := getDestDir; if (DirStr='') then Exit;
  if not getCopyMoveAnswer('复制', DirStr) then Exit;
  copyFileList(DirStr);
end;

procedure TfrmXQSearch.ppmCopySelectedClick(Sender: TObject);
var
  DirStr: string;
begin
  DirStr := getDestDir; if (DirStr='') then Exit;
  if not getCopyMoveAnswer('复制', DirStr) then Exit;
  copyFileList(DirStr, True);
end;

procedure TfrmXQSearch.ppmMoveAllClick(Sender: TObject);
var
  DirStr: string;
begin
  DirStr := getDestDir; if (DirStr='') then Exit;
  if not getCopyMoveAnswer('移动', DirStr) then Exit;
  copyFileList(DirStr, False, True);
end;

procedure TfrmXQSearch.ppmMoveSelectedClick(Sender: TObject);
var
  DirStr: string;
begin
  DirStr := getDestDir; if (DirStr='') then Exit;
  if not getCopyMoveAnswer('移动', DirStr) then Exit;
  copyFileList(DirStr, True, True);
end;

end.
