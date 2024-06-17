DROP PROCEDURE IF EXISTS proc_Cadastros 
GO

CREATE PROCEDURE proc_Cadastros @TipoOperacao INTEGER, 
                                @Acao VARCHAR(2) = NULL,
                                @CodigoCliente INTEGER = NULL,
                                @NomeCliente VARCHAR(100) = NULL,
                                @CPFCliente VARCHAR(14)= NULL,
                                @Telefone VARCHAR(14)= NULL,
                                @Endereco VARCHAR(100)= NULL,
                                @Bairro VARCHAR(50)= NULL,
                                @Complemento VARCHAR(50)= NULL,
                                @Cep VARCHAR(8)= NULL,
                                @Email VARCHAR (100)= NULL,
                                @CodigoCidade INTEGER = NULL,
                                @NomeCidade VARCHAR(100)= NULL,
                                @Estado VARCHAR(2)= NULL,
                                @CepInicial VARCHAR(8)= NULL,
                                @CepFinal VARCHAR(8)= NULL,
                                @MsgErro VARCHAR(255) OUTPUT 

AS 
BEGIN 
--> [1 - Cadastro Cidades] [2 - Cadastros Clientes] 
IF @TipoOperacao = 1 

--> [I1 - Insert] [E1 - Update] [D1 - Delete]
IF @Acao = 'I1' 

BEGIN 
IF NOT EXISTS
  (SELECT 1
   FROM CIDADES
   WHERE Nome = @NomeCidade) 

BEGIN
	INSERT INTO cidades(Nome, Estado, Cep_Inicial, Cep_Final)
	VALUES(@NomeCidade,
		   @Estado,
		   @CepInicial,
		   @CepFinal);
	SET @MsgErro = '' 
	END 
	ELSE 
	BEGIN
		SET @MsgErro = 'A Cidade informada já possui cadastro!' 
	RETURN 
	END 
END

IF @Acao = 'E1'

BEGIN
	UPDATE cidades
	SET Nome = @NomeCidade,
		Estado = @Estado,
		Cep_Inicial = @CepInicial,
		Cep_Final = @CepFinal
	WHERE Codigo_Cidade = @CodigoCidade;
	  SET @MsgErro = 'Alteração concluída com sucesso!' 
END

IF @Acao = 'D1'

BEGIN IF NOT EXISTS
  (SELECT CLI.Codigo_Cidade
    FROM CLIENTES CLI
    INNER JOIN CIDADES CID ON CLI.Codigo_Cidade = CID.Codigo_Cidade
	WHERE Cli.Codigo_Cidade = @CodigoCidade) 

BEGIN
	DELETE
	FROM cidades
	WHERE cidades.Codigo_Cidade = @CodigoCidade; 
	END 
	ELSE 
	BEGIN
		SET @MsgErro = 'Essa cidade não pode ser excluída por já ter clientes cadastrados!' 
	END 
END

--> [1 - Cadastro Cidades] [2 - Cadastros Clientes] 
IF @TipoOperacao = 2 

BEGIN DECLARE @VerificaCEPInicial VARCHAR(8),
               @VerificaCEPFinal VARCHAR(8); 
               
--> [I2 - Insert] [E2 - Update] [D2 - Delete]
IF @Acao = 'I2' 
 
 BEGIN 
 
IF NOT EXISTS
(SELECT 1
    FROM CLIENTES
    WHERE CGC_CPF_Cliente = @CPFCliente) 
  
BEGIN
	SELECT @VerificaCEPInicial = Cep_Inicial,
			@VerificaCEPFinal = Cep_Final
	FROM CIDADES
	WHERE Codigo_Cidade = @CodigoCidade 
  
IF @Cep BETWEEN @VerificaCEPInicial AND @VerificaCEPFinal 
BEGIN
	INSERT INTO clientes(Nome, CGC_CPF_Cliente, Telefone, Endereco, Bairro, Complemento, Cep, e_mail, Codigo_Cidade)
	VALUES(@NomeCliente,
			@CPFCliente,
			@Telefone,
			@Endereco,
			@Bairro,
			@Complemento,
			@Cep,
			@Email,
			@CodigoCidade);
		SET @MsgErro = '' 
END 
ELSE 
BEGIN
    SET @MsgErro = 'O CEP informado não pertence a cidade informada' 
RETURN 
END 
END 
ELSE 
BEGIN
    SET @MsgErro = 'Este cliente já possui cadastro!' 
    RETURN 
END 
END

IF @Acao = 'E2' 
BEGIN
	UPDATE CLIENTES
	SET Nome = @NomeCliente,
    CGC_CPF_Cliente = @CPFCliente,
    Telefone = @Telefone,
    Endereco = @Endereco,
    Bairro = @Bairro,
    Complemento = @Complemento,
    Cep = @Cep,
    E_mail = @Email,
    Codigo_Cidade = @CodigoCidade
WHERE CODIGO_CLIENTE = @CodigoCliente;
  SET @MsgErro = '' 
END

IF @Acao = 'D2' 
BEGIN
  DELETE
  FROM CLIENTES
  WHERE CODIGO_CLIENTE = @CodigoCliente;;
    SET @MsgErro = '' 
END 
END 
  
END;