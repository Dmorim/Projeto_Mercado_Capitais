object FRM_List_Cart: TFRM_List_Cart
  Left = 551
  Top = 291
  Caption = 'Listagem de Carteiras'
  ClientHeight = 353
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = Ini_Form
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 420
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 416
    object SEP_Cart_01: TSplitter
      Left = 85
      Top = 1
      Height = 39
      ExplicitLeft = 80
      ExplicitTop = 8
      ExplicitHeight = 100
    end
    object SEP_Cart_02: TSplitter
      Left = 169
      Top = 1
      Height = 39
      ExplicitLeft = 160
      ExplicitTop = -1
    end
    object SEP_Cart_00: TSplitter
      Left = 1
      Top = 1
      Height = 39
      ExplicitLeft = 0
      ExplicitTop = 24
      ExplicitHeight = 100
    end
    object SEP_Cart_03: TSplitter
      Left = 253
      Top = 1
      Height = 39
      ExplicitLeft = 240
      ExplicitTop = 24
      ExplicitHeight = 100
    end
    object BTT_Add: TButton
      AlignWithMargins = True
      Left = 7
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = BTT_AddClick
    end
    object BTT_Edit: TButton
      AlignWithMargins = True
      Left = 91
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Editar'
      Enabled = False
      TabOrder = 1
      OnClick = BTT_EditClick
      ExplicitLeft = 94
      ExplicitTop = 5
    end
    object BTT_Delete: TButton
      AlignWithMargins = True
      Left = 175
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Excluir'
      Enabled = False
      TabOrder = 2
      OnClick = BTT_DeleteClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 334
    Width = 426
    Height = 19
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 333
    ExplicitWidth = 422
    object LBL_Qtd_Cart: TLabel
      Left = 255
      Top = 0
      Width = 130
      Height = 15
      Margins.Top = 1
      Caption = 'Quantidade de Carteiras:'
    end
    object LBL_Num_Cart: TLabel
      Left = 395
      Top = 0
      Width = 6
      Height = 15
      Margins.Top = 1
      Caption = '0'
    end
  end
  object DBG_List_Cart: TDBGrid
    Left = 0
    Top = 47
    Width = 426
    Height = 287
    Align = alClient
    DataSource = DTS_List_Cart
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBG_List_CartCellClick
    OnDblClick = BTT_EditClick
    Columns = <
      item
        Expanded = False
        FieldName = 'C'#243'digo'
        Title.Alignment = taCenter
        Title.Color = clBtnShadow
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Carteira'
        Title.Alignment = taCenter
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd Max'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Max'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tipo Carteira'
        Title.Alignment = taCenter
        Width = 135
        Visible = True
      end>
  end
  object CDS_List_Cart: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'C'#243'digo'
        DataType = ftInteger
      end
      item
        Name = 'Carteira'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Qtd Max'
        DataType = ftInteger
      end
      item
        Name = 'Tipo Carteira'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'INDEX_CDG'
        Options = [ixPrimary]
        Source = 'C'#243'digo'
      end>
    Params = <>
    StoreDefs = True
    Top = 312
    object CDS_List_CartCódigo: TIntegerField
      FieldName = 'C'#243'digo'
    end
    object CDS_List_CartCarteira: TStringField
      FieldName = 'Carteira'
      Size = 35
    end
    object CDS_List_CartQtdAções: TIntegerField
      FieldName = 'Qtd Max'
    end
    object CDS_List_CartTipoCarteira: TStringField
      FieldName = 'Tipo Carteira'
    end
  end
  object DTS_List_Cart: TDataSource
    DataSet = CDS_List_Cart
    Left = 32
    Top = 312
  end
end
