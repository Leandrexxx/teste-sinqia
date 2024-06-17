--8. Criar um procedimento armazenado (procedure) para realizar as operações de INSERT, UPDATE E DELETE na tabela de CIDADES. Criar uma procedure única que faça todas as operações. Ela pode ser usada no aplicativo criado, se desejar. (Criar um arquivo separado)

DROP PROCEDURE IF EXISTS proc_cidades
GO

CREATE PROCEDURE proc_cidades
    @Acao         INT,
	@CodigoCidade INT,
    @Nome          VARCHAR(60),
    @Estado        VARCHAR(2),
    @CepInicial   VARCHAR(8),
    @CepFinal     VARCHAR(8),
	@MsgErro        VARCHAR(255) OUTPUT

AS
BEGIN
  --> [1 - Insert] [2 - Update] [3 - Delete]

 IF @Acao = 1
 BEGIN

	IF NOT EXISTS (SELECT 1 FROM CIDADES WHERE Nome = @Nome)
	BEGIN
      INSERT INTO cidades(Nome, Estado, Cep_Inicial, Cep_Final)
	  VALUES(@Nome, @Estado, @CepInicial, @CepFinal);
	  SET @MsgErro = ''
	END
		ELSE
	BEGIN
	  SET @MsgErro = 'A Cidade informada já possui cadastro!'
	  RETURN
	END
  END

  IF @Acao = 2
  BEGIN 
	UPDATE cidades 
	SET Nome = @Nome, Estado = @Estado, Cep_Inicial = @CepInicial, Cep_Final = @CepFinal
	WHERE Codigo_Cidade = @CodigoCidade;
	SET @MsgErro = 'Alteração concluída com sucesso!'
  END

  IF @Acao = 3
  BEGIN
	IF EXISTS (SELECT CLI.Codigo_Cidade FROM CLIENTES CLI
                   INNER JOIN CIDADES CID ON
                   CLI.Codigo_Cidade = CID.Codigo_Cidade)
	BEGIN
      DELETE FROM cidades
   	  WHERE Codigo_Cidade = @CodigoCidade;
	END
		ELSE
	BEGIN
	  SET @MsgErro = 'Essa cidade não pode ser excluída por já ter clientes cadastrados!'
	END
  END

END;

-- Testando Inserção
EXEC proc_cidades
    @Acao = 1,
    @CodigoCidade = NULL,
    @Nome = 'CidadeTeste',
    @Estado = 'ST',
    @CepInicial = '12345678',
    @CepFinal = '87654321',
	@MsgErro = null;

-- Verifique se a inserção foi bem-sucedida
SELECT * FROM cidades WHERE Nome = 'CidadeTeste';

-- Testando Atualização (supondo que o CodigoCidade da cidade inserida seja 1)
EXEC proc_cidades
    @Acao = 2,
    @CodigoCidade = 15,
    @Nome = 'CidadeTesteAtualizada',
    @Estado = 'TS',
    @CepInicial = '87654321',
    @CepFinal = '12345678',
	@MsgErro = null;

-- Verifique se a atualização foi bem-sucedida
SELECT * FROM cidades WHERE Codigo_Cidade = 15;

-- Testando Exclusão
EXEC proc_cidades
    @Acao = 3,
    @CodigoCidade = 15,
    @Nome = NULL,
    @Estado = NULL,
    @CepInicial = NULL,
    @CepFinal = NULL,
	@MsgErro = null;

-- Verifique se a exclusão foi bem-sucedida
SELECT * FROM cidades WHERE Codigo_Cidade = 15;
