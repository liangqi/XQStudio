///////////////////////////////////////////////////////////////////////////////
//
// XQStduio Source Code (http://www.qipaile.net/xqstudio)
//
// Copyright (c) 1998-2008, DONG Shiwei 
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

program XQStudio;
{$M 262144,1048576}
uses
  Forms,
  Windows,
  XQMultiInst in 'XQMultiInst.pas',
  XQMain in 'XQMain.pas' {frmMain},
  XQTable in 'XQTable.pas' {frmXQTable},
  XQAbout in 'XQAbout.pas' {frmXQAbout},
  XQSystem in 'XQSystem.pas',
  XQFileP in 'XQFileP.pas' {frmXQFileP},
  XQFileRW in 'XQFileRW.pas',
  dDelphiS in 'dDelphiS.pas',
  XQPNode in 'XQPNode.pas',
  XQDataT in 'XQDataT.pas',
  XQRecLBX in 'XQRecLBX.pas',
  XQVarLBX in 'XQVarLBX.pas',
  XQReadme in 'XQReadme.pas' {frmXQReadme},
  XQWizard in 'XQWizard.pas' {frmXQWizard},
  XQSearch in 'XQSearch.pas' {frmXQSearch},
  XQTipsDlg in 'XQTipsDlg.pas' {frmXQTipsDlg};

{$R *.RES}

begin
{
  if (GlobalFindAtom('XQStudio is writen by Mr. Dong Shiwei.')=0) then
  begin
    GlobalAddAtom('XQStudio is writen by Mr. Dong Shiwei.');
  end
  else
  begin
    Application.Terminate;
  end;
}
  Application.Initialize;
  Application.Title := 'XQStudio 1.63';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmXQAbout, frmXQAbout);
  Application.CreateForm(TfrmXQWizard, frmXQWizard);
  Application.CreateForm(TfrmXQTipsDlg, frmXQTipsDlg);
  Application.Run;
end.
