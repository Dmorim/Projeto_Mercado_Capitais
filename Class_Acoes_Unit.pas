unit Class_Acoes_Unit;

interface
uses
  System.Generics.Collections, Class_Unit, System.RegularExpressions, SysUtils;

type
  TAcao = class
    private
      FTicket: string;
      FCotacao: Currency;
      FData_Compra: TDate;
      FIndicadores: TList<TIndicador>;

      Function Get_Ticket: string;
      Function Get_Cotacao: Currency;
      Function Get_Data_Compra: TDate;
      Function Verificar_Ticket(ATicket: string): Boolean;

      Procedure Set_Ticket(ATicket: string);
      Procedure Set_Cotacao(ACotacao: Currency);
      Procedure Set_Data_Compra(AData_Compra: TDate);

    public
      property Ticket: string read Get_Ticket write Set_Ticket;
      property Cotacao: Currency read Get_Cotacao write Set_Cotacao;
      property Data_Compra: TDate read Get_Data_Compra write Set_Data_Compra;

      property Indicadores: TList<TIndicador> read FIndicadores write FIndicadores;
      
      constructor Create(ATicket: string; ACotacao: Currency; AData_Compra:TDate);
      destructor Destroy; override;

      Procedure Add_Indicadores(AIndicador: TIndicador);
  end;

implementation

Constructor TAcao.Create(ATicket: string; ACotacao: Currency; AData_Compra:TDate);
  begin
    Ticket := ATicket;
    Cotacao := ACotacao;
    FData_Compra := AData_Compra;
    FIndicadores := TList<TIndicador>.Create;
  end;

Destructor TAcao.Destroy;
  begin
    FIndicadores.Free;
    inherited;
  end;

Function TAcao.Get_Ticket: string;
  begin
    result := FTicket;
  end;

Function TAcao.Get_Cotacao: Currency;
  begin
    result := FCotacao;
  end;

Function TAcao.Get_Data_Compra: TDate;
  begin
    result := FData_Compra;
  end;

Procedure TAcao.Set_Ticket(ATicket: string);
  begin
    if Verificar_Ticket(ATicket) then
      FTicket := ATicket
    else
      raise Exception.Create('Insira um Ticket com um formato válido');
  end;

Procedure TAcao.Set_Cotacao(ACotacao: Currency);
  begin
    if ACotacao > 0 then
      FCotacao := ACotacao
    else
      raise Exception.Create('Insira um valor válido para a Cotação')
  end;

Procedure TAcao.Set_Data_Compra(AData_Compra: TDate);
  begin
    FData_Compra := AData_Compra;
  end;

Function TAcao.Verificar_Ticket(ATicket: string): Boolean;
  begin
    Result := TRegEx.IsMatch(ATicket, '^[A-Za-z]{4}\d{2}$') or TRegEx.IsMatch(ATicket, '^[A-Za-z]{4}\d{1}$');
  end;

Procedure TAcao.Add_Indicadores(AIndicador: TIndicador);
  begin	
    Indicadores.Add(AIndicador);
  end;

end.
