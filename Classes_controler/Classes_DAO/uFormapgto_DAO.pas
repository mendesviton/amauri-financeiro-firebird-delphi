unit uFormapgto_DAO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_padrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls,Vcl.Mask,uControleSQL,DB, Vcl.Imaging.jpeg,uUtilAmauri;

type
   TFormaPGTODAO = class
    private
      SQLGlobal:TExecSQL;
      function   fExistePadraoConfigurado:string;
    public
      function   getParametroPadrao(BDCOD:string):boolean;
      function   getDescricao(BDCOD:string):string;
      procedure  pInsereFormaPGTO(BDCOD,BDESCRICAO:string;BDPADRAO:boolean);
      procedure  pExluirFormaPGTO(BDCOD:string);


  end;

implementation

{

 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 | #2 class                              TControleFormaPagamentoSQL                                   |
 |                                                                                                    |
 |            this class has the function of communicating with access to payment methods data,       |
 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


}

function TFormaPGTODAO.fExistePadraoConfigurado: string;
var
 I:integer;
 wSQL:string;
 wFormaPadraoAtual:string;
 SQLGlobalAlt:TExecSQL;
begin
 SQLGlobalAlt:=TExecSQL.Create;
 try


  result:='TRUE';
  wSQL := 'select * from TFIN_FORMAPGTO pgt where pgt.bdpadrao = '+QuotedStr('TRUE');
  SQLGlobalAlt.CommandText.SQL.Clear;
  SQLGlobalAlt.CommandText.SQL.Add(wSQL);
  SQLGlobalAlt.CommandText.Open;

  if not SQLGlobalAlt.CommandText.IsEmpty then //j? existe uma forma de pagamento padr?o definida
         begin
            wFormaPadraoAtual:= SQLGlobalAlt.CommandText.FieldByName('BDDESCRICAO').AsString;
            SQLGlobalAlt.CommandText.Close;


            if MessageDlg(wFormaPadraoAtual+' ? a forma de pagamento padr?o '+#13+'              deseja substituir ?',mtConfirmation,[mbYes,mbNo],1) = mrYes then
               begin
                 wSQL:=' update  TFIN_FORMAPGTO set BDPADRAO = ''FALSE''';
                 SQLGlobalAlt.CommandText.SQL.Clear;
                 SQLGlobalAlt.CommandText.CommandText:=wSQL;
                 SQLGlobalAlt.CommandText.ExecSQL;
                 result:='TRUE';
               end
               else
               result:='FALSE';
         end;
         result:='TRUE';
 finally

   SQLGlobalAlt.Free;
 end;


end;

function TFormaPGTODAO.getDescricao(BDCOD: string): string;
var
  wSQL:String;
begin
   if not Assigned(SQLGlobal) then
     SQLGlobal:=TExecSQL.Create;
  wSQL := EmptyStr;
  wSQL := 'select * from TFIN_FORMAPGTO usu where usu.BDCODFORMAPGTO = '+trim(BDCOD);
  SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  result := SQLGlobal.CommandText.FieldByName('BDDESCRICAO').AsString

end;

function TFormaPGTODAO.getParametroPadrao(BDCOD: string): boolean;
var
  wSQL:String;
begin
   if not Assigned(SQLGlobal) then
     SQLGlobal:=TExecSQL.Create;
  wSQL := EmptyStr;
  wSQL := 'select * from TFIN_FORMAPGTO usu where usu.BDCODFORMAPGTO = '+trim(BDCOD);
  SQLGlobal.CommandText.SQL.Clear;
  SQLGlobal.CommandText.SQL.Add(wSQL);
  SQLGlobal.CommandText.Open;
  if UpperCase(SQLGlobal.CommandText.FieldByName('BDPADRAO').AsString) = UpperCase('TRUE')then
     result:=TRUE
     else
     result:=FALSE;
end;

procedure TFormaPGTODAO.pExluirFormaPGTO(BDCOD: string);
begin

end;

procedure TFormaPGTODAO.pInsereFormaPGTO(BDCOD, BDESCRICAO: string;
  BDPADRAO: boolean);
var
  wSQL:string;
begin
  if not Assigned(SQLGlobal) then
     SQLGlobal:=TExecSQL.Create;

     SQLGlobal.CommandText.SQL.Clear;

     wSQL := ' update or insert into TFIN_FORMAPGTO (BDPADRAO,BDDESCRICAO,BDCODFORMAPGTO) ';
     wSQL := wSQL + ' values (:BDPADRAO,:BDDESCRICAO,:BDCODFORMAPGTO)';
     SQLGlobal.CommandText.CommandText:=wSQL;
     SQLGlobal.CommandText.Params[0].Name :='BDPADRAO';
     if BDPADRAO then
        SQLGlobal.CommandText.Params[0].AsString := fExistePadraoConfigurado  //vitor - esse m?todo confere se ja existe forma padr?o cadastrada
        else
        SQLGlobal.CommandText.Params[0].AsString := 'FALSE';

     SQLGlobal.CommandText.Params[1].Name :='BDDESCRICAO';
     SQLGlobal.CommandText.Params[1].AsString := BDESCRICAO;
     SQLGlobal.CommandText.Params[2].Name :='BDCODFORMAPGTO';
     SQLGlobal.CommandText.Params[2].AsString := BDCOD;
     SQLGlobal.CommandText.ExecSQL;

end;


end.
