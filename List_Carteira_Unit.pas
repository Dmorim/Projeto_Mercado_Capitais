unit List_Carteira_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Class_Carteira_Unit, Datasnap.DBClient,
  Datasnap.Provider, Vcl.Mask, Vcl.DBCtrls;

type
  TFRM_List_Cart = class(TForm)
    Panel1: TPanel;
    BTT_Add: TButton;
    BTT_Edit: TButton;
    BTT_Delete: TButton;
    SEP_Cart_01: TSplitter;
    SEP_Cart_02: TSplitter;
    SEP_Cart_00: TSplitter;
    SEP_Cart_03: TSplitter;
    Panel2: TPanel;
    LBL_Qtd_Cart: TLabel;
    LBL_Num_Cart: TLabel;
    CDS_List_Cart: TClientDataSet;
    DTS_List_Cart: TDataSource;
    DBG_List_Cart: TDBGrid;
    CDS_List_CartCódigo: TIntegerField;
    CDS_List_CartCarteira: TStringField;
    CDS_List_CartQtdAções: TIntegerField;
    CDS_List_CartTipoCarteira: TStringField;
    procedure BTT_AddClick(Sender: TObject);
    procedure Update_Cart_Count;
    procedure Create_Data_Set;
    procedure Link_Data_Set;
    procedure Ini_Form(Sender: TObject);
    procedure BTT_EditClick(Sender: TObject);
    procedure DBG_List_CartCellClick(Column: TColumn);
    procedure BTT_DeleteClick(Sender: TObject);
    procedure Ativar_Botoes;
    procedure Desativar_Botoes;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_List_Cart: TFRM_List_Cart;

implementation
uses
Cad_carteira_Unit; // Unit que contem o Form para cadastrar uma carteira

var
Codigo_Selecionado: integer; // Código de carteira que está atualmente selecionado no DBGrid


{$R *.dfm}

procedure TFRM_List_Cart.BTT_AddClick(Sender: TObject); // Procedure que abre e libera a memória do Form de cadastro
  begin
    Tipo_Janela := False; // Define o tipo de Janela como Cadastro
    FRM_Cad_Cart := TFRM_Cad_Cart.Create(nil);

    try
      FRM_Cad_Cart.ShowModal;
    finally
      FRM_Cad_Cart.Free;
    end;

    // Atualiza o DBGrid e a contagem de intens
    Link_Data_Set;
    Update_Cart_Count;
  end;

procedure TFRM_List_Cart.Update_Cart_Count; // Procedure que atualiza a contagem de Carteiras no Form
  begin
    LBL_Num_Cart.Caption := inttostr(Cart_Hold.Ver_Quant_Cart);
  end;

procedure TFRM_List_Cart.Create_Data_Set; // Procedure para abrir o DataSet
  begin
    CDS_List_Cart.CreateDataSet;
    CDS_List_Cart.Open
  end;

procedure TFRM_List_Cart.DBG_List_CartCellClick(Column: TColumn); // Procedure que atualiza a variavel Código_Selecionado a cada alteração de célula no DBGrid
begin
  Codigo_Selecionado := DBG_List_Cart.Fields[0].AsInteger;
end;

procedure TFRM_List_Cart.Link_Data_Set; // Procedure que atualiza os itens do DataSet de acordo com os itens em TCarteira
var
  cart: TCarteira;
begin
  CDS_List_Cart.DisableControls; // Desativa atualizações visuais durante o loop
  try
    CDS_List_Cart.EmptyDataSet; // Limpa o dataset

    for cart in Cart_Hold.Carteira do // Passa por todas as carteiras listadas e Cart_Hold
    begin
      CDS_List_Cart.Append; // Insere um novo registro
      CDS_List_Cart.FieldByName('Código').AsInteger := cart.Codigo;
      CDS_List_Cart.FieldByName('Carteira').AsString := cart.Nome;
      CDS_List_Cart.FieldByName('Qtd Max').AsInteger := cart.Qtd_Max_Acoes;
      CDS_List_Cart.FieldByName('Tipo Carteira').AsString := cart.Tipo_Cart;
      CDS_List_Cart.Post; // Salva o registro
    end;

    if Cart_Hold.Carteira.Count > 0 then
      begin
        Ativar_Botoes;
      end
    else
      begin
        Desativar_Botoes;
      end;

  finally
    CDS_List_Cart.EnableControls; // Reativa atualizações visuais
  end;
end;



procedure TFRM_List_Cart.Ini_Form(Sender: TObject); // Procedure com os demais procedures que devem ser executados sempre que a tela for criada
  begin
    Update_Cart_Count;
    Create_Data_Set;
    Link_Data_Set;
  end;

procedure TFRM_List_Cart.BTT_DeleteClick(Sender: TObject); // Procedure para excluir o registro e a instância da carteira da lista de TCarteira_Holder
var Carteira: TCarteira;
Confirmacao: Integer;
mensagem: String;
begin
  for Carteira in Cart_Hold.Carteira do // Loop para encontrar a instância selecionada
    begin
      if Carteira.Codigo = Codigo_Selecionado then
        break
    end;

    Mensagem := Format('Deseja excluir a carteira "%s"?', [Carteira.Nome]);
    Confirmacao := MessageDlg(Mensagem, mtConfirmation, [mbYes, mbNo], 0); // Mensagem de Confirmação
    if Confirmacao = mrYes then
      begin
        Cart_Hold.Carteira.Remove(Carteira); // Remoção da carteira da lista

        // Atualização do DataSet e do Contador
        Carteira.Free;
        Link_Data_Set;
        Update_Cart_Count;
      end;

end;

procedure TFRM_List_Cart.BTT_EditClick(Sender: TObject); // Procedure que abre o Form de cadastro de Carteira, mas em modo edição
var
carteira: TCarteira;
begin
  if Cart_Hold.Carteira.Count > 0 then
  begin
    for carteira in Cart_Hold.Carteira do // Loop para encontrar qual instância de carteira vai ser editada
      begin
        if carteira.Codigo = Codigo_Selecionado then
          break
      end;

    Tipo_Janela := True; // Define o tipo de Janela para Edição
    Carteira_Em_Uso := Carteira; // Define a Carteira que vai ser editada para a que foi encontrada no loop

    // Abre a tela de cadastro
    FRM_Cad_Cart := TFRM_Cad_Cart.Create(nil);
    try
      FRM_Cad_Cart.ShowModal;
    finally
      FRM_Cad_Cart.Free;
    end;

    // Atualiza o DataSet e o Contador
    Link_Data_Set;
    Update_Cart_Count;
  end;
end;

procedure TFRM_List_Cart.Ativar_Botoes;
begin
  BTT_Edit.Enabled := True;
  BTT_Delete.Enabled := True;
end;

procedure TFRM_List_Cart.Desativar_Botoes;
begin
  BTT_Edit.Enabled := False;
  BTT_Delete.Enabled := False;
end;

end.
