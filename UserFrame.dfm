object FrameUsr: TFrameUsr
  Left = 0
  Top = 0
  Width = 589
  Height = 426
  TabOrder = 0
  object spl1: TSplitter
    Left = 0
    Top = 173
    Width = 589
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 0
    ExplicitWidth = 176
  end
  object grp1: TGroupBox
    Left = 0
    Top = 176
    Width = 589
    Height = 250
    Align = alBottom
    TabOrder = 0
    object strngrd1: TStringGrid
      Left = 2
      Top = 15
      Width = 585
      Height = 233
      Align = alClient
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      GradientEndColor = clBlue
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 32
      ExplicitWidth = 521
      ExplicitHeight = 217
      ColWidths = (
        64
        116
        122
        136)
    end
  end
  object grp2: TGroupBox
    Left = 0
    Top = 0
    Width = 589
    Height = 173
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 40
    ExplicitTop = 32
    ExplicitWidth = 185
    ExplicitHeight = 105
    object lbl1: TLabel
      Left = 168
      Top = 16
      Width = 86
      Height = 19
      Caption = #1053#1072#1079#1074#1086#1085#1080#1083':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
