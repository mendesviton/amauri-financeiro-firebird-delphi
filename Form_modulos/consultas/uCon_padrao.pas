{ Solicita??o    Programador       Data              Descri??o
  w1             Vitor D.        16/04/2022          Cria??o das telas padr?es do sistema (Consulta).
  w15            Vitor D.        05/06/2022          Inserir as telas nas tabelas dinamicamente
}
unit uCon_padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uControleSQL, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrCon_padrao = class(TForm)
    cliDS1: TClientDataSet;
    DS1: TDataSource;
    DSPRO1: TDataSetProvider;
    pnBarra: TPanel;
    spCancelar: TSpeedButton;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    lbPesquisar: TLabel;
    SpeedButton1: TSpeedButton;
    edPesquisa: TEdit;
    spImprimir: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure pnFundoCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure spCancelarClick(Sender: TObject);
  private
    globalSQL:TExecSQL;
  protected
    //w15 - Vitor -  05/06/2022 confere se a tela ja esta adicionada a  tabela de telas. - vitor
    procedure pAdicionaTelaSistema;

     //garante a cria??o e a libera??o dos objetos nas telas filhas. - vitor
    procedure pCriaObj;virtual;abstract;
    procedure pDestroiObj;virtual;abstract;

    //inicia processos de inser??o/edi??o/exclus?o de registros nas telas filhas. - Vitor
    procedure pExcluirRegistro;virtual;abstract;


  public
    procedure setListaObj(const prLista:TStringList);virtual;

  end;

var
  frCon_padrao: TfrCon_padrao;

implementation

uses
  uUtilAmauri;

{$R *.dfm}

procedure TfrCon_padrao.FormCreate(Sender: TObject);
begin
 pCriaObj;
 pAdicionaTelaSistema;
end;

procedure TfrCon_padrao.pAdicionaTelaSistema;
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

procedure TfrCon_padrao.pnFundoCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
//  pnFundo.Left :=  Round(NewWidth/2) - Round(pnFundo.Width/2)-7;
//  pnFundo.Top  :=  Round(NewHeight/2) - Round(pnFundo.Height/2)-18;
end;

procedure TfrCon_padrao.setListaObj(const prLista: TStringList);
begin
//  ShowMessage(prLista[0]);
end;

procedure TfrCon_padrao.spCancelarClick(Sender: TObject);
begin
 pExcluirRegistro;
end;

procedure TfrCon_padrao.SpeedButton1Click(Sender: TObject);
begin
  edPesquisa.Clear;
end;

end.
