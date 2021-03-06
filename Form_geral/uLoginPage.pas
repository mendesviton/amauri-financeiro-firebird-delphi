unit uLoginPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,uLogin_controler;

type
  TfrLogin = class(TForm)
    Panel1: TPanel;
    pnBarra: TPanel;
    sbLogar: TSpeedButton;
    lbLogin: TLabel;
    lbSenha: TLabel;
    edLogin: TEdit;
    edSenha: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure sbLogarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edSenhaExit(Sender: TObject);
  private

    FLoginControler:TControleLogin;
    FAutenticado:boolean;
    FLoginValidado: boolean;
    procedure Logar;
    procedure pSetLoginSenha;
    procedure pCriaObj;
    procedure pDestroiObj;
    procedure SetLoginValidado(const Value: boolean);
  public
    property LoginValidado:boolean read FLoginValidado write SetLoginValidado;
  end;

var
  frLogin: TfrLogin;

implementation
 uses
 uControleSQL,uUtilAmauri;

{$R *.dfm}

{ TForm1 }

procedure TfrLogin.Button1Click(Sender: TObject);
begin
  FAutenticado:=true;
end;

procedure TfrLogin.edSenhaExit(Sender: TObject);
begin
  Logar;
end;

procedure TfrLogin.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  resize:=false;
end;

procedure TfrLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //ta jaguara isso aqui
  pDestroiObj;
  if not LoginValidado then
     Application.Terminate;
end;

procedure TfrLogin.FormCreate(Sender: TObject);
begin
  pCriaObj;
end;

procedure TfrLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
     Application.Terminate;
end;

procedure TfrLogin.Logar;
begin
 pSetLoginSenha;
  if FLoginControler.pValidaLogin then
     begin
       LoginValidado:=true;
       ShowMessage('Voce logou no sistema');
       self.Close;
     end;

end;

procedure TfrLogin.pCriaObj;
begin
  if not Assigned(FLoginControler) then
         FLoginControler:=TControleLogin.Create(self);
end;

procedure TfrLogin.pDestroiObj;
begin
    if Assigned(FLoginControler) then
       FreeAndNil(FLoginControler);
end;

procedure TfrLogin.pSetLoginSenha;
begin
  FLoginControler.LoginUsuario:=trim(edLogin.Text);
  FLoginControler.SenhaUsuario:=trim(edSenha.Text);
end;

procedure TfrLogin.sbLogarClick(Sender: TObject);
begin
 Logar;
end;

procedure TfrLogin.SetLoginValidado(const Value: boolean);
begin
  FLoginValidado := Value;
end;

end.
