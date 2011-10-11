object frmXQAbout: TfrmXQAbout
  Left = 334
  Top = 220
  ActiveControl = OKButton
  BorderStyle = bsToolWindow
  Caption = '关于"象棋演播室"'
  ClientHeight = 211
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlVersionInfo: TPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ProgramIcon: TImage
      Left = 40
      Top = 24
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010002002020100000000000E80200002600000010101000
        00000000280100000E0300002800000020000000400000000100040000000000
        8002000000000000000000000000000000000000000000000000800000800000
        00808000800000008000800080800000C0C0C000808080000000FF0000FF0000
        00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000BBB00000000
        000000000B000000000BBBBBB000000000000000BBBBBBB000BBBBBBBB000000
        00000000BBBBBBBBB000000BBBB00000000BB0000000BBBBBBB00000BBB00000
        00BBBBB000000000BBBBB000BBB00000BBBBBBB00000000000BBBBB0BBB0000B
        BBBBBBB000000BBBB0000BBBBBB000BBBBBBB0000000000BBBBB00BBBBB00BBB
        BB0000000000000000BBBB00BBBBBBBB0000000000BBBBBBB0000BBBBBBBBB00
        00000000000000BBBBBB00BBBBB0BBBBB00000000000000000BBBBBBBB000BBB
        B00000000000000BB000BBBBB000003030000000000000BBBBBBBBBBBBBBBBBB
        BBB00000000000BBB000BBBBBBBBBBBBBBB000000000000BB000000BBB000000
        BBB000000BBBBB0BBBBBBBBBBBBBBBBBBBB00000BBBBBBBBBBBBBBBBBBBBBBBB
        BBB00000BBBBBBBBBBB00000BBB000000000000000000BBBBBBBB0000BBB0000
        00000000000000000BBBBBBBBBBB000000000000000000000000BBBBB0000000
        0000000000000000000000BBB000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
        FFFC7FFFDFF03FFF80E01FFF00000FE3000E0FC0F0030F00FF000E01FC000C01
        F8000807FE00003FE00000FFC000003FFC00103FFF00387FFE00000FFC00000F
        FC30000FC000000F8000000F0000001F000307FFF80007FFFF800FFFFFF03FFF
        FFFC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF280000001000000020000000
        0100040000000000C00000000000000000000000000000000000000000000000
        000080000080000000808000800000008000800080800000C0C0C00080808000
        0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000000B
        00000000000000BBB0000000000B0000B00000000000B000B000BBB000BB0B00
        B0BB00000000B0BB0B000000000B0B0BB00000000000B0B00BB0000000000B00
        00BB00000000BBBBBB0000000000B0B000B00000000BBBBBBBBB00000000B00B
        0000000000000BBBBB000000000000B0000000000000000000000000FE7F0000
        EC3F0000E7310000C3200000C00F0000E03F0000E01F0000F18F0000F0070000
        F01F0000E00F0000E0070000F01F0000F83F0000FDFF0000FFFF0000}
      Stretch = True
      IsControl = True
    end
    object lblVersion: TLabel
      Left = 96
      Top = 24
      Width = 162
      Height = 24
      Alignment = taCenter
      Caption = 'Version Information'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      IsControl = True
    end
    object Copyright: TLabel
      Left = 96
      Top = 96
      Width = 248
      Height = 16
      Alignment = taCenter
      Caption = 'Copyright (C) Dong Shiwei,  1998-2007'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Comments: TLabel
      Left = 96
      Top = 120
      Width = 119
      Height = 16
      Alignment = taCenter
      Caption = 'All rights reserved'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object lblEmail: TLabel
      Left = 96
      Top = 144
      Width = 187
      Height = 16
      Alignment = taCenter
      Caption = 'E-mail: xqstudio@qipaile.net'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Label2: TLabel
      Left = 96
      Top = 72
      Width = 93
      Height = 16
      Caption = '作者: 过河象'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object OKButton: TButton
    Left = 160
    Top = 178
    Width = 65
    Height = 22
    Caption = '确认'
    Default = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    IsControl = True
  end
end
