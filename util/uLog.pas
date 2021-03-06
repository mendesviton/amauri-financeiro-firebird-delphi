{  Solicita??o    Programador         Data         Descri??o
      w12         Vitor Daniel     13/05/2022      Classes de controle de log do sistema.
}
unit uLog;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls,Vcl.Mask,uControleSQL,DB, Vcl.Imaging.jpeg,uConsts;

type
  TLOG = class
    private
      SQLGlobal:TExecSQL;
    FDataAtual: string;
      procedure pCriaObj;
      procedure pDestroiObj;
    procedure SetDataAtual(const Value: string);

    public
      {M?todos de inser??o  de log}

      procedure AddLog(prCodUsu,prCodTela,prTipoAcao,prData,prDescricao:string);
      destructor Destroy; override;
      property DataAtual:string read FDataAtual write SetDataAtual;
  end;

implementation

uses
  uUtilAmauri;
{ TLOG }

procedure TLOG.AddLog(prCodUsu, prCodTela, prTipoAcao, prData,
  prDescricao: string);
var
  wSQL:string;
begin
  pCriaObj;
     {executa a stored procedure que monta o sql de insert da tabela de tlog}
     SQLGlobal.CommandText.SQL.Clear;
     if not (prCodUsu = EmptyStr) then
     wSQL:='EXECUTE PROCEDURE '+C_SP_INSERIR_LOG+'('+prCodUsu+','+prCodTela+','+prTipoAcao+','+QuotedStr(prDescricao)+','+QuotedStr(DataAtual)+')'
     else
     wSQL:='EXECUTE PROCEDURE '+C_SP_INSERIR_LOG+'('+C_NENHUM_USUARIO+','+prCodTela+','+prTipoAcao+','+QuotedStr(prDescricao)+','+QuotedStr(DataAtual)+')';

     SQLGlobal.CommandText.CommandText:=wSQL;
     SQLGlobal.CommandText.ExecSQL;
end;

destructor TLOG.Destroy;
begin
  pDestroiObj;
  inherited;
end;

procedure TLOG.pCriaObj;
begin
  if not Assigned(SQLGlobal) then
     SQLGlobal:=TExecSQL.Create;

  DataAtual:=TUtil.FConverteDataAAAAMMDD(datetostr(date));
end;

procedure TLOG.pDestroiObj;
begin
  if  Assigned(SQLGlobal) then
     FreeAndNil(SQLGlobal);
end;

procedure TLOG.SetDataAtual(const Value: string);
begin
  FDataAtual := Value;
end;

end.
