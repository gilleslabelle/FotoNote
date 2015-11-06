program FotoNoteFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainMobileAppV2 in 'MainMobileAppV2.pas' {MainForm},
  ClientsU in '..\commun\ClientsU.pas',
  MsgObjU in '..\commun\MsgObjU.pas',
  NotesU in '..\commun\NotesU.pas',
  UtilsU in '..\commun\UtilsU.pas',
  UtilsU_FMX in '..\commun\UtilsU_FMX.pas',
  MainDataModule in 'MainDataModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
