unit uFrmInserirNovaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmInserirNovaVenda = class(TForm)
    btnInserirNovaVenda: TButton;
    procedure btnInserirNovaVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TVenda = class
  private
    FVendaID: Integer;
    FClienteID: Integer;
    FModeloID: Integer;
    FDataVenda: String;
  public
    property VendaID: Integer read FVendaID write FVendaID;
    property ClienteID: Integer read FClienteID write FClienteID;
    property ModeloID: Integer read FModeloID write FModeloID;
    property DataVenda: String read FDataVenda write FDataVenda;
  end;

var
  frmInserirNovaVenda: TfrmInserirNovaVenda;

implementation

{$R *.dfm}

uses uFrmAvaliacaoDelphi;

procedure TfrmInserirNovaVenda.btnInserirNovaVendaClick(Sender: TObject);
var
   Venda: TVenda;
   i: Integer;
begin
     for i := 1 to 5 do
     begin
          Venda := TVenda.Create;

          try
             Venda.VendaID := 300 + i; // ID fictício
             Venda.ClienteID := 100 + i; // ID do cliente inserido
             Venda.ModeloID := 20 + i; // ID do modelo inserido
             Venda.DataVenda := '23/03/2025'; // Data atual

             frmAvaliacaoDelphi.InserirDadosBD('INSERT INTO Vendas (VendaID, ClienteID, ModeloID, DataVenda) '+
                                               'VALUES (:VendaID, :ClienteID, :ModeloID, :DataVenda)',
                                               [Venda.VendaID, Venda.ClienteID, Venda.ModeloID, Venda.DataVenda]
                                              );
          finally
                 Venda.Free;
          end;
     end;
end;

end.
