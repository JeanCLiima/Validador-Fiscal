program Validador;



{$R *.dres}

uses
  Midaslib,
  Vcl.Forms,
  UFiscal in 'UFiscal.pas' {FFiscal},
  UDados in 'UDados.pas' {FDados: TDataModule},
  ULogin in 'ULogin.pas' {FLogin},
  ULocalizar in 'ULocalizar.pas' {FLocalizar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFDados, FDados);
  Application.CreateForm(TFFiscal, FFiscal);
  Application.Run;
end.
