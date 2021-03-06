unit uCad_contas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_padrao, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls,uContas_controler,uCad_formapgto;

type
  TfrCad_contas = class(TfrCad_padrao)
    lbCodigo: TLabel;
    ckPadrao: TCheckBox;
    edCodigo: TEdit;
    lbDescricao: TLabel;
    edDescricao: TEdit;
    lbNome: TLabel;
    edNome: TEdit;
    sbFormaPgto: TSpeedButton;
    procedure spLimpaCamposClick(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
  private
    FValida:TContasControler;
  public
    { Public declarations }
  protected
    procedure pSetaComponentesTela;override;
    procedure pExcluirRegistro;override;
    procedure pGravarRegistro;override;
    procedure pCriaObj;override;
    procedure pDestroiObj;override;

  end;
var
  frCad_contas: TfrCad_contas;

implementation

{$R *.dfm}

{ TfrCad_contas }

procedure TfrCad_contas.edCodigoExit(Sender: TObject);
begin
  inherited;
  FValida.pValidaCodigo;
end;

procedure TfrCad_contas.pCriaObj;
begin
  inherited;
  if not Assigned(FValida) then
     FValida:=TContasControler.Create;
end;

procedure TfrCad_contas.pDestroiObj;
begin
   inherited;
    if Assigned(FValida) then
       FreeAndNil(FValida);
end;

procedure TfrCad_contas.pExcluirRegistro;
begin
  inherited;

end;

procedure TfrCad_contas.pGravarRegistro;
begin
  inherited;

end;

procedure TfrCad_contas.pSetaComponentesTela;
begin
  inherited;

  FValida.edTipo        := edNome;
  FValida.edDescricao   := edDescricao;
  FValida.edCodigo      := edCodigo;
  FValida.ckPadrao      := ckPadrao;
  FValida.pnEdicao      := pnUsuario;
end;

procedure TfrCad_contas.spLimpaCamposClick(Sender: TObject);
begin
  inherited;
  TfrCad_formapgto.Create(self).Show;
end;

end.
