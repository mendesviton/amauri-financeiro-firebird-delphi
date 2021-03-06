unit uUtilAmauri;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_padrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls,Vcl.Mask,uControleSQL;

type
  TUtil = class
    public
      class procedure cfDigitaTempoRealEditLabel(edDigitado:TComponent;lbEscrito:TLabel;Caption:string);
      function IsNumeric(S : String) : Boolean;
      class function FConverteDataAAAAMMDD(prdate:String):String;
      class function ApplicationpathFR3:string;

       function PadronizaTamanho(Imagem: TGraphic; W, H: Integer;
       Tipo: TGraphicClass): TGraphic;

      class function GetDescriptografa(prSenha:String):String;
      class function GetCriptografa(prSenha:String):String;

    end;

  TUtilValida = class
    public
    class function pCampoPreenchido(inputvalue:string):boolean;
    class function pValidaEmail(inputvalue:string):boolean;

  end;
  TUtilSQL = class
    public
      class function getCodTela(prNomeForm:string):string;
      class function pExiste_registro(prCampochave,prTabela,prValor:String):boolean;

  end;
    var
  FButtonNames: array [TMsgDlgBtn] of string = (
  'Yes',
  'No',
  'OK',
  'Cancel',
  'Abort',
  'Retry',
  'Ignore',
  'All',
  'NoToAll',
  'YesToAll',
  'Help'{$IFNDEF VER150},
  'Close'{$ENDIF});

implementation




{ TUtil }

class function TUtil.ApplicationpathFR3: string;
begin
  result:= ExtractFilePath(Application.ExeName)+'fr3\';
end;

class procedure TUtil.cfDigitaTempoRealEditLabel(edDigitado: TComponent; lbEscrito: TLabel;Caption:string);
begin
  if edDigitado is TMaskEdit then
     lbEscrito.Caption:= Caption + TMaskEdit(edDigitado).Text;
  if edDigitado is TEdit then
     lbEscrito.Caption:= Caption + TEdit(edDigitado).Text;
  if edDigitado is TComboBox then
     lbEscrito.Caption:= Caption + TComboBox(edDigitado).Text;
end;

function TUtil.IsNumeric(S: String): Boolean;
begin
  Result := True;
  Try
     StrToInt(S);
  Except
  Result := False;
end;
end;

function TUtil.PadronizaTamanho(Imagem: TGraphic; W, H: Integer;
  Tipo: TGraphicClass): TGraphic;
var
B: TBitmap;
begin
  B := TBitmap.Create;
  try
  B.Width := W;
  B.Height := H;
  B.Canvas.StretchDraw(Rect(0, 0, W, H), Imagem);
  if Tipo = nil then
  Result := TGraphic(Imagem.ClassType.Create)
  else
  Result := Tipo.Create;
  Result.Assign(B);
  finally
  B.Free;
  end;
end;


class function TUtil.FConverteDataAAAAMMDD(prdate: String): String;
var
  wMes:string;
  wDia:String;
  wAno:String;
begin
 //vitor - 03/05/2022 - retorna a data para o formato do firebird AAAA/MM/DD
 wDia := Copy(prdate,0,2);
 wMes := Copy(prdate,4,2);
 wAno := Copy(prdate,7,4);

 result:=(wAno+'/'+wMes+'/'+wDia)
end;



Class function TUtil.GetCriptografa(prSenha:String): String;
var
  wTexto               : String;
  wContador, wContaPos : LongInt;
  wSinal               : Boolean;

Begin
   wTexto    := EmptyStr;
   wSinal    := True;
   wContaPos := Length(prSenha);

   for wContador:= 1 to Length(prSenha) do
     begin
       if wSinal Then
          wTexto := wTexto + Chr(Ord(prSenha[wContaPos])+1)
       else
          wTexto := wTexto + Chr(Ord(prSenha[wContaPos])-1);

       wContaPos := (wContaPos-1);
       wSinal:= Not wSinal;
     end;

   Result := wTexto;
end;

class function TUtil.GetDescriptografa(prSenha: string): String;
var
  wTexto               : String;
  wContador, wContaPos : LongInt;
  wSinal               : Boolean;
  wInt                 : integer;

  function GetParImpar(FValor:integer): Boolean;
begin
  Result := ((FValor Mod 2) = 0);
end;

Begin
   wTexto    := EmptyStr;
   wInt      := Length(prSenha);
   wSinal    := GetParImpar(wInt);
//   FreeAndNil(wInt);
   wContaPos := Length(prSenha);

   for wContador := Length(prSenha) DownTo 1 do
   Begin
     If wSinal then
        wTexto:= wTexto + Chr(Ord(prSenha[wContaPos])+1)
     else
        wTexto:= wTexto + Chr(Ord(prSenha[wContaPos])-1);

     wContaPos:= (wContaPos-1);
     wSinal:= Not wSinal;
   End;

   Result := wTexto;

end;

{ TUtilValida }

class function TUtilValida.pValidaEmail(inputvalue: string): boolean;
begin
    inputvalue := Trim(UpperCase(inputvalue));
  if Pos('@', inputvalue) > 1 then begin
    Delete(inputvalue, 1, pos('@', inputvalue));
    Result := (Length(inputvalue) > 0) and (Pos('.', inputvalue) > 2) and (Pos(' ', inputvalue) = 0);
  end
  else
  begin
    Result := False;
  end;
end;

class function TUtilValida.pCampoPreenchido(inputvalue: string):boolean;
begin
  if trim(inputvalue) = EmptyStr then
     result:=false
     else
     result:=true;
end;

{ TUtilSQL }

class function TUtilSQL.getCodTela(prNomeForm: string): string;
var
  sqlGlobal:TExecSQL;
  wSQL:string;
  begin
  Result:=EmptyStr;

  if (prNomeForm = EmptyStr) then
      Exit;

  try
      sqlGlobal:=TExecSQL.Create;
      wSQL:= 'SELECT * FROM TSIS_TELAS WHERE UPPER(BDNOMEFORM) LIKE UPPER('+QuotedStr('%'+prNomeForm+'%')+')';
      sqlGlobal.CommandText.SQL.Clear;
      sqlGlobal.CommandText.SQL.Add(wSQL);
      sqlGlobal.CommandText.Open;
      if not sqlGlobal.CommandText.IsEmpty then
         Result:=sqlGlobal.CommandText.FieldByName('BDCODTELA').AsString

  finally
     FreeAndNil(sqlGlobal);
  end

end;

class function TUtilSQL.pExiste_registro(prCampochave, prTabela,
  prValor:string): boolean;
var
sqlGlobal:TExecSQL;
wSQL:string;
begin
  Result:=false;
  if (prValor = EmptyStr) then
      Exit;


  try
    sqlGlobal:=TExecSQL.Create;
    wSQL:= 'SELECT * FROM '+ prTabela + ' WHERE '+prCampochave+' = '+prValor;
    sqlGlobal.CommandText.SQL.Clear;
    sqlGlobal.CommandText.SQL.Add(wSQL);
    sqlGlobal.CommandText.Open;
    if not sqlGlobal.CommandText.IsEmpty then
       begin
         Result:=true;
       end;
  finally
     FreeAndNil(sqlGlobal);
  end

end;

end.

