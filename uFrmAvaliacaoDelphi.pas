unit uFrmAvaliacaoDelphi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.Client;

type
  TfrmAvaliacaoDelphi = class(TForm)
    btnInserirClientes: TButton;
    btnInserirModelos: TButton;
    btnInserirVenda: TButton;
    procedure btnInserirClientesClick(Sender: TObject);
    procedure btnInserirModelosClick(Sender: TObject);
    procedure btnInserirVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InserirDadosBD(SQL: string; Params: array of Variant);
    function VarArrayToString(const A: array of Variant): string;
  end;

var
   frmAvaliacaoDelphi: TfrmAvaliacaoDelphi;

implementation

{$R *.dfm}

uses uFrmInserirNovosClientes, uFrmInserirNovaVenda, uFrmInserirNovosModelos;

{ TfrmAvaliacaoDelphi }

procedure TfrmAvaliacaoDelphi.btnInserirClientesClick(Sender: TObject);
var
   novosClientes: TfrmInserirNovosClientes;
begin
     novosClientes := TfrmInserirNovosClientes.Create(Self);

     try
        novosClientes.Show;
     except
           novosClientes.Free;
     end;
end;

procedure TfrmAvaliacaoDelphi.btnInserirModelosClick(Sender: TObject);
var
   novosModelos: TfrmInserirNovosModelos;
begin
     novosModelos := TfrmInserirNovosModelos.Create(Self);

     try
        novosModelos.Show;
     except
           novosModelos.Free;
     end;
end;

procedure TfrmAvaliacaoDelphi.btnInserirVendaClick(Sender: TObject);
var
   novaVenda: TfrmInserirNovaVenda;
begin
     novaVenda := TfrmInserirNovaVenda.Create(Self);

     try
        novaVenda.Show;
     except
           novaVenda.Free;
     end;
end;

procedure TfrmAvaliacaoDelphi.InserirDadosBD(SQL: string;
  Params: array of Variant);
begin
     // Método fictício para inserção no banco de dados
     ShowMessage('SQL: ' + SQL + #13 + 'Params: ' + VarArrayToString(Params));
end;

function TfrmAvaliacaoDelphi.VarArrayToString(
  const A: array of Variant): string;
var
  i: Integer;
begin
     Result := '';

     for i := Low(A) to High(A) do
     begin
          if i > Low(A) then
          begin
               Result := Result + ', ';
          end;

          Result := Result + VarToStr(A[i]);
     end;
end;

end.
