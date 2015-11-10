program FotoNote;

uses
  {$IFDEF MSWINDOWS}
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  {$ENDIF }
  System.StartUpCopy,
  FMX.Forms,
  MainMobileAppV2 in 'MainMobileAppV2.pas' {MainForm},
  ClientsU in '..\commun\ClientsU.pas',
  MsgObjU in '..\commun\MsgObjU.pas',
  NotesU in '..\commun\NotesU.pas',
  UtilsU in '..\commun\UtilsU.pas',
  UtilsU_FMX in '..\commun\UtilsU_FMX.pas',
  MainDataModule in 'MainDataModule.pas' {DataModule1: TDataModule},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
