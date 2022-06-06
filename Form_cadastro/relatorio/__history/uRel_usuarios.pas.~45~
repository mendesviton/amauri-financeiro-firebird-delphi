unit uRel_usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRel_Padrao, Vcl.Menus, frxClass,
  frxDBSet, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, frxExportPDF,
  frxExportDOCX, frxExportCSV,uUtilAmauri;

type
  TfrRel_usuario = class(Tfr_RelPadrao1)
    Panel1: TPanel;
    pnUsuario: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    edCodigo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
     FSelecionados:TStringList;
     function getFiltroSelecionados:String;

  public
    { Public declarations }
  protected
     procedure setFilePath;override;
     procedure setSQL;override;
  end;

var
  frRel_usuario: TfrRel_usuario;

implementation

uses
  uCon_usuario;
{$R *.dfm}

procedure TfrRel_usuario.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  inherited;
  //
end;

procedure TfrRel_usuario.FormCreate(Sender: TObject);
begin
  inherited;
  // vitor -  utiliza pra criar o filtro do sql
  if Owner is TfrCon_usuario  then
     begin
       FSelecionados:=TfrCon_usuario(Owner).FSelecionado;
     end;
end;

function TfrRel_usuario.getFiltroSelecionados: String;
var
  wSQL:String;
  I:integer;
begin
  result:=EmptyStr;
  wSQL:= EmptyStr;
  if Assigned(FSelecionados) then
     if (FSelecionados.Count > 0) then
         begin
          //vitor selecionados da tela anterior
          for I := 0 to FSelecionados.Count-1 do
              begin
               wSQL:= wSQL+ FSelecionados[I] + ','
              end;
          result:=(' where vwusu.bdcodusu in('+copy(wSQL,1,(Length(wSQL)-1))+')');
         end;

end;


procedure TfrRel_usuario.setFilePath;
begin
  // vitor - diretório que criei o arquivo pelo componente.
  fr3FilePath:=TUtil.ApplicationpathFR3+'Cadastra.fr3';

end;

procedure TfrRel_usuario.setSQL;
var
wSQL:string;
begin
  FSQL:=EmptyStr;
 wSQL := 'select * from VW_CAD_USUARIO vwusu';
 wSQL := wSQL + getFiltroSelecionados;

// if FiltroUsuario <> EmptyStr then
// wSQL :=wSQL + 'where bdcodusu in ('+FiltroUsuario+')';

 fSQL:=wSQL;

end;

end.
