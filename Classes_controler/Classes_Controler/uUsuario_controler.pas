{ Solicita??o           Data              Descri??o
                      16/04/2022          Cria??o das classes de processos de usu?rio.
    w6                28/08/2022          https://trello.com/c/1Kyt5dtP/21-w6-controle-edi%C3%A7%C3%A3o-inser%C3%A7%C3%A3o
}
unit uUsuario_controler;


interface
uses

   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs,  DBXFirebird, SqlExpr,  StrUtils, inifiles,Vcl.StdCtrls,
   uConexaoBanco,Vcl.Mask,uConsts,uUtilAmauri,uUsuario_DAO,Vcl.ExtCtrls,Vcl.Graphics,Vcl.Imaging.jpeg,uLog;


   type
    TUsuarioControler = class
      private
        FedEmail: TEdit;
        FedCodigo: TEdit;
        FedNumero: TEdit;
        FmkCPF: TMaskEdit;
        FedNomeLocal: TEdit;
        FedNome: TEdit;
        FedCidade: TEdit;
        Fcbuf: TComboBox;
        FcbLogr: TComboBox;
        FValidado:boolean;
        FlbCidade: TLabel;
        FlbEstado: TLabel;
        FlbCodigoCarteira: TLabel;
        FlbEndere?o: TLabel;
        FlbEmail: TLabel;
        FlbCPF: TLabel;
        FlbNomeCarteira: tlabel;
        FUtilSQL:TUtilSQL;
        FUtil:TUtil;
        FLOG:TLOG;
        FUsuarioSQL:TUsuarioDAO;
        FpnEdicao: TPanel;
        FImageFoto: timage;
        FFotoUsuario: TFileStream;
        FckSituacao: TCheckBox;
        FNomeForm:String;
        procedure SetcbLogr(const Value: TComboBox);
        procedure Setcbuf(const Value: TComboBox);
        procedure SetedCidade(const Value: TEdit);
        procedure SetedCodigo(const Value: TEdit);
        procedure SetedEmail(const Value: TEdit);
        procedure SetedNome(const Value: TEdit);
        procedure SetedNomeLocal(const Value: TEdit);
        procedure SetedNumero(const Value: TEdit);
        procedure SetmkCPF(const Value: TMaskEdit);
        procedure SetlbCidade(const Value: TLabel);
        procedure SetlbCodigoCarteira(const Value: TLabel);
        procedure SetlbCPF(const Value: TLabel);
        procedure SetlbEmail(const Value: TLabel);
        procedure SetlbEndere?o(const Value: TLabel);
        procedure SetlbEstado(const Value: TLabel);
        procedure SetlbNomeCarteira(const Value: tlabel);
        procedure InsercaoEdi??o;
        procedure Inserindo;
        procedure SetpnEdicao(const Value: TPanel);
        procedure SetImageFoto(const Value: timage);
        function pValidados:boolean;
        procedure SetFotoUsuario(const Value: TFileStream);
        procedure SetckSituacao(const Value: TCheckBox);
        procedure pCriaObj;
        procedure pDestroiObj;
      public
        constructor Create(AOwner: TComponent);
        Function  IniciaProcesso:boolean;
        Function  DeleteUser:boolean;
        Function  pValidaCodigo :boolean;
        Function  pValidaNome   :boolean;
        Function  pValidaEmail  :boolean;
        Function  pValidaCPF    :boolean;
        Function  pValidaLogradouro:boolean;
        Function  pValidaUF     :boolean;
        Function  pValidaNomeLocal:boolean;
        Function  pValidaNumero :boolean;
        Function  pValidaCidade :boolean;
        procedure pExcluirVariosUsuarios(prListaUsuario:TStringList);
        destructor Destroy; override;
        property edCodigo:TEdit read FedCodigo write SetedCodigo;
        property edNome  :TEdit read FedNome write SetedNome;
        property edEmail :TEdit read FedEmail write SetedEmail;
        property mkCPF   :TMaskEdit read FmkCPF write SetmkCPF;
        property cbLogr  :TComboBox read FcbLogr write SetcbLogr;
        property cbuf    :TComboBox read Fcbuf write Setcbuf;
        property edNomeLocal :TEdit read FedNomeLocal write SetedNomeLocal;
        property edNumero  :TEdit read FedNumero write SetedNumero;
        property edCidade  :TEdit read FedCidade write SetedCidade;
        property lbCodigoCarteira:TLabel read FlbCodigoCarteira write SetlbCodigoCarteira;
        property lbNomeCarteira :tlabel read FlbNomeCarteira write SetlbNomeCarteira;
        property lbEmail :TLabel read FlbEmail write SetlbEmail;
        property lbCPF   :TLabel read FlbCPF write SetlbCPF;
        property lbEndere?o  :TLabel read FlbEndere?o write SetlbEndere?o;
        property lbCidade  :TLabel read FlbCidade write SetlbCidade;
        property lbEstado  :TLabel read FlbEstado write SetlbEstado;
        property pnEdicao  :TPanel read FpnEdicao write SetpnEdicao;
        property ImageFoto :timage read FImageFoto write SetImageFoto;
        property FotoUsuario  :TFileStream read FFotoUsuario write SetFotoUsuario;
        property ckSituacao   :TCheckBox read FckSituacao write SetckSituacao;
    end;




implementation




{ TProcessosUsuario }

constructor TUsuarioControler.Create(AOwner: TComponent);
begin
//  inherited;
  FNomeForm:=(tform(AOwner).Name);
  pCriaObj;
end;

function TUsuarioControler.DeleteUser: boolean;
var
wNameuser:string;
begin


if trim(edCodigo.Text) <> EmptyStr then
  begin
   wNameuser:=FUsuarioSQL.getNomeUsuario(trim(edCodigo.Text));
   if TUtilSQL.pExiste_registro(C_KEY_TABLE_USUARIO,C_TABLENAME_USUARIO,trim(edCodigo.Text)) then
      begin
        FUsuarioSQL.pExcluiUsuario(trim(edCodigo.Text));
        InsercaoEdi??o;
        if TUtilSQL.pExiste_registro(C_KEY_TABLE_USUARIO,C_TABLENAME_USUARIO,trim(edCodigo.Text)) then
            begin
              MessageDlg(C_ERRO_EXCLUSAO,mtInformation,[mbOK],1);
              FLOG.AddLog(edCodigo.Text,TUtilSQL.getCodTela(FNomeForm),C_EXCLUSAO,datetostr(date),C_ERRO_EXCLUSAO);
            end
            else
            begin
              MessageDlg('Usu?rio '+edCodigo.Text + ' - '+wNameuser+ ' foi exclu?do com sucesso! ',mtConfirmation,[mbOK],1);
              FLOG.AddLog(edCodigo.Text,TUtilSQL.getCodTela(FNomeForm),C_EXCLUSAO,datetostr(date),C_SUCESSO_EXCLUSAO);
            end
      end
      else
           begin
            MessageDlg('Carregue um usu?rio existente para a exclus?o',mtConfirmation,[mbOK],1);
            edCodigo.SetFocus;
           end

  end
  else
  MessageDlg('Nenhum usu?rio carregado digite o c?digo',mtConfirmation,[mbOK],1);


end;

destructor TUsuarioControler.Destroy;
begin
  inherited;
  pDestroiObj;
end;

function TUsuarioControler.IniciaProcesso: boolean;
var
 wMsg:string;

  function DevolveZeroCodigo:string;
  begin
    //jaguara?
    if trim(edCodigo.Text) = EmptyStr then
       begin
        result:='0'
       end
       else
       begin
        result:=trim(edCodigo.Text)
       end;

  end;
begin


   if pValidados then
   begin

     if TUtilSQL.pExiste_registro(C_KEY_TABLE_USUARIO,C_TABLENAME_USUARIO,trim(edCodigo.Text))then
        begin
          wMsg:= 'Usu?rio '+edCodigo.Text+' - '+FUsuarioSQL.getNomeUsuario(edCodigo.Text)+' editado com sucesso!';
          FLOG.AddLog(edCodigo.Text,TUtilSQL.getCodTela(FNomeForm),C_EDICAO,datetostr(date),C_SUCESSO_EDICAO);
        end
        else
        begin
          wMsg:= 'Usu?rio '+edCodigo.Text+' - '+trim(edNome.Text)+' inserido com sucesso!';
          FLOG.AddLog(edCodigo.Text,TUtilSQL.getCodTela(FNomeForm),C_INSERCAO,datetostr(date),C_SUCESSO_INSERCAO);
        end;


          FUsuarioSQL.pInsereUsuario(DevolveZeroCodigo,trim(edNome.Text),trim(mkCPF.Text),trim(cbLogr.Text),trim(edNomeLocal.Text),trim(edNumero.Text),
          trim(edCidade.text),trim(edEmail.text),inttostr(cbuf.ItemIndex +1),FotoUsuario,ckSituacao.Checked);

          MessageDlg(wMsg,mtConfirmation,[mbOK],1);


   { sol.w6 - vitor - 28/05/2022 - mudan?as nos controles de inser??o e edi??o (estavam retornando a mesma imagem no processo).

        FUsuarioSQL.pInsereUsuario(DevolveZeroCodigo,trim(edNome.Text)
        ,trim(mkCPF.Text),trim(cbLogr.Text),trim(edNomeLocal.Text),trim(edNumero.Text)
        ,trim(edCidade.text),trim(edEmail.text),inttostr(cbuf.ItemIndex +1),FotoUsuario,ckSituacao.Checked);

     if trim(edCodigo.Text) <> EmptyStr then
        begin
         if TUtilSQL.pExiste_registro(C_KEY_TABLE_USUARIO,C_TABLENAME_USUARIO,trim(edCodigo.Text))then
           MessageDlg('Usu?rio'+edCodigo.Text+' - '+FUsuarioSQL.getNomeUsuario(edCodigo.Text)+' inserido com sucesso!',mtConfirmation,[mbOK],1)
        end
         else
              MessageDlg('Usu?rio'+edCodigo.Text+' - '+trim(edNome.Text)+' inserido com sucesso!',mtConfirmation,[mbOK],1)
   }
   end;
end;

procedure TUsuarioControler.InsercaoEdi??o;
var
  Nova: TGraphic;
  bdcodusu:string;
begin
  if not Assigned(FUsuarioSQL) then
     FUsuarioSQL:=TUsuarioDAO.Create;

  bdcodusu:= trim(edCodigo.Text);
  if bdcodusu = EmptyStr then
     bdcodusu := '0';


       if FUsuarioSQL.fExisteUsuario(bdcodusu) then
          begin
            edEmail.Text := FUsuarioSQL.getEmailUsuario(trim(edCodigo.Text));
            edNome.Text  := FUsuarioSQL.getNomeUsuario(trim(edCodigo.Text));
            mkCPF.Text   := FUsuarioSQL.getCPF(trim(edCodigo.Text));
            edNomeLocal.Text :=FUsuarioSQL.getNomeLocal(trim(edCodigo.Text));
            cbLogr.Text  := FUsuarioSQL.getLogradouro(trim(edCodigo.Text));
            edCidade.Text := FUsuarioSQL.getCidade(trim(edCodigo.Text));
            edNumero.Text := FUsuarioSQL.getNumero(trim(edCodigo.Text));
            cbuf.ItemIndex := (FUsuarioSQL.getCodUF(trim(edCodigo.Text))-1);  //Carrega o ind?ce equivalente
            lbEndere?o.Caption := 'Endere?o: ' + FUsuarioSQL.getLogradouro(trim(edCodigo.Text)) +' '+  FUsuarioSQL.getNomeLocal(trim(edCodigo.Text)) +' '+ FUsuarioSQL.getNumero(trim(edCodigo.Text));
            lbEstado.Caption   := 'Estado: ' +  FUsuarioSQL.getNomeEstadoUsuario(trim(edCodigo.Text));
            ckSituacao.Checked:= FUsuarioSQL.getSituacaoUsuario(trim(edCodigo.Text));
            if  not(FUsuarioSQL.getFotoUsuario(trim(edCodigo.Text)) = nil)  then
               begin
                  ImageFoto.Picture.Assign(FUsuarioSQL.getFotoUsuario(trim(edCodigo.Text)));
                  Nova:=FUtil.PadronizaTamanho(ImageFoto.Picture.Graphic,170,150,TJPEGImage);
                  ImageFoto.Picture.Graphic := Nova;
               end
               else
                  ImageFoto.Picture := nil;

            pnEdicao.Caption := 'Editando um registro';
            pnEdicao.Font.Color := clGreen;
          end
          else
          begin
            Inserindo;
          end;
end;

procedure TUsuarioControler.Inserindo;
begin
  edNome.Clear;
  edEmail.Clear;
  edNomeLocal.Clear;
  edNumero.Clear;
  edCidade.Clear;
  cbLogr.ItemIndex := 0;
  cbuf.ItemIndex   := 22;
  mkCPF.Clear;
  lbEstado.Caption   := 'Estado: ' + cbuf.Text;
  lbEndere?o.Caption := 'Endere?o: '+cbLogr.Text;
  ImageFoto.Picture  := nil;
  ckSituacao.Checked :=false;
  pnEdicao.Caption    := 'Inserindo um registro';
  pnEdicao.Font.Color := clRed;

end;

procedure TUsuarioControler.pCriaObj;
begin
   if not Assigned(FUtil) then
          FUtil:=TUtil.Create;

   if not Assigned(FUsuarioSQL) then
          FUsuarioSQL:= TUsuarioDAO.Create;

   if not Assigned(FLOG) then
          FLOG:= TLOG.Create;

   if not Assigned(FUtilSQL) then
          FUtilSQL:=TUtilSQL.Create;

end;

procedure TUsuarioControler.pDestroiObj;
begin
  if Assigned(FUsuarioSQL)  then
     FreeAndNil(FUsuarioSQL);

  if Assigned(FUtil) then
     FreeAndNil(FUtil);

  if Assigned(Flog) then
     FreeAndNil(Flog);

  if Assigned(FUtilSQL) then
     FreeAndNil(FUtilSQL);

end;

procedure TUsuarioControler.pExcluirVariosUsuarios(prListaUsuario: TStringList);
var
I:integer;
begin
 for I := 0 to (prListaUsuario.Count-1) do
        begin
          FUsuarioSQL.pExcluiUsuario(prListaUsuario[I]);
          FLOG.AddLog(prListaUsuario[I],FUtilSQL.getCodTela(C_FRCON_USUARIO),C_EXCLUSAO,datetostr(date),C_SUCESSO_EXCLUSAO);
          MessageDlg('Exclus?o realizada com sucesso',mtConfirmation,[mbOK],1);
        end;
end;

function TUsuarioControler.pValidaCidade:boolean;
var
I:integer;
begin
//  Result:=false;
//  if (FUtil.IsNumeric(edCidade.text) and TUtilValida.pValidaVazio(edCidade.Text)) then
//     begin
//        MessageDlg('Cidade preenchida incorretamente',mtError,[mbOK],1);
//        edNomeLocal.SetFocus;
//     end
//     else
//     result:=true;
 Result:=false;
   if not TUtilValida.pCampoPreenchido(edCidade.Text) then
      begin
          MessageDlg('O preenchimento da cidade ? obrigat?rio',mtError,[mbOK],1);
          edCidade.SetFocus
      end
      else
      begin
        for I := 0 to length(edCidade.Text) do
            begin
              if (edCidade.Text[I] in  ['0'..'9']) then
                 begin
                   edCidade.SetFocus;
                   MessageDlg('Cidade preenchida incorretamente ',mtError,[mbOK],1);
                   result:=false;
                   break
                 end
                 else
                 result:=true;
            end;

      end;
end;

function TUsuarioControler.pValidaCodigo:boolean;
begin


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

function TUsuarioControler.pValidaCPF:boolean;
begin
  Result:=false;
       if trim(mkCPF.Text) = '.   .   -' then
         begin
            MessageDlg('O preenchimento do CPF ? obrigat?rio',mtError,[mbOK],1);
           mkCPF.SetFocus;
         end
         else
         Result:=true;
end;

function TUsuarioControler.pValidados: boolean;
begin
  result := pValidaNome and  pValidaEmail and  pValidaCPF and
           pValidaNomeLocal and      pValidaCidade and  pValidaNumero;
end;

function TUsuarioControler.pValidaEmail:boolean;
begin
  Result:=TUtilValida.pValidaEmail(trim(edEmail.Text));
  if not Result then
     begin
       MessageDlg('O preenchimento do e-mail ? obrigat?rio ',mtError,[mbOK],1);
//       edEmail.Clear;
       edEmail.SetFocus;
     end;

end;

function TUsuarioControler.pValidaLogradouro:boolean;
begin
  //nothing to validate
end;

function TUsuarioControler.pValidaNome:boolean;
var
I:Integer;
begin

  Result:=false;
   if not TUtilValida.pCampoPreenchido(edNome.Text) then
      begin
          MessageDlg('O preenchimento do nome ? obrigat?rio',mtError,[mbOK],1);
          edNome.SetFocus
      end
      else
      begin
        for I := 0 to length(edNome.Text) do
            begin
              if (edNome.Text[I] in  ['0'..'9']) then
                 begin
                   edNome.SetFocus;
                   MessageDlg('Nome preenchido incorretamente ',mtError,[mbOK],1);
                   result:=false;
                   break
                 end
                 else
                 result:=true;
            end;

      end;

end;

function TUsuarioControler.pValidaNomeLocal:boolean;
begin
  Result:=false;
  if not TUtilValida.pCampoPreenchido(edNomeLocal.Text) then
     begin
        edNomeLocal.SetFocus;
         MessageDlg('O nome do local ? obrigat?rio',mtError,[mbOK],1);
     end
     else
        Result:=true
end;

function TUsuarioControler.pValidaNumero:boolean;
begin
  Result:= FUtil.IsNumeric(trim(edNumero.Text));
  if not Result then
     begin
        MessageDlg('N?mero preenchido incorretamente',mtError,[mbOK],1);
//       edNumero.Clear;
       edNumero.SetFocus;
     end;
end;

function TUsuarioControler.pValidaUF:boolean;
begin
  //nada a validar
end;

procedure TUsuarioControler.SetcbLogr(const Value: TComboBox);
begin
  FcbLogr := Value;
end;

procedure TUsuarioControler.Setcbuf(const Value: TComboBox);
begin
  Fcbuf := Value;
end;

procedure TUsuarioControler.SetckSituacao(const Value: TCheckBox);
begin
  FckSituacao := Value;
end;

procedure TUsuarioControler.SetedCidade(const Value: TEdit);
begin
  FedCidade := Value;
end;

procedure TUsuarioControler.SetedCodigo(const Value: TEdit);
begin
  FedCodigo := Value;
end;

procedure TUsuarioControler.SetedEmail(const Value: TEdit);
begin
  FedEmail := Value;
end;

procedure TUsuarioControler.SetedNome(const Value: TEdit);
begin
  FedNome := Value;
end;

procedure TUsuarioControler.SetedNomeLocal(const Value: TEdit);
begin
  FedNomeLocal := Value;
end;

procedure TUsuarioControler.SetedNumero(const Value: TEdit);
begin
  FedNumero := Value;
end;

procedure TUsuarioControler.SetFotoUsuario(const Value: TFileStream);
begin
  FFotoUsuario := Value;
end;

procedure TUsuarioControler.SetImageFoto(const Value: timage);
begin
  FImageFoto := Value;
end;

procedure TUsuarioControler.SetlbCidade(const Value: TLabel);
begin
  FlbCidade := Value;
end;

procedure TUsuarioControler.SetlbCodigoCarteira(const Value: TLabel);
begin
  FlbCodigoCarteira := Value;
end;

procedure TUsuarioControler.SetlbCPF(const Value: TLabel);
begin
  FlbCPF := Value;
end;

procedure TUsuarioControler.SetlbEmail(const Value: TLabel);
begin
  FlbEmail := Value;
end;

procedure TUsuarioControler.SetlbEndere?o(const Value: TLabel);
begin
  FlbEndere?o := Value;
end;

procedure TUsuarioControler.SetlbEstado(const Value: TLabel);
begin
  FlbEstado := Value;
end;

procedure TUsuarioControler.SetlbNomeCarteira(const Value: tlabel);
begin
  FlbNomeCarteira := Value;
end;

procedure TUsuarioControler.SetmkCPF(const Value: TMaskEdit);
begin
  FmkCPF := Value;
end;

procedure TUsuarioControler.SetpnEdicao(const Value: TPanel);
begin
  FpnEdicao := Value;
end;


end.
