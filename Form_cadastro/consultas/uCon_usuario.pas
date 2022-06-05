unit uCon_usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCon_padrao, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,uControleSQL,
  Vcl.Buttons,uUsuario_DAO,uRel_usuarios, Vcl.Menus;

type
  TfrCon_usuario = class(TfrCon_padrao)
    PopupMenu1: TPopupMenu;
    Selecionartodos1: TMenuItem;
    irarSeleotodos1: TMenuItem;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure spImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    globalSQL:TExecSQL;
  public
    FSelecionado:TStringList;
    procedure setListaObj(const prLista:TStringList);override;
  end;

var
  frCon_usuario: TfrCon_usuario;

implementation
  uses
    uCad_usuario, test;

{$R *.dfm}

procedure TfrCon_usuario.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Owner is TfrCad_usuario then
    begin
      TfrCad_usuario(owner).SelecionadoConsulta(DBGrid1.Fields[1].Value);
    end;

end;

procedure TfrCon_usuario.DBGrid1DblClick(Sender: TObject);
var
i:integer;
begin
 inherited;
  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  (Sender as TDBGrid).DataSource.Dataset.Edit;


    if((Sender as TDBGrid).DataSource.Dataset.FieldByName('BDCHECK').AsInteger = 0)then
      begin
        i:=1
      end
      else
        begin
        FSelecionado.Add((Sender as TDBGrid).DataSource.Dataset.FieldByName('BDCODUSU').AsString);
        i:=0;
        end;
      (Sender as TDBGrid).DataSource.Dataset.FieldByName('BDCHECK').AsInteger := i;


  (Sender as TDBGrid).DataSource.Dataset.Post;
end;

procedure TfrCon_usuario.DBGrid1DrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  // Desenha um checkbox no dbgrid
  if Column.FieldName = 'BDCHECK' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.Dataset.FieldByName('BDCHECK').AsInteger = 0) then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -1, -1); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrCon_usuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(globalSQL) then
     globalSQL.Destroy;


end;

procedure TfrCon_usuario.FormCreate(Sender: TObject);
begin
  inherited;
  FSelecionado:=TStringList.Create;
  DBGrid1.Columns[0].Title.Caption := '';
  DBGrid1.Columns[0].Width := 40;
  if not Assigned(globalSQL) then
     globalSQL:=TExecSQL.Create;

     DSPRO1.DataSet:= globalSQL.CommandText;
     cliDS1.Close;
     cliDS1.CommandText :=TUsuarioDAO.pSelectAllConsulta;
     cliDS1.Open;


end;

procedure TfrCon_usuario.setListaObj(const prLista: TStringList);
begin
  inherited;

end;

procedure TfrCon_usuario.spImprimirClick(Sender: TObject);
var
I:integer;
begin
  inherited;
  for I := 0 to (FSelecionado.Count-1) do
      begin
        ShowMessage(FSelecionado[I])
      end;

  TfrRel_usuario.Create(self).Show;
end;

end.


