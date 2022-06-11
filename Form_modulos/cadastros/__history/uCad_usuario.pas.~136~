{ Solicitação           Data              Descrição
  w00002              16/04/2022          Criação da tela de cadastro de usuário.
}
unit uCad_usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_padrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Imaging.jpeg,uUtilAmauri, Vcl.Mask,uControleSQL,uUsuario_controler,
  Vcl.Menus, Vcl.ExtDlgs,uUsuario_DAO, Vcl.AppEvnts,uCon_usuario;

type
  TfrCad_usuario = class(TfrCad_padrao)
    PopupMenu1: TPopupMenu;
    Insiraasuafoto1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    PopupMenu2: TPopupMenu;
    qweqweqwewq1: TMenuItem;
    lbCodigo: TLabel;
    lbCPF: TLabel;
    lbEmail: TLabel;
    lbNome: TLabel;
    lbLogradouro: TLabel;
    lbNumero: TLabel;
    lbCidade: TLabel;
    lbUF: TLabel;
    mkCPF: TMaskEdit;
    edCodigo: TEdit;
    edEmail: TEdit;
    edNome: TEdit;
    Panel2: TPanel;
    Image1: TImage;
    cbLogradouro: TComboBox;
    cbUF: TComboBox;
    edNumero: TEdit;
    edRua: TEdit;
    edCidade: TEdit;
    ckSituação: TCheckBox;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    procedure cbLogradouroChange(Sender: TObject);
    procedure Insiraasuafoto1Click(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure FormataAposCarregar;
    procedure mkCPFKeyPress(Sender: TObject; var Key: Char);
    procedure mkCPFExit(Sender: TObject);
    procedure edNomeExit(Sender: TObject);
    procedure edEmailExit(Sender: TObject);
    procedure edRuaExit(Sender: TObject);
    procedure edNumeroExit(Sender: TObject);
    procedure edCidadeExit(Sender: TObject);
    procedure ckSituaçãoClick(Sender: TObject);
    procedure spLimpaCamposClick(Sender: TObject);
  private
    FValida:TUsuarioControler;
    SQLglobal:TExecSQL;
    FotoUsuario: TFileStream;
    procedure pCarregaComboUF;
    function PadronizaTamanho(Imagem: TGraphic; W, H: Integer; Tipo: TGraphicClass = nil): TGraphic;
  public

    //vitor - utilizar para carregar o usuário a partir da tela de consulta.
    procedure SelecionadoConsulta(prCodUsu:string);

  protected
     procedure pSetaComponentesTela;override;
     procedure pExcluirRegistro;override;
     procedure pGravarRegistro;override;
     procedure pCriaObj;override;
     procedure pDestroiObj;override;
     procedure pChamaConsulta;override;
  end;

var
  frCad_usuario: TfrCad_usuario;

implementation

{$R *.dfm}

procedure TfrCad_usuario.cbLogradouroChange(Sender: TObject);
begin
  inherited;

//  lbNomelogr.Caption := cbLogradouro.Text;
end;

procedure TfrCad_usuario.ckSituaçãoClick(Sender: TObject);
begin
  inherited;
  if not(ckSituação.Checked) then
     ckSituação.Caption:='Usuário inativo'
     else
     ckSituação.Caption:='Usuário ativo'

end;

procedure TfrCad_usuario.edCidadeExit(Sender: TObject);
begin
  inherited;
  if not FSubiu then
     if FValida.pValidaCidade then
        pGravarRegistro;
end;

procedure TfrCad_usuario.edCodigoExit(Sender: TObject);
begin
  inherited;
   if FValida.pValidaCodigo then
      FCODIGO:=strtoint(trim(edCodigo.Text));

end;

procedure TfrCad_usuario.edEmailExit(Sender: TObject);
begin
  inherited;
  if not (FSubiu) then
     FValida.pValidaEmail
end;

procedure TfrCad_usuario.edNomeExit(Sender: TObject);
begin
  inherited;
  if not FSubiu then
     FValida.pValidaNome;
end;

procedure TfrCad_usuario.edNumeroExit(Sender: TObject);
begin
  inherited;
  if not FSubiu then
     FValida.pValidaNumero;
end;

procedure TfrCad_usuario.edRuaExit(Sender: TObject);
begin
  inherited;
  if not FSubiu then
    FValida.pValidaNomeLocal;
end;

procedure TfrCad_usuario.FormataAposCarregar;
var
Nova:TGraphic;
begin
       Nova := PadronizaTamanho(Image1.Picture.Graphic,170,150,TJPEGImage);
       Image1.Picture.Graphic := Nova;
end;

procedure TfrCad_usuario.Insiraasuafoto1Click(Sender: TObject);
var
 Nova: TGraphic;
 jpegimg:TJPEGImage;
begin
  inherited;

  if OpenPictureDialog1.Execute then
     begin
       FotoUsuario := TFileStream.Create(OpenPictureDialog1.FileName, fmOpenRead);
       FValida.FotoUsuario      := FotoUsuario;
       jpegimg:=TJPEGImage.Create;
       jpegimg.LoadFromStream(FotoUsuario);
       Image1.Picture.Assign(jpegimg);
       Nova := PadronizaTamanho(Image1.Picture.Graphic,170,150,TJPEGImage);
       Image1.Picture.Graphic := Nova;

     end;

end;

procedure TfrCad_usuario.mkCPFExit(Sender: TObject);
begin
  inherited;
//  ShowMessage(mkCPF.Text);
  if not (FSubiu) then
     FValida.pValidaCPF;
end;

procedure TfrCad_usuario.mkCPFKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

function TfrCad_usuario.PadronizaTamanho(Imagem: TGraphic; W, H: Integer;
  Tipo: TGraphicClass): TGraphic;
var
B: TBitmap;
begin
  B := TBitmap.Create;
  try
  B.Width := W;
  B.Height := H;
  B.Canvas.StretchDraw(Rect(0, 0, W, H), Imagem);
  if Tipo = nil then
  Result := TGraphic(Imagem.ClassType.Create)
  else
  Result := Tipo.Create;
  Result.Assign(B);
  finally
  B.Free;
  end;
end;

procedure TfrCad_usuario.pCarregaComboUF;
var
I:integer;
begin
  inherited;
  if not Assigned(SQLglobal) then
     SQLglobal := TExecSQL.Create;

  SQLglobal.CommandText.SQL.Clear;
  SQLglobal.CommandText.SQL.Add('select bdnomeuf from tuf');
  SQLglobal.CommandText.Open;
  for I := 0 to SQLglobal.CommandText.RecordCount-1 do
      begin
        cbUF.AddItem(SQLglobal.CommandText.FieldByName('bdnomeuf').AsString,nil);
        SQLglobal.CommandText.Next;
      end;
  // carrega o combo com Santa Catarina Default.
  cbUF.ItemIndex := 22;
end;

procedure TfrCad_usuario.pChamaConsulta;
begin
  inherited;
  TfrCon_usuario.Create(self);
end;

procedure TfrCad_usuario.pCriaObj;
begin
  inherited;
  if not Assigned(FValida) then //   criado com TComponent de parametro pois é necessário abstrair informações a título de log.
     FValida:=TUsuarioControler.create(self);

  if not Assigned(FValida) then
     SQLglobal := TExecSQL.Create;

end;

procedure TfrCad_usuario.pDestroiObj;
begin
  inherited;
  if Assigned(SQLglobal) then
     FreeAndNil(SQLglobal);
  if Assigned(FValida) then
     FreeAndNil(FValida);
end;

procedure TfrCad_usuario.pExcluirRegistro;
begin
  inherited;
  FValida.DeleteUser;
end;

procedure TfrCad_usuario.pGravarRegistro;
begin
  inherited;
  FValida.IniciaProcesso;
end;

procedure TfrCad_usuario.SelecionadoConsulta(prCodUsu: string);
begin
  edCodigo.Text:= trim(prCodUsu);
  FValida.pValidaCodigo;
end;

procedure TfrCad_usuario.spLimpaCamposClick(Sender: TObject);
var
  jpegimg:TJPEGImage;
begin
  inherited;

  {vitor - limpa apenas a imagem, caso tenha alguma carregada, o resto dos
  componentes é limpo dinamicamente na tela de cadastro padrão.}
   jpegimg:=TJPEGImage.Create;
   Image1.Picture.Assign(jpegimg);
end;

procedure TfrCad_usuario.pSetaComponentesTela;
begin
inherited;
  FValida.edCodigo         :=edCodigo;
  FValida.edNome           :=edNome;
  FValida.edEmail          :=edEmail;
  FValida.edNomeLocal      :=edRua;
  FValida.edNumero         :=edNumero;
  FValida.edCidade         :=edCidade;
  FValida.cbLogr           :=cbLogradouro;
  FValida.cbuf             :=cbUF;
  FValida.mkCPF            :=mkCPF;
  {Valida.lbCodigoCarteira := lbCodigoCarteira;
  FValida.lbNomeCarteira   := lbNomeCarteira;
  FValida.lbEmail          := lbEmailCarteira;
  FValida.lbCPF            := lbCPFCarteira;
  FValida.lbEndereço       := lbEnderecoCarteira;
  FValida.lbCidade         := lbCidadeCarteira;
  FValida.lbEstado         := lbUFCarteira;}
  FValida.pnEdicao         := pnUsuario;
  FValida.ImageFoto        := Image1;
  FValida.ckSituacao       := ckSituação;

  { vitor - algumas configurações de tela coloquei aqui porque o padrão executa esse método no  oncreate}
  cbLogradouro.ItemIndex := 0;
  pCarregaComboUF;


end;

end.
