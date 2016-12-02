object ExtLineForm: TExtLineForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1042#1085#1077#1096#1085#1080#1077' '#1051#1080#1085#1080#1080
  ClientHeight = 444
  ClientWidth = 312
  Color = clBtnFace
  Constraints.MaxHeight = 482
  Constraints.MaxWidth = 328
  Constraints.MinHeight = 482
  Constraints.MinWidth = 328
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    000000000000000000000000000000F0F0F0F0F00F0000000000000000000000
    B000000B000000F00B0000B00F00000000B00B00000000F0000BB0000F000000
    000BB000000000F000B00B000F0000000B0000B0000000F0B000000B0F000000
    00000000000000F0F0F0F0F00F0000000000000000000000000000000000FFFF
    0000FFFF0000D55B0000F7EF0000E3C70000D18B0000F81F0000DC3B0000FC3F
    0000D81B0000F18F0000C3C30000F7EF0000D55B0000FFFF0000FFFF0000}
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 417
    Width = 312
    Height = 27
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object btn1: TBitBtn
      Left = 236
      Top = 1
      Width = 75
      Height = 25
      Align = alRight
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      OnClick = btn1Click
    end
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 0
    Width = 312
    Height = 384
    Align = alClient
    DataSource = DMain.IntrPhUDS
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'intnumber'
        Title.Caption = #1042#1085#1091'-'#1085#1103' '#1083#1080#1085#1080#1103' '
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Internalline'
        Title.Caption = #1042#1085#1091'-'#1085#1103' '#1083#1080#1085#1080#1103' '
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 55
        Visible = True
      end>
  end
  object pnl2: TPanel
    Left = 0
    Top = 384
    Width = 312
    Height = 33
    Align = alBottom
    Caption = 'pnl2'
    TabOrder = 2
    object dbnvgr1: TDBNavigator
      Left = 32
      Top = 3
      Width = 240
      Height = 25
      DataSource = DMain.IntrPhUDS
      Kind = dbnHorizontal
      TabOrder = 0
    end
  end
end
