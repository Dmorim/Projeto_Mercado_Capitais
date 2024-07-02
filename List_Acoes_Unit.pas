unit List_Acoes_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Datasnap.DBClient, Cad_Acoes_Unit, Class_Carteira_Unit, Class_Acoes_Unit;

type
  TFRM_List_Acoes = class(TForm)
    DBG_Acoes: TDBGrid;
    Panel1: TPanel;
    BTT_Delete: TButton;
    BTT_Edit: TButton;
    BTT_Add: TButton;
    SEP_Acoes_02: TSplitter;
    SEP_Acoes_01: TSplitter;
    SEP_Acoes_00: TSplitter;
    SEP_Acoes_03: TSplitter;
    Panel2: TPanel;
    CLDS_Acoes: TClientDataSet;
    DTS_Acoes: TDataSource;
    CLDS_AcoesTicket: TStringField;
    CLDS_AcoesCarteira: TStringField;
    CLDS_AcoesCotacao: TFloatField;
    CLDS_AcoesData_Compra: TDateTimeField;
    LBL_Numero_Acoes: TLabel;
    LBL_Qtd_Acoes: TLabel;
    procedure BTT_AddClick(Sender: TObject);
    procedure Construir_DataSet;
    procedure Abrir_DataSet;
    procedure Atualizar_Contador;
    procedure Ini_Form(Sender: TObject);
    procedure Ativar_Botoes;
    procedure Desativar_Botoes;
    procedure BTT_EditClick(Sender: TObject);
    procedure DBG_AcoesCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_List_Acoes: TFRM_List_Acoes;

implementation
var
Ticket_Selecionado: String;
{$R *.dfm}

procedure TFRM_List_Acoes.BTT_AddClick(Sender: TObject);
begin
  Tipo_Janela := False;
  FRM_Cadastro_Acoes := TFRM_Cadastro_Acoes.Create(nil);

  try
    FRM_Cadastro_Acoes.ShowModal;
  finally
    FRM_Cadastro_Acoes.Free;
  end;

  Atualizar_Contador;
  Construir_DataSet;
end;

 procedure TFRM_List_Acoes.BTT_EditClick(Sender: TObject);
 var
 Carteira: TCarteira;
 Acao: TAcao;
  begin
    for Carteira in Cart_Hold.Carteira do
      for Acao in Carteira.Acoes do
        if Acao.Ticket = Ticket_Selecionado then
          break;  // Encontra a Ação que será editada

    Tipo_Janela := True; // Define o tipo de Janela como Edição
    Acao_Em_Uso := Acao; // Passa a Ação que será editada para a Tela
    Carteira_Em_Uso := Carteira; // Passa a Carteira referente a Ação

    FRM_Cadastro_Acoes := TFRM_Cadastro_Acoes.Create(nil); // Cria a instância da tela

    try
      FRM_Cadastro_Acoes.ShowModal; // Exibe a tela
    finally
      FRM_Cadastro_Acoes.Free; // Libera a memória
    end;

    // Atualiza os dados da listagem
    Atualizar_Contador;
    Construir_DataSet;

  end;

procedure TFRM_List_Acoes.Atualizar_Contador; // Procedure que atualiza a contagem de Ações no Form
 var
 contador: integer;
 carteira: TCarteira;
 acao: TAcao;

  begin
    contador := 0;
    for carteira in Cart_Hold.Carteira do
      for acao in carteira.Acoes do
        Inc(Contador);

    LBL_Numero_Acoes.Caption := inttostr(contador);
  end;

procedure TFRM_List_Acoes.Construir_DataSet; // Procedure que atualiza os itens do DataSet de acordo com os itens em TAcoes
var
  cart: TCarteira;
  acoes: TAcao;
begin
  CLDS_Acoes.DisableControls; // Desativa atualizações visuais durante o loop
  try
    CLDS_Acoes.EmptyDataSet; // Limpa o dataset
    for cart in Cart_Hold.Carteira do // Passa por todas as carteiras listadas e Cart_Hold
      for acoes in cart.Acoes do // Passa por todos as ações listadas em Carteiras
            begin
              CLDS_Acoes.Append; // Insere um novo registro
              CLDS_Acoes.FieldByName('Ticket').AsString := acoes.Ticket;
              CLDS_Acoes.FieldByName('Carteira').AsString := cart.Nome;
              CLDS_Acoes.FieldByName('Cotacao').AsCurrency := acoes.Cotacao;
              CLDS_Acoes.FieldByName('Data_Compra').AsDateTime := acoes.Data_Compra;
              CLDS_Acoes.Post; // Salva o registro
            end;

    if Cart_Hold.Carteira.Count > 0 then
    begin
      if cart.Acoes.Count > 0 then
        begin
          Ativar_Botoes;
          exit;
        end
      else
        begin
          Desativar_Botoes;
        end;
    end;
  finally
    CLDS_Acoes.EnableControls; // Reativa atualizações visuais
  end;
end;

procedure TFRM_List_Acoes.Abrir_DataSet; // Procedure para abrir o DataSet
  begin
    CLDS_Acoes.CreateDataSet;
    CLDS_Acoes.Open
  end;

procedure TFRM_List_Acoes.Ini_Form(Sender: TObject);
  begin
    Atualizar_Contador;
    Abrir_DataSet;
    Construir_DataSet;
  end;

procedure TFRM_List_Acoes.Ativar_Botoes;
  begin
    BTT_Edit.Enabled := True;
    BTT_Delete.Enabled := True;
  end;

procedure TFRM_List_Acoes.DBG_AcoesCellClick(Column: TColumn);
  begin
    Ticket_Selecionado := DBG_Acoes.Fields[0].AsString;
  end;

procedure TFRM_List_Acoes.Desativar_Botoes;
  begin
    BTT_Edit.Enabled := False;
    BTT_Delete.Enabled := False;
  end;


end.
