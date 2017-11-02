unit TBGFiredacDriver.Model.Conexao;

interface

uses
  TBGConnection.Model.Interfaces, FireDAC.Comp.Client, System.Classes, Data.DB;

Type
  TFiredacDriverModelConexao = class(TInterfacedObject, iConexao)
    private
      FConnection : TFDConnection;
    public
      constructor Create(Connection : TFDConnection);
      destructor Destroy; override;
      class function New(Connection : TFDConnection) : iConexao;
      //iConexao
      function Conectar : iConexao;
      function &End: TComponent;
      function Connection : TCustomConnection;
      function StartTransaction : iConexao;
      function RollbackTransaction : iConexao;
      function Commit : iConexao;
  end;

implementation

{ TFiredacDriverModelConexao }

function TFiredacDriverModelConexao.Commit: iConexao;
begin
  Result := Self;
  FConnection.Commit;
end;

function TFiredacDriverModelConexao.Conectar: iConexao;
begin
  Result := Self;
  FConnection.Connected := true;
end;

function TFiredacDriverModelConexao.&End: TComponent;
begin
  Result := FConnection;
end;

function TFiredacDriverModelConexao.Connection: TCustomConnection;
begin
  Result := FConnection;
end;

constructor TFiredacDriverModelConexao.Create(Connection : TFDConnection);
begin
  FConnection := Connection;
end;

destructor TFiredacDriverModelConexao.Destroy;
begin

  inherited;
end;

class function TFiredacDriverModelConexao.New(Connection : TFDConnection) : iConexao;
begin
  Result := Self.Create(Connection);
end;

function TFiredacDriverModelConexao.RollbackTransaction: iConexao;
begin
  Result := Self;
  FConnection.Rollback;
end;

function TFiredacDriverModelConexao.StartTransaction: iConexao;
begin
  Result := Self;
  FConnection.StartTransaction;
end;

end.
