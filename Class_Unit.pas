unit Class_Unit;

interface

uses
System.Generics.Collections;

type
  TIndicador = class
    private
      FNome: string;
      FValor: Double;
      FData: TDateTime;
    public
      property Nome: string read FNome write FNome;
      property Valor: Double read FValor write FValor;
      property Data: TDateTime read FData write FData;
      constructor Create(ANome: string; AValor: Double; AData: Double);
  end;


implementation
  Constructor TIndicador.Create(ANome: string; AValor: Double; AData: Double);
    begin
      FNome := ANome;
      FValor := AValor;
      FData := AData;
    end;

end.
