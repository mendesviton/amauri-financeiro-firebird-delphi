{ Solicita??o    Programador       Data              Descri??o
  w1             Vitor D.        16/04/2022          Cria??o das telas padr?es do sistema (Cadastro).
  w15            Vitor D.        05/06/2022          Inserir as telas nas tabelas dinamicamente
}
unit uCad_padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,Vcl.Mask,uConsts,Vcl.StdCtrls,uLog,uControleSQL;

type
  TfrCad_padrao = class(TForm)
    sbConsulta: TSpeedButton;
    sbGravarRegistro: TSpeedButton;
    sbExcluirRegistro: TSpeedButton;
    pnBarra: TPanel;
    pnFundo: TPanel;
    pnComponentes: TPanel;
    pnUsuario: TPanel;
    spLimpaCampos: TSpeedButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure sbGravarRegistroClick(Sender: TObject);
    procedure sbExcluirRegistroClick(Sender: TObject);
    procedure sbConsultaClick(Sender: TObject);
    procedure spLimpaCamposClick(Sender: TObject);
  private
    FComponentlist:TStringList;
    FFSubiu: boolean;
    FLog:TLOG;
    FFCODIGO: Integer;
    // controle das setar do teclado nos edits
    procedure pControleKey(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure onEnterEdits(Sender: TObject);
    procedure pCriaControlesTecla;virtual;
    procedure SetFSubiu(const Value: boolean);
    procedure pLimpaCampo;
    procedure SetFCODIGO(const Value: Integer);

  public
    property FSubiu : boolean read FFSubiu write SetFSubiu;
    property FCODIGO :Integer read FFCODIGO write SetFCODIGO;
  protected

    procedure pSetaComponentesTela;virtual;abstract;

    //inicia processos de inser??o/edi??o/exclus?o de registros nas telas filhas. - Vitor
    procedure pExcluirRegistro;virtual;abstract;
    procedure pGravarRegistro;virtual;abstract;

    procedure pChamaConsulta;virtual;abstract;

    //garante a cria??o e a libera??o dos objetos nas telas filhas. - vitor
    procedure pCriaObj;virtual;abstract;
    procedure pDestroiObj;virtual;abstract;

    //w15 - Vitor -  05/06/2022 confere se a tela ja esta adicionada a  tabela de telas. - vitor
    procedure pAdicionaTelaSistema;
  end;

var
  frCad_padrao: TfrCad_padrao;

implementation

uses
  uUtilAmauri;

{$R *.dfm}

procedure TfrCad_padrao.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
var
 wNewHeightDescontado:integer;
begin
//wNewHeightDescontado:=(NewHeight-(pnBarra.Height+pnUsuario.Height));
//
////    Vitor - 14/05/2022 - centraliza  panel de componentes e n?o deixa form ser menor que o mesmo.
//  if (NewWidth <= pnFundo.Width) or (wNewHeightDescontado <= pnFundo.Height) then
//     Resize:=false
//     else
//     begin
//      pnFundo.Left :=  Round(NewWidth/2) - Round(pnFundo.Width/2)-8;
//      pnFundo.Top  :=  Round(NewHeight/2) + pnBarra.Height - Round(pnFundo.Height/2)-52
//     end;
  wNewHeightDescontado:=(NewHeight-(pnUsuario.Height + 40));

//    Vitor - 14/05/2022 - centraliza  panel de componentes e n?o deixa form ser menor que o mesmo.
  if (NewWidth <= (pnComponentes.Width)+15) or (wNewHeightDescontado <= pnComponentes.Height) then
     Resize:=false
     else
     begin
      pnComponentes.Left :=  Round(NewWidth/2) - Round(pnComponentes.Width/2) -8 ;
      pnComponentes.Top  :=  Round(NewHeight/2) -  Round(pnComponentes.Height/2)-28;
     end;

end;

procedure TfrCad_padrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  pDestroiObj;
  FreeAndNil(FComponentlist);
end;

procedure TfrCad_padrao.FormCreate(Sender: TObject);
begin
  pCriaControlesTecla;
  pCriaObj;
  pSetaComponentesTela;
  pAdicionaTelaSistema;
end;

procedure TfrCad_padrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_ESCAPE:
      begin
        self.Close;
      end;
  end;
end;

procedure TfrCad_padrao.onEnterEdits(Sender: TObject);
begin
  FSubiu:=false;
end;

procedure TfrCad_padrao.pAdicionaTelaSistema;
var
  wSQL :string;
  FSQL :TExecSQL;
  Futil:TUtilSQL;
begin
 try
   Futil:=TUtilSQL.Create;
   FSQL:=TExecSQL.Create;

   if (Futil.getCodTela(TForm(self).Name) = EmptyStr)  then
      begin



         FSQL.CommandText.SQL.Clear;

          wSQL := 'update or insert into TSIS_TELAS (BDNOMETELA,BDNOMEFORM) ';
         wSQL := wSQL + ' values (:BDNOMETELA,:BDNOMEFORM)';
         wSQL := wSQL + ' matching (BDNOMETELA)';
         FSQL.CommandText.CommandText:=wSQL;
         FSQL.CommandText.Params[0].Name :='BDNOMETELA';
         FSQL.CommandText.Params[0].AsString :=TForm(Self).Caption ;
         FSQL.CommandText.Params[1].Name :='BDNOMEFORM';
         FSQL.CommandText.Params[1].AsString := TForm(self).Name;
         FSQL.CommandText.ExecSQL;

      end;
 finally
   FreeAndNil(FSQL);
   FreeAndNil(Futil);
 end;

end;

procedure TfrCad_padrao.pControleKey(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  wTaborder,I:integer;
  wComponentClassName:String;

  begin

  wComponentClassName:= EmptyStr;
  wTaborder:=TEdit(Sender).TabOrder;

  if (Key = VK_UP) then
     for I := 0 to (self.ComponentCount-1) do
      begin

         if (Self.Components[I].ClassParent = TCustomMaskEdit) then
            if TCustomMaskEdit(Self.Components[I]).TabOrder = (wTaborder - 1) then
               begin
                FSubiu:=true;
                TCustomMaskEdit(Self.Components[I]).SetFocus;
               end;

         if (Self.Components[I].ClassParent = TCustomEdit) then
            if TCustomEdit(Self.Components[I]).TabOrder = (wTaborder - 1) then
               begin
                FSubiu:=true;
                TCustomEdit(Self.Components[I]).SetFocus;
               end;

         if  Self.Components[I].ClassType = TCheckBox then
             if TCheckBox(Self.Components[I]).TabOrder = (wTaborder - 1) then
                begin
                  FSubiu:=true;
                  TCheckBox(Self.Components[I]).SetFocus;
                end;

        if (Self.Components[I].ClassType = TComboBox) then
            if TComboBox(Self.Components[I]).TabOrder = (wTaborder - 1) then
               begin
                TComboBox(Self.Components[I]).SetFocus;
               end;

      end;

  if (Key = VK_DOWN) or (key = VK_RETURN) then
     for I := 0 to (self.ComponentCount-1) do
      begin


                   if (Self.Components[I].ClassParent = TCustomMaskEdit) then
                      if TCustomMaskEdit(Self.Components[I]).TabOrder = (wTaborder + 1) then
                         begin
                          FSubiu:=false;
                          TCustomMaskEdit(Self.Components[I]).SetFocus;
                         end;

                   if (Self.Components[I].ClassParent = TCustomEdit) then
                      if TCustomEdit(Self.Components[I]).TabOrder = (wTaborder + 1) then
                         begin
                          FSubiu:=false;
                          TCustomEdit(Self.Components[I]).SetFocus;
                         end;

                   if  Self.Components[I].ClassType = TCheckBox then
                       if TCheckBox(Self.Components[I]).TabOrder = (wTaborder + 1) then
                          begin
                            FSubiu:=false;
                            TCheckBox(Self.Components[I]).SetFocus;
                          end;

                   if (Self.Components[I].ClassType = TComboBox) then
                      if TComboBox(Self.Components[I]).TabOrder = (wTaborder + 1) then
                         begin
                          FSubiu:=false;
                          TComboBox(Self.Components[I]).SetFocus;
                         end;


      end;



//  if key = VK_UP then
//     begin
//       for I := 0 to (FComponentlist.Count-1) do
//           begin
//             if FComponentlist.Objects[I].ClassParent = TCustomMaskEdit   then
//                begin
//                  if TCustomMaskEdit(FComponentlist.Objects[I]).Name = TComponent(Sender).Name then
//                     begin
//                      TCustomMaskEdit(FComponentlist.Objects[I-1]).SetFocus;
//                     end;
//                end;
//
//
//             if FComponentlist.Objects[I].ClassParent = TCustomEdit   then
//                begin
//                  if TCustomEdit(FComponentlist.Objects[I]).Name = TComponent(Sender).Name then
//                     begin
//                      FSubiu:=true;
//                      TCustomEdit(FComponentlist.Objects[I-1]).SetFocus;
//                     end;
//                end;
//
//
//             if FComponentlist.Objects[I].ClassParent = TCheckBox   then
//                begin
//                  if TCheckBox(FComponentlist.Objects[I]).Name = TComponent(Sender).Name then
//                     begin
//                       TCheckBox(FComponentlist.Objects[I-1]).SetFocus;
//                     end;
//                end;
//
//              wComponentClassName := FComponentlist.Objects[I].ClassName
//
//           end;
//     end;

end;

procedure TfrCad_padrao.pCriaControlesTecla;
var
  I:integer;
begin
//  FComponentlist:=TStringList.Create;

  for I := 0 to (Self.ComponentCount-1) do
      begin
         if (Self.Components[I].ClassParent = TCustomMaskEdit) then
            begin
              TMaskEdit(Self.Components[I]).OnKeyDown := pControleKey;
              TMaskEdit(Self.Components[I]).OnEnter   := onEnterEdits;
//              FComponentlist.AddObject(TMaskEdit(Self.Components[I]).Name,TMaskEdit(Self.Components[I]));
            end;

         if (Self.Components[I].ClassParent = TCustomEdit) then
             begin
              TEdit(Self.Components[I]).OnKeyDown := pControleKey;
              TEdit(Self.Components[I]).OnEnter   := onEnterEdits;
//               FComponentlist.AddObject(TEdit(Self.Components[I]).Name,TEdit(Self.Components[I]));
             end;

         if  Self.Components[I].ClassType = TCheckBox then
             begin
              TCheckBox(Self.Components[I]).OnKeyDown := pControleKey;
              TCheckBox(Self.Components[I]).OnEnter   := onEnterEdits;
//              FComponentlist.AddObject(TCheckBox(Self.Components[I]).Name,TCheckBox(Self.Components[I]));
             end;

         if Self.Components[I].ClassType = TComboBox then
            begin
              TComboBox(Self.Components[I]).OnKeyDown := pControleKey;
              TComboBox(Self.Components[I]).OnEnter   := onEnterEdits;
            end;
      end;

end;

procedure TfrCad_padrao.pLimpaCampo;
var
  I:integer;
begin

//    Vitor - 14/05/2022 - limpa os campos dinamicamente, percorrendo a tela em tempo de execu??o.
  for I := 0 to Self.ComponentCount-1 do
      begin
        if (Self.Components[I].ClassParent = TCustomMaskEdit) or
           (Self.Components[I].ClassParent = TCustomEdit) then
            TCustomEdit(Self.Components[I]).Clear;

        if Self.Components[I].ClassType = TCheckBox then
            TCheckBox(Self.Components[I]).Checked:=True;

//        if Self.Components[I].ClassType = TPanel then
//            TPanel(Self.Components[I]).Caption := EmptyStr;
          pnUsuario.Caption := 'Inserindo um registro';
          pnUsuario.Font.Color := clRed;
      end;
end;

procedure TfrCad_padrao.SetFCODIGO(const Value: Integer);
begin
  FFCODIGO := Value;
end;

procedure TfrCad_padrao.SetFSubiu(const Value: boolean);
begin
  FFSubiu := Value;
end;

procedure TfrCad_padrao.spLimpaCamposClick(Sender: TObject);
begin
  pLimpaCampo;
end;

procedure TfrCad_padrao.sbConsultaClick(Sender: TObject);
begin
  pChamaConsulta;
end;

procedure TfrCad_padrao.sbGravarRegistroClick(Sender: TObject);
var
 FLOG:TLOG;
 FUtil:TUtilSQL;
begin
 FLOG:= TLOG.Create;
 FUtil:= TUtilSQL.Create;
 try
  pGravarRegistro;
 except
       on E: Exception do
         begin
           MessageDlg('Houve um problema ao executar o processo de inclus?o/edi??o, por favor consulte o Log',mtInformation,[mbOK],1);
           FLOG.AddLog(inttostr(FCODIGO),FUtil.getCodTela(TForm(self).name),C_INSERCAO,datetostr(date),C_MSG_SQL_EXCEPTION + E.Message);
         end;
 end;

  FreeAndNil(FLOG);
  FreeAndNil(FUtil);
end;

procedure TfrCad_padrao.sbExcluirRegistroClick(Sender: TObject);
var
 FLOG:TLOG;
 FUtil:TUtilSQL;
begin
 FLOG:= TLOG.Create;
 FUtil:= TUtilSQL.Create;
 try
  pExcluirRegistro;
 except

       on E: Exception do
        begin
          MessageDlg('Houve um problema ao executar o processo de exclus?o, por favor consulte o Log',mtInformation,[mbOK],1);
          FLOG.AddLog(inttostr(FCODIGO),FUtil.getCodTela(TForm(self).name),C_EXCLUSAO,datetostr(date),C_MSG_SQL_EXCEPTION + E.Message);
        end;

 end;
 FreeAndNil(FLOG);
 FreeAndNil(FUtil);
end;

end.
