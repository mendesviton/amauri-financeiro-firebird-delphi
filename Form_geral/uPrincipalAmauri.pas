unit uPrincipalAmauri;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uInicioProcessos, Vcl.StdCtrls,
  Vcl.Menus, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,uCad_usuario,uCon_usuario,
  uRel_usuarios,uUtilAmauri,uCad_formapgto,uCad_contas,uLoginPage;

type
  TfrAmauriPrincipal = class(TfrInicioProcessos)
    Formasdepagamentos1: TMenuItem;
    Formasdepagamento1: TMenuItem;
    Formasdepagamento2: TMenuItem;
    Contas1: TMenuItem;
    dasdasd1: TMenuItem;
    procedure Usuarios1Click(Sender: TObject);
    procedure Usurios2Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure sadsadasd1Click(Sender: TObject);
    procedure Formasdepagamentos1Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
  private


  public

  end;

var
  frAmauriPrincipal: TfrAmauriPrincipal;

implementation

{$R *.dfm}

procedure TfrAmauriPrincipal.Contas1Click(Sender: TObject);
begin
  inherited;
  TfrCad_contas.Create(self).Show;
end;

procedure TfrAmauriPrincipal.Formasdepagamentos1Click(Sender: TObject);
begin
  inherited;
  TfrCad_formapgto.Create(self);
end;

procedure TfrAmauriPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if Key = #27 then Application.Terminate;
end;

procedure TfrAmauriPrincipal.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  inherited;
//  if Msg.CharCode = VK_ESCAPE then
//      if MessageDlg('Deseja realmente sair do sistema? ',mtConfirmation,[mbYes,mbNo],1) = mrYes then
//         Application.Terminate;
end;

procedure TfrAmauriPrincipal.FormShow(Sender: TObject);
begin
  inherited;
//  sleep(10);

end;

procedure TfrAmauriPrincipal.sadsadasd1Click(Sender: TObject);
begin
  inherited;
  TfrCad_formapgto.Create(self);
end;

procedure TfrAmauriPrincipal.Usuarios1Click(Sender: TObject);
begin
  inherited;
  TfrCad_usuario.Create(self);
end;

procedure TfrAmauriPrincipal.Usurios1Click(Sender: TObject);
begin
  inherited;
  TfrRel_usuario.Create(self).Show;
end;

procedure TfrAmauriPrincipal.Usurios2Click(Sender: TObject);
begin
  inherited;
  TfrCon_usuario.Create(self).Show;
end;

end.
