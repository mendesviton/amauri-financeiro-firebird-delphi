unit test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uControleSql,
  Vcl.StdCtrls, frxClass, frxDBSet;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    DAOfac:TExecSQL;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  frxReport1.LoadFromFile('D:\Dev\Amauri_financeiro DELPHI\Relatorio\Cadastra.fr3');
  frxReport1.PrepareReport;
  frxReport1.ShowReport();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  frxReport1.PrepareReport;
  frxReport1.DesignReport();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not Assigned(DAOfac) then
         DAOfac:=TExecSQL.Create;


  frxDBDataset1.DataSet:=DAOfac.CommandText;
  DAOfac.CommandText.Close;
  DAOfac.CommandText.SQL.Clear;
  DAOfac.CommandText.SQL.Add('SELECT * FROM TFIN_TUSUARIO');
  DAOfac.CommandText.Open;
end;

end.
