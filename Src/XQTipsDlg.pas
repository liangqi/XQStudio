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

unit XQTipsDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, dDelphiS;

type
  TfrmXQTipsDlg = class(TForm)
    pnlTip: TPanel;
    pnlTipIcon: TPanel;
    pnlTipShow: TPanel;
    pnlTipDYK: TPanel;
    bvlLine: TBevel;
    pnlTipMemo: TPanel;
    memTip: TMemo;
    chkTipShow: TCheckBox;
    btnClose: TButton;
    btnLastTip: TButton;
    btnNextTip: TButton;
    imgTipIcon: TImage;
    memTips: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNextTipClick(Sender: TObject);
    procedure btnLastTipClick(Sender: TObject);
  private
    { Private declarations }
  protected
    iCurrentTipCount    : integer;
    isTipShow           : boolean;
  public
    procedure ShowTips;
  end;

var
  frmXQTipsDlg: TfrmXQTipsDlg;

implementation

{$R *.DFM}

procedure TfrmXQTipsDlg.ShowTips;
var
  iMaxTipCount : integer;
begin
  if (memTips.Lines.Count < 1) then
  begin
    Exit;
  end;

  iMaxTipCount := memTips.Lines.Count - 1;

  if not (iCurrentTipCount in [0..iMaxTipCount]) then
  begin
    iCurrentTipCount := 0;
  end;

  memTip.Clear;
  memTip.Lines.Add(memTips.Lines[iCurrentTipCount]);

  btnLastTip.Enabled := (iCurrentTipCount <> 0);
  btnNextTip.Enabled := (iCurrentTipCount <> iMaxTipCount);
end;

procedure TfrmXQTipsDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Inc(iCurrentTipCount);
  WriteRegStr('Help', 'TipsIndex', IntToStr(iCurrentTipCount));
  if isTipShow <> chkTipShow.Checked then
  begin
    case chkTipShow.Checked of
      True : WriteRegStr('Help', 'ShowTips', 'Yes');
      False: WriteRegStr('Help', 'ShowTips', 'No' );
    end;
  end;
end;

procedure TfrmXQTipsDlg.FormCreate(Sender: TObject);
var
  s: String;
begin
  s := memTips.Lines[0];
  memTip.Text := s;
  memTip.Clear;

  iCurrentTipCount := StrToInt(ReadRegStr('Help','TipsIndex','0'));

  isTipShow := (ReadRegStr('Help', 'ShowTips', 'Yes')='Yes');

  chkTipShow.Checked := isTipShow;
end;

procedure TfrmXQTipsDlg.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmXQTipsDlg.FormShow(Sender: TObject);
begin
  ShowTips;
  btnClose.SetFocus;
end;

procedure TfrmXQTipsDlg.btnNextTipClick(Sender: TObject);
begin
  Inc(iCurrentTipCount);
  ShowTips;
end;

procedure TfrmXQTipsDlg.btnLastTipClick(Sender: TObject);
begin
  Dec(iCurrentTipCount);
  ShowTips;
end;

end.
