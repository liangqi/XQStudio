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

unit XQFileP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Grids;

type
  TfrmXQFileP = class(TForm)
    pgcFileP: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    btnOk: TButton;
    btnCancel: TButton;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    bvlLine1: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Label16: TLabel;
    Bevel3: TBevel;
    edtTitle: TEdit;
    Label26: TLabel;
    Memo2: TMemo;
    Bevel5: TBevel;
    Bevel4: TBevel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    StringGrid2: TStringGrid;
    Edit9: TEdit;
    ListBox1: TListBox;
    ComboBox1: TComboBox;
    Edit10: TEdit;
    Label24: TLabel;
    edtRMKWriter: TEdit;
    Label25: TLabel;
    edtAuthor: TEdit;
    pnlStep13: TPanel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label39: TLabel;
    lblResult: TLabel;
    rbtResult0: TRadioButton;
    rbtResult1: TRadioButton;
    rbtResult2: TRadioButton;
    rbtResult3: TRadioButton;
    edtBlkPlayer: TEdit;
    Label40: TLabel;
    edtRedPlayer: TEdit;
    edtMatchTime: TEdit;
    Label23: TLabel;
    edtMatchAddr: TEdit;
    edtMatchName: TEdit;
    Bevel6: TBevel;
    lblType: TLabel;
    Label17: TLabel;
    edtTimeRule: TEdit;
    Label19: TLabel;
    edtRedTime: TEdit;
    Label20: TLabel;
    edtBlkTime: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FilePInfoChange(Sender: TObject);
  private
    { Private declarations }
  public
    isUpdate : Boolean;
    { Public declarations }
  end;

var
  frmXQFileP: TfrmXQFileP;

implementation

{$R *.DFM}

procedure TfrmXQFileP.FormCreate(Sender: TObject);
begin
  isUpdate := False;
end;

procedure TfrmXQFileP.FilePInfoChange(Sender: TObject);
begin
  isUpdate := True;
end;

end.
