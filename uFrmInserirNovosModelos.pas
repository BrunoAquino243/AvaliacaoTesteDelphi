unit uFrmInserirNovosModelos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmInserirNovosModelos = class(TForm)
    btnInserir5NovosModelos: TButton;
    procedure btnInserir5NovosModelosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TModeloCarro = class
  private
    FModeloID: Integer;
    FNomeModelo: String;
    FDataLancamento: String;
  public
    property ModeloID: Integer read FModeloID write FModeloID;
    property NomeModelo: String read FNomeModelo write FNomeModelo;
    property DataLancamento: String read FDataLancamento write FDataLancamento;
  end;

var
  frmInserirNovosModelos: TfrmInserirNovosModelos;

implementation

{$R *.dfm}

uses uFrmAvaliacaoDelphi;

procedure TfrmInserirNovosModelos.btnInserir5NovosModelosClick(Sender: TObject);
var
   Modelo: TModeloCarro;
   i: Integer;
begin
     for i := 1 to 5 do
     begin
          Modelo := TModeloCarro.Create;

          try
             Modelo.ModeloID := 20 + i; // ID fictício
             Modelo.NomeModelo := 'Modelo ' + IntToStr(i);
             Modelo.DataLancamento := '15/02/202'+ IntToStr(i);

             frmAvaliacaoDelphi.InserirDadosBD('INSERT INTO ModelosCarros (ModeloID, NomeModelo, DataLancamento) '+
                                               'VALUES (:ModeloID, :NomeModelo, :DataLancamento)',
                                               [Modelo.ModeloID, Modelo.NomeModelo, Modelo.DataLancamento]
                                              );
          finally
                 Modelo.Free;
          end;
     end;
end;

end.
