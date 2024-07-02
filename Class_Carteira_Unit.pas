unit Class_Carteira_Unit;
interface

uses
System.Generics.Collections, Class_Acoes_Unit, SysUtils;


type
  TCarteira = class // Classe que armazena carteira de A��es
    private
      FCodigo: Integer; // C�digo da carteira
      FNome: String; // Nome da Carteira
      FQtd_Max_Acoes: Integer; // Quantidade M�xima de a��es poss�veis em uma carteira
      FTipo_Cart: String; // Tipo de carteira
      FAcoes: TList<TAcao>; // Lista com a��es presentes na carteira

      // Fun��es que retornam os valores da propriedade da Carteira
      function Get_Codigo: Integer;
      function Get_Nome: string;
      function Get_Qtd: Integer;
      function Get_Tipo: String;
      function Get_Acoes: TList<TAcao>;

      // Procedures que setam os valores das propriedades
      procedure Set_Codigo(ACodigo: Integer);
      procedure Set_Nome(ANome: String);
      procedure Set_Qtd(AQtd: Integer);
      procedure Set_Tipo(ATipo: String);

    public
      property Acoes: TList<TAcao> read Get_Acoes write FAcoes;
      property Codigo: Integer read Get_Codigo write Set_Codigo;
      property Nome: String read Get_Nome write Set_Nome;
      property Qtd_Max_Acoes: Integer read Get_Qtd write Set_Qtd;
      property Tipo_Cart: String read Get_Tipo write Set_Tipo;
      
      procedure Add_Acao(AAcao: TAcao); // Procedure para adicionar uma a��o a lista
      procedure Remover_Acao(AAcao: TAcao);
      function Ver_Quant_Cart: integer; // Fun��o que retorna a quantidade de itens dentro da carteira

      constructor Create(ACodigo:Integer; ANome:String; AQtd: Integer; ATipo: String);
      destructor Destroy; override;
  end;

  TCarteira_Holder = class // Classe que armazena as carteiras criadas, n�o exibida no sistema
    private
      FCarteiras: TList<TCarteira>; // Lista com as carteiras cadastradas
    public
      property Carteira: TList<TCarteira> read FCarteiras write FCarteiras;

      procedure Add_Carteira(ACarteira: TCarteira); // Procedure para adicionar uma carteira na lista
      function Ver_Quant_Cart: integer; // Fun��o que retorna a quantidade de carteiras cadastradas
      function Get_Nom_Cart(AIndex: integer): string; // Fun��o que retorna a propriedade Nome de uma carteira, sendo fornecido o c�digo
      function Get_Cod_Cart(ANome: string): integer; // Fu���o que retorna o c�digo de uma carteira, sendo fornecido o nome dela

      constructor Create;
      destructor Destroy; override;
  end;


var
  Cart_Hold: TCarteira_Holder; // Inst�ncia �nica da classe Carteira Holder, criada em Main_Unit.pas

implementation

  Constructor TCarteira.Create(ACodigo:Integer; ANome: string; AQtd: Integer; ATipo: string); // Construtor da classe carteira com suas propriedades
    begin
      Acoes := TList<TAcao>.Create;
      Codigo := ACodigo;
      Nome := ANome;
      Qtd_Max_Acoes := AQtd;
      Tipo_Cart := ATipo;
    end;

  Destructor TCarteira.Destroy;
    begin
      FAcoes.Free; // Libera a mem�ria da lista de a��o
      inherited;
    end;

  Constructor TCarteira_Holder.Create; // Construtor de Carteira Holder
    begin
      FCarteiras := TList<TCarteira>.Create; // Cria a lista de carteira
    end;

  Destructor TCarteira_Holder.Destroy;
    begin
      FCarteiras.Free;
    end;

  Procedure TCarteira.Add_Acao(AAcao: TAcao); // Fun��o para adicionar a a��o na lista de a��es de Carteira
    begin
      if (Acoes.Count < Qtd_Max_Acoes) and (Qtd_Max_Acoes > 0) then
        begin
          FAcoes.Add(AAcao);
        end
      else
        begin
          raise Exception.Create('Quantidade m�xima de a��es atingida');
        end;
    end;

  Procedure TCarteira.Remover_Acao(AAcao: TAcao);
    begin
      if Acoes.Contains(AAcao) then
        begin
          Acoes.Remove(AAcao)
        end
      else
        begin
          raise Exception.Create('A��o n�o existente na carteira');
        end;
    end;


  Procedure TCarteira.Set_Codigo(ACodigo: Integer);
    begin
      FCodigo := ACodigo;
    end;

  Procedure TCarteira.Set_Nome(ANome: string);
    begin
      FNome := ANome;
    end;

  Procedure TCarteira.Set_Qtd(AQtd: Integer);
    begin
      if AQtd >= 0 then
      begin
        FQtd_Max_Acoes := AQtd;
      end
      else
      begin
        raise Exception.Create('Quantidade de a��es nao pode ser um n�mero negativo');
      end;

    end;

  Procedure TCarteira.Set_Tipo(ATipo: string);
    begin	
      FTipo_Cart := ATipo;
    end;

// Inicio da lista de fun��es que retornam os valores das propriedades de carteira
  Function TCarteira.Get_Nome: string;
    begin
      result := FNome;
    end;

  Function TCarteira.Get_Acoes: System.Generics.Collections.TList<TAcao>;
    begin
      result := FAcoes;
    end;

  Function TCarteira.Get_Codigo: Integer;
    begin
      result := FCodigo
    end;

  Function TCarteira.Get_Qtd: Integer;
    begin
      result := FQtd_Max_Acoes;
    end;

  Function TCarteira.Get_Tipo: string;
    begin
      result := FTipo_Cart;
    end;
// Fim da lista de fun��es que retornam os valores das propriedades de carteira

  Function TCarteira.Ver_Quant_Cart: Integer; // Retorna a quantidade de a��es na lista de Carteira
    begin
      result := FAcoes.Count;
    end;

  Procedure TCarteira_Holder.Add_Carteira(ACarteira: TCarteira); // Adiciona a carteira na lista de Carteira Holder
    begin
      Carteira.Add(ACarteira)
    end;

  Function TCarteira_Holder.Ver_Quant_Cart: Integer; // Retorna a quantidade de carteira na lista de Carteira Holder
    begin
      result := Carteira.Count;
    end;

  Function TCarteira_Holder.Get_Nom_Cart(AIndex:integer): string;  // Retorna o nome da Carteira com o c�digo(index) fornecido
    begin
      result := FCarteiras[AIndex].Get_Nome;
    end;

  Function TCarteira_Holder.Get_Cod_Cart(ANome: string): Integer;  // Retorna o Index(e por consequ�ncia o c�digo) da carteira usando o nome fornecedo
    var
    i: integer;

    begin
      result := -1;
      for i := 0 to Carteira.Count - 1 do  // Itera sobre todos os itens da lista carteira
        begin
        if Carteira[i].Get_Nome = ANome then // Se o nome for igual ao fornecido
          begin
            result := i; // Retorna o indice da lista
            break;
          end;
        end;
    end;


end.
