{  Programador         Data         Descri��o
   Vitor Daniel     13/05/2022      Constantes global.
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

  {TIPO-A��O LOG}
  C_EDICAO_INSER��O   = '1';
  C_EXCLUSAO = '2';


implementation

end.
