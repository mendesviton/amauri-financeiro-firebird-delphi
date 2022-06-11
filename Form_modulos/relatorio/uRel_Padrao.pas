{ Solicitação    Programador       Data              Descrição
  w1             Vitor D.        16/04/2022          Criação das telas padrões do sistema (Relatório).
  w15            Vitor D.        05/06/2022          Inserir as telas nas tabelas dinamicamente
}
unit uRel_Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Vcl.Buttons,
  Vcl.ExtCtrls,uControleSQL, Vcl.Menus, frxExportPDF, frxExportDOCX,
  frxExportCSV;

type
  Tfr_RelPadrao1 = class(TForm)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    pnFundo: TPanel;
    pnBarra: TPanel;
    SpeedButton3: TSpeedButton;
    PopupMenu1: TPopupMenu;
    EditarRelatrio1: TMenuItem;
    frxPDFExport1: TfrxPDFExport;
    frxCSVExport1: TfrxCSVExport;
    frxDOCXExport1: TfrxDOCXExport;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EditarRelatrio1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    EDIT_MODE:boolean;
    procedure ConfigParametros;
    procedure pConfiguraDataset;
    function getFilePath:string;
    function getSQL:string;
  public
    FSQL:string;
    DAOfac:TExecSQL;
    fr3FilePath:string;
  protected
    procedure setFilePath;virtual;abstract;
    procedure setSQL;virtual;abstract;

     //garante a criação e a liberação dos objetos nas telas filhas. - vitor
    procedure pCriaObj;virtual;abstract;
    procedure pDestroiObj;virtual;abstract;

    //w15 - Vitor -  05/06/2022 confere se a tela ja esta adicionada a  tabela de telas. - vitor
    procedure pAdicionaTelaSistema;
  end;

var
  fr_RelPadrao1: Tfr_RelPadrao1;

implementation

uses
  uUtilAmauri;

{
    Manual implementação de relatórios
    criar o arquivo .fr3 com o componente da tela

    implementar nas filhas.
      setFilePath
      getSQL

}

{$R *.dfm}

procedure Tfr_RelPadrao1.ConfigParametros;
begin
  frxReport1.Variables['Data_atual']:=DateToStr(Date)
end;

procedure Tfr_RelPadrao1.EditarRelatrio1Click(Sender: TObject);
begin
  EDIT_MODE:=True;
  frxReport1.LoadFromFile(getFilePath);
  pConfiguraDataset;
  frxReport1.PrepareReport;
  frxReport1.DesignReport;
end;

procedure Tfr_RelPadrao1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
     pnFundo.Left :=  Round(NewWidth/2) - Round(pnFundo.Width/2)-7;
     pnFundo.Top  :=  Round(NewHeight/2) + pnBarra.Height - Round(pnFundo.Height/2)-55;
end;

procedure Tfr_RelPadrao1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if  Assigned(DAOfac) then
      DAOfac.Destroy;

  pDestroiObj;
end;

procedure Tfr_RelPadrao1.FormCreate(Sender: TObject);
begin
  pAdicionaTelaSistema;
  if not Assigned(DAOfac) then
         DAOfac:=TExecSQL.Create;
  frxDBDataset1.DataSet:=DAOfac.CommandText;
  setFilePath;
  setSQL;
  pCriaObj;
  showmessage('inserir rotina de log Tfr_RelPadrao1.pConfiguraDataset')
end;

function Tfr_RelPadrao1.getFilePath: string;
begin
  if fr3FilePath = EmptyStr then
     begin
       ShowMessage('Esqueceu de setar o arquivo .fr3, implemente setFilePath');
     end
     else
     result:=fr3FilePath;

end;

function Tfr_RelPadrao1.getSQL: string;
begin
 if FSQL = EmptyStr then
    begin
      ShowMessage('Esqueceu de montar sql de consulta,implmente o método setSQL.');
      result:= '';
    end
    else
    result:=FSQL;
end;

procedure Tfr_RelPadrao1.pAdicionaTelaSistema;
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

procedure Tfr_RelPadrao1.pConfiguraDataset;
begin
 if not EDIT_MODE then
  try
    Daofac.CommandText.Close;
    DAOfac.CommandText.SQL.Clear;
    DAOfac.CommandText.SQL.Add(getSQL);
    DAOfac.CommandText.Open;
    if DAOfac.CommandText.IsEmpty then
       begin
         ShowMessage('Não há dados a serem impressos');
         exit;
       end
       else
       begin
        frxReport1.PrepareReport;
        frxReport1.ShowReport;
       end;
  except

  end
  else
   try
    Daofac.CommandText.Close;
    DAOfac.CommandText.SQL.Clear;
    DAOfac.CommandText.SQL.Add(getSQL);
    DAOfac.CommandText.Open;
    frxReport1.PrepareReport;
    frxReport1.DesignReport;

  except

  end

end;

procedure Tfr_RelPadrao1.SpeedButton3Click(Sender: TObject);
begin
  ConfigParametros;
  EDIT_MODE:=false;
  frxReport1.LoadFromFile(getFilePath);
  pConfiguraDataset;


end;

end.
