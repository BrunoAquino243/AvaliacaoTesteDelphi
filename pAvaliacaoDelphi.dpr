program pAvaliacaoDelphi;

uses
  Vcl.Forms,
  uFrmAvaliacaoDelphi in 'uFrmAvaliacaoDelphi.pas' {frmAvaliacaoDelphi},
  uFrmInserirNovosClientes in 'uFrmInserirNovosClientes.pas' {frmInserirNovosClientes},
  uFrmInserirNovosModelos in 'uFrmInserirNovosModelos.pas' {frmInserirNovosModelos},
  uFrmInserirNovaVenda in 'uFrmInserirNovaVenda.pas' {frmInserirNovaVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAvaliacaoDelphi, frmAvaliacaoDelphi);
  Application.CreateForm(TfrmInserirNovosClientes, frmInserirNovosClientes);
  Application.CreateForm(TfrmInserirNovosModelos, frmInserirNovosModelos);
  Application.CreateForm(TfrmInserirNovaVenda, frmInserirNovaVenda);
  Application.Run;
end.
