{ Solicitação           Data              Descrição
                      16/04/2022          Criação das classes de processos de formas de pagamento.
}
unit uFormapgto_controler;


interface
uses

   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs,  DBXFirebird, SqlExpr,  StrUtils, inifiles,Vcl.StdCtrls,
   uConexaoBanco,Vcl.Mask,uConsts,uUtilAmauri,uFormapgto_DAO,Vcl.ExtCtrls,Vcl.Graphics,Vcl.Imaging.jpeg;
 type
   TFormaPGTOControler = class
     private
        FFormasSQL:TFormaPGTODAO;
        FUtil1:TUtil;
        FedDescricao: TEdit;
        FedCodigo: TEdit;
        FckPadrao: TCheckBox;
        FpnEdicao: TPanel;
        procedure SetedDescricao(const Value: TEdit);
        procedure SetckPadrao(const Value: TCheckBox);
        procedure SetedCodigo(const Value: TEdit);
        procedure InsercaoEdição;
        procedure Inserindo;
        procedure SetpnEdicao(const Value: TPanel);
        function  pValidados:boolean;
     public

        function  IniciaProcesso:boolean;
        Function  pValidaCodigo :boolean;
        Function  pValidaDescricao   :boolean;
        destructor Destroy; override;
        property edDescricao: TEdit read FedDescricao write SetedDescricao;
        property edCodigo: TEdit read FedCodigo write SetedCodigo;
        property ckPadrao: TCheckBox read FckPadrao write SetckPadrao;
        property pnEdicao: TPanel read FpnEdicao write SetpnEdicao;

   end;

implementation
 destructor TFormaPGTOControler.Destroy;
begin
  if Assigned(FFormasSQL) then
     FFormasSQL.Destroy;

//  if Assigned(FUtil1) then
//     freeandnil(FUtil1);



  inherited;
end;

function TFormaPGTOControler.IniciaProcesso: boolean;
function DevolveZeroCodigo:string;
  begin
    if trim(edCodigo.Text) = EmptyStr then
       result:='0'
       else
       result:=trim(edCodigo.Text)

  end;
begin
   if not Assigned(FFormasSQL) then
      FFormasSQL:=TFormaPGTODAO.Create;

   if pValidados then
   begin


        FFormasSQL.pInsereFormaPGTO(DevolveZeroCodigo,edDescricao.Text,ckPadrao.Checked);

     if trim(edCodigo.Text) <> EmptyStr then
        begin
         if TUtilSQL.pExiste_registro(C_KEY_TABLE_FORMAPGTO,C_TABLENAME_TFIN_FORMAPGTO,trim(edCodigo.Text))then
           MessageDlg('Forma de pagamento'+edCodigo.Text+' - '+FFormasSQL.getDescricao(edCodigo.Text)+' inserido com sucesso!',mtConfirmation,[mbOK],1)
         end
         else
              MessageDlg('Forma de pagamento'+edCodigo.Text+' - '+trim(edDescricao.Text)+' inserido com sucesso!',mtConfirmation,[mbOK],1)
   end;
end;


procedure TFormaPGTOControler.InsercaoEdição;
var
 bdcodusu:string;
begin
       if not Assigned(FFormasSQL) then
           FFormasSQL:=TFormaPGTODAO.Create;

  bdcodusu:= trim(edCodigo.Text);
  if bdcodusu = EmptyStr then
     bdcodusu := '0';

       if TUtilSQL.pExiste_registro('BDCODFORMAPGTO','TFIN_FORMAPGTO',trim(bdcodusu)) then
          begin
            edDescricao.Text   := FFormasSQL.getDescricao(bdcodusu);//.getNumero(trim(edCodigo.Text));
            ckPadrao.Checked   := FFormasSQL.getParametroPadrao(bdcodusu);
            pnEdicao.Caption := 'Editando um registro';
            pnEdicao.Font.Color := clGreen;
          end
          else
          begin
            Inserindo;
            pnEdicao.Caption := 'Inserindo um registro';
            pnEdicao.Font.Color := clRed;
          end;
end;

procedure TFormaPGTOControler.Inserindo;
begin
  edDescricao.Clear;
  ckPadrao.Checked:=false;
end;

function TFormaPGTOControler.pValidaDescricao: boolean;
var
 I:integer;
begin
     if not Assigned(FUtil1) then
        FUtil1:=TUtil.Create;

  Result:=false;
   if not TUtilValida.pCampoPreenchido(edDescricao.Text) then
      begin
          MessageDlg('O preenchimento da descrição é obrigatório',mtError,[mbOK],1);
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
                   MessageDlg('A descrição  foi preenchido incorretamente ',mtError,[mbOK],1);
                   result:=false;
                   break
                 end
                 else
                 result:=true;
            end;

      end;
end;

function TFormaPGTOControler.pValidados: boolean;
begin
  Result := pValidaDescricao

end;

function TFormaPGTOControler.pValidaCodigo: boolean;
begin
     if not Assigned(FUtil1) then
        FUtil1:=TUtil.Create;

  Result:=false;
  if (not FUtil1.IsNumeric(edCodigo.Text)) and (TUtilValida.pCampoPreenchido(edCodigo.Text))  then
         begin
                  MessageDlg('Código preenchido incorretamente',mtError,[mbOK],1);
//                  edCodigo.Clear;
                  edCodigo.SetFocus;
         end
         else
         begin
                InsercaoEdição;
                Result:=true;  //validao
         end;
end;

procedure TFormaPGTOControler.SetckPadrao(const Value: TCheckBox);
begin
  FckPadrao := Value;
end;

procedure TFormaPGTOControler.SetedCodigo(const Value: TEdit);
begin
  FedCodigo := Value;
end;

procedure TFormaPGTOControler.SetedDescricao(const Value: TEdit);
begin
  FedDescricao := Value;
end;

procedure TFormaPGTOControler.SetpnEdicao(const Value: TPanel);
begin
  FpnEdicao := Value;
end;
end.
