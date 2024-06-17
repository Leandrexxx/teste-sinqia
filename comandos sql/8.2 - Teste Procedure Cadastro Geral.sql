
	---INSERIR CIDADE
	DECLARE @MsgErro VARCHAR(255) = ''
	EXEC proc_Cadastros
	@TipoOperacao = 1,
    @Acao = 'I1',
    @CodigoCidade = NULL,
    @NomeCidade = 'TESTE TUPÃ',
    @Estado = 'ST',
    @CepInicial = '12345678',
    @CepFinal = '87654321',
	@MsgErro = @MsgErro OUTPUT;

	SELECT @MsgErro;
	----------------------------------------
	----EDITAR CIDADE
	DECLARE @MsgErro VARCHAR(255) = ''
	EXEC proc_Cadastros
	@TipoOperacao = 1,
    @Acao = 'E1',
    @CodigoCidade = 1,--->>>VERFICAR O ID
    @NomeCidade = 'CidadeFinalProc',
    @Estado = 'TS',
    @CepInicial = '17603700',
    @CepFinal = '17603800',
	@MsgErro = @MsgErro OUTPUT;

	SELECT @MsgErro;
	----------------------------------------
	-----EXCLUIR CIDADE
	DECLARE @MsgErro VARCHAR(255) = ''
	EXEC proc_Cadastros
	@TipoOperacao = 1,
    @Acao = 'D1',
    @CodigoCidade = 1,--->>>VERFICAR O ID
	@MsgErro = @MsgErro OUTPUT;
	SELECT @MsgErro;

	SELECT @MsgErro;
	----------------------------------
	---INSERIR CLIENTES
	DECLARE @MsgErro VARCHAR(255) = ''
	EXEC proc_Cadastros
	@TipoOperacao = 2,
    @Acao = 'I2',
    @CodigoCliente = NULL,  
    @NomeCliente = 'Cliente Teste final',
    @CPFCliente = '12345688888',
    @Telefone = '1234567890',
    @Endereco = 'Rua Teste, 123',
    @Bairro = 'Bairro Teste',
    @Complemento = 'Apto 101',
    @Cep = '17603700',
    @Email = 'cliente@teste.com',
    @CodigoCidade = 1,--->>>VERFICAR O ID
	@MsgErro = null;  

	SELECT @MsgErro;
	----------------------------------
	---EDITAR CLIENTES
	DECLARE @MsgErro VARCHAR(255) = ''
	EXEC proc_Cadastros
	@TipoOperacao = 2,
    @Acao = 'E2',
    @CodigoCliente = 1,  
    @NomeCliente = 'TESTE final',
    @CPFCliente = '12345688888',
    @Telefone = '1234567890',
    @Endereco = 'Rua Teste, 123',
    @Bairro = 'Bairro Teste',
    @Complemento = 'Apto 101',
    @Cep = '12345679',
    @Email = 'cliente@teste.com',
    @CodigoCidade = 1,--->>>VERFICAR O ID
	@MsgErro =  @MsgErro OUTPUT;  
	SELECT @MsgErro;
	-----------------------------------
	----EXCLUIR CLIENTES
	DECLARE @MsgErro VARCHAR(255) = ''

	EXEC proc_Cadastros
	@TipoOperacao = 2,
    @Acao = 'D2',
    @CodigoCliente = 1,  --->>>VERFICAR O ID
	@MsgErro = @MsgErro OUTPUT;
	SELECT @MsgErro;

	-------------