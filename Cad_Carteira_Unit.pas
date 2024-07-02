unit Cad_Carteira_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Class_Carteira_Unit;

type
  TFRM_Cad_Cart = class(TForm)
    EDT_Nom_Cart: TEdit;
    EDT_Qtd_Acoes: TEdit;
    EDT_Tipo_Cart: TEdit;
    LBL_Nom_Cart: TLabel;
    LBL_Tipo_Cart: TLabel;
    LBL_Qtd_Acoes: TLabel;
    BTN_Confirm: TBitBtn;
    BTN_Cance: TBitBtn;
    LBL_Cod_Cart: TLabel;
    Edt_Cod_Cart: TEdit;
    procedure BTN_CanceClick(Sender: TObject);
    procedure Get_Cart_val(Sender: TObject);
    procedure BTN_ConfirmClick(Sender: TObject);
    procedure Modo_Edicao(Sender: TObject);
    procedure Ini_Form(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Cad_Cart: TFRM_Cad_Cart;
  Tipo_Janela: Boolean; // False para Inserir, True para Editar
  Carteira_Em_Uso: TCarteira; // Carteira que será editada

implementation

procedure TFRM_Cad_Cart.Get_Cart_Val(Sender: TObject); // Seta o código com o valor do próximo item da carteira
  begin
    Edt_Cod_Cart.Text := inttostr(Cart_Hold.Ver_Quant_Cart + 1);
  end;

procedure TFRM_Cad_Cart.Modo_Edicao(Sender: TObject); // Pega o valor das propriedades da carteira e preenche os edits com ela
  begin
      Edt_Cod_Cart.Text := inttostr(Carteira_Em_Uso.Codigo);
      EDT_Nom_Cart.Text := Carteira_Em_Uso.Nome;
      EDT_Qtd_Acoes.Text := inttostr(Carteira_Em_Uso.Qtd_Max_Acoes);
      EDT_Tipo_Cart.Text := Carteira_Em_Uso.Tipo_Cart;
  end;

procedure TFRM_Cad_Cart.Ini_Form(Sender: TOBject); // De acordo com o Tipo_Janela fornecido, definirá se executará a função de novo código ou de preenchimento de dados da carteira
  begin
    if Tipo_Janela then
      Modo_Edicao(Sender)
    else
      Get_Cart_val(Sender)
  end;
{$R *.dfm}

procedure TFRM_Cad_Cart.BTN_CanceClick(Sender: TObject); // Procedure para fechar o Form no botão de Cancelar
  begin
    Close;
  end;

procedure TFRM_Cad_Cart.BTN_ConfirmClick(Sender: TObject); // Procedure do botão de Confirmar
var Cart: TCarteira;
  begin
    if (EDT_Nom_Cart.Text <> '') and (EDT_Qtd_Acoes.Text <> '') and (EDT_Tipo_Cart.Text <> '') then // Verifica se todos os itens estão preenchidos
      if Tipo_Janela then // Verifica se a janela está em modo edição
        begin
          // Altera os valores da Carteira em Uso para os que estão nos Edits
          Carteira_Em_Uso.Nome := EDT_Nom_Cart.Text;
          Carteira_Em_Uso.Qtd_Max_Acoes := strtoint(EDT_Qtd_Acoes.Text);
          Carteira_Em_Uso.Tipo_Cart := EDT_Tipo_Cart.Text;
          // Exibe uma mensagem de sucesso e fecha o form
          ShowMessage('Carteira Editada com Sucesso');
          Close;
        end
      else  // Se estiver em modo cadastro
        begin
          // Cria a instância de TCarteira
          Cart := TCarteira.Create(Cart_Hold.Ver_Quant_Cart + 1, EDT_Nom_Cart.Text, strtoint(EDT_Qtd_Acoes.Text), EDT_Tipo_Cart.Text);
          Cart_Hold.Add_Carteira(Cart); // Adicioa a instância na lista de Cart_Hold
          ShowMessage('Carteira cadastrada com sucesso'); // Exibe a mensagem de sucesso
          Close; // Fecha o Form
        end
    else // Caso algum dos itens não esteja preenchido
      begin
        ShowMessage('Há campos em branco, tente novamente')
      end;


end;

end.
