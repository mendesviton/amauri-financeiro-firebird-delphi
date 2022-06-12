{  Programador         Data         Descri��o
   Vitor Daniel     13/05/2022      Constantes globais.
}
unit uConsts;

interface

const
  {UTILIT�RIOS}
  C_DATABASEPATH = 'BASE\AMAURIFIN.FDB';          //Diret�rio do arquivo (banco de dados)

  {TABELA DE USU�RIOS}
  C_TABLENAME_USUARIO = 'TFIN_TUSUARIO';
  C_KEY_TABLE_USUARIO = 'BDCODUSU';

  {TABELA DE FORMAS DE PAGAMENTO}
  C_TABLENAME_TFIN_FORMAPGTO ='TFIN_FORMAPGTO';
  C_KEY_TABLE_FORMAPGTO = 'BDCODFORMAPGTO';

  {TABELA DE CONTAS}
  C_TABLENAME_TFIN_TCONTAS = 'TFIN_TCONTAS';
  C_KEY_TABLE_CONTAS ='BDCODCONTA';

  {PROCEDURE INSERIR LOG}
  C_SP_INSERIR_LOG = 'SP_INSERIR_LOG';     //sql que insere na tabela TLOG


  {MENSAGENS DE ERRO}
  C_MSG_SQL_EXCEPTION = 'Houve uma exce��o ao executar o comando sql mensagem de erro: ';

  {LOG}
  C_INSERCAO = '1';
  C_EDICAO   = '2';
  C_EXCLUSAO = '3';
  C_PROCESSO = '4';
  C_NENHUM_USUARIO = '0';

  {MENSAGENS}
  C_ERRO_EXCLUSAO    = 'N�o foi poss�vel realizar a exclus�o';
  C_SUCESSO_EXCLUSAO = 'Exclus�o realizada com sucesso';
  C_SUCESSO_INSERCAO = 'Inser��o realizada com sucesso';
  C_SUCESSO_EDICAO   = 'Edi��o realizada com sucesso';

  {NOME FORMS}
    //Contas
  C_FRCAD_CONTAS      = 'frCad_contas';

    //Forma de pagamento
  C_FRCAD_FORMAPGTO   = 'frCad_formapgto';

    //Usu�rio
  C_FRCAD_USUARIO     = 'frCad_usuario';
  C_FRCON_USUARIO     = 'frCon_usuario';
  C_FRREL_USUARIO     = 'frRel_usuario';

   //Login
  C_FRLOGIN = 'frLogin';
implementation

end.
