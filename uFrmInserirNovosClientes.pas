unit uFrmInserirNovosClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmInserirNovosClientes = class(TForm)
    btnInserir5NovosClientes: TButton;
    procedure btnInserir5NovosClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TCliente = class
  private
    FClienteID: Integer;
    FNome: String;
    FCPF: String;
    FDataNascimento: String;
  public
    property ClienteID: Integer read FClienteID write FClienteID;
    property Nome: String read FNome write FNome;
    property CPF: String read FCPF write FCPF;
    property DataNascimento: String read FDataNascimento write FDataNascimento;
  end;

var
  frmInserirNovosClientes: TfrmInserirNovosClientes;

implementation

{$R *.dfm}

uses uFrmAvaliacaoDelphi;

procedure TfrmInserirNovosClientes.btnInserir5NovosClientesClick(Sender: TObject);
var
   Cliente: TCliente;
   i: Integer;
begin
     for i := 1 to 5 do
     begin
          Cliente := TCliente.Create;

          try
             Cliente.ClienteID := 100 + i; // ID fictício
             Cliente.Nome := 'Bruno ' + IntToStr(i);
             Cliente.CPF := '0' + IntToStr(112152159 + i); // CPF fictício
             Cliente.DataNascimento := '20/05/199'+ IntToStr(i);

             frmAvaliacaoDelphi.InserirDadosBD('INSERT INTO Clientes (ClienteID, Nome, CPF, DataNascimento) '+
                                               'VALUES (:ClienteID, :Nome, :CPF, :DataNascimento)',
                                               [Cliente.ClienteID, Cliente.Nome, Cliente.CPF, Cliente.DataNascimento]
                                              );
          finally
                 Cliente.Free;
          end;
     end;
end;

end.
