unit uLoginPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    pnBarra: TPanel;
    sbGravarRegistro: TSpeedButton;
    lbCodigo: TLabel;
    lbNome: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure sbGravarRegistroClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FAutenticado:boolean;
    FLoginValidado: boolean;
    function GetTrue: boolean;
    procedure SetLoginValidado(const Value: boolean);
  public
    property LoginValidado:boolean read FLoginValidado write SetLoginValidado;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  FAutenticado:=true;
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  resize:=false;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not LoginValidado then
     Application.Terminate;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
     Application.Terminate;
end;

function TForm1.GetTrue: boolean;
begin
//
end;

procedure TForm1.sbGravarRegistroClick(Sender: TObject);
begin
  LoginValidado:=true;
end;

procedure TForm1.SetLoginValidado(const Value: boolean);
begin
  FLoginValidado := Value;
end;

end.
