program Amauri_financeiro;

{$R *.dres}

uses
  FastMM4,
  Vcl.Forms,
  uConexaoBanco in 'model\uConexaoBanco.pas',
  uControleSQL in 'model\uControleSQL.pas',
  uUtilAmauri in 'util\uUtilAmauri.pas',
  uConsts in 'util\uConsts.pas',
  uUsuario_controler in 'Classes_controler\Classes_Controler\uUsuario_controler.pas',
  uUsuario_DAO in 'Classes_controler\Classes_DAO\uUsuario_DAO.pas',
  uFormapgto_DAO in 'Classes_controler\Classes_DAO\uFormapgto_DAO.pas',
  uFormapgto_controler in 'Classes_controler\Classes_Controler\uFormapgto_controler.pas',
  uContas_controler in 'Classes_controler\Classes_Controler\uContas_controler.pas',
  uContasDAO in 'Classes_controler\Classes_DAO\uContasDAO.pas',
  uLog in 'util\uLog.pas',
  uLoginPage in 'Form_geral\uLoginPage.pas' {frLogin},
  uInicioProcessos in 'Form_geral\uInicioProcessos.pas' {frInicioProcessos},
  uPrincipalAmauri in 'Form_geral\uPrincipalAmauri.pas' {frAmauriPrincipal},
  uCad_padrao in 'Form_modulos\cadastros\uCad_padrao.pas' {frCad_padrao},
  uCad_usuario in 'Form_modulos\cadastros\uCad_usuario.pas' {frCad_usuario},
  uCad_contas in 'Form_modulos\cadastros\uCad_contas.pas' {frCad_contas},
  uCad_formapgto in 'Form_modulos\cadastros\uCad_formapgto.pas' {frCad_formapgto},
  uCon_padrao in 'Form_modulos\consultas\uCon_padrao.pas' {frCon_padrao},
  uCon_usuario in 'Form_modulos\consultas\uCon_usuario.pas' {frCon_usuario},
  uRel_Padrao in 'Form_modulos\relatorio\uRel_Padrao.pas' {fr_RelPadrao1},
  uRel_usuarios in 'Form_modulos\relatorio\uRel_usuarios.pas' {frRel_usuario},
  uLogin_controler in 'Classes_controler\Classes_Controler\uLogin_controler.pas';

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrAmauriPrincipal, frAmauriPrincipal);
  Application.Run;
end.
