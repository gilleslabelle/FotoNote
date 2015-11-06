program AM.TestPhotoReceiveVCL;

uses
  Vcl.Forms,
  AM.Gestion.PhotoMobileVCL in 'AM.Gestion.PhotoMobileVCL.pas' {frmPhoto},
  ClientsU in '..\commun\ClientsU.pas',
  MsgObjU in '..\commun\MsgObjU.pas',
  UtilsU in '..\commun\UtilsU.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPhoto, frmPhoto);
  Application.Run;
end.
