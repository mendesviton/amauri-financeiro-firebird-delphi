unit uLogin_controler;

interface
  uses
  uUsuario_DAO,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uControleSQL,
  Data.DB, Datasnap.Provider,Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls,Vcl.StdCtrls,uLog;

type
  TControleLogin = class
   private
    LogControl:TLOG;
    FLoginUsuarioDAO:TUsuarioLoginDAO;
    FLoginUsuario: String;
    FSenhaUsuario: String;
    function ConsistenciaCampos:boolean;
    procedure pCriaObj;
    procedure pDestroiObj;
    procedure SetLoginUsuario(const Value: String);
    procedure SetSenhaUsuario(const Value: String);


   public
    destructor Destroy; override;
    function pValidaLogin:boolean;
    constructor Create(AOwner: TComponent);
     property LoginUsuario:String read FLoginUsuario write SetLoginUsuario;
     property SenhaUsuario:String read FSenhaUsuario write SetSenhaUsuario;

   protected


end;

implementation
  uses
    uConsts,uUtilAmauri;

{ TControleLogin }

function TControleLogin.ConsistenciaCampos: boolean;
begin
 result:=true;

 if LoginUsuario = EmptyStr then
    begin
     showmessage('Login preenchido incorretamente');
     result:=false;
     exit;
    end;

 if SenhaUsuario = EmptyStr then
    begin
     showmessage('Senha preenchida incorretamente');
     result:=false;
     exit;
    end;

end;

constructor TControleLogin.Create(AOwner: TComponent);
begin
//  inherited;
  pCriaObj;

end;


destructor TControleLogin.Destroy;
begin
  pDestroiObj;
  inherited;
end;

procedure TControleLogin.pCriaObj;
begin
  if not Assigned(FLoginUsuarioDAO) then
         FLoginUsuarioDAO:=TUsuarioLoginDAO.Create;

  if not Assigned(LogControl) then
         LogControl:=TLOG.Create;
end;

procedure TControleLogin.pDestroiObj;
begin
   if Assigned(FLoginUsuarioDAO) then
       FreeAndNil(FLoginUsuarioDAO);
   if Assigned(FLoginUsuarioDAO) then
       FreeAndNil(LogControl);
end;

function TControleLogin.pValidaLogin: boolean;
begin
  try

    if ConsistenciaCampos then
       result:=FLoginUsuarioDAO.VerificaLogin(LoginUsuario,SenhaUsuario)
       else
       result:=false;

  except
     on E: Exception do
        LogControl.AddLog(EmptyStr,TUtilSQL.getCodTela(C_FRLOGIN),C_PROCESSO,datetostr(date),C_MSG_SQL_EXCEPTION + E.Message);

  end;
end;

procedure TControleLogin.SetLoginUsuario(const Value: String);
begin
  FLoginUsuario := Value;
end;

procedure TControleLogin.SetSenhaUsuario(const Value: String);
begin
  FSenhaUsuario := Value;
end;

end.
