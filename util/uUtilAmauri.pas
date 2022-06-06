unit uUtilAmauri;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_padrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls,Vcl.Mask,uControleSQL;

type
  TUtil = class
    private

    public
     class procedure cfDigitaTempoRealEditLabel(edDigitado:TComponent;lbEscrito:TLabel;Caption:string);
     function IsNumeric(S : String) : Boolean;
     function MessageDlg2(const prMensagem: String; prTipo: TMsgDlgType;
  prBotoes: array of TMsgDlgBtn; prCaption: Array of String;
  prBotaoDefault: integer; prHelp: LongInt): TModalResult;
      function fTamLetraPadrao2(Font: TFont; const prCaption: String): integer;
      function PadronizaTamanho(Imagem: TGraphic; W, H: Integer;
  Tipo: TGraphicClass): TGraphic;
      class function FConverteDataAAAAMMDD(prdate:String):String;
      class function ApplicationpathFR3:string;

    end;
  TUtilValida = class
    private

    public
    class function pCampoPreenchido(inputvalue:string):boolean;
    class function pValidaEmail(inputvalue:string):boolean;

  end;
  TUtilSQL = class
    private
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

function TUtil.fTamLetraPadrao2(Font: TFont; const prCaption: String): integer;
var
 wCalculaTamanho: TBitmap;
 I: integer;

begin

  wCalculaTamanho := TBitmap.Create;
  wCalculaTamanho.Canvas.Font := Font;

  Result := 0;

  for I := 1 to Length(prCaption) do
   Result := Result + wCalculaTamanho.Canvas.TextWidth(prCaption[I]);

  wCalculaTamanho.FreeImage;
  wCalculaTamanho.ReleaseHandle;

end;

function TUtil.MessageDlg2(const prMensagem: String; prTipo: TMsgDlgType;
  prBotoes: array of TMsgDlgBtn; prCaption: Array of String;
  prBotaoDefault: integer; prHelp: LongInt): TModalResult;
var
 wConta, wBotao: integer; { Vari�vel que indicar� o bot�o atual }
 wButton: TButton;
 wTamTotBotoes: integer;
 wLeft: integer;
 wIBtn: integer;
 wCjtoBtn: TMsgDlgButtons;
 wEspaco: integer;

const
 C_ESPACO = 5;

begin
 wCjtoBtn := [];
 for wIBtn := 0 to Length(prBotoes) - 1 do
  Include(wCjtoBtn, prBotoes[wIBtn]);

 wBotao := 0;
 wTamTotBotoes := 0;

 with CreateMessageDialog(prMensagem, prTipo, wCjtoBtn) do
  try
   // Ajusta o tamanho e posi��o dos bot�es
   for wConta := 0 to ComponentCount - 1 do
   begin
    if Components[wConta] is TButton then
    begin
     { Altera o Caption dos Bot�es }
     wButton := TButton(Components[wConta]);
     wButton.Width := fTamLetraPadrao2(wButton.Font, '    ' + prCaption[wBotao]
       + '    ');
     wTamTotBotoes := wTamTotBotoes + wButton.Width;
     Inc(wBotao);
    end;
   end;
   if (wTamTotBotoes + (C_ESPACO * (wBotao + 1)) + C_ESPACO) > Width then
   begin
    Width := (wTamTotBotoes + (C_ESPACO * (wBotao + 1)) + C_ESPACO);
    wEspaco := C_ESPACO;
   end
   else
   begin
    wEspaco := (Width - wTamTotBotoes) div (wBotao + 1);
   end;
   wBotao := 0;
   wLeft := wEspaco;

   for wIBtn := 0 to Length(prBotoes) - 1 do
   begin
    wConta := 0;

    while wConta <= ComponentCount - 1 do
    begin
     if Components[wConta] is TButton then
     begin
      { Altera o Caption dos Bot�es }
      wButton := TButton(Components[wConta]);

      if wButton.Name = FButtonNames[prBotoes[wIBtn]] then
      begin
       wButton.Width := fTamLetraPadrao2(wButton.Font,
         '    ' + prCaption[wBotao] + '    ');
       wButton.Left := wLeft;
       wLeft := wLeft + wButton.Width + wEspaco;
       wButton.Caption := prCaption[wBotao];
       wButton.TabOrder := wBotao;
       Inc(wBotao);

       { Faz o Bot�o ficar Default conforme o par�metro }
       if (wButton.Caption = prCaption[prBotaoDefault]) then
        ActiveControl := (Components[wConta] as TWinControl);

       Break;
      end;
     end;

     Inc(wConta);
    end;
   end;

   case prTipo of
    mtWarning:
     Caption := 'Aten��o!';
    mtError:
     Caption := 'Erro!';
    mtInformation:
     Caption := 'Informa��o!';
    mtConfirmation:
     Caption := 'Confirma��o!';
   end;
   Position := poScreenCenter;
   Result := ShowModal;
  finally
   Free;
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

