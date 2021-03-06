unit uCad_formapgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_padrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,uFormapgto_DAO,uFormapgto_controler;

type
  TfrCad_formapgto = class(TfrCad_padrao)
    edDescricao: TEdit;
    ckPadrao: TCheckBox;
    edCodigo: TEdit;
    lbNome: TLabel;
    lbCodigo: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Edit2: TEdit;
    Panel3: TPanel;
    procedure edDescricaoExit(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
  private
     FormaPGTOSQL:TFormaPGTODAO;
     FValida:TFormaPGTOControler;

  public

  protected
    procedure pSetaComponentesTela;override;
    procedure pExcluirRegistro;override;
    procedure pGravarRegistro;override;
    procedure pCriaObj;override;
    procedure pDestroiObj;override;

  end;

var
  frCad_formapgto: TfrCad_formapgto;

implementation

{$R *.dfm}

procedure TfrCad_formapgto.edCodigoExit(Sender: TObject);
begin
  inherited;
  FValida.pValidaCodigo;
end;

procedure TfrCad_formapgto.edDescricaoExit(Sender: TObject);
begin
  inherited;
if not FSubiu then
  if FValida.pValidaDescricao then
     pGravarRegistro
end;

procedure TfrCad_formapgto.pCriaObj;
begin
  inherited;
  if not Assigned(FValida)  then
         FValida:=TFormaPGTOControler.Create;
end;

procedure TfrCad_formapgto.pDestroiObj;
begin
  inherited;
   if Assigned(FValida) then
      FreeAndNil(FValida)

end;

procedure TfrCad_formapgto.pExcluirRegistro;
begin
  inherited;
  //FValida.deleta
end;

procedure TfrCad_formapgto.pGravarRegistro;
begin
  inherited;
  FValida.IniciaProcesso
end;

procedure TfrCad_formapgto.pSetaComponentesTela;
begin
  inherited;
  FValida.pnEdicao := pnUsuario;
  FValida.edDescricao:=edDescricao;
  FValida.edCodigo:=edCodigo;
  FValida.ckPadrao:=ckPadrao;

  ckPadrao.Checked:=false;
end;

end.
