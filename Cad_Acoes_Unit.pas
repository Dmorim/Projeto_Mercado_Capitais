unit Cad_Acoes_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCalendars, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ComCtrls, Class_Acoes_Unit, Class_Carteira_Unit, StrUtils;

type
  TFRM_Cadastro_Acoes = class(TForm)
    BTN_Indicadores_Acoes: TBitBtn;
    BTN_Cancelar_Acoes: TBitBtn;
    BTN_Confirmar_Acoes: TBitBtn;
    CBB_Carteira_Acoes: TComboBox;
    LBL_Ticket_Acao: TLabel;
    LBL_Carteira_Acao: TLabel;
    LBL_Data_Compra_Acao: TLabel;
    LBL_Cotacao_Acao: TLabel;
    DTP_Compra_Acoes: TDateTimePicker;
    EDT_Ticket_Acoes: TEdit;
    EDT_Cotacao_Acoes: TEdit;
    procedure BTN_Confirmar_AcoesClick(Sender: TObject);
    procedure Inserir_Itens_CBB_Carteira;
    procedure Ini_Form(Sender: TObject);
    procedure Modo_Edicao;
    procedure Troca_Carteira;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Cadastro_Acoes: TFRM_Cadastro_Acoes;
  Tipo_Janela: Boolean;
  Acao_Em_Uso: TAcao;
  Carteira_Em_Uso: TCarteira;

implementation

{$R *.dfm}
Procedure TFRM_Cadastro_Acoes.Inserir_Itens_CBB_Carteira;
var
  carteira: TCarteira;
begin
  for carteira in Cart_Hold.Carteira do
    begin
      CBB_Carteira_Acoes.Items.Add(carteira.Nome)
    end;

end;

procedure TFRM_Cadastro_Acoes.Ini_Form(Sender: TObject);
begin
  Inserir_Itens_CBB_Carteira;
  if Tipo_Janela then
    begin
      Modo_Edicao;
    end;

end;

procedure TFRM_Cadastro_Acoes.BTN_Confirmar_AcoesClick(Sender: TObject);
var
Acao: TAcao; Carteira: TCarteira;

begin
  if (EDT_Ticket_Acoes.Text	<> '') and (EDT_Cotacao_Acoes.Text <> '') and (CBB_Carteira_Acoes.ItemIndex >= 0) then
    begin
     if Tipo_Janela then

      begin
        Acao_Em_Uso.Ticket := EDT_Ticket_Acoes.Text;
        Acao_Em_Uso.Cotacao := strtocurr(ReplaceStr(EDT_Cotacao_Acoes.Text, 'R$', ''));
        Acao_Em_Uso.Data_Compra := DTP_Compra_Acoes.Date;
        if CBB_Carteira_Acoes.text <> Carteira_Em_Uso.Nome then
          begin
            Troca_Carteira
          end;
        MessageDlg('Carteira Editada com sucesso!', mtInformation, [mbOk], 0);
        Close;
      end

     else

      begin

        try
          Acao := TAcao.Create(EDT_Ticket_Acoes.Text, StrtoCurr(EDT_Cotacao_Acoes.Text), DTP_Compra_Acoes.Date);
        Except
          on erro: Exception do
            begin
              MessageDlg(erro.Message , mtError, [mbOk], 0); // Erro levantado da criação da classe Acao em Class_Acoes_Unit
              exit
            end;
        end;

        for Carteira in Cart_Hold.Carteira do
          begin
            if Carteira.Nome = CBB_Carteira_Acoes.Text then
              break
          end;

        try
          Carteira.Add_Acao(Acao);
        Except
          on erro: Exception do
            begin
              MessageDlg(erro.Message , mtError, [mbOk], 0); // Erro levantado na adição de ação alem do limte em Class_Carteira_Unit
              exit
            end;
        end;

        MessageDlg('Carteira cadastrada com sucesso!', mtInformation, [mbOk], 0);
        Close;
      end;
    end
    else
      begin
        MessageDlg('Preencha todos os campos!', mtError, [mbOk], 0)
      end;

end;

procedure TFRM_Cadastro_Acoes.Modo_Edicao;
var
Carteira: TCarteira;
Contador: Integer;
  begin
    contador := 0;

    EDT_Ticket_Acoes.Text := Acao_Em_Uso.Ticket;
    EDT_Cotacao_Acoes.Text := currtostrf(Acao_Em_Uso.Cotacao, ffCurrency, 2);
    CBB_Carteira_Acoes.ItemIndex := contador; for Carteira in Cart_Hold.Carteira do; Inc(contador); if Carteira.Nome = Carteira_Em_Uso.Nome then; exit;
    DTP_Compra_Acoes.Date := Acao_Em_Uso.Data_Compra;
  end;

procedure TFRM_Cadastro_Acoes.Troca_Carteira;
var
Carteira: TCarteira;
  begin
    Carteira_Em_Uso.Remover_Acao(Acao_Em_Uso);
    for Carteira in Cart_Hold.Carteira do
      begin
        if Carteira.Nome = CBB_Carteira_Acoes.Text then
        break
      end;
    Carteira.Add_Acao(Acao_Em_Uso)
  end;

end.
