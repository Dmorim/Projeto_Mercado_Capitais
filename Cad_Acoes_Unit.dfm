object FRM_Cadastro_Acoes: TFRM_Cadastro_Acoes
  Left = 572
  Top = 415
  BorderStyle = bsDialog
  Caption = 'Cadastro de A'#231#245'es'
  ClientHeight = 155
  ClientWidth = 315
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Consolas'
  Font.Style = []
  Position = poDesigned
  OnCreate = Ini_Form
  TextHeight = 14
  object LBL_Ticket_Acao: TLabel
    Left = 8
    Top = 3
    Width = 42
    Height = 14
    Caption = 'Ticket'
  end
  object LBL_Carteira_Acao: TLabel
    Left = 194
    Top = 3
    Width = 56
    Height = 14
    Caption = 'Carteira'
  end
  object LBL_Data_Compra_Acao: TLabel
    Left = 8
    Top = 59
    Width = 98
    Height = 14
    Caption = 'Data de Compra'
  end
  object LBL_Cotacao_Acao: TLabel
    Left = 194
    Top = 59
    Width = 49
    Height = 14
    Caption = 'Cota'#231#227'o'
  end
  object BTN_Indicadores_Acoes: TBitBtn
    Left = 8
    Top = 119
    Width = 125
    Height = 25
    Caption = 'Indicadores'
    TabOrder = 4
  end
  object BTN_Cancelar_Acoes: TBitBtn
    Left = 149
    Top = 119
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
  end
  object BTN_Confirmar_Acoes: TBitBtn
    Left = 230
    Top = 119
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 5
    OnClick = BTN_Confirmar_AcoesClick
  end
  object CBB_Carteira_Acoes: TComboBox
    Left = 194
    Top = 24
    Width = 111
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DTP_Compra_Acoes: TDateTimePicker
    Left = 8
    Top = 79
    Width = 121
    Height = 22
    Date = 45470.000000000000000000
    Time = 0.690915208331716700
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object EDT_Ticket_Acoes: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 23
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    CanUndoSelText = True
    TabOrder = 0
  end
  object EDT_Cotacao_Acoes: TEdit
    Left = 196
    Top = 79
    Width = 111
    Height = 23
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    CanUndoSelText = True
    TabOrder = 3
  end
end
