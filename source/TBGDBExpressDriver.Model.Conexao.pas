unit TBGDBExpressDriver.Model.Conexao;

interface

uses
  TBGConnection.Model.Interfaces, System.Classes,
  Data.SqlExpr, Data.DB, Data.DBXCommon;

Type
  TDBExpressDriverModelConexao = class(TInterfacedObject, iConexao)
    private
      FConnection : TSQLConnection;
      FTrans: TDBXTransaction;
    public
      constructor Create(Connection : TSQLConnection);
      destructor Destroy; override;
      class function New(Connection : TSQLConnection) : iConexao;
      //iConexao
      function Conectar : iConexao;
      function &End: TComponent;
      function Connection : TCustomConnection;
      function StartTransaction : iConexao;
      function RollbackTransaction : iConexao;
      function Commit : iConexao;
  end;

implementation

uses
  System.SysUtils;

{ TDBExpressDriverModelConexao }

function TDBExpressDriverModelConexao.Commit: iConexao;
begin
  Result := Self;
  FConnection.CommitFreeAndNil(FTrans);
end;

function TDBExpressDriverModelConexao.Conectar: iConexao;
begin
  Result := Self;
  FConnection.Connected := true;
end;

function TDBExpressDriverModelConexao.&End: TComponent;
begin
  Result := FConnection;
end;

function TDBExpressDriverModelConexao.Connection: TCustomConnection;
begin
  Result := FConnection;
end;

constructor TDBExpressDriverModelConexao.Create(Connection : TSQLConnection);
begin
  FConnection := Connection;
end;

destructor TDBExpressDriverModelConexao.Destroy;
begin

  inherited;
end;

class function TDBExpressDriverModelConexao.New(Connection : TSQLConnection) : iConexao;
begin
  Result := Self.Create(Connection);
end;

function TDBExpressDriverModelConexao.RollbackTransaction: iConexao;
begin
  Result := Self;
  FTrans := FConnection.BeginTransaction;
end;

function TDBExpressDriverModelConexao.StartTransaction: iConexao;
begin
  Result := Self;
  FConnection.RollbackFreeAndNil(FTrans);
end;

end.
