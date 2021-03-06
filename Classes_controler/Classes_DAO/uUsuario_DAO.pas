{ Solicita??o           Data              Descri??o
                     16/04/2022           Classe de acesso aos dados de usu?rio.
}
unit uUsuario_DAO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_padrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls,Vcl.Mask,uControleSQL,DB,uConsts, Vcl.Imaging.jpeg,uUtilAmauri,uLog;

type
  TUsuarioDAO = class
    private
      SQLGlobal:TExecSQL;
      LogControl:TLOG;
    public
      constructor Create;virtual;
      class function pSelectAllConsulta(prCodUsu:String = ''):string;
      procedure  pExcluiUsuario(BDCODUSU:string);
      procedure  pInsereUsuario(BDCODUSU,BDNOME,BDCPF,BDLOGR,BDRUA,BDNUMERO,BDCIDADE,BDEMAIL,BDUF:String;BDFOTOUSER:TFileStream;BDSITUACAO:boolean);
      function   fExisteUsuario(BDCODUSU:string):boolean;
      function   getNomeUsuario(BDCODUSU:string):string;
      function   getEmailUsuario(BDCODUSU:string):string;
      function   getCPF(BDCODUSU:string):string;
      function   getLogradouro(BDCODUSU:string):string;
      function   getNomeLocal(BDCODUSU:string):string;
      function   getCidade(BDCODUSU:string):string;
      function   getNumero(BDCODUSU:string):string;
      function   getCodUF(BDCODUSU:string):integer;
      function   getNomeEstadoUsuario(BDCODUSU:string):String;
      function   getFotoUsuario(BDCODUSU:string):TJPEGImage;
      function   getSituacaoUsuario(BDCODUSU:string):boolean;
      destructor Destroy; override;
    protected
      procedure pCriaObj;virtual;
      procedure pDestroiObj;virtual;
    end;
type
  TUsuarioLoginDAO = class(TUsuarioDAO)
    public
      constructor Create;override;
      function  VerificaLogin(prLogin,prSenha:string):boolean;
    protected
      procedure pCriaObj;override;
      procedure pDestroiObj;override;
    end;





implementation

{
 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 | #1 class                              TControleUsuario                                             |
 |                                                                                                    |
 |            this class has the function of communicating with access to user data,                  |
 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
}

constructor TUsuarioDAO.Create;
begin
//  inherited;
  pCriaObj;
end;

destructor TUsuarioDAO.Destroy;
begin
  pDestroiObj;
  inherited;
end;

function TUsuarioDAO.fExisteUsuario(BDCODUSU: string): boolean;
var
 wSQL:string;
begin
  wSQL := EmptyStr;
  wSQL := 'select * from tfin_tusuario usu where usu.bdcodusu = '+trim(BDCODUSU);

       SQLGlobal.CommandText.SQL.Clear;
       SQLGlobal.CommandText.SQL.Add(wSQL);
       SQLGlobal.CommandText.Open;

       if SQLGlobal.CommandText.IsEmpty then
            result:=false    //n?o existe usu?rio
            else
            result:=true;    //existe usu?rio



end;

function TUsuarioDAO.getCidade(BDCODUSU: string): string;
var
wSQL:String;
begin
  wSQL := EmptyStr;
  wSQL := 'select * from tfin_tusuario usu where usu.bdcodusu = '+trim(BDCODUSU);
  SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  result := SQLGlobal.CommandText.FieldByName('BDCIDADE').AsString
end;

function TUsuarioDAO.getCodUF(BDCODUSU: string): integer;
var
wSQL:String;
begin
  wSQL := EmptyStr;
  wSQL := 'select * from tfin_tusuario usu where usu.bdcodusu = '+trim(BDCODUSU);
   SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  result := SQLGlobal.CommandText.FieldByName('BDUF').AsInteger
end;

function TUsuarioDAO.getCPF(BDCODUSU: string): string;
var
wSQL:String;
begin
  wSQL := EmptyStr;
  wSQL := 'select * from tfin_tusuario usu where usu.bdcodusu = '+trim(BDCODUSU);
   SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  result := SQLGlobal.CommandText.FieldByName('BDCPF').AsString
end;

function TUsuarioDAO.getEmailUsuario(BDCODUSU: string): string;
var
wSQL:String;
begin
  wSQL := EmptyStr;
  wSQL := 'select * from tfin_tusuario usu where usu.bdcodusu = '+trim(BDCODUSU);
  SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  result := SQLGlobal.CommandText.FieldByName('BDEMAIL').AsString
end;

function TUsuarioDAO.getFotoUsuario(BDCODUSU: string): TJPEGImage;
var
  imagem: TJPEGImage;
  foto: TStream;
  wSQL:String;
begin
  wSQL := EmptyStr;
  wSQL := 'select * from tfin_tusuario usu where usu.bdcodusu = '+trim(BDCODUSU);
  SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  if not (SQLGlobal.CommandText.FieldByName('BDFOTOUSER').IsNull)  then
     begin
        foto:= SQLGlobal.CommandText.CreateBlobStream(SQLGlobal.CommandText.FieldByName('BDFOTOUSER'),bmRead);
        imagem := TJPEGImage.Create;
        imagem.LoadFromStream(foto);
        Result:=imagem;
     end
     else
     Result:= nil;

end;

function TUsuarioDAO.getLogradouro(BDCODUSU: string): string;
var
wSQL:String;
begin
  wSQL := EmptyStr;
  wSQL := 'select * from tfin_tusuario usu where usu.bdcodusu = '+trim(BDCODUSU);
  SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  result := SQLGlobal.CommandText.FieldByName('BDLOGR').AsString
end;

function TUsuarioDAO.getNomeEstadoUsuario(BDCODUSU: string): string;
var
wSQL:String;
begin
  wSQL := EmptyStr;
  wSQL := wSQL +' select * from tfin_tusuario usu ';
  wSQL := wSQL +' left outer join tuf uf on (uf.bdcodigo = usu.bduf)';
  wSQL := wSQL +' where usu.bdcodusu = '+trim(BDCODUSU);
  SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  result := SQLGlobal.CommandText.FieldByName('BDNOMEUF').AsString;
end;

function TUsuarioDAO.getNomeLocal(BDCODUSU: string): string;
var
wSQL:String;
begin
  wSQL := EmptyStr;
  wSQL := 'select * from tfin_tusuario usu where usu.bdcodusu = '+trim(BDCODUSU);
  SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  result := SQLGlobal.CommandText.FieldByName('BDRUA').AsString
end;

function TUsuarioDAO.getNomeUsuario(BDCODUSU: string): string;
var
wSQL:String;
begin
  wSQL := EmptyStr;
  wSQL := 'select * from tfin_tusuario usu where usu.bdcodusu = '+trim(BDCODUSU);
  SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  result := SQLGlobal.CommandText.FieldByName('BDNOME').AsString
end;

function TUsuarioDAO.getNumero(BDCODUSU: string): string;
var
wSQL:String;
begin
  wSQL := EmptyStr;
  wSQL := 'select * from tfin_tusuario usu where usu.bdcodusu = '+trim(BDCODUSU);
  SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  result := SQLGlobal.CommandText.FieldByName('BDNUMERO').AsString
end;

function TUsuarioDAO.getSituacaoUsuario(BDCODUSU: string): boolean;
var
wSQL:string;
begin
  wSQL := EmptyStr;
  wSQL := 'select * from tfin_tusuario usu where usu.bdcodusu = '+trim(BDCODUSU);
  SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  if SQLGlobal.CommandText.FieldByName('BDSITUACAO').AsString = '1' then
     result:=true
     else
     result:=false;
end;

procedure TUsuarioDAO.pCriaObj;
begin
  if not Assigned(SQLGlobal) then
         SQLGlobal:=TExecSQL.Create;

  if not Assigned(LogControl) then
         LogControl:=TLOG.Create;
end;

procedure TUsuarioDAO.pDestroiObj;
begin
   if Assigned(LogControl) then
      FreeAndNil(LogControl);

   if Assigned(SQLGlobal) then
      FreeAndNil(SQLGlobal);

end;

procedure TUsuarioDAO.pExcluiUsuario(BDCODUSU: string);
var
  wSQL:String;
begin

     SQLGlobal.CommandText.SQL.Clear;
     wSQL := wSQL + 'delete from tfin_tusuario where BDCODUSU = :BDCODUSU';
      SQLGlobal.CommandText.CommandText:=wSQL;
      SQLGlobal.CommandText.Params[0].Name :='BDCODUSU';
      SQLGlobal.CommandText.Params[0].AsInteger := StrToInt(BDCODUSU);
      SQLGlobal.CommandText.ExecSQL;


end;

procedure TUsuarioDAO.pInsereUsuario(BDCODUSU, BDNOME, BDCPF, BDLOGR,
  BDRUA, BDNUMERO, BDCIDADE, BDEMAIL, BDUF: String;BDFOTOUSER:TFileStream;BDSITUACAO:boolean);
var
  wSQL:String;
begin
     SQLGlobal.CommandText.SQL.Clear;



     wSQL := wSQL + 'update or insert into tfin_tusuario (BDCODUSU,BDNOME,BDCPF,BDLOGR,BDRUA,BDNUMERO,BDCIDADE,BDEMAIL,BDUF,BDDATAINSERCAO,BDSITUACAO';
     if not (BDFOTOUSER = nil) then
     wSQL := wSQL + ',BDFOTOUSER)'
     else
     wSQL := wSQL + ')';
     wSQL := wSQL + ' values (:BDCODUSU,:BDNOME,:BDCPF,:BDLOGR,:BDRUA,:BDNUMERO,:BDCIDADE,:BDEMAIL,:BDUF,:BDDATAINSERCAO,:BDSITUACAO';
     if not (BDFOTOUSER = nil) then
     wSQL := wSQL +  ',:BDFOTOUSER)'
     else
     wSQL := wSQL + ')';
     SQLGlobal.CommandText.CommandText:=wSQL;
     SQLGlobal.CommandText.Params[0].Name :='BDCODUSU';
     SQLGlobal.CommandText.Params[0].AsInteger := StrToInt(BDCODUSU);
     SQLGlobal.CommandText.Params[1].Name :='BDNOME';
     SQLGlobal.CommandText.Params[1].AsString := BDNOME;
     SQLGlobal.CommandText.Params[2].Name :='BDCPF';
     SQLGlobal.CommandText.Params[2].AsString := BDCPF;
     SQLGlobal.CommandText.Params[3].Name :='BDLOGR';
     SQLGlobal.CommandText.Params[3].AsString := BDLOGR;
     SQLGlobal.CommandText.Params[4].Name :='BDRUA';
     SQLGlobal.CommandText.Params[4].AsString := BDRUA;
     SQLGlobal.CommandText.Params[5].Name :='BDNUMERO';
     SQLGlobal.CommandText.Params[5].AsInteger := StrToInt(BDNUMERO);
     SQLGlobal.CommandText.Params[6].Name :='BDCIDADE';
     SQLGlobal.CommandText.Params[6].AsString := BDCIDADE;
     SQLGlobal.CommandText.Params[7].Name :='BDEMAIL';
     SQLGlobal.CommandText.Params[7].AsString:= BDEMAIL;
     SQLGlobal.CommandText.Params[8].Name :='BDUF';
     SQLGlobal.CommandText.Params[8].AsInteger:= StrToInt(BDUF);
     SQLGlobal.CommandText.Params[9].Name :='BDDATAINSERCAO';
     SQLGlobal.CommandText.Params[9].AsString:= TUtil.FConverteDataAAAAMMDD(datetostr(date));
     SQLGlobal.CommandText.Params[10].Name :='BDSITUACAO';
     if BDSITUACAO then
        SQLGlobal.CommandText.Params[10].AsString:= '1'
        else
        SQLGlobal.CommandText.Params[10].AsString:= '0';

     if not (BDFOTOUSER = nil) then
        begin
          SQLGlobal.CommandText.Params[11].Name := 'BDFOTOUSER';
          SQLGlobal.CommandText.Params[11].LoadFromStream(BDFOTOUSER,ftGraphic);
        end;
     SQLGlobal.CommandText.ExecSQL;


//  except
//     on E: Exception do
//        LogControl.AddLog(BDCODUSU,'1','1',datetostr(date), C_MSG_SQL_EXCEPTION + E.Message );



end;

class function TUsuarioDAO.pSelectAllConsulta(prCodUsu: String = ''): string;
var
 wSQL:String;
begin
 wSQL := ' select vw.*,1 as BDCHECK from VW_CAD_USUARIO vw ';
 if not (prCodUsu = EmptyStr) then
    wSQL := wSQL + ' where vw.bdcodusu ='+ Trim(prCodUsu);
 result:=wSQL;
end;

{
 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 | #2 class                   TControleUsuario  extends TUsuarioDAO                                           |
 |                                                                                                    |
 |            this class has the function of communicating with access to loginuser data,                  |
 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
}

constructor TUsuarioLoginDAO.Create;
begin
  inherited;

end;

procedure TUsuarioLoginDAO.pCriaObj;
begin
  inherited;
//  if not Assigned(SQLGlobal) then
//         SQLGlobal:=TExecSQL.Create;
//
//  if not Assigned(LogControl) then
//         LogControl:=TLOG.Create;
end;

procedure TUsuarioLoginDAO.pDestroiObj;
begin
  inherited;
//   if Assigned(LogControl) then
//      FreeAndNil(LogControl);
//
//   if Assigned(SQLGlobal) then
//      FreeAndNil(SQLGlobal);
end;

function TUsuarioLoginDAO.VerificaLogin(prLogin,prSenha:string): boolean;
var
  wSQL:String;
begin
  wSQL := EmptyStr;
     result:=true;

       wSQL := 'SELECT * FROM TSIS_LOGIN WHERE UPPER(BDLOGINUSU) = ' + QuotedStr(UpperCase(prLogin));
       SQLGlobal.CommandText.SQL.Clear;
       SQLGlobal.CommandText.SQL.Add(wSQL);
       SQLGlobal.CommandText.Open;

       if SQLGlobal.CommandText.IsEmpty then
           begin
             ShowMessage('Login incorreto, tente novamente');
             result := false; // n?o existe login ou foi digitado errado
             exit
           end;

       if not ((UpperCase(SQLGlobal.CommandText.FieldByName('BDSENHAUSU').AsString)) = (UpperCase(prSenha))) then
           begin
             ShowMessage('Senha incorreta,tente novamente');
             result := false; // senha digitada incorretamente
             exit
           end;

end;

end.
