object FRM_List_Acoes: TFRM_List_Acoes
  Left = 551
  Top = 291
  Caption = 'Listagem de A'#231'oes'
  ClientHeight = 396
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = Ini_Form
  TextHeight = 15
  object DBG_Acoes: TDBGrid
    Left = 0
    Top = 47
    Width = 361
    Height = 324
    Align = alClient
    DataSource = DTS_Acoes
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBG_AcoesCellClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ticket'
        Title.Alignment = taCenter
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Carteira'
        Title.Alignment = taCenter
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cotacao'
        Title.Alignment = taCenter
        Width = 75
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Data_Compra'
        Title.Alignment = taCenter
        Width = 95
        Visible = True
      end>
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 355
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 351
    object SEP_Acoes_02: TSplitter
      Left = 189
      Top = 1
      Height = 39
      ExplicitLeft = 150
    end
    object SEP_Acoes_01: TSplitter
      Left = 95
      Top = 1
      Height = 39
      ExplicitLeft = 80
    end
    object SEP_Acoes_00: TSplitter
      Left = 1
      Top = 1
      Height = 39
      ExplicitLeft = 0
      ExplicitTop = 16
      ExplicitHeight = 100
    end
    object SEP_Acoes_03: TSplitter
      Left = 283
      Top = 1
      Height = 39
      ExplicitLeft = 240
      ExplicitTop = 16
      ExplicitHeight = 100
    end
    object BTT_Delete: TButton
      AlignWithMargins = True
      Left = 195
      Top = 4
      Width = 85
      Height = 33
      Align = alLeft
      Caption = 'Excluir'
      Enabled = False
      TabOrder = 0
      OnClick = BTT_DeleteClick
    end
    object BTT_Edit: TButton
      AlignWithMargins = True
      Left = 101
      Top = 4
      Width = 85
      Height = 33
      Align = alLeft
      Caption = 'Editar'
      Enabled = False
      TabOrder = 1
      OnClick = BTT_EditClick
    end
    object BTT_Add: TButton
      AlignWithMargins = True
      Left = 7
      Top = 4
      Width = 85
      Height = 33
      Align = alLeft
      Caption = 'Adicionar'
      Enabled = False
      TabOrder = 2
      OnClick = BTT_AddClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 371
    Width = 361
    Height = 25
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 370
    ExplicitWidth = 357
    object LBL_Numero_Acoes: TLabel
      Left = 338
      Top = 5
      Width = 6
      Height = 15
      Margins.Top = 1
      Caption = '0'
    end
    object LBL_Qtd_Acoes: TLabel
      Left = 218
      Top = 4
      Width = 116
      Height = 15
      Margins.Top = 1
      Caption = 'Quantidade de A'#231#245'es:'
      Layout = tlCenter
    end
  end
  object CLDS_Acoes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Ticket'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Carteira'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cotacao'
        DataType = ftCurrency
      end
      item
        Name = 'Data_Compra'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'IDX_Ticket'
        Fields = 'Ticket'
        Options = [ixPrimary, ixUnique]
        Source = 'CLDS_Acoes'
      end>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 360
    object CLDS_AcoesTicket: TStringField
      FieldName = 'Ticket'
      Size = 6
    end
    object CLDS_AcoesCarteira: TStringField
      FieldName = 'Carteira'
    end
    object CLDS_AcoesCotacao: TFloatField
      FieldName = 'Cotacao'
      KeyFields = 'Cotacao'
      currency = True
    end
    object CLDS_AcoesData_Compra: TDateTimeField
      FieldName = 'Data_Compra'
    end
  end
  object DTS_Acoes: TDataSource
    DataSet = CLDS_Acoes
    Left = 8
    Top = 331
  end
end
