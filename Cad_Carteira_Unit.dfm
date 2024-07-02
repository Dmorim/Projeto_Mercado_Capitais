object FRM_Cad_Cart: TFRM_Cad_Cart
  Left = 756
  Top = 395
  Caption = 'Cadastro de Carteiras'
  ClientHeight = 152
  ClientWidth = 252
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clDefault
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = Ini_Form
  TextHeight = 17
  object LBL_Nom_Cart: TLabel
    Left = 123
    Top = 8
    Width = 105
    Height = 17
    Caption = 'Nome da Carteira'
  end
  object LBL_Tipo_Cart: TLabel
    Left = 123
    Top = 64
    Width = 95
    Height = 17
    Caption = 'Tipo de Carteira'
  end
  object LBL_Qtd_Acoes: TLabel
    Left = 8
    Top = 64
    Width = 64
    Height = 17
    Caption = 'Qtd. A'#231#245'es'
  end
  object LBL_Cod_Cart: TLabel
    Left = 8
    Top = 8
    Width = 43
    Height = 17
    Caption = 'C'#243'digo'
  end
  object EDT_Nom_Cart: TEdit
    Left = 123
    Top = 31
    Width = 121
    Height = 21
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    CanUndoSelText = True
    TabOrder = 0
  end
  object EDT_Qtd_Acoes: TEdit
    Left = 8
    Top = 85
    Width = 73
    Height = 21
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    CanUndoSelText = True
    TabOrder = 1
  end
  object EDT_Tipo_Cart: TEdit
    Left = 123
    Top = 85
    Width = 121
    Height = 21
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    CanUndoSelText = True
    TabOrder = 2
  end
  object BTN_Confirm: TBitBtn
    Left = 169
    Top = 125
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = BTN_ConfirmClick
  end
  object BTN_Cance: TBitBtn
    Left = 88
    Top = 125
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = BTN_CanceClick
  end
  object Edt_Cod_Cart: TEdit
    Left = 8
    Top = 31
    Width = 73
    Height = 19
    Alignment = taRightJustify
    BorderStyle = bsNone
    Color = clInactiveCaption
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    CanUndoSelText = True
    ReadOnly = True
    TabOrder = 5
  end
end
