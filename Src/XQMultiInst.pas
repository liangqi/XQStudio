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

unit XQMultiInst;

interface

implementation

uses Forms, Windows, SysUtils, Dialogs, XQDataT;

const XQStudioAppID = 'net.qipaile.XQStudio';

var
  XQStudioMsgID: Integer;
  WProc        : TFNWndProc;
  MutexHandle  : THandle;
  XQStudioCmdID: ATOM;
  sXqfName     : string;

function NewWndProc(Handle:HWND; Msg:Integer; wParam,lParam:Longint):Longint; stdcall;
begin
  Result := 0;
  if Msg = XQStudioMsgID then
  begin
    case wParam of
      1: // QUERYWINDOWHANDLE
        begin
          if IsIconic(Application.Handle) then
          begin
            Application.MainForm.WindowState := wsNormal;
            Application.Restore;
          end;
          PostMessage(HWND(lParam), XQStudioMsgID, 2, Application.MainForm.Handle);
        end;

      2: // RESPONDWINDOWHANDLE
        begin
          SetForegroundWindow(HWND(lParam));
          sXqfName := sGetCmdLineXqfName;
          if FileExists(sXqfName) then
          begin
            XQStudioCmdID := GlobalAddAtom(PChar(sXqfName));
            PostMessage(HWND(lParam), dCWMOPENXQF, 0, Longint(XQStudioCmdID));
          end;
          Application.Terminate;
        end;
    end; // End of case
  end
  else
  begin
    Result := CallWindowProc(wProc, Handle, Msg, wParam, lParam);
  end;
end;

procedure SubClassApplication;
begin
  WProc := TFNWndProc(SetWindowLong(Application.Handle, GWL_WNDPROC,
               Longint(@NewWndProc)));
end;

procedure DoFirstInstance;
begin
    MutexHandle := CreateMutex(nil, False, XQStudioAppID);
end;

procedure BroadcastFocusMessage;
var
  BSMRecipients: DWORD;
begin
  Application.ShowMainForm := false;
  BSMRecipients := BSM_APPLICATIONS;
  BroadCastSystemMessage(BSF_IGNORECURRENTTASK or BSF_POSTMESSAGE,
      @BSMRecipients, XQStudioMsgID, 1, Application.Handle);
end;

procedure InitInstance;
begin
  SubClassApplication;  // hook application message loop
  MutexHandle := OpenMutex(MUTEX_ALL_ACCESS, False,XQStudioAppID);
  if MutexHandle = 0 then
    DoFirstInstance
  else
    BroadcastFocusMessage;
end;

initialization
  XQStudioMsgID := RegisterWindowMessage(XQStudioAppID + '.MsgID');
  InitInstance;

finalization
  if WProc <> nil then
  begin
    SetWindowLong(Application.Handle, GWL_WNDPROC, LongInt(WProc));
  end;
  if MutexHandle <> 0 then CloseHandle(MutexHandle);
end.

