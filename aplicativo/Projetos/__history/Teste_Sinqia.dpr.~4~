program Teste_Sinqia;

uses
  Vcl.Forms,
  U_Principal in '..\forms\U_Principal.pas' {FrmPrincipal},
  U_Conexao in '..\DCU\U_Conexao.pas' {dmConexao: TDataModule},
  U_Cidades in '..\DCU\U_Cidades.pas' {frmCadastroCidades},
  U_Clientes in '..\DCU\U_Clientes.pas' {frmCadastroClientes},
  U_Relatorio in '..\DCU\U_Relatorio.pas' {frmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmCadastroCidades, frmCadastroCidades);
  Application.CreateForm(TfrmCadastroClientes, frmCadastroClientes);
  Application.CreateForm(TfrmRelatorio, frmRelatorio);
  Application.Run;
end.
