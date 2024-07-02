object FRM_Main: TFRM_Main
  Left = 735
  Top = 395
  Width = 283
  Height = 189
  AutoScroll = True
  Caption = 'Mercado de Capitais'
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = Create_Cart_Holder
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 132
    Width = 271
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Bem vindo a Aplica'#231#227'o Mercado de Capitais'
        Width = 50
      end>
    ExplicitTop = 131
    ExplicitWidth = 267
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 271
    Height = 35
    ButtonHeight = 35
    Caption = 'ToolBar1'
    Color = clMenu
    ParentColor = False
    TabOrder = 1
    ExplicitWidth = 267
    object BTT_CART: TButton
      Left = 0
      Top = 0
      Width = 60
      Height = 35
      Cursor = crHandPoint
      Caption = 'Carteira'
      DisabledImageName = 'B'
      TabOrder = 0
      OnClick = BTT_CARTClick
    end
    object Tool_Sep_1: TToolButton
      Left = 60
      Top = 0
      Width = 7
      Cursor = crHandPoint
      Style = tbsSeparator
    end
    object BTTT_ACOES: TButton
      Left = 67
      Top = 0
      Width = 60
      Height = 35
      Cursor = crHandPoint
      Caption = 'A'#231#245'es'
      TabOrder = 1
      OnClick = BTTT_ACOESClick
    end
    object Tool_Sep_2: TToolButton
      Left = 127
      Top = 0
      Width = 8
      Caption = 'Tool_Sep_2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BTT_Comp: TButton
      Left = 135
      Top = 0
      Width = 60
      Height = 35
      Caption = 'Comparar'
      TabOrder = 2
    end
    object Tool_Sep_3: TToolButton
      Left = 195
      Top = 0
      Width = 8
      Caption = 'Tool_Sep_3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object BTT_Opc: TButton
      Left = 203
      Top = 0
      Width = 60
      Height = 35
      Caption = 'Op'#231#245'es'
      TabOrder = 3
    end
  end
end
