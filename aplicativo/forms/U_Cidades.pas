unit U_Cidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Data.DB, Data.Win.ADODB, ppCtrls,
  ppPrnabl, ppClass, ppBands, ppCache, ppDesignLayer, ppParameter, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmCadastroCidades = class(TForm)
    qryCadastroCidades: TADOQuery;
    dsCadastroCidades: TDataSource;
    qryCadastroCidadesCODIGO_CIDADE: TAutoIncField;
    qryCadastroCidadesNOME: TStringField;
    qryCadastroCidadesESTADO: TStringField;
    qryCadastroCidadesCEP_INICIAL: TStringField;
    qryCadastroCidadesCEP_FINAL: TStringField;
    qryVerificaCidade: TADOQuery;
    qryVerificaCidadeCliente: TADOQuery;
    qryRelCidades: TADOQuery;
    dsRelCidades: TDataSource;
    prRelCidades: TppReport;
    plRelCidades: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppLine2: TppLine;
    Panel1: TPanel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    PageControl1: TPageControl;
    tabConsulta: TTabSheet;
    tabCadastro: TTabSheet;
    gridPesquisa: TDBGrid;
    edtPesquisa: TEdit;
    Label7: TLabel;
    dbedtUf: TDBEdit;
    dbedtCepInicial: TDBEdit;
    dbedtCepFinal: TDBEdit;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbedtNome: TDBEdit;
    Label2: TLabel;
    dbeditCodigo: TDBEdit;
    Label1: TLabel;
    Label10: TLabel;
    btnSair: TBitBtn;
    btnRelatorio: TBitBtn;
    Label6: TLabel;
    rbNome: TRadioButton;
    Label13: TLabel;
    rbUf: TRadioButton;
    Label9: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedtCepInicialExit(Sender: TObject);
    procedure dbedtCepFinalExit(Sender: TObject);
    procedure dbedtUfKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtUfExit(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRelatorioClick(Sender: TObject);
    procedure pprRelAfterPrint(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    procedure TrocarEstadoBotoes;
    procedure TrocarEstadoBotoesInverter ;
    procedure somenteLetras(var Key: char);
    procedure destravaBotoes;
    procedure travaBotoes;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCidades: TfrmCadastroCidades;

implementation

{$R *.dfm}

uses U_Conexao;

procedure TfrmCadastroCidades.somenteLetras(var Key:Char);
begin
  if not (Key in ['A'..'Z', 'a'..'z', #8, #9, #13, #27]) then
  begin
    Key := #0;
  end;

end;

procedure TfrmCadastroCidades.trocarEstadoBotoes;
begin
  btnNovo.Enabled     :=    not btnNovo.Enabled;
  btnEditar.Enabled   :=    not btnEditar.Enabled;
  btnExcluir.Enabled  :=    not btnExcluir.Enabled;
  btnCancelar.Enabled :=    not btnCancelar.Enabled;
  btnGravar.Enabled   :=    not btnGravar.Enabled;
end;

procedure TfrmCadastroCidades.trocarEstadoBotoesInverter;
begin
  btnNovo.Enabled     := True;
  btnEditar.Enabled   := True;
  btnExcluir.Enabled  := True;
  btnCancelar.Enabled := True;
  btnGravar.Enabled   := True;
end;

procedure TfrmCadastroCidades.destravaBotoes;
begin
  dbedtNome.ReadOnly       := False;
  dbedtUf.ReadOnly         := False;
  dbedtCepInicial.ReadOnly := False;
  dbedtCepFinal.ReadOnly   := False;

end;

procedure TfrmCadastroCidades.travaBotoes;
begin
  dbedtNome.ReadOnly       := True;
  dbedtUf.ReadOnly         := True;
  dbedtCepInicial.ReadOnly := True;
  dbedtCepFinal.ReadOnly   := True;

end;

procedure TfrmCadastroCidades.btnCancelarClick(Sender: TObject);
begin
  if qryCadastroCidades.State in [dsInsert,dsEdit] then
  begin
    qryCadastroCidades.Cancel;
    trocarEstadoBotoes;
    travaBotoes
  end;
end;

procedure TfrmCadastroCidades.btnEditarClick(Sender: TObject);
begin
  qryCadastroCidades.Edit;
  trocarEstadoBotoes;
  destravaBotoes;
end;

procedure TfrmCadastroCidades.btnExcluirClick(Sender: TObject);
begin
  qryVerificaCidadeCliente.Close;
  qryVerificaCidadeCliente.Parameters.ParamByName('cidadeCliente').Value := qryCadastroCidades.FieldByName('codigo_cidade').AsInteger;
  qryVerificaCidadeCliente.Open;

  if qryVerificaCidadeCliente.IsEmpty then
  begin
    if MessageBoxEx(Handle,'Voc� esta exclu�ndo o cadastro de uma cidade!'+
    #13+#10+'Deseja continuar?','Confirma��o',MB_YESNO,LANG_PORTUGUESE)=MRYES then
    begin
      if not(qryCadastroCidades.IsEmpty) then
      begin
        qryCadastroCidades.Delete;
        trocarEstadoBotoesInverter;
        travaBotoes;
      end
      else
      begin
        Showmessage('N�o foi encontrado nenhum registro');
      end;
    end;
  end
  else
  begin
    ShowMessage('ATEN��O: N�o � poss�vel exclu�r uma cidade que possui clientes cadastrados!');
    exit;
  end;

end;

procedure TfrmCadastroCidades.btnGravarClick(Sender: TObject);
begin

  if dbedtNome.Text = '' then
  begin
    ShowMessage('ATEN��O: O campo com o nome da cidade n�o pode ficar em branco!');
    dbedtNome.SetFocus;
    exit;
  end;

  qryVerificaCidade.Close;
  qryVerificaCidade.Parameters.ParamByName('nomeCidade').Value := dbedtNome.Text;
  qryVerificaCidade.Open;

  if qryCadastroCidades.State in [dsInsert] then
  begin
    if not(qryVerificaCidade.IsEmpty) then
    begin
      ShowMessage('ATEN��O: J� existe uma cidade com o nome que esta tentando inserir, por gentileza verefique!');
      dbedtNome.Text;
      exit;
    end;
  end;

  if qryCadastroCidades.State in [dsEdit] then
  begin
    if qryVerificaCidade.RecordCount > 1 then
    begin
      ShowMessage('ATEN��O: J� existe uma cidade com o nome que esta tentando editar, por gentileza verefique!');
      dbedtNome.Text;
      exit;
    end;
  end;

  if dbedtUf.Text = '' then
  begin
    ShowMessage('ATEN��O: O campo com o UF do estado n�o pode ficar em branco!');
    dbedtUf.SetFocus;
    exit;
  end;

  if dbedtCepInicial.Text = '        ' then
  begin
    ShowMessage('ATEN��O: O campo com o Cep in�cial da cidade n�o pode ficar em branco!');
    dbedtCepInicial.SetFocus;
    exit;
  end;

  if dbedtCepFinal.text = '        ' then
  begin
    ShowMessage('ATEN��O: O campo com o Cep final da cidade n�o pode ficar em branco!');
    dbedtCepFinal.SetFocus;
    exit;
  end;

  try
  if qryCadastroCidades.State in [dsInsert,dsEdit] then
  begin
    qryCadastroCidades.Post;
    trocarEstadoBotoes;
    travaBotoes;

    ShowMessage('Processo conclu�do com sucesso!');
   end;

   except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um erro ao gravar a cidade: ' + E.Message);

    if qryCadastroCidades.State in [dsInsert, dsEdit] then
    begin
      qryCadastroCidades.Cancel;
    end;
    end;
  end;

end;

procedure TfrmCadastroCidades.btnNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := tabCadastro;
  qryCadastroCidades.Insert;
  trocarEstadoBotoes;
  dbedtNome.SetFocus;
  destravaBotoes;
end;

procedure TfrmCadastroCidades.btnRelatorioClick(Sender: TObject);
begin
  qryRelCidades.Open;
  if not(qryRelCidades.IsEmpty) then
  begin
    prRelCidades.Print;
  end
  else
  begin
    ShowMessage('Nenhum registro foi encontrado!');
  end;
end;

procedure TfrmCadastroCidades.btnSairClick(Sender: TObject);
begin
  qryCadastroCidades.Close;
  close;
end;

procedure TfrmCadastroCidades.dbedtUfExit(Sender: TObject);
begin
  if Length(dbedtUf.Text) < 2 then
  begin
    Showmessage('Aten��o: N�o foi inserido a quantidade correta de caracteres para o UF!');
    dbedtUf.SetFocus;
    exit;
  end;
end;

procedure TfrmCadastroCidades.dbedtUfKeyPress(Sender: TObject; var Key: Char);
begin
  somenteLetras(Key);
end;

procedure TfrmCadastroCidades.dbedtCepInicialExit(Sender: TObject);
begin
  if Length(dbedtCepInicial.Text) < 8 then
  begin
    Showmessage('Aten��o: N�o foi inserido a quantidade correta de caracteres para o CEP!');
    dbedtCepInicial.SetFocus;
    exit;
  end;

end;

procedure TfrmCadastroCidades.dbedtCepFinalExit(Sender: TObject);
begin
  if Length(dbedtCepFinal.Text) < 8 then
  begin
    Showmessage('Aten��o: N�o foi inserido a quantidade correta de caracteres para o CEP!');
    dbedtCepFinal.SetFocus;
    exit;
  end;
end;

procedure TfrmCadastroCidades.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  qryCadastroCidades.Locate('nome',edtPesquisa.Text,[loPartialKey,loCaseInsensitive]);

  if (rbNome.Checked) then
  begin
  qryCadastroCidades.Locate('nome',edtPesquisa.Text,[loPartialKey,loCaseInsensitive]);
  end;

  if (rbUf.Checked) then
  begin
  qryCadastroCidades.Locate('estado',edtPesquisa.Text,[loPartialKey,loCaseInsensitive]);
  end;
end;

procedure TfrmCadastroCidades.FormShow(Sender: TObject);
begin
  rbNome.Checked := true;
  qryCadastroCidades.Close;
  qryCadastroCidades.Open;
  travaBotoes;
end;

procedure TfrmCadastroCidades.pprRelAfterPrint(Sender: TObject);
begin
  qryRelCidades.Close;
end;

end.
