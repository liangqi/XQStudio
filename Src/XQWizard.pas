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

unit XQWizard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Clipbrd,
  dDelphiS, XQDataT, XQFileRW, XQSystem, Menus;

type
  TfrmXQWizard = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    btnPrior: TButton;
    btnNext: TButton;
    btnCancel: TButton;
    pgcSetup: TPageControl;
    tstStep1: TTabSheet;
    tstStep2: TTabSheet;
    pnlXQBoard: TPanel;
    imgXQBoard: TImage;
    imgQZ21: TImage;
    imgQZ22: TImage;
    imgQZ20: TImage;
    imgQZ23: TImage;
    imgQZ19: TImage;
    imgQZ24: TImage;
    imgQZ18: TImage;
    imgQZ25: TImage;
    imgQZ17: TImage;
    imgQZ27: TImage;
    imgQZ26: TImage;
    imgQZ32: TImage;
    imgQZ30: TImage;
    imgQZ29: TImage;
    imgQZ31: TImage;
    imgQZ28: TImage;
    imgQZ05: TImage;
    imgQZ06: TImage;
    imgQZ04: TImage;
    imgQZ07: TImage;
    imgQZ03: TImage;
    imgQZ08: TImage;
    imgQZ02: TImage;
    imgQZ09: TImage;
    imgQZ01: TImage;
    imgQZ11: TImage;
    imgQZ10: TImage;
    imgQZ12: TImage;
    imgQZ14: TImage;
    imgQZ13: TImage;
    imgQZ16: TImage;
    imgQZ15: TImage;
    imgQZMove: TImage;
    imgClient: TImage;
    pnlStep1: TPanel;
    pnlStep12: TPanel;
    Label6: TLabel;
    edtTitle: TEdit;
    pnlStep13: TPanel;
    pnlStep11: TPanel;
    pnlStep14: TPanel;
    RadioGroup1: TRadioGroup;
    rbtPlayType0: TRadioButton;
    rbtPlayType3: TRadioButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtMatchName: TEdit;
    edtMatchTime: TEdit;
    edtMatchAddr: TEdit;
    edtRedPlayer: TEdit;
    edtBlkPlayer: TEdit;
    Label7: TLabel;
    edtRMKWriter: TEdit;
    Label8: TLabel;
    edtAuthor: TEdit;
    btnFinish: TButton;
    pnlStep2RightMargin: TPanel;
    pnlStep2Right: TPanel;
    pnlStep21: TPanel;
    pnlStep22: TPanel;
    pnlStep23: TPanel;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    rbtWhoPlay0: TRadioButton;
    rbtWhoPlay1: TRadioButton;
    rbtRst1: TRadioButton;
    rbtRst2: TRadioButton;
    rbtRst3: TRadioButton;
    rbtRst0: TRadioButton;
    Label9: TLabel;
    Label10: TLabel;
    lblResult: TLabel;
    rbtResult0: TRadioButton;
    rbtResult1: TRadioButton;
    rbtResult2: TRadioButton;
    rbtResult3: TRadioButton;
    rbtPlayType1: TRadioButton;
    rbtPlayType2: TRadioButton;
    ppmBoard: TPopupMenu;
    ppmCopy: TMenuItem;
    ppmSaveAsBmp: TMenuItem;
    dlgSaveDialog: TSaveDialog;
    ppmLine1: TMenuItem;
    ppmPastePosition: TMenuItem;
    Label11: TLabel;
    edtTimeRule: TEdit;
    Label12: TLabel;
    edtRedTime: TEdit;
    Label13: TLabel;
    edtBlkTime: TEdit;
    N1: TMenuItem;
    ppm32Qizi: TMenuItem;
    ppm1Ma: TMenuItem;
    ppm2M: TMenuItem;
    imgQiziRed: TImage;
    procedure imgXQBoardDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure XQZStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure XQZEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure pnlXQBoardResize(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure rbtPlayTypeClick(Sender: TObject);
    procedure pnlBottomResize(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
    procedure ppmCopyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppmSaveAsBmpClick(Sender: TObject);

    procedure dSaveBoardToFile(sFilename: String);
    procedure dRefreshQiziPosition;
    procedure ppmPastePositionClick(Sender: TObject);
    procedure ppmBoardPopup(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppm32QiziClick(Sender: TObject);
    procedure ppm1MaClick(Sender: TObject);
    procedure ppm2MClick(Sender: TObject);
  private
    StartMoveLeft, StartMoveTop : dTInt32;
    QiziXYRect                  : array [0..8, 0..9] of TRect;
    pntQizi                     : array [1..32] of TPoint;
    FIsEditPosition: Boolean;      // 棋盘外的位置
  public
    imgQizi                     : array [1..32] of TImage;
    QiziXY                      : dTXQZXY;
    XQFHead                     : dTXQFHead;
    IsPasteQituOk               : Boolean;
    imgQituImage                : TImage;
    procedure QiziXYtoImage(qzXY: dTXQZXY; img: TImage);
    function  isStringListToQiziXYOK(sl:TStringList;
               var qzXY:dTXQZXY): dTBoolean;
    procedure dEditPosition;

    { Public declarations }
  end;

var
  frmXQWizard: TfrmXQWizard;

implementation

uses XQMain;

{$R *.DFM}

procedure TfrmXQWizard.imgXQBoardDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  iLeft, iTop: dTInt32;
begin
  with Sender as TImage do
  begin
    iLeft := Left;
    iTop  := Top;
  end;
  imgQZMove.Left := X + iLeft - 9;
  imgQZMove.Top  := Y + iTop  - 9;
end;

procedure TfrmXQWizard.XQZStartDrag(Sender: TObject;
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

procedure TfrmXQWizard.XQZEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
  Cx, Cy: dTInt32;
function isPointInQiziXY(var Px, Py: dTInt32): dTBoolean;
var
  i, j: dTInt32;
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

function iQiziIdxAtXY(XYx, XYy: dTInt32): dTInt32;
var
  i: dTInt32;
begin
  for i:=1 to 32 do if (QiziXY[i]=(XYx*10+XYy)) then
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
      if ((Tag=05) or (Tag=21)) then Exit;      // 帅、将不可以移出宫外 
      if (Cx > (imgXQBoard.Left + imgXQBoard.Width - 50)) then
      begin
        QiziXY[Tag] := $FF;
        Left := pntQizi[tag].X;
        Top  := pntQizi[tag].Y;
      end;
      Exit;
    end;
    if (iQiziIdxAtXY(Cx, Cy)>0) then Exit;
    if not isQiziCanAtXY(tag, Cx, Cy) then Exit;
    QiziXY[Tag] := Cx*10 + Cy;
    Left := QiziXYRect[Cx, Cy].Left;
    Top  := QiziXYRect[Cx, Cy].Top;
  end;;
end;


var
  dCQiziLT: array [1..64] of dTInt32 =
           (215,156, 239,156, 263,156, 287,180, 215,228, 287,156, 263,180,
            239,180, 215,180, 215,204, 239,204, 239,228, 263,228, 287,228,
            263,204, 287,204, 216,122, 240, 98, 264, 98, 288, 98, 216, 50,
            288,122, 264,122, 240,122, 216, 98, 240, 74, 216, 74, 263, 50,
            239, 50, 288, 50, 263, 74, 288, 74);
procedure TfrmXQWizard.FormCreate(Sender: TObject);
var
  i, j: dTInt32;
begin
  FIsEditPosition := False;
  
  // 给32个棋子图片赋值
  imgQizi[01]:=imgQZ01; imgQizi[17]:=imgQZ17;
  imgQizi[02]:=imgQZ02; imgQizi[18]:=imgQZ18;
  imgQizi[03]:=imgQZ03; imgQizi[19]:=imgQZ19;
  imgQizi[04]:=imgQZ04; imgQizi[20]:=imgQZ20;
  imgQizi[05]:=imgQZ05; imgQizi[21]:=imgQZ21;
  imgQizi[06]:=imgQZ06; imgQizi[22]:=imgQZ22;
  imgQizi[07]:=imgQZ07; imgQizi[23]:=imgQZ23;
  imgQizi[08]:=imgQZ08; imgQizi[24]:=imgQZ24;
  imgQizi[09]:=imgQZ09; imgQizi[25]:=imgQZ25;
  imgQizi[10]:=imgQZ10; imgQizi[26]:=imgQZ26;
  imgQizi[11]:=imgQZ11; imgQizi[27]:=imgQZ27;
  imgQizi[12]:=imgQZ12; imgQizi[28]:=imgQZ28;
  imgQizi[13]:=imgQZ13; imgQizi[29]:=imgQZ29;
  imgQizi[14]:=imgQZ14; imgQizi[30]:=imgQZ30;
  imgQizi[15]:=imgQZ15; imgQizi[31]:=imgQZ31;
  imgQizi[16]:=imgQZ16; imgQizi[32]:=imgQZ32;

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

  // 棋子移动的'替身'
  imgQZMove.Width:=18; imgQZMove.Height:=18; imgQZMove.Visible:=False;

  // 设置盘外棋子的静态位置
  for i:=1 to 32 do
  begin
    imgQizi[i].Width  := 18;
    imgQizi[i].Height := 18;
    imgQizi[i].Left   := dCQiziLT[(i-1)*2+1];
    imgQizi[i].Top    := dCQiziLT[(i-1)*2+2];
    pntQizi[i].X      := imgQizi[i].Left;
    pntQizi[i].Y      := imgQizi[i].Top;
  end;

  // 全部的棋子不在盘上
  for i:=1 to 32 do QiziXY[i] := $FF;

  // 将'红帅'放在盘上
  QiziXY[05]       :=40;
  imgQizi[05].Left := QiziXYRect[4,0].Left;
  imgQizi[05].Top  := QiziXYRect[4,0].Top;

  // 将'黑将'放在盘上
  QiziXY[21]       :=49;
  imgQizi[21].Left := QiziXYRect[4,9].Left;
  imgQizi[21].Top  := QiziXYRect[4,9].Top;
end;

procedure TfrmXQWizard.pnlXQBoardResize(Sender: TObject);
begin
  with Sender as TPanel do Width:=321;
end;

procedure TfrmXQWizard.btnNextClick(Sender: TObject);
begin
  tstStep1.TabVisible := False;
  tstStep2.TabVisible := True;
  btnPrior.Visible    := True;
  btnNext.Visible     := False;
  btnFinish.Enabled   := True;
end;

procedure TfrmXQWizard.btnPriorClick(Sender: TObject);
begin
  tstStep1.TabVisible := True;
  tstStep2.TabVisible := False;
  btnPrior.Visible    := False;
  btnNext.Visible     := True;
  btnFinish.Enabled   := False;
end;

procedure TfrmXQWizard.rbtPlayTypeClick(Sender: TObject);
//var
//  isResultVisible: dTBoolean;
begin
  tstStep2.TabVisible := False;
  btnPrior.Visible    := False;
  btnNext.Visible     := rbtPlayType2.Checked or rbtPlayType3.Checked;
  btnFinish.Enabled   := rbtPlayType0.Checked or rbtPlayType1.Checked;

  pnlStep13.Visible   := rbtPlayType0.Checked or rbtPlayType2.Checked;

//  isResultVisible   :=rbtPlayType0.Checked;
//  lblResult.Visible :=isResultVisible;
//  rbtResult0.Visible:=isResultVisible;
//  rbtResult1.Visible:=isResultVisible;
//  rbtResult2.Visible:=isResultVisible;
//  rbtResult3.Visible:=isResultVisible;
end;

procedure TfrmXQWizard.pnlBottomResize(Sender: TObject);
begin
  btnPrior.Left   := btnNext.Left;
  btnPrior.Top    := btnNext.Top;
  btnPrior.Width  := btnNext.Width;
  btnPrior.Height := btnNext.Height;
end;

procedure TfrmXQWizard.btnFinishClick(Sender: TObject);
begin
  with XQFHead do
  begin
    CodeA := 0;
    if rbtPlayType0.Checked then CodeA := 0;
    if rbtPlayType1.Checked then CodeA := 1;
    if rbtPlayType2.Checked then CodeA := 2;
    if rbtPlayType3.Checked then CodeA := 3;

    PlayResult := 0;
    if rbtResult0.Checked then PlayResult := 0;
    if rbtResult1.Checked then PlayResult := 1;
    if rbtResult2.Checked then PlayResult := 2;
    if rbtResult3.Checked then PlayResult := 3;

    TitleA    := edtTitle.Text;
    MatchName := edtMatchName.Text;
    MatchTime := edtMatchTime.Text;
    MatchAddr := edtMatchAddr.Text;
    RedPlayer := edtRedPlayer.Text;
    BlkPlayer := edtBlkPlayer.Text;
    RMKWriter := edtRMKWriter.Text;
    Author    := edtAuthor.Text;
  end;
end;

procedure TfrmXQWizard.dSaveBoardToFile(sFilename: String);
var
  Bitmap      : TBitMap;
  AFormat     : Word;
  AData       : THandle;
  APalette    : HPalette;
  RectS, RectD: TRect;
  i, j, x, y  : dTInt32;
  AGreen, ASilver, AOlive: TColor;
begin
  Bitmap := TBitmap.Create;
  try
    imgXQBoard.Picture.SaveToClipboardFormat(AFormat,AData,APalette);
    ClipBoard.SetAsHandle(AFormat,AData);
    Bitmap.LoadFromClipboardFormat(AFormat,AData,APalette);

    for i:=1 to 32 do
    begin
      if (QiziXY[i]>89) then Continue;
      with imgQizi[i] do
      begin
        RectD := Rect(Left, Top, Left + Width, Top + Height);
        RectS := Rect(0, 0, Width, Height);
      end;
      if (i < 17) then
      begin
        imgQiziRed.Canvas.Pen.Mode := pmCopy;
        imgQiziRed.Canvas.CopyMode := cmSrcCopy;
        imgQiziRed.Canvas.CopyRect(RectS, imgQizi[i].Canvas, RectS);
        with imgQiziRed.Canvas do
        begin
          for x:=0 to RectS.Right do for y := 0 to RectS.Bottom do
          begin
            if (Pixels[x, y] = clRed) then
            begin
              Pixels[x, y] := RGB(255,255,255); continue;
            end;
            if (Pixels[x, y] = clWhite) then
            begin
              Pixels[x, y] := RGB(0, 0, 0); continue;
            end;
          end;
          Pen.Mode := pmMask;
          Ellipse(RectS);
        end;
        Bitmap.Canvas.CopyMode := cmSrcCopy;
        Bitmap.Canvas.CopyRect(RectD, imgQiziRed.Canvas, RectS);
      end
      else
      begin
        Bitmap.Canvas.CopyMode := cmSrcCopy;
        Bitmap.Canvas.CopyRect(RectD, imgQizi[i].Canvas, RectS);
      end;
    end;

    ASilver := Bitmap.Canvas.Pixels[0,   0];
    AGreen  := Bitmap.Canvas.Pixels[15, 80];
    AOlive  := Bitmap.Canvas.Pixels[17, 28];

    for i:=0 to Bitmap.Width do for j:=0 to Bitmap.Height do
    begin
      if (Bitmap.Canvas.Pixels[i, j] = ASilver) then
      begin
        Bitmap.Canvas.Pixels[i, j] := RGB(255,255,255);  continue;
      end;
      if (Bitmap.Canvas.Pixels[i, j] = AGreen) then
      begin
        Bitmap.Canvas.Pixels[i, j] := RGB(0, 0, 0);  continue;
      end;
      if (Bitmap.Canvas.Pixels[i, j] = AOlive) then
      begin
        Bitmap.Canvas.Pixels[i, j] := RGB(0, 0, 0);  continue;
      end;
    end;

    Bitmap.PixelFormat := pf4Bit;
    Bitmap.SaveToClipBoardFormat(AFormat,AData,APalette);
    ClipBoard.SetAsHandle(AFormat,AData);
    if (Trim(sFileName)<>'') then BitMap.SaveToFile(sFileName);

    if Assigned(imgQituImage) then
    begin
      imgQituImage.Canvas.CopyRect(
          Rect(0,0,imgXQBoard.Width, imgXQBoard.Height), Bitmap.Canvas,
          Rect(0,0,imgXQBoard.Width, imgXQBoard.Height));
      imgQituImage := nil;
    end;
  finally
    Bitmap.Free;
  end;
end;

procedure TfrmXQWizard.ppmCopyClick(Sender: TObject);
begin
  dSaveBoardToFile('');
end;

procedure TfrmXQWizard.ppmSaveAsBmpClick(Sender: TObject);
var
  sFileName : String;
begin
  if dlgSaveDialog.Execute then
  begin
    sFileName := dlgSaveDialog.FileName;
    if (Pos('.', sFileName)=0) then sFileName := sFileName + '.bmp';
    if FileExists(sFileName) then
    begin
      if (Application.MessageBox('文件已经存在，要替换吗?', '保存文件',
          MB_OKCANCEL + MB_DEFBUTTON1) = IDCANCEL) then Exit;
    end;
    dSaveBoardToFile(sFileName);
  end;
end;


procedure TfrmXQWizard.FormShow(Sender: TObject);
begin
  if FIsEditPosition then
     pgcSetup.ActivePage := tstStep2
  else
     pgcSetup.ActivePage := tstStep1;
end;

procedure TfrmXQWizard.dRefreshQiziPosition;
var
  i,xy, x, y: dTInt32;

begin
  // 全部的棋子不在盘上
  for i:=1 to 32 do
  begin
    if (QiziXY[i] = $FF) then Continue;
    xy := QiziXY[i];
    x  := xy div 10;
    y  := xy mod 10;

    imgQizi[i].Left := QiziXYRect[x, y].Left;
    imgQizi[i].Top  := QiziXYRect[x, y].Top;
  end;
end;

procedure TfrmXQWizard.ppmBoardPopup(Sender: TObject);
begin
  // 判断是否是文本，以决定是否允许粘贴
  ppmPastePosition.Enabled := Clipboard.HasFormat(CF_TEXT);
end;

function TfrmXQWizard.isStringListToQiziXYOK(sl:TStringList; var qzXY:dTXQZXY): dTBoolean;
var
  i, j, k, x0, y0, iIdxBase : dTInt32;
  iIdxPos                   : array [1..5] of dTInt32;
  xy                        : dTXQZXY;
  s                         : String;
  sPiece                    : String[2];
begin
  Result := False;
  if sl.Count < 19 then Exit;

  // 寻找棋盘的左上角，x0为列数从1开始，y0为行数从0开始
  x0 := 0;  y0 := 0;
  for i:=0 to (sl.Count - 1) do
  begin
    x0 := pos('│　│　│　│＼│／│　│　│　│', sl.Strings[i]);
    if x0 > 0 then
    begin
      y0 := i - 1;
      if y0 < 0 then Exit;
      if ((y0 + 18) > sl.Count) then Exit;
      break;
    end;
  end;

  for i:=1 to 32 do xy[i] := $FF;

  for i:=0 to 9 do                      // 棋盘共有10行
  begin
    s := sl.Strings[y0 + ((9-i)*2)] + '   ';    // 取得文本列
    if ((Length(s) - x0 -1) < 34) then Exit;
    for j:=0 to 8 do                    // 棋盘共有9列
    begin
      if (j > 0) then k := -1 else k := 2;

      if (not (s[x0 + j*4 + k] in ['[', ']', '(', ')'])) then Continue;

      if ((s[x0 + j*4 + k] = '[') or (s[x0 + j*4 + k] = ']')) then
        iIdxBase := 16                  // 黑方
      else
        iIdxBase := 00;                 // 红方

      for k:=1 to 5 do iIdxPos[k] := 0;

      sPiece := '  ';
      sPiece[1] := s[x0 + j*4 + 0];
      sPiece[2] := s[x0 + j*4 + 1];

      if (sPiece = '车') then
      begin
        iIdxPos[1] := iIdxBase + 01;
        iIdxPos[2] := iIdxBase + 09;
      end;
      if (sPiece = '马') then
      begin
        iIdxPos[1] := iIdxBase + 02;
        iIdxPos[2] := iIdxBase + 08;
      end;
      if (sPiece = '相') or (sPiece = '象') then
      begin
        iIdxPos[1] := iIdxBase + 03;
        iIdxPos[2] := iIdxBase + 07;
      end;
      if (sPiece = '士') or (sPiece = '仕') then
      begin
        iIdxPos[1] := iIdxBase + 04;
        iIdxPos[2] := iIdxBase + 06;
      end;
      if (sPiece = '帅') or (sPiece = '将') then
      begin
        iIdxPos[1] := iIdxBase + 05;
      end;
      if (sPiece = '炮') then
      begin
        iIdxPos[1] := iIdxBase + 10;
        iIdxPos[2] := iIdxBase + 11;
      end;
      if (sPiece = '兵') or (sPiece = '卒') then
      begin
        iIdxPos[1] := iIdxBase + 12;
        iIdxPos[2] := iIdxBase + 13;
        iIdxPos[3] := iIdxBase + 14;
        iIdxPos[4] := iIdxBase + 15;
        iIdxPos[5] := iIdxBase + 16;
      end;

      for k:=1 to 5 do
      begin
        if iIdxPos[k] = 0 then Exit;
        if (xy[iIdxPos[k]]<>$FF) then Continue;

        if isQiziCanAtXY(iIdxPos[k], j, i) then
        begin
          xy[iIdxPos[k]] := j*10 + i;
        end;
        break;
      end;
    end;
  end;

  qzXY := xy;
  Result := True;
end;

// 根据目前的棋子位置刷新棋图
procedure TfrmXQWizard.ppmPastePositionClick(Sender: TObject);
var
  slTxt: TStringList;
begin
  slTxt := TStringList.Create;
try
  slTxt.Text := ClipBoard.AsText;

  IsPasteQituOk := True;
  if not (isStringListToQiziXYOK(slTxt, QiziXY)) then
  begin
    Application.MessageBox(
      '剪贴板中的文本不是有效的棋子位置图。'#13#10#13#10+
      '有效的位置图是由本' +
      '软件自动生成的文本大棋图(小棋图不可以)。'#13#10#13#10 +
      '请确认将正确的棋图文本选中并放入剪贴板。',
      '系统信息',
      MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      IsPasteQituOk := False;
  end;
finally
  Self.dRefreshQiziPosition;
  slTxt.Free;
end;
end;

procedure TfrmXQWizard.QiziXYtoImage(qzXY: dTXQZXY; img: TImage);
var
  Bitmap      : TBitMap;
  AFormat     : Word;
  AData       : THandle;
  APalette    : HPalette;
  RectS, RectD: TRect;
  i           : dTInt32;
begin
  QiziXY := qzXY;
  dRefreshQiziPosition;

  Bitmap := TBitmap.Create;
  try
    imgXQBoard.Picture.SaveToClipboardFormat(AFormat,AData,APalette);
    ClipBoard.SetAsHandle(AFormat,AData);
    Bitmap.LoadFromClipboardFormat(AFormat,AData,APalette);

    for i:=1 to 32 do
    begin
      if (QiziXY[i]=$FF) then Continue;
      with imgQizi[i] do
      begin
        RectD := Rect(Left, Top, Left + Width, Top + Height);
        RectS := Rect(0, 0, Width, Height);
      end;
      Bitmap.Canvas.CopyRect(RectD, imgQizi[i].Canvas, RectS);
    end;

    Bitmap.SaveToClipBoardFormat(AFormat,AData,APalette);
    ClipBoard.SetAsHandle(AFormat,AData);
    Bitmap.PixelFormat := pf4Bit;
    img.Picture.LoadFromClipboardFormat(AFormat,AData,APalette);
  finally
    Bitmap.Free;
  end;
end;

procedure TfrmXQWizard.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i:=1 to 32 do begin imgQizi[i].Free; imgQizi[i] := nil; end;
end;

procedure TfrmXQWizard.ppm32QiziClick(Sender: TObject);
begin
  QiziXY := dCXqzXY;
  dRefreshQiziPosition;
end;

procedure TfrmXQWizard.ppm1MaClick(Sender: TObject);
begin
  QiziXY    := dCXqzXY;
  QiziXY[2] := $FF;
  dRefreshQiziPosition;
end;

procedure TfrmXQWizard.ppm2MClick(Sender: TObject);
begin
  QiziXY    := dCXqzXY;
  QiziXY[8] := $FF;
  dRefreshQiziPosition;
end;

procedure TfrmXQWizard.dEditPosition;
begin
  FIsEditPosition     := True;
  tstStep1.TabVisible := False;
  tstStep2.TabVisible := True;
  btnPrior.Visible    := False;
  btnNext.Visible     := False;
  btnFinish.Enabled   := True;
  Self.Caption        := ' 修改或调整当前文件初始局面的子力位置';
end;

end.
