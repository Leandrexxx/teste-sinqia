unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Cidades1: TMenuItem;
    Clientes1: TMenuItem;
    Relatrios1: TMenuItem;
    RelatrioTesteSinqia1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    procedure Cidades1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure RelatrioTesteSinqia1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses U_Conexao, U_Cidades, U_Clientes, U_Relatorio;

procedure TFrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  frmCadastroClientes.ShowModal;
end;

procedure TFrmPrincipal.BitBtn2Click(Sender: TObject);
begin
  frmCadastroCidades.ShowModal;
end;

procedure TFrmPrincipal.BitBtn3Click(Sender: TObject);
begin
  frmRelatorio.ShowModal;
end;

procedure TFrmPrincipal.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.Cidades1Click(Sender: TObject);
begin
  frmCadastroCidades.ShowModal;
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmCadastroClientes.ShowModal;
end;

procedure TFrmPrincipal.RelatrioTesteSinqia1Click(Sender: TObject);
begin
  frmRelatorio.ShowModal;
end;

end.
