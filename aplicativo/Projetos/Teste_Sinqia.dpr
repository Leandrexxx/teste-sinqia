program Teste_Sinqia;

uses
  Vcl.Forms,
  U_Principal in '..\forms\U_Principal.pas' {FrmPrincipal},
  U_Clientes in '..\forms\U_Clientes.pas' {frmCadastroClientes},
  U_Cidades in '..\forms\U_Cidades.pas' {frmCadastroCidades},
  U_Relatorio in '..\forms\U_Relatorio.pas' {frmRelatorio},
  U_Conexao in '..\forms\U_Conexao.pas' {dmConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TfrmCadastroClientes, frmCadastroClientes);
  Application.CreateForm(TfrmCadastroCidades, frmCadastroCidades);
  Application.CreateForm(TfrmRelatorio, frmRelatorio);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
