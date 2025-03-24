object frmAvaliacaoDelphi: TfrmAvaliacaoDelphi
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'frmAvaliacaoDelphi'
  ClientHeight = 72
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object btnInserirClientes: TButton
    Left = 5
    Top = 8
    Width = 108
    Height = 57
    Caption = 'Inserir Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnInserirClientesClick
  end
  object btnInserirModelos: TButton
    Left = 119
    Top = 8
    Width = 108
    Height = 57
    Caption = 'Inserir Modelos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnInserirModelosClick
  end
  object btnInserirVenda: TButton
    Left = 233
    Top = 8
    Width = 108
    Height = 57
    Caption = 'Inserir Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnInserirVendaClick
  end
end
