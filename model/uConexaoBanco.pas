{
 10/12/2021 - Vitor Daniel - Cria??o da classe uConex?oBanco
}
unit uConexaoBanco;

interface

uses

  SqlExpr, inifiles, SysUtils, Forms,uConsts;



  type
   TBDConnection = class
    wLogErro : String;
    private
     FDBConnection : TSQLConnection;
     function GetConnection : TSQLConnection;


    public
     constructor Create;
     destructor  Destroy; override;
     property BDConnection : TSQLConnection   read GetConnection;
     procedure setpathDatabase;


   end;


implementation
uses uControleSQL;

{ TBDConnection }

{                            <----- INSERIR ARQUIVO .INI NA PASTA DO EXECUT?VEL DO PROJETO ----->,
 Vitor Daniel - 10/12/2021 - implementa??o paliativa do arquivo que seta as informa?oes para a conex?o,
 mudan?as para no quando for usado um instalador, criar pastas espec?ficas na instala??o, ou criar uma arquitetura de conex?o com banco de dados via servi?o}

constructor TBDConnection.Create;
var
 ArquivoINI,
 Server,
 Path,
 DriverName,
 UserName,
 PassWord : string;
 LocalServer : Integer;
 Configuration : TIniFile;
begin
   wLogErro := EmptyStr;
   ArquivoINI := ExtractFilePath(Application.ExeName) + 'config.ini';

   if not FileExists(ArquivoINI) then
      begin
       wLogErro:=' Arquivo de Config n?o Encontrado '
      end;

   Configuration := TIniFile.Create(ArquivoINI);

    try
     Server     := Configuration.ReadString('Dados', 'Servidor',   Server);
     Path       := Configuration.ReadString('Dados', 'DataBase',   Path);
     DriverName := Configuration.ReadString('Dados', 'DriverName', DriverName);
     UserName   := Configuration.ReadString('Dados', 'UserName',   UserName);
     PassWord   := Configuration.ReadString('Dados', 'PassWord',   PassWord);
    finally
     Configuration.Free;
    end;

    try
     FDBConnection := TSQLConnection.Create(Application);
     FDBConnection.ConnectionName := 'FBConnection';
     FDBConnection.DriverName     := 'Firebird';
     FDBConnection.LibraryName    := 'dbxfb.dll';
     FDBConnection.VendorLib      := 'fbclient.dll';
     FDBConnection.GetDriverFunc  := 'getSQLDriverINTERBASE';
     FDBConnection.LoginPrompt    := false;
     FDBConnection.Connected      := False;
     FDBConnection.Params.Values['DataBase']   := Server ;
     FDBConnection.Params.Values['User_Name']  := UserName;
     FDBConnection.Params.Values['Password']   := PassWord;
     FDBConnection.Connected  := True;

    except
      wLogErro:=' Erro ao Conectar o Banco de dados. Verifique as preferencias do sistema! '

    end;
//
//    FreeAndNil(Configuration);
    setpathDatabase;

end;

destructor TBDConnection.Destroy;
begin
//   FreeAndNil(FDBConnection);
   FDBConnection.Free;
  inherited;
end;

function TBDConnection.GetConnection: TSQLConnection;
begin
   Result := FDBConnection;
end;

procedure TBDConnection.setpathDatabase;
var
FSQL:TExecSQL;
wCont:integer;
ArquivoINI    : String;
Configuration : TIniFile;
begin
  try
    ArquivoINI := ExtractFilePath(Application.ExeName) + 'config.ini';
    Configuration := TIniFile.Create(ArquivoINI);
    Configuration.WriteString('Dados','Servidor',ExtractFilePath(Application.ExeName) + C_DATABASEPATH);
  finally
    FreeAndNil(Configuration);
  end;

end;
end.
