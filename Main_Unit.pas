unit Main_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  List_Carteira_Unit, List_Acoes_Unit, Class_Carteira_Unit;

type
  TFRM_Main = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    BTT_CART: TButton;
    BTTT_ACOES: TButton;
    Tool_Sep_1: TToolButton;
    Tool_Sep_2: TToolButton;
    BTT_Comp: TButton;
    Tool_Sep_3: TToolButton;
    BTT_Opc: TButton;
    procedure BTT_CARTClick(Sender: TObject);
    procedure BTTT_ACOESClick(Sender: TObject);
    procedure Create_Cart_Holder(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FRM_Main: TFRM_Main;


implementation
    {$R *.dfm}

procedure TFRM_Main.BTTT_ACOESClick(Sender: TObject); // Procedure para abrir o Form de A��es
  var FRM_List_Acoes: TFRM_List_Acoes;
begin
  FRM_List_Acoes := TFRM_List_Acoes.Create(nil);
  try
    FRM_List_Acoes.ShowModal;
  finally
    FRM_List_Acoes.free;
  end;
end;

procedure TFRM_Main.BTT_CARTClick(Sender: TObject); // Procedure para abrir o Form de Carteira
begin
  FRM_List_Cart := TFRM_List_Cart.Create(nil);
  try
    FRM_List_Cart.ShowModal;
  finally
    FRM_List_Cart.free;
  end;
end;

procedure TFRM_Main.Create_Cart_Holder(Sender: TObject); // Cria��o da Inst�ncia �nica de Cart_Hold para armazenar as carteiras criadas
  begin
    Cart_Hold := TCarteira_Holder.Create;
  end;

end.

{
Programa para utiliza��o nas aulas de Mercado de Capitais, cadeira optativa do curso de ci�ncias econ�micas da Universidade Regional do Cariri
A fun��o para esse programa ser� de armazenar a��es bom como os valores de seus fundamntos, ele tamb�m ir� comparar fundamentos da mesma a��o em per�odos distintos e comparar fundamentos entre a��es
A ideia � que o programa requira ao usu�rio a inser��o da a��o que ele deseja acompanhar, bem como a inser��o dos indicadores fundamentalistas atrelados a ela
O programa ter� um carteira que ir� salvar as a��es inseridas pelo usu�rio para futuras consultas
As a��es listar�o os indicadores fundamentalistas que foram inseridos nelas para compara��o
Os indicadores fundamentalistas s� poder�o ser preenchidos trimestralmente
}

