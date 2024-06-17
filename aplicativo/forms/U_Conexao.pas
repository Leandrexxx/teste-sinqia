unit U_Conexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmConexao = class(TDataModule)
    conexao: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses U_Cidades, U_Clientes, U_Principal, U_Relatorio;

{$R *.dfm}

end.
