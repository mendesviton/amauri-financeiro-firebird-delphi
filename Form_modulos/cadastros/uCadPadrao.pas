unit uCadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.StdCtrls;

type
  TfrCadpadraoSyndico = class(TForm)
    pnFundo: TPanel;
    Bevel3: TBevel;
    btAnterior: TSpeedButton;
    btProximo: TSpeedButton;
    btConsulta: TSpeedButton;
    btExcluir: TSpeedButton;
    btRegistroAntigo: TSpeedButton;
    btStatus: TSpeedButton;
    btNovoRegistro: TSpeedButton;
    btLimpar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadpadraoSyndico: TfrCadpadraoSyndico;

implementation

{$R *.dfm}

procedure TfrCadpadraoSyndico.FormCreate(Sender: TObject);
begin
  btRegistroAntigo.Hide;
end;

end.
