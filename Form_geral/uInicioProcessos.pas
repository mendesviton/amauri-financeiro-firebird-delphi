{  Solicitação      Programador        Data         Descrição
    w00001          Vitor Daniel    31/03/2022      Criação das telas de processos/cadastros/lançamentos/consulta.
}
unit uInicioProcessos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles,uConexaoBanco,uControleSQL,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Menus, Vcl.ToolWin,
  Vcl.ComCtrls,uLoginPage;

type
  TfrInicioProcessos = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Usuarios1: TMenuItem;
    Relatrios1: TMenuItem;
    Consulta1: TMenuItem;
    Dadoscadastrais1: TMenuItem;
    Usurios1: TMenuItem;
    Usurios2: TMenuItem;
    tmVerificaAcesso: TTimer;
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure asdasd1Click(Sender: TObject);
    procedure tmVerificaAcessoTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FSQL:TExecSQL;
  public
    { Public declarations }
  end;

var
  frInicioProcessos: TfrInicioProcessos;
    { Métodos de controle de tela e componentes }
implementation

{$R *.dfm}

procedure TfrInicioProcessos.asdasd1Click(Sender: TObject);
begin
//  TForm1.Create(self);
end;

procedure TfrInicioProcessos.Button1Click(Sender: TObject);
begin
// showmessage('teste de herança')
end;

procedure TfrInicioProcessos.FormActivate(Sender: TObject);
begin
  Image1.Width := Screen.Width;
  Image1.Height := Screen.Height;
  tform1.Create(self).ShowModal;
end;

procedure TfrInicioProcessos.FormResize(Sender: TObject);
begin
  Image1.Width := Screen.Width;
  Image1.Height := Screen.Height
end;

procedure TfrInicioProcessos.tmVerificaAcessoTimer(Sender: TObject);
begin
//  ShowMessage('fuck');
end;

end.
