program Mercado_De_Capitais;

uses
  Vcl.Forms,
  Main_Unit in 'Main_Unit.pas' {FRM_Main},
  List_Carteira_Unit in 'List_Carteira_Unit.pas' {FRM_List_Cart},
  List_Acoes_Unit in 'List_Acoes_Unit.pas' {FRM_List_Acoes},
  Class_Unit in 'Class_Unit.pas',
  Cad_Carteira_Unit in 'Cad_Carteira_Unit.pas' {FRM_Cad_Cart},
  Class_Carteira_Unit in 'Class_Carteira_Unit.pas',
  Class_Acoes_Unit in 'Class_Acoes_Unit.pas',
  Cad_Acoes_Unit in 'Cad_Acoes_Unit.pas' {FRM_Cadastro_Acoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRM_Main, FRM_Main);
  Application.CreateForm(TFRM_Cadastro_Acoes, FRM_Cadastro_Acoes);
  Application.Run;
end.
