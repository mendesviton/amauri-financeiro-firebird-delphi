{ Solicita??o           Data              Descri??o
                      16/04/2022          Cria??o das classes de processos de contas.
}
unit uContas_controler;

interface
  uses

   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs,  DBXFirebird, SqlExpr,  StrUtils, inifiles,Vcl.StdCtrls,
   uConexaoBanco,Vcl.Mask,uConsts,uUtilAmauri,uFormapgto_DAO,uContasDAO,Vcl.ExtCtrls,Vcl.Graphics,Vcl.Imaging.jpeg;
type
  TContasControler = class
    private
        FedDescricao: TEdit;
        FedCodigo: TEdit;
        FpnEdicao: TPanel;
        FckPadrao: TCheckBox;
        FedTipo: tedit;
        FUtil:TUtil;
        FDAOContas:TContasDAO;
        procedure SetckPadrao(const Value: TCheckBox);
        procedure SetedCodigo(const Value: TEdit);
        procedure SetedDescricao(const Value: TEdit);
        procedure SetpnEdicao(const Value: TPanel);
        procedure SetedTipo(const Value: tedit);
        procedure pCriaObj;
        procedure pDestroiObj;
        procedure InsercaoEdi??o;

    public
        function  IniciaProcesso:boolean;
        Function  pValidaCodigo :boolean;
        Function  pValidaDescricao   :boolean;
        property edTipo:tedit read FedTipo write SetedTipo;
        property edDescricao: TEdit read FedDescricao write SetedDescricao;
        property edCodigo: TEdit read FedCodigo write SetedCodigo;
        property ckPadrao: TCheckBox read FckPadrao write SetckPadrao;
        property pnEdicao: TPanel read FpnEdicao write SetpnEdicao;
    published
  end;

implementation

{ TContasControler }

function TContasControler.IniciaProcesso: boolean;
begin

end;

procedure TContasControler.InsercaoEdi??o;
var
 bdcodusu:string;
begin
  pCriaObj;

  { vitor - 28/05/2022 - tratado se o edit esta vazio
    dentro do m?todo n?o ? mais necess?rio fazer esse
    tipo de coisa.

  bdcodusu:= trim(edCodigo.Text);
  if bdcodusu = EmptyStr then
     bdcodusu := '0';}

       if TUtilSQL.pExiste_registro(C_KEY_TABLE_CONTAS,C_TABLENAME_TFIN_TCONTAS,trim(edCodigo.Text)) then
          begin
//            edDescricao.Text   := FDAOContas.getDescricao(bdcodusu);
//            ckPadrao.Checked   := FDAOContas.getParametroPadrao(bdcodusu);
            MessageDlg('Parou de implementar por aqui ',mtError,[mbOK],1);
            pnEdicao.Caption := 'Editando um registro';
            pnEdicao.Font.Color := clGreen;
          end
          else
          begin
            MessageDlg('Parou de implementar por aqui ',mtError,[mbOK],1);
//            Inserindo
            pnEdicao.Caption := 'Inserindo um registro';
            pnEdicao.Font.Color := clRed;
          end;
end;

procedure TContasControler.pCriaObj;
begin
    if not Assigned(FDAOContas) then
        FDAOContas:=TContasDAO.Create;

     if not Assigned(FUtil) then
        FUtil:=TUtil.Create;

end;

procedure TContasControler.pDestroiObj;
begin

end;

function TContasControler.pValidaCodigo: boolean;
begin
  pCriaObj;

  Result:=false;
  if (not FUtil.IsNumeric(edCodigo.Text)) and (TUtilValida.pCampoPreenchido(edCodigo.Text))  then
         begin
                  MessageDlg('C?digo preenchido incorretamente',mtError,[mbOK],1);
//                  edCodigo.Clear;
                  edCodigo.SetFocus;
         end
         else
         begin
                InsercaoEdi??o;
                Result:=true;  //validao
         end;

end;

function TContasControler.pValidaDescricao: boolean;
  var
 I:integer;
begin

  pCriaObj;


  Result:=false;
   if not TUtilValida.pCampoPreenchido(edDescricao.Text) then
      begin
          MessageDlg('O preenchimento da descri??o ? obrigat?rio',mtError,[mbOK],1);
          //edNome.SetFocus
          edDescricao.SetFocus;
      end
      else
      begin
        for I := 0 to length(edDescricao.Text) do
            begin
              if (edDescricao.Text[I] in  ['0'..'9']) then
                 begin
                   edDescricao.SetFocus;
                   MessageDlg('A descri??o  foi preenchido incorretamente ',mtError,[mbOK],1);
                   result:=false;
                   break
                 end
                 else
                 result:=true;
            end;

      end;
end;

procedure TContasControler.SetckPadrao(const Value: TCheckBox);
begin
  FckPadrao := Value;
end;

procedure TContasControler.SetedCodigo(const Value: TEdit);
begin
  FedCodigo := Value;
end;

procedure TContasControler.SetedDescricao(const Value: TEdit);
begin
  FedDescricao := Value;
end;

procedure TContasControler.SetedTipo(const Value: tedit);
begin
  FedTipo := Value;
end;

procedure TContasControler.SetpnEdicao(const Value: TPanel);
begin
  FpnEdicao := Value;
end;

end.
