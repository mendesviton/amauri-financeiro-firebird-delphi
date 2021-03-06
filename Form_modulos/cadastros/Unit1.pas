unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_padrao, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls,uContas_controler;

type
  TfrCad_contas = class(TfrCad_padrao)
    lbNome: TLabel;
    lbCodigo: TLabel;
    edTipo: TEdit;
    ckPadrao: TCheckBox;
    edCodigo: TEdit;
    Label1: TLabel;
    edDescricao: TEdit;
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

  FValida.edTipo        := edTipo;
  FValida.edDescricao   := edDescricao;
  FValida.edCodigo      := edCodigo;
  FValida.ckPadrao      := ckPadrao;
end;

end.
