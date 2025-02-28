unit U_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmCadastroClientes = class(TForm)
    dsCadastroClientes: TDataSource;
    qryCidades: TADOQuery;
    dsCidades: TDataSource;
    qryCadastroCliente: TADOQuery;
    qryCadastroClienteCODIGO_CLIENTE: TAutoIncField;
    qryCadastroClienteCGC_CPF_CLIENTE: TStringField;
    qryCadastroClienteNOME: TStringField;
    qryCadastroClienteTELEFONE: TStringField;
    qryCadastroClienteENDERECO: TStringField;
    qryCadastroClienteBAIRRO: TStringField;
    qryCadastroClienteCOMPLEMENTO: TStringField;
    qryCadastroClienteCODIGO_CIDADE: TIntegerField;
    qryCadastroClientecep: TStringField;
    qryVerificaCep: TADOQuery;
    qryVerificaCpf: TADOQuery;
    qryCadastroClientee_mail: TStringField;
    Panel2: TPanel;
    PageControl1: TPageControl;
    tabConsulta: TTabSheet;
    Label7: TLabel;
    edtPesquisa: TEdit;
    DBGrid1: TDBGrid;
    tabCadastro: TTabSheet;
    Label6: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    lblCampos: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dblkCidade: TDBLookupComboBox;
    dbedtCodigo: TDBEdit;
    dbedtCpf: TDBEdit;
    dbedtNome: TDBEdit;
    dbedtTelefone: TDBEdit;
    dbedtEndereco: TDBEdit;
    dbedtBairro: TDBEdit;
    dbedtComplemento: TDBEdit;
    dbedtEmail: TDBEdit;
    dbedtCep: TDBEdit;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnSair: TBitBtn;
    rbNome: TRadioButton;
    rbCpf: TRadioButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure TrocarEstadoBotoes ;
    procedure TrocarEstadoBotoesInverter;
    procedure destravaBotoes;
    procedure travaBotoes;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

{$R *.dfm}

uses U_Conexao;


procedure TfrmCadastroClientes.TrocarEstadoBotoes;
begin
  btnNovo.Enabled     :=    not btnNovo.Enabled;
  btnEditar.Enabled   :=    not btnEditar.Enabled;
  btnExcluir.Enabled  :=    not btnExcluir.Enabled;
  btnCancelar.Enabled :=    not btnCancelar.Enabled;
  btnGravar.Enabled   :=    not btnGravar.Enabled;
end;

procedure TfrmCadastroClientes.TrocarEstadoBotoesInverter;
begin
  btnNovo.Enabled     := True;
  btnEditar.Enabled   := True;
  btnExcluir.Enabled  := True;
end;

procedure TfrmCadastroClientes.destravaBotoes;
begin
  dbedtCpf.ReadOnly         := False;
  dbedtNome.ReadOnly        := False;
  dbedtEndereco.ReadOnly    := False;
  dbedtBairro.ReadOnly      := False;
  dbedtComplemento.ReadOnly := False;
  dbedtTelefone.ReadOnly    := False;
  dbedtEmail.ReadOnly       := False;
  dbedtCep.ReadOnly         := False;
  dblkCidade.ReadOnly       := False;

end;

procedure TfrmCadastroClientes.travaBotoes;
begin
  dbedtCpf.ReadOnly         := True;
  dbedtNome.ReadOnly        := True;
  dbedtEndereco.ReadOnly    := True;
  dbedtBairro.ReadOnly      := True;
  dbedtComplemento.ReadOnly := True;
  dbedtTelefone.ReadOnly    := True;
  dbedtEmail.ReadOnly       := True;
  dbedtCep.ReadOnly         := True;
  dblkCidade.ReadOnly       := True;

end;

procedure TfrmCadastroClientes.btnCancelarClick(Sender: TObject);
begin
  if qryCadastroCliente.State in [dsInsert,dsEdit] then
  begin
    qryCadastroCliente.Cancel;
    TrocarEstadoBotoes;
    travaBotoes;
  end;

end;

procedure TfrmCadastroClientes.btnEditarClick(Sender: TObject);
begin
  qryCadastroCliente.Edit;
  TrocarEstadoBotoes;
  destravaBotoes
end;

procedure TfrmCadastroClientes.btnExcluirClick(Sender: TObject);
begin

  if MessageBoxEx(Handle,'Você esta excluíndo o cadastro de uma cidade!'+
  #13+#10+'Deseja continuar?','Confirmação',MB_YESNO,LANG_PORTUGUESE)=MRYES then
  begin
    if not(qryCadastroCliente.IsEmpty) then
    begin
      qryCadastroCliente.Delete;
      TrocarEstadoBotoesInverter;
      travaBotoes;
    end
    else
    begin
      showmessage('Não foi encontrado nenhum registro');
      exit;
    end;
  end;
end;

procedure TfrmCadastroClientes.btnGravarClick(Sender: TObject);
begin

  if (dbedtCpf.Text = '           ') then
  begin
    ShowMessage('ATENÇÃO: O campo do CPF não pode ficar em branco');
    dbedtCpf.SetFocus;
    exit;
  end
  else
  begin

  qryVerificaCpf.Close;
  qryVerificaCpf.Parameters.ParamByName('cpfCliente').Value := dbedtCpf.Text;
  qryVerificaCpf.Open;

  if qryCadastroCliente.State in [dsInsert] then
  begin
    if not(qryVerificaCpf.IsEmpty) then
    begin
      ShowMessage('ATENÇÃO: Já existe um cliente cadastrado com o CPF que esta tentando inserir, por gentileza verefique!');
      dbedtNome.SetFocus;
      exit;
    end;
  end;

  if qryCadastroCliente.State in [dsEdit] then
  begin
    if qryVerificaCpf.RecordCount > 1 then
    begin
      ShowMessage('ATENÇÃO: Já existe um cliente cadastrado com o CPF que esta tentando editar, por gentileza verefique!');
      dbedtNome.SetFocus;
      exit;
    end;
  end;
  end;

  if dbedtNome.Text = '' then
  begin
    ShowMessage('ATENÇÃO: O campo do Nome não pode ficar em branco');
    dbedtNome.SetFocus;
    exit;
  end;

  if dblkCidade.Text = '' then
  begin
    ShowMessage('ATENÇÃO: O campo da Cidade não pode ficar em branco');
    exit;
  end;

  if (dbedtCep.Text = '        ') then
  begin
    ShowMessage('ATENÇÃO: O campo do CEP não pode ficar em branco');
    dbedtCep.SetFocus;
    exit;
  end;

  try
  if qryCadastroCliente.State in [dsInsert,dsEdit] then
  begin
  qryVerificaCep.Close;
  qryVerificaCep.Parameters.ParamByName('codCidade').Value := dblkCidade.KeyValue;
  qryVerificaCep.Parameters.ParamByName('cep').Value := dbedtCep.Text;
  qryVerificaCep.Open;

  if (qryVerificaCep.IsEmpty) then
  begin
    ShowMessage('ATENÇÃO: O CEP informado não corresponde ao CEP Incial e Final da cidade informada!');
    dbedtCep.SetFocus;
    exit;
  end;

  qryCadastroCliente.Post;
  TrocarEstadoBotoes;
  travaBotoes;
      ShowMessage('Processo concluído com sucesso!');
  end;

  except
  on E: Exception do
  begin
    ShowMessage('Ocorreu um erro ao gravar o cliente: ' + E.Message);

  if qryCadastroCliente.State in [dsInsert, dsEdit] then
  begin
    qryCadastroCliente.Cancel;
  end;

  end;

  end;
end;

procedure TfrmCadastroClientes.btnNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := tabCadastro;
  qryCadastroCliente.Insert;
  TrocarEstadoBotoes;
  dbedtCpf.SetFocus;
  destravaBotoes
end;

procedure TfrmCadastroClientes.btnSairClick(Sender: TObject);
begin
  qryCadastroCliente.Close;
  Close;
end;

procedure TfrmCadastroClientes.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (rbNome.Checked) then
  begin
  qryCadastroCliente.Locate('nome',edtPesquisa.Text,[loPartialKey,loCaseInsensitive]);
  end;

  if (rbCpf.Checked) then
  begin
  qryCadastroCliente.Locate('cgc_cpf_cliente',edtPesquisa.Text,[loPartialKey,loCaseInsensitive]);
  end;

end;

procedure TfrmCadastroClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCadastroCliente.Close;
end;

procedure TfrmCadastroClientes.FormShow(Sender: TObject);
begin
  rbNome.Checked := true;
  qryCadastroCliente.Close;
  qryCadastroCliente.Open;
  qryCidades.Close;
  qryCidades.Open;
  travaBotoes;
end;

end.
