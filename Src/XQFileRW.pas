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

unit XQFileRW;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, XQSystem, dDelphiS, XQDataT, XQPNode;

type
  //-----------------------------------------------------------------------
  // 象棋文件头记录的定义
  //.......................................................................
  dTXQFHead = packed record                     // 定义象棋棋谱文件头
    Signature : dTWord;                         // 文件标记 'XQ' = $5158;
    Version   : dTByte;                         // 版本号
    KeyMask   : dTByte;                         // 加密掩码
    ProductId : dTDWord;                        // 产品号(厂商的产品号)
    KeyOrA    : dTByte;
    KeyOrB    : dTByte;
    KeyOrC    : dTByte;
    KeyOrD    : dTByte;
    KeysSum   : dTByte;                         // 加密的钥匙和
    KeyXY     : dTByte;                         // 棋子布局位置钥匙       
    KeyXYf    : dTByte;                         // 棋谱起点钥匙
    KeyXYt    : dTByte;                         // 棋谱终点钥匙

    // = 16 bytes
    QiziXY    : dTXQZXY;                        // 32个棋子的原始位置
    // = 48 bytes
    PlayStepNo: dTWord;                         // 棋谱文件的开始步数
    WhoPlay   : dTByte;                         // 该谁下
    PlayResult: dTByte;                         // 最终结果
    PlayNodes : dTDWord;                        // 本棋谱一共记录了多少步
    PTreePos  : dTDWord;                        // 对弈树在文件中的起始位置
    Reserved1 : array [1..4] of dTByte;
    // = 64 bytes
    CodeA     : dTWord;                         // 对局类型(开,中,残等)
    CodeB     : dTWord;                         // 另外的类型
    CodeC     : dTWord;                         //
    CodeD     : dTWord;
    CodeE     : dTWord;
    CodeF     : dTWord;
    CodeH     : dTWord;
    CodeG     : dTWord;
    // = 80  bytes
    TitleA    : String[63];                     // 标题
    TitleB    : String[63];
    // = 208 bytes
    MatchName : String[63];                     // 比赛名称
    MatchTime : String[15];                     // 比赛时间
    MatchAddr : String[15];                     // 比赛地点
    RedPlayer : String[15];                     // 红方姓名
    BlkPlayer : String[15];                     // 黑方姓名
    // = 336 bytes
    TimeRule  : String[63];                     // 开局类型
    RedTime   : String[15];
    BlkTime   : String[15];
    Reservedh : String[31];
    // = 464 bytes
    RMKWriter : String[15];                     // 棋谱评论员
    Author    : STring[15];                     // 文件的作者
    // = 496 bytes
    Reserved2 : array [1..16] of dTByte;
    // = 512 bytes
    Reserved3 : array [1..512] of dTByte;
  end;

  //-----------------------------------------------------------------------
  // 象棋文件对弈记录的定义
  //.......................................................................
  dTXQFPlayNode = packed record
    XYf, XYt, ChildTag, Reserved: dTByte;
    RemarkSize: dTDWord;
  end;

  //-----------------------------------------------------------------------
  // 象棋文件类
  //.......................................................................
  dTXQFile = class
  public
    Name        : String;                       // 文件名
    XQPlayTree  : dTXQPlayNode;                 // 象棋对局树
    XQFHead     : dTXQFHead;                    // 象棋文件头

    isDisableRmk: dTBoolean;
    isReverseH  : dTBoolean;

    KeyXY       : dTByte;                       // 棋子32个位置加密因子
    KeyXYf      : dTByte;                       // 棋谱加密因子(起点)
    KeyXYt      : dTByte;                       // 棋谱加密因子(终点)
    KeyRMKSize  : dTWord;                       // 注解大小加密因子

    function  iLoadXQFile(OnlyHead:Boolean=False): dTINT32;    // 读入XQF
    procedure dSetRandomSecurityKeys;           // 设置随机的加密因子
    procedure dCalculateSecurityKeys;           // 计算真正的加密密码
    function  isKeysSumZero: dTBoolean;         // 检查密码的校验和为零否?
    function  iSaveXQFile: dTINT32;             // 保存XQF

    // 构造函数
    constructor Create(sName:String; XQPTree: dTXQPlayNode);
  end;

  dTXqfStream = class (TFileStream)
  private
    FKeyBytes: array [1..4] of Byte;
    F32Keys  : array [1..32] of Byte;
    FBuf1024 : packed array [0..1023 + 16] of Byte;
  public
    procedure SetKeyBytes(B1, B2, B3, B4: Byte);
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;



   procedure dAddXqfToPlayTree(ATree: dTXQPlayNode; AXqf: string);


implementation

procedure dTXqfStream.SetKeyBytes(B1, B2, B3, B4: Byte);
begin
  FKeyBytes[1] := B1;  FKeyBytes[2] := B2;
  FKeyBytes[3] := B3;  FKeyBytes[4] := B4;

  { F32Keys = [(C) Copyright Mr. Dong Shiwei.] }
  F32Keys[ 1] := Ord('[') and B1;
  F32Keys[ 2] := Ord('(') and B2;
  F32Keys[ 3] := Ord('C') and B3;
  F32Keys[ 4] := Ord(')') and B4;
  F32Keys[ 5] := Ord(' ') and B1;
  F32Keys[ 6] := Ord('C') and B2;
  F32Keys[ 7] := Ord('o') and B3;
  F32Keys[ 8] := Ord('p') and B4;
  F32Keys[ 9] := Ord('y') and B1;
  F32Keys[10] := Ord('r') and B2;
  F32Keys[11] := Ord('i') and B3;
  F32Keys[12] := Ord('g') and B4;
  F32Keys[13] := Ord('h') and B1;
  F32Keys[14] := Ord('t') and B2;
  F32Keys[15] := Ord(' ') and B3;
  F32Keys[16] := Ord('M') and B4;
  F32Keys[17] := Ord('r') and B1;
  F32Keys[18] := Ord('.') and B2;
  F32Keys[19] := Ord(' ') and B3;
  F32Keys[20] := Ord('D') and B4;
  F32Keys[21] := Ord('o') and B1;
  F32Keys[22] := Ord('n') and B2;
  F32Keys[23] := Ord('g') and B3;
  F32Keys[24] := Ord(' ') and B4;
  F32Keys[25] := Ord('S') and B1;
  F32Keys[26] := Ord('h') and B2;
  F32Keys[27] := Ord('i') and B3;
  F32Keys[28] := Ord('w') and B4;
  F32Keys[29] := Ord('e') and B1;
  F32Keys[30] := Ord('i') and B2;
  F32Keys[31] := Ord('.') and B3;
  F32Keys[32] := Ord(']') and B4;
end;

function dTXqfStream.Read(var Buffer; Count: Longint): Longint;
var
  ByteBuf: PByte;
  p      : PByte;
  i, iPos: Integer;
  KeyByte: Byte;
begin
  Result := 0;
  if (Count < 1) then Exit;
  if (Count > 1024) then
  begin
    GetMem(ByteBuf, Count);
  end
  else
  begin
    ByteBuf := @FBuf1024;
  end;
  iPos   := Self.Position;  if (iPos < 0 ) then iPos := 0;
  Result := inherited Read(ByteBuf^, Count);
  p := ByteBuf;
  for i:=0 to Count-1 do
  begin
    KeyByte := F32Keys[(iPos mod 32) + 1];
    P^ := P^ - KeyByte;
    Inc(p);
    Inc(iPos);
  end;
  Move(ByteBuf^, Buffer, Count);
  if (Count > 1024) then FreeMem(ByteBuf);
end;

function dTXqfStream.Write(const Buffer; Count: Longint): Longint;
var
  ByteBuf: PByte;
  p      : PByte;
  i, iPos: Integer;
  KeyByte: Byte;
begin
  Result := 0;
  if Count < 1 then Exit;
  if (Count > 1024) then
  begin
    GetMem(ByteBuf, Count);
  end
  else
  begin
    ByteBuf := @FBuf1024;
  end;
  Move(Buffer, ByteBuf^, Count);
  iPos := Self.Position;
  p    := ByteBuf;
  for i:=0 to Count-1 do
  begin
    KeyByte := F32Keys[(iPos mod 32) + 1];
    P^ := P^ + KeyByte;
    Inc(p);
    Inc(iPos);
  end;
  Result := inherited Write(ByteBuf^, Count);
  if (Count > 1024) then FreeMem(ByteBuf);
end;

//-------------------------------------------------------------------------
// 象棋文件类的构造函数
//.........................................................................
constructor dTXQFile.Create(sName:String; XQPTree: dTXQPlayNode);
begin
  Name := sName;  XQPlayTree := XQPTree;  isReverseH := False;
end;

//-------------------------------------------------------------------------
// 装入象棋文件
//.........................................................................
function dTXQFile.iLoadXQFile(OnlyHead:Boolean): dTINT32;
var
  fs        : dTXqfStream;                      // 文件流
  i, iRet   : dTInt32;

// 子函数:读入注解
function slLoadRemark(fs:dTXqfStream; RmkSize:dTDWord):TStringList;
var
  sl: TStringList;
  ss: TStringStream;                            // 字符串流
begin
  slLoadRemark := nil;
  if (RmkSize=0) then Exit;
  sl := TStringList.Create;
  ss := TStringStream.Create('');
  ss.CopyFrom(fs, RmkSize);  ss.Position := 0;
  sl.LoadFromStream(ss);
  ss.Free;
  slLoadRemark:=sl;
end;

// 子程序:将一个节点插入对弈树
procedure dInsertPNintoPlayTree(pt:dTXQPlayNode);
var
  nd   : dTXQPlayNode;                          // 对弈树节点
  pn   : dTXQFPlayNode;                         // 文件存放节点
  b    : dTByte;
begin
  if pt=nil then Exit;

  pn.RemarkSize := 0;
  fs.Read(pn,sizeof(pn) - Sizeof(pn.RemarkSize));// 读入一个节点
  if (XQFHead.Version <= $0A) then
  begin
    b := 0;
    if ((pn.ChildTag and $F0) <> 0) then b := b or $80;
    if ((pn.ChildTag and $0F) <> 0) then b := b or $40;
    pn.ChildTag := b;
    fs.Read(pn.RemarkSize, SizeOf(pn.RemarkSize));
  end
  else
  begin
    pn.ChildTag := pn.ChildTag and ($E0);

    if ((pn.ChildTag and $20) <> 0) then
    begin
      fs.Read(pn.RemarkSize, SizeOf(pn.RemarkSize));
    end;
  end;

  // 一步棋的起点和终点有简单的加密计算，读入时需要还原
  pt.XYf    := pn.XYf - $18 - KeyXYf;           // 一步棋的起点
  pt.XYt    := pn.XYt - $20 - KeyXYt;           // 一步棋的终点

  if pt.LastStepNode <> nil then                // 如果不是第一步节点
  begin
    pt.StepNo := pt.LastStepNode.StepNo + 1;    // 步数
    pt.QiziXY := pt.LastStepNode.QiziXY;
    pt.StrRec := sGetPlayRecStr(pt.QiziXY, pt.XYf, pt.XYt, False);
  end
  else                                          // 是第一步节点
  begin
    pt.XYf    := 0;
    case XQFHead.WhoPlay of                     // 判断谁先走棋
      0: pt.XYt    := 0;
      1: pt.XYt    := $FF;
    end;
  end;

  if (pn.RemarkSize > 0) then                   // 如果有注解
  begin
    pn.RemarkSize := pn.RemarkSize-KeyRMKSize;  // 还原注解的大小
  end;

  pt.Remark := slLoadRemark(fs, pn.RemarkSize); // 注解

//  if pn.ChildTag=0 then Exit;
  if ((pn.ChildTag and $80)<>0) then            // 有左子树
  begin
    nd := dTXQPlayNode.Create(0,'',0,0,pt.QiziXY,nil,pt,nil,pt);
    pt.dSetLChild(nd);
    dInsertPNintoPlayTree(pt.LChild);
  end;
  if ((pn.ChildTag and $40)<>0) then            // 有右子树
  begin
    nd := dTXQPlayNode.Create(0,'',0,0,pt.QiziXY,nil,
                                       pt.LastStepNode,pt,nil);
    pt.dSetRChild(nd);
    dInsertPNintoPlayTree(pt.RChild);
  end;
end;

begin                                           // 装入象棋文件主程序
  iLoadXQFile := -1;
  iRet        := -1;
  fs          := nil;
  if XQPlayTree = nil then Exit;

  // 将对弈树清空
  if XQPlayTree.LChild <> nil then XQPlayTree.LChild.Free;
  if XQPlayTree.RChild <> nil then XQPlayTree.RChild.Free;

  try
    try
      fs := dTXqfStream.Create(Name, fmOpenRead);
      fs.SetKeyBytes(0, 0, 0, 0);

      // 读入文件头
      if (fs.Read(XQFHead, SizeOf(XQFHead)) <> SizeOf(XQFHead)) then Exit;

      // 检查文件标记
      if (XQFHead.Signature <> $5158) then begin iRet:=-2; Exit; end;

      // 检查密码校验和
      if (not isKeysSumZero) then begin iRet := -3; Exit; end;

      // 检查文件版本号
      if (XQFHead.Version > dCFileVersion) then
      begin
        Application.MessageBox(
          '这是一个高版本的XQF文件，您需要更高版本的XQStudio来' +
          '读取这个文件。请在Internet站点下载XQStudio的最新版本。',
          dCVersionInfo,
          MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        iRet:=-3;
        Exit;
      end;

      dCalculateSecurityKeys;   // 将文件头中的密码因子计算为密码；

      with XQPlayTree do
      begin
        StepNo      := XQFHead.PlayStepNo;
        StrRec      := '==========';
        XYf         := 0;
        XYt         := 0;

        // 棋子位置循环移动
        for i:=1 to 32 do
        begin
          if (XQFHead.Version >= 12) then
          begin
            QiziXY[((i + KeyXY) mod 32) + 1] := XQFHead.QiziXY[i];
          end
          else
          begin
            QiziXY[i] := XQFHead.QiziXY[i];
          end;
        end;

        // 棋子位置解密
        for i:=1 to 32 do
        begin
          QiziXY[i]:= QiziXY[i] - KeyXY;
          if (QiziXY[i] > 89) then  QiziXY[i] := $FF;  // For 1.2 or higher
        end;

        LastStepNode:= nil;
        LParent     := nil;
        RParent     := nil;
        LChild      := nil;
        RChild      := nil;
      end;

      if (not OnlyHead) then
      begin
        fs.SetKeyBytes(
            (XQFHead.KeysSum and XQFHead.KeyMask) or XQFHead.KeyOrA,
            (XQFHead.KeyXY   and XQFHead.KeyMask) or XQFHead.KeyOrB,
            (XQFHead.KeyXYf  and XQFHead.KeyMask) or XQFHead.KeyOrC,
            (XQFHead.KeyXYt  and XQFHead.KeyMask) or XQFHead.KeyOrD);
        dInsertPNintoPlayTree(XQPlayTree);
      end;

      iRet := 0;
    except
    else
      iRet := -1;
    end;
   finally
     if (fs <> nil) then fs.Free;
     iLoadXQFile := iRet;
   end;
end;

//-------------------------------------------------------------------------
// 设置随机的加密因子
//.........................................................................
var
  isRandomize : Boolean = False;
procedure dTXQFile.dSetRandomSecurityKeys;
var
  b: dTByte;
begin
  b := 0;
  if (not isRandomize) then
  begin
    randomize;
    isRandomize := True;
  end;
  XQFHead.KeyXY   := Random(254) + 1;  b:= b + XQFHead.KeyXY;
  XQFHead.KeyXYf  := Random(254) + 1;  b:= b + XQFHead.KeyXYf;
  XQFHead.KeyXYt  := Random(254) + 1;  b:= b + XQFHead.KeyXYt;
  XQFHead.KeysSum := 256 - b;
end;

//-------------------------------------------------------------------------
// 计算真正的加密密码
//.........................................................................
procedure dTXQFile.dCalculateSecurityKeys;
var
  bKey : Byte;
  wKey : Word;
begin
  if XQFHead.Version <= 10 then         // 兼容1.0以前的版本
  begin
    KeyXY      := 0; 
    KeyXYf     := 0;
    KeyXYt     := 0;
    KeyRMKSize := 0;
    Exit;
  end;

  // 以下是密码计算公式
  bKey       := XQFHead.KeyXY;
  KeyXY      := (((((bKey*bKey)*3+9)*3+8)*2+1)*3+8) * bKey;
  bKey       := XQFHead.KeyXYf;
  KeyXYf     := (((((bKey*bKey)*3+9)*3+8)*2+1)*3+8) * KeyXY;
  bKey       := XQFHead.KeyXYt;
  KeyXYt     := (((((bKey*bKey)*3+9)*3+8)*2+1)*3+8) * KeyXYf;
  wKey       := (XQFHead.KeysSum) * 256 + XQFHead.KeyXY;
  KeyRMKSize := (wKey mod 32000) + 767;
end;

//-------------------------------------------------------------------------
// 检查密码的校验和为零否?
//.........................................................................
function  dTXQFile.isKeysSumZero: dTBoolean;
var
  b: dTByte;
begin
  with XQFHead do
  begin
    b := KeysSum + KeyXY + KeyXYf + KeyXYt;
  end;
  Result := (b=0);
end;


//-------------------------------------------------------------------------
// 保存象棋文件，请注意版本号
//.........................................................................
function dTXQFile.iSaveXQFile: dTINT32;
var
  fs        : dTXqfStream;                      // 文件流
  i, iRet   : dTInt32;
function bGetSaveXY(bXY: Byte): Byte;
var
  X, Y: Byte;
begin
  if Self.isReverseH then
  begin
    X := bXY div 10;
    Y := bXY mod 10;
    Result := (8 - X) * 10 + Y;
  end
  else
  begin
    Result := bXY;
  end;
end;
// 子程序：保存对弈树到XQF文件
procedure dSavePlayNodeIntoXQFile(fs:dTXqfStream; pt:dTXQPlayNode);
var
  pn     : dTXQFPlayNode;
  iBytes : dTInt32;
  b      : dTByte;
begin
  if (pt=nil) then Exit;                        // 没有棋局记录
  pn.RemarkSize := 0;

  // 加密棋谱
  pn.XYf        := bGetSaveXY(pt.XYf) + $18 + KeyXYf;
  pn.XYt        := bGetSaveXY(pt.XYt) + $20 + KeyXYt;

  if (pt.LastStepNode = nil) then               // 如果是第一步节点
  begin
    pn.XYf := Ord('X');
    pn.XYt := Ord('Q');
  end;

  pn.ChildTag   := 0;

  b := Random(256);  b := (b and $1F);          // 只有前三位有定义

  pn.ChildTag   := pn.ChildTag or b;

  pn.Reserved   := Random(256);

  // 设置左孩子
  if pt.LChild <> nil then pn.ChildTag := (pn.ChildTag or $80);

  // 设置右兄弟
  if pt.RChild <> nil then pn.ChildTag := (pn.ChildTag or $40);

  iBytes := 0;
  if (pt.Remark <> nil) then
  begin
    pn.RemarkSize := Length(pt.Remark.Text);
    iBytes := pn.RemarkSize;
  end;

  if isDisableRmk then iBytes := 0;

  if (iBytes > 0) then
  begin
    pn.ChildTag := (pn.ChildTag or $20);
    pn.RemarkSize := pn.RemarkSize + KeyRMKSize;
    fs.Write(pn, SizeOf(pn));
    fs.Write(PChar(pt.Remark.Text)^, iBytes);
  end
  else
  begin
    fs.Write(pn, (SizeOf(pn) - SizeOf(pn.RemarkSize)));
  end;

  dSavePlayNodeIntoXQFile(fs, pt.LChild);
  dSavePlayNodeIntoXQFile(fs, pt.RChild);
end;

begin
  iSaveXQFile := -1;
  iRet := -1;  fs := nil;
  if XQPlayTree = nil then Exit;
  try
    try
      XQFHead.Signature := $5158;               // 文件标记 'XQ' = $5158;
      XQFHead.Version   := dCFileVersion;       // 版本号
      Randomize;
      XQFHead.KeyMask   := Random(256) or $AA;
      XQFHead.KeyOrA    := Random(256);
      XQFHead.KeyOrB    := Random(256);
      XQFHead.KeyOrC    := Random(256);
      XQFHead.KeyOrD    := XQFHead.KeyOrA + XQFHead.KeyOrB + XQFHead.KeyOrC;
      XQFHead.KeyOrD    := 256 - XQFHead.KeyOrD;

      dSetRandomSecurityKeys;                   // 设置随机的加密因子
      dCalculateSecurityKeys;                   // 根据加密因子计算密码

      // 棋子位置循环偏移
      for i:=1 to 32 do
      begin
        XQFHead.QiziXY[i]:=XQPlayTree.QiziXY[((i + KeyXY) mod 32) + 1];
      end;

      // 棋子位置加密
      for i:=1 to 32 do
      begin
        // 死子位置随机产生
        if (XQFHead.QiziXY[i]=$FF) then XQFHead.QiziXY[i]:=90+Random(155);

        // 棋子位置加密
        XQFHead.QiziXY[i]:=bGetSaveXY(XQFHead.QiziXY[i]) + KeyXY;
      end;

      fs := dTXqfStream.Create(Name, fmCreate);
      fs.SetKeyBytes(0,0,0,0);
      fs.Write(XQFHead,sizeof(XQFHead));// 写入文件头
      fs.SetKeyBytes(
            (XQFHead.KeysSum and XQFHead.KeyMask) or XQFHead.KeyOrA,
            (XQFHead.KeyXY   and XQFHead.KeyMask) or XQFHead.KeyOrB,
            (XQFHead.KeyXYf  and XQFHead.KeyMask) or XQFHead.KeyOrC,
            (XQFHead.KeyXYt  and XQFHead.KeyMask) or XQFHead.KeyOrD);
      dSavePlayNodeIntoXQFile(fs, XQPlayTree);
      iRet := 0;
    except
    else
      iRet := -1;
    end;
   finally
     if (fs <> nil) then fs.Free;
     iSaveXQFile := iRet;
   end;
end;

{
function GetRParent(ATree, APNode: dTXQPlayNode): dTXQPlayNode;
begin
  Result := nil;
  if ATree  = nil then Exit;
  if APNode = nil then Exit;
  if IsQzXYSame(ATree.QiziXY, APNode.QiziXY, False, False) then
  begin
    Result := ATree;
    Exit;
  end;
  Result := GetRParent(ATree.LChild, APNode);
  if Result <> nil then Exit;
  Result := GetRParent(ATree.RChild, APNode);
end;

procedure dAddPlayNodeToTree(ATree, APNode: dTXQPlayNode);
var
  p: dTXQPlayNode;
begin
  if ATree  = nil then Exit;
  if APNode = nil then Exit;
  if APNode.RParent <> nil then
  begin
    p := GetRParent(ATree, APNode);

  end;

  dAddPlayNodeToTree(ATree, APNode.LChild);
  dAddPlayNodeToTree(ATree, APNode.RChild);
end;
}

procedure dMergePlayTree(t1, t2: dTXQPlayNode);
var
   pNext, qHead, p, q: dTXQPlayNode;
begin
  if t1 = nil then Exit;
  if t2 = nil then Exit;
  if not IsQzXYSame(t1.QiziXY, t2.QiziXY, False, False) then Exit;

  // 如果左子树为空，则直接将t2的左子树copy过来。
  if (t1.LChild = nil) then
  begin
    t1.LChild := t2.LChild;
    t2.LChild := nil;
    if t1.LChild <> nil then
    begin
      t1.LChild.LParent      := nil;
      t1.LChild.RParent      := t1;
      t1.LChild.LastStepNode := t1;
    end;
    Exit;
  end;

  qHead  := t1.LChild;
  p      := t2.LChild;
  t2.LChild := nil;

  while (p <> nil) do
  begin
    q        := qHead;
    pNext    := p.RChild;

    p.LParent := nil;
    p.RParent := nil;
    p.RChild  := nil;

    while (q<>nil) do
    begin
      if (q.XYf = p.XYf) and (q.XYt = p.XYt) then
      begin
        dMergePlayTree(q, p);
        p.Free;
        break;
      end
      else
      begin
        if (q.RChild = nil) then
        begin
          q.RChild  := p;
          p.LParent := q;
          p.RParent := nil;
          p.LastStepNode := q.LastStepNode;
          p.RChild  := nil;
          break;
        end
        else
        begin
          q := q.RChild;
        end;
      end;
    end;
    p := pNext;
  end;
end;

procedure dAddXqfToPlayTree(ATree: dTXQPlayNode; AXqf: string);
var
  AXqFile     : dTXQFile;
  AXqTree     : dTXQPlayNode;
  AXqfQzXY    : dTXQZXY;
begin
  AXqTree       := dTXQPlayNode.Create(0,'========= ',0,0,AXqfQzXY,
                                     nil,nil,nil,nil);
  if (AXqTree = nil) then Exit;

  AXqFile := dTXQFILE.Create(AXqf, AXqTree);
  if (AXqFile = nil) then
  begin
    AXqTree.Free;
    Exit;
  end;

  if (AXqFile.iLoadXQFile <> 0) then
  begin
    AXqFile.Free;
    AXqTree.Free;
    Exit;
  end;

  dMergePlayTree(ATree, AXqTree);
  AXqFile.Free;
  AXqTree.Free;
end;


end.
