unit MainDataModule;

interface

uses
  System.IOUtils,FMX.Dialogs, System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    tblNotes: TFDTable;
    tblNotesID: TFDAutoIncField;
    tblNotesDescription: TWideMemoField;
    tblNotesDate: TFloatField;
    tblNotesPhoto: TBlobField;
    tblNotesNoteAudio: TBlobField;
    tblNotesClientID: TIntegerField;
    tblNotesClientNom: TWideMemoField;
    tblNotesImportance: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenDatabase;
  end;

var
  DataModule1: TDataModule1;

implementation




{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
 FDConnection1.Connected := false;
  tblnotes.Active         := false;
end;

procedure TDataModule1.FDConnection1BeforeConnect(Sender: TObject);
var
  lepath: string;
begin

//{$IFDEF Android}
//  lepath := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'NotesDb.db');
//{$ENDIF}
//{$IFDEF iOS}
//  lepath := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'NotesDb.db');
//{$ENDIF}
//{$IFDEF OSX}

lepath := TPath.Combine(TPath.GetDocumentsPath, 'NotesDb.db');


//{$ENDIF}
{$IFDEF MSWINDOWS}
  // lepath := TPath.Combine(TPath.GetDocumentsPath, 'Cimetieres.db');
  lepath := TPath.GetFullPath('..\..\..\..\data\NotesDb.db');

{$ENDIF}
  if FileExists(lepath) then
  begin

    FDConnection1.Params.Values['Database'] := lepath;

  end
  else
  begin

    TThread.Synchronize(TThread.CurrentThread, // tthread.CurrentThread,
    procedure
    begin
    ShowMessage(Format('Le fichier existe PAS «%s»', [lepath]));
    end);



    raise Exception.Create(Format('Le fichier existe PAS «%s»', [lepath]));

  end;
end;




procedure TDataModule1.OpenDatabase;
begin
    Self.FDConnection1.Connected := true;

  Self.tblnotes.Active := true;
end;

end.
