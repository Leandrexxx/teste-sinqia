object frmCadastroClientes: TfrmCadastroClientes
  Left = 0
  Top = 0
  Caption = 'Cadastro Clientes'
  ClientHeight = 425
  ClientWidth = 899
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 386
    Top = 60
    Width = 46
    Height = 14
    Caption = 'Pesquisa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 24
    Top = 24
    Width = 215
    Height = 25
    Caption = 'Cadastro de Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 16
    Top = 312
    Width = 36
    Height = 14
    Caption = 'Cidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 72
    Width = 37
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = dbedtCodigo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 104
    Top = 72
    Width = 20
    Height = 14
    Caption = 'CPF'
    FocusControl = dbedtCpf
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 120
    Width = 32
    Height = 14
    Caption = 'Nome'
    FocusControl = dbedtNome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 261
    Width = 49
    Height = 14
    Caption = 'Telefone'
    FocusControl = dbedtTelefone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 168
    Width = 52
    Height = 14
    Caption = 'Endere'#231'o'
    FocusControl = dbedtEndereco
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 16
    Top = 216
    Width = 30
    Height = 14
    Caption = 'Bairro'
    FocusControl = dbedtBairro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 232
    Top = 213
    Width = 76
    Height = 14
    Caption = 'Complemento'
    FocusControl = dbedtComplemento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 112
    Top = 259
    Width = 31
    Height = 14
    Caption = 'e-mail'
    FocusControl = dbedtEmail
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 253
    Top = 315
    Width = 21
    Height = 14
    Caption = 'CEP'
    FocusControl = dbedtCep
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCampos: TLabel
    Left = 16
    Top = 363
    Width = 175
    Height = 14
    Caption = 'Campos com '#39'*'#39' s'#227'o obrigat'#243'rios'
    FocusControl = dbedtNome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 130
    Top = 71
    Width = 7
    Height = 14
    Caption = '*'
    Color = clWhite
    FocusControl = dbedtNome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label14: TLabel
    Left = 55
    Top = 118
    Width = 7
    Height = 14
    Caption = '*'
    Color = clWhite
    FocusControl = dbedtNome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label15: TLabel
    Left = 55
    Top = 311
    Width = 7
    Height = 14
    Caption = '*'
    Color = clWhite
    FocusControl = dbedtNome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label16: TLabel
    Left = 276
    Top = 313
    Width = 7
    Height = 14
    Caption = '*'
    Color = clWhite
    FocusControl = dbedtNome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object btnExcluir: TBitBtn
    Left = 154
    Top = 383
    Width = 65
    Height = 35
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnExcluirClick
  end
  object btnEditar: TBitBtn
    Left = 83
    Top = 383
    Width = 65
    Height = 35
    Caption = 'Editar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = btnEditarClick
  end
  object btnNovo: TBitBtn
    Left = 12
    Top = 383
    Width = 65
    Height = 35
    Caption = 'Novo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = btnNovoClick
  end
  object btnCancelar: TBitBtn
    Left = 225
    Top = 383
    Width = 65
    Height = 35
    Caption = 'Cancelar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = btnCancelarClick
  end
  object btnGravar: TBitBtn
    Left = 296
    Top = 383
    Width = 65
    Height = 35
    Caption = 'Gravar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = btnGravarClick
  end
  object edtPesquisa: TEdit
    Left = 386
    Top = 80
    Width = 503
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnKeyDown = edtPesquisaKeyDown
  end
  object DBGrid1: TDBGrid
    Left = 386
    Top = 108
    Width = 503
    Height = 277
    DataSource = dsCadastroClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 244
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGC_CPF_CLIENTE'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Width = 103
        Visible = True
      end>
  end
  object dblkCidade: TDBLookupComboBox
    Left = 16
    Top = 331
    Width = 223
    Height = 22
    DataField = 'CODIGO_CIDADE'
    DataSource = dsCadastroClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'CODIGO_CIDADE'
    ListField = 'NOME'
    ListSource = dsCidades
    ParentFont = False
    TabOrder = 8
  end
  object dbedtCodigo: TDBEdit
    Left = 16
    Top = 88
    Width = 72
    Height = 22
    DataField = 'CODIGO_CLIENTE'
    DataSource = dsCadastroClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
  end
  object dbedtCpf: TDBEdit
    Left = 104
    Top = 88
    Width = 186
    Height = 22
    DataField = 'CGC_CPF_CLIENTE'
    DataSource = dsCadastroClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object dbedtNome: TDBEdit
    Left = 16
    Top = 139
    Width = 345
    Height = 22
    DataField = 'NOME'
    DataSource = dsCadastroClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object dbedtTelefone: TDBEdit
    Left = 16
    Top = 277
    Width = 81
    Height = 22
    DataField = 'TELEFONE'
    DataSource = dsCadastroClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object dbedtEndereco: TDBEdit
    Left = 16
    Top = 185
    Width = 345
    Height = 22
    DataField = 'ENDERECO'
    DataSource = dsCadastroClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object dbedtBairro: TDBEdit
    Left = 16
    Top = 232
    Width = 193
    Height = 22
    DataField = 'BAIRRO'
    DataSource = dsCadastroClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object dbedtComplemento: TDBEdit
    Left = 232
    Top = 232
    Width = 129
    Height = 22
    DataField = 'COMPLEMENTO'
    DataSource = dsCadastroClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object dbedtEmail: TDBEdit
    Left = 112
    Top = 277
    Width = 249
    Height = 22
    CharCase = ecLowerCase
    DataField = 'e_mail'
    DataSource = dsCadastroClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object dbedtCep: TDBEdit
    Left = 253
    Top = 331
    Width = 108
    Height = 22
    DataField = 'cep'
    DataSource = dsCadastroClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object btnSair: TBitBtn
    Left = 825
    Top = 39
    Width = 65
    Height = 35
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = btnSairClick
  end
  object dsCadastroClientes: TDataSource
    DataSet = qryCadastroCliente
    Left = 952
    Top = 192
  end
  object qryCidades: TADOQuery
    Connection = dmConexao.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cidades')
    Left = 904
    Top = 144
  end
  object dsCidades: TDataSource
    DataSet = qryCidades
    Left = 952
    Top = 144
  end
  object qryCadastroCliente: TADOQuery
    Connection = dmConexao.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from clientes')
    Left = 904
    Top = 192
    object qryCadastroClienteCODIGO_CLIENTE: TAutoIncField
      FieldName = 'CODIGO_CLIENTE'
      ReadOnly = True
    end
    object qryCadastroClienteCGC_CPF_CLIENTE: TStringField
      FieldName = 'CGC_CPF_CLIENTE'
      EditMask = '000\.000\.000\-00;0;_'
      Size = 14
    end
    object qryCadastroClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qryCadastroClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(99\)00000-0000;0;_'
      Size = 14
    end
    object qryCadastroClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object qryCadastroClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object qryCadastroClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 50
    end
    object qryCadastroClienteCODIGO_CIDADE: TIntegerField
      FieldName = 'CODIGO_CIDADE'
    end
    object qryCadastroClientecep: TStringField
      FieldName = 'cep'
      EditMask = '00000\-999;0;_'
      Size = 8
    end
    object qryCadastroClientee_mail: TStringField
      FieldName = 'e_mail'
      Size = 100
    end
  end
  object qryVerificaCep: TADOQuery
    Connection = dmConexao.conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'codCidade'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'cep'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'Select * from cidades'
      'where codigo_cidade = :codCidade '
      'and :cep between cep_inicial and cep_final')
    Left = 928
    Top = 88
  end
  object qryVerificaCpf: TADOQuery
    Connection = dmConexao.conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'cpfCliente'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 14
        Value = Null
      end>
    SQL.Strings = (
      'Select * from clientes '
      'where cgc_cpf_cliente = :cpfCliente')
    Left = 920
    Top = 248
  end
end
