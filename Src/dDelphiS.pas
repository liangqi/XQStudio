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


unit dDelphiS;

interface
uses
  Windows, Registry, Classes;

type
  dTBYTE        = Byte;
  dTWORD        = Word;
  dTDWORD       = LongWord;
  dTINT8        = ShortInt;
  dTINT16       = SmallInt;
  dTINT32       = LongInt;
  dTINT64       = Int64;
  dTBOOLEAN     = Boolean;

var
  FWinReg       : TRegistry;
  FWinRegRoot   : string;
  FWinRegOk     : Boolean = False;
  procedure InitializeReg;
  function  ReadRegStr(SubKey, ItemName, Default: string): string;
  function  WriteRegStr(SubKey, ItemName, Value: string): boolean;
  procedure FinalizeReg;


implementation

// Recent File List

procedure InitializeReg;
begin
  FWinReg := nil;
  FWinReg := TRegistry.Create;
  FWinReg.RootKey := {HKEY_LOCAL_MACHINE} HKEY_CURRENT_USER;
  FWinRegRoot := 'Software\Qipaile.Net\XQStudio\1.6';

  if (not FWinReg.KeyExists(FWinRegRoot)) then
  begin
    FWinReg.CreateKey(FWinRegRoot);
  end;
  FWinRegOk := true;
end;

function WriteRegStr(SubKey,ItemName,Value:string): boolean;
var
  KeyStr: String;
begin
  Result := false;
  if (not FWinRegOk) then InitializeReg;
  if (not FWinRegOk) then Exit;
  if (FWinReg = nil) then Exit;

  KeyStr := FWinRegRoot;
  if (SubKey <> '') then KeyStr := KeyStr + '\' + SubKey;

  if not FWinReg.OpenKey(KeyStr, True) then Exit;
  try
    FWinReg.WriteString(ItemName, Value);
    FWinReg.CloseKey;
  except
    Exit;
  end;

  Result := true;
end;

function ReadRegStr(SubKey,ItemName,Default:string):string;
var
  KeyStr: String;
begin
  Result := Default;

  if (not FWinRegOk) then InitializeReg;
  if (not FWinRegOk) then Exit;
  if (FWinReg = nil) then Exit;

  KeyStr := FWinRegRoot;
  if (SubKey <> '') then KeyStr := KeyStr + '\' + SubKey;

  if not FWinReg.OpenKey(KeyStr, True) then Exit;
  try
    Result := FWinReg.ReadString(ItemName);
  except
    Result := Default;
  end;

  if Result = '' then Result := Default;

  FWinReg.CloseKey;
end;

procedure FinalizeReg;
begin
  if (not FWinRegOk) then Exit;
  FWinReg.CloseKey;
  FWinReg.Free;
  FWinReg   := nil;
  FWinRegOk := False;
end;

end.

