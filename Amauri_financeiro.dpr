program Amauri_financeiro;

{$R *.dres}

uses
  Vcl.Forms,
  uConexaoBanco in 'model\uConexaoBanco.pas',
  uControleSQL in 'model\uControleSQL.pas',
  uUtilAmauri in 'util\uUtilAmauri.pas',
  uConsts in 'util\uConsts.pas',
  uInicioProcessos in 'Form_cadastro\uInicioProcessos.pas' {frInicioProcessos},
  uPrincipalAmauri in 'Form_cadastro\uPrincipalAmauri.pas' {frAmauriPrincipal},
  uRel_Padrao in 'Form_cadastro\relatorio\uRel_Padrao.pas' {fr_RelPadrao1},
  uRel_usuarios in 'Form_cadastro\relatorio\uRel_usuarios.pas' {frRel_usuario},
  uCon_padrao in 'Form_cadastro\consultas\uCon_padrao.pas' {frCon_padrao},
  uCon_usuario in 'Form_cadastro\consultas\uCon_usuario.pas' {frCon_usuario},
  uCad_usuario in 'Form_cadastro\cadastros\uCad_usuario.pas' {frCad_usuario},
  uCad_formapgto in 'Form_cadastro\cadastros\uCad_formapgto.pas' {frCad_formapgto},
  uUsuario_controler in 'Classes_controler\Classes_Controler\uUsuario_controler.pas',
  uUsuario_DAO in 'Classes_controler\Classes_DAO\uUsuario_DAO.pas',
  uFormapgto_DAO in 'Classes_controler\Classes_DAO\uFormapgto_DAO.pas',
  uFormapgto_controler in 'Classes_controler\Classes_Controler\uFormapgto_controler.pas',
  uContas_controler in 'Classes_controler\Classes_Controler\uContas_controler.pas',
  uContasDAO in 'Classes_controler\Classes_DAO\uContasDAO.pas',
  uCad_contas in 'Form_cadastro\cadastros\uCad_contas.pas' {frCad_contas},
  uLog in 'util\uLog.pas',
  uCad_padrao in 'Form_cadastro\cadastros\uCad_padrao.pas' {frCad_padrao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrAmauriPrincipal, frAmauriPrincipal);
  Application.Run;
end.
