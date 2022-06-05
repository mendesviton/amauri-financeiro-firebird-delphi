unit uPrincipalAmauri;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uInicioProcessos, Vcl.StdCtrls,
  Vcl.Menus, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,uCad_usuario,uCon_usuario,
  uRel_usuarios,uUtilAmauri,uCad_formapgto,uCad_contas;

type
  TfrAmauriPrincipal = class(TfrInicioProcessos)
    Formasdepagamentos1: TMenuItem;
    Formasdepagamento1: TMenuItem;
    Formasdepagamento2: TMenuItem;
    Contas1: TMenuItem;
    procedure Usuarios1Click(Sender: TObject);
    procedure Usurios2Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sadsadasd1Click(Sender: TObject);
    procedure Formasdepagamentos1Click(Sender: TObject);
    procedure asdasd1Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
  private


  public

  end;

var
  frAmauriPrincipal: TfrAmauriPrincipal;

implementation

{$R *.dfm}

procedure TfrAmauriPrincipal.asdasd1Click(Sender: TObject);
begin
  inherited;

end;

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

procedure TfrAmauriPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  


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
