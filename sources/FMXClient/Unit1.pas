unit Unit1;

interface

uses
  MainDataModule, NotesU, FireDac.comp.client, Data.DB, System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.MultiView, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.ScrollBox, FMX.Memo, FMX.ActnList, FMX.MediaLibrary.Actions, System.Actions, FMX.StdActns, FMX.Objects,
  FMX.Edit, FMX.Layouts, FMX.ExtCtrls, FMX.ListBox, FGX.ActionSheet, System.ImageList, FMX.ImgList, IPPeerClient, IPPeerServer, System.Tether.Manager, System.Tether.AppProfile,
  REST.Json, FMX.Ani, FMX.Effects;

type

  TDoInittializationThread = class(TThread)
  strict private
    FOwner: TForm;
  private
  protected
    procedure Execute; override;
  public
    constructor Create(owner: TForm);
  end;

  TAnonFunc = reference to function(): Boolean;

  TTabResults = record

    // modalresult: TModalResult;
    ProcCancel: TAnonFunc;
    ProcOK: TAnonFunc;
    ID: Integer;
    Nom: string;
    procedure Clear;
  end;

  TForm1 = class(TForm)
    TabControl: TTabControl;
    TabItemListNotes: TTabItem;
    TabItemTakeNote: TTabItem;
    TabItemClients: TTabItem;
    tabLog: TTabItem;
    TabItemServeur: TTabItem;
    MultiView1: TMultiView;
    lvNotes: TListView;
    ToolBar1: TToolBar;
    cmdAddNote: TSpeedButton;
    cmdStatus: TButton;
    ToolBarMain: TToolBar;
    lblTitle: TLabel;
    cmdSend: TButton;
    cmdParam: TSpeedButton;
    LogMemo: TMemo;
    ActionList1: TActionList;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    ChangeTabActionListNotes: TChangeTabAction;
    ChangeTabActionTakeNote: TChangeTabAction;
    ChangeTabActionLog: TChangeTabAction;
    ChangeTabActionListClients: TChangeTabAction;
    actRefreshListServeur: TAction;
    ChangeTabActionServeur: TChangeTabAction;
    ToolBar2: TToolBar;
    cmdTakeNoteCancel: TSpeedButton;
    cmdTakeNoteOK: TSpeedButton;
    Layout1: TLayout;
    lvClients: TListView;
    ToolBar3: TToolBar;
    cmdListClientCancelButton: TSpeedButton;
    cmdListClientOKButton: TSpeedButton;
    ToolBar4: TToolBar;
    cmdUpdateClients: TButton;
    ToolBar5: TToolBar;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    GridLayout1: TGridLayout;
    cmdDeleteNote: TButton;
    Memo1: TMemo;
    ToolBar6: TToolBar;
    SpeedButton8: TSpeedButton;
    ToolBar7: TToolBar;
    Button1: TButton;
    ListBox1: TListBox;
    lbiStatusServer: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    lbiShowAllClients: TListBoxItem;
    ListBoxItem1: TListBoxItem;
    ListBoxHeader1: TListBoxHeader;
    fgActionSheet: TfgActionSheet;
    ListBox2: TListBox;
    lbiDescriptionNote: TListBoxItem;
    txtNote: TMemo;
    ListBoxGroupFooter1: TListBoxGroupFooter;
    lbiPhoto: TListBoxItem;
    Image1: TImage;
    lbiClient: TListBoxItem;
    lbiImportance: TListBoxItem;
    ListBoxGroupFooter2: TListBoxGroupFooter;
    lbiDeleteNote: TListBoxItem;
    Layout2: TLayout;
    lbiNotedate: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    actLoadClientFromDatabase: TAction;
    lblLastClientUpdateDate: TLabel;
    TetheringTakePhotoAppProfile: TTetheringAppProfile;
    TetheringManager: TTetheringManager;
    OpenDialog1: TOpenDialog;
    StyleBook1: TStyleBook;
    lbiEnregistrement: TListBoxItem;
    cmdNotePlayRec: TSpeedButton;
    cmdNoteStopRec: TSpeedButton;
    cmdNoteRecRec: TSpeedButton;
    TabItemRecording: TTabItem;
    ChangeTabActionRecording: TChangeTabAction;
    ToolBar8: TToolBar;
    SpeedButton1: TSpeedButton;
    ToolBar9: TToolBar;
    GridLayout2: TGridLayout;
    ImageControl1: TImageControl;
    GlowEffect1: TGlowEffect;
    FloatAnimation1: TFloatAnimation;
    ProgressBar1: TProgressBar;
    Layout3: TLayout;
    Timer1: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdAddNoteClick(Sender: TObject);
    procedure cmdTakeNoteOKClick(Sender: TObject);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure lvNotesItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure lvNotesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
    procedure cmdDeleteNoteClick(Sender: TObject);
    procedure imNoteDblClick(Sender: TObject);
    procedure lbiClientClick(Sender: TObject);
    procedure actLoadClientFromDatabaseExecute(Sender: TObject);
    procedure lbiPhotoClick(Sender: TObject);
    procedure TetheringManagerEndAutoConnect(Sender: TObject);
    procedure TetheringManagerPairedToRemote(const Sender: TObject; const [Ref] AManagerInfo: TTetheringManagerInfo);
    procedure TetheringManagerRemoteManagerShutdown(const Sender: TObject; const AManagerIdentifier: string);
    procedure TetheringManagerEndManagersDiscovery(const Sender: TObject; const ARemoteManagers: TTetheringManagerInfoList);
    procedure TetheringManagerEndProfilesDiscovery(const Sender: TObject; const ARemoteProfiles: TTetheringProfileInfoList);
    procedure TetheringManagerRequestManagerPassword(const Sender: TObject; const ARemoteIdentifier: string; var Password: string);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure cmdUpdateClientsClick(Sender: TObject);
    procedure lbiShowAllClientsClick(Sender: TObject);
    procedure cmdListClientOKButtonClick(Sender: TObject);
    procedure cmdListClientCancelButtonClick(Sender: TObject);
    procedure lvClientsClick(Sender: TObject);
    procedure cmdNotePlayRecClick(Sender: TObject);
    procedure cmdNoteRecRecClick(Sender: TObject);
    procedure cmdNoteStopRecClick(Sender: TObject);
    procedure lbiEnregistrementClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure lbiStatusServerClick(Sender: TObject);
    procedure actRefreshListServeurExecute(Sender: TObject);
  strict private
    FIsFormActivated: Boolean;
    FThread: TDoInittializationThread;
    FUncomittedNote: TUneNote;
    FCurrentManagerIdentifier: string;
    FConnected: Boolean;
    FTTabClientResult: TTabResults;
    // FMic: TAudioCaptureDevice;
  private
    procedure DoInitialization;
    procedure ListNotes;
    procedure BitMapToDBimage(const blobFld: TBlobField; var img: TBitmap);
    procedure DbImageToBitmap(const tbl: TFDTable; const blobFld: TBlobField; out img: TBitmap);
    procedure AfficheUneNote(Value: TUneNote);
    procedure UpdateNoteToDatabase(Value: TUneNote);

    procedure DoMakeActiveTabClients(const DoShowOkButton: Boolean);
    procedure GetClientsFromServer;

    procedure FindTheteringServers;
    procedure RefreshListTheteringServers;
    function GetDefaultRecordFileName: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses UtilsU, ClientsU, MsgObjU, System.IOUtils;

resourcestring
  StrAMPhotoReceiverMana = 'AM.PhotoReceiverManager';
  StrAucuneConnectionAu = 'Aucune connection'; // au serveur ! ';
  StrAMPhotoReceiverApp = 'AM.PhotoReceiverApp';

procedure TForm1.FormActivate(Sender: TObject);
begin
  if not FIsFormActivated then
  begin
    FIsFormActivated := true;
    DoInitialization;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FIsFormActivated := false;

  TabControl.ActiveTab := TabItemListNotes;

  TabControl.TabPosition := TTabPosition.None;

  // ToolBarDeleteNote.Visible := false;
  //
  FConnected := false;
  FCurrentManagerIdentifier := '';
  lbiStatusServer.ItemData.Detail := StrAucuneConnectionAu;
  // FClientColl               := TClientColl.Create;
  // // TakePhotoAppProfile.Resources.FindByName('License').Value := '12345';
  // // This is a unique GUID generated when our application is executed
  //
 // LogMemo.Lines.Add('Local Identifier: ' + TetheringManager.Identifier);
  // // Now let's AutoConnect to all available Tethering Managers
  //
  //
  // // MultiView1.Mode := TMultiViewMode.PlatformBehaviour;
  //
  // cmdStatus.ImageIndex := 0;

  // cmdSelectFichierWindows.Visible:=false;
  //
  //
  //
{$IFDEF MSWINDOWS}
  // cmdSelectFichierWindows.Visible:=true;
  MultiView1.Mode := TMultiViewMode.Panel;

  ListBox1.ItemHeight := 60;
{$ENDIF }
  //

end;

function function1: Boolean;
begin
end;

procedure TForm1.lbiClientClick(Sender: TObject);
begin
  FTTabClientResult.Clear;

  FTTabClientResult.ProcCancel := (
    function(): Boolean
    begin
      Result := true;
      ChangeTabActionTakeNote.Execute;
    end);

  FTTabClientResult.ProcOK := (
    function(): Boolean
    begin
      Result := true;
      if lvClients.ItemIndex >= 0 then
      begin
        lbiClient.ItemData.Detail := lvClients.Items[lvClients.ItemIndex].Text;
        FUncomittedNote.ClientID := lvClients.Items[lvClients.ItemIndex].Tag;
        FUncomittedNote.ClientNom := lvClients.Items[lvClients.ItemIndex].Text;
      end;

      ChangeTabActionTakeNote.Execute;
    end);


  // FTTabClientResult.ProcCancel();

  DoMakeActiveTabClients(true);

end;

procedure TForm1.lbiEnregistrementClick(Sender: TObject);
begin
  ChangeTabActionRecording.Execute;
end;

procedure TForm1.lbiPhotoClick(Sender: TObject);
var
  i: Integer;
begin

  if fgActionSheet.Supported then
  begin

    fgActionSheet.UseUIGuidline := true;
    fgActionSheet.Title := 'S�lection photo';

    for i := 0 to fgActionSheet.Actions.Count - 1 do
    begin
      if (fgActionSheet.Actions[i].Action = TakePhotoFromCameraAction1) and (TakePhotoFromCameraAction1.Enabled = false) then
      begin
        fgActionSheet.Actions[i].Visible := false;
      end;

      if (fgActionSheet.Actions[i].Action = TakePhotoFromLibraryAction1) and (TakePhotoFromLibraryAction1.Enabled = false) then
      begin
        fgActionSheet.Actions[i].Visible := false;
      end;
    end;

    fgActionSheet.Show;

  end
  else
  begin
    if OpenDialog1.Execute then
    begin
      Image1.Bitmap.LoadFromFile(OpenDialog1.FileName);
      FUncomittedNote.Photo.LoadFromFile(OpenDialog1.FileName);
    end;
  end;
end;

procedure TForm1.lbiShowAllClientsClick(Sender: TObject);
begin
  DoMakeActiveTabClients(false);
end;

procedure TForm1.lbiStatusServerClick(Sender: TObject);
begin
  ChangeTabActionServeur.Execute;
end;

procedure TForm1.ListBoxItem2Click(Sender: TObject);
begin
  //

  ChangeTabActionLog.Execute;
end;

procedure TForm1.ListNotes;
var
  lvi: TListViewItem;
  img: TBitmap;

begin
  // DataModuleMain.tblnotes.Active := true;

  lvNotes.Items.Clear;
  DataModule1.tblnotes.First;

  while not DataModule1.tblnotes.Eof do
  begin
    lvi := lvNotes.Items.Add;
    lvi.Text := DataModule1.tblnotesDescription.Value;

    lvi.Detail := FormatDateTime('"Note prise" dddd "le" d mmmm yyyy "�" hh:mm', DataModule1.tblnotesDate.AsFloat);

    lvi.Tag := DataModule1.tblnotesID.Value;

    // img := TBitmap.Create(0,0);
    DbImageToBitmap(DataModule1.tblnotes, DataModule1.tblnotesPhoto, img);
    lvi.Bitmap.Assign(img);
    DataModule1.tblnotes.Next;
    img.Free;
  end;

end;

procedure TForm1.lvClientsClick(Sender: TObject);
begin
  cmdListClientOKButtonClick(nil);
end;

procedure TForm1.lvNotesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
begin
  if DataModule1.tblnotes.Locate('ID', lvNotes.Items[AIndex].Tag) then
  begin

    // DataModule1.tblnotes.Edit;
    DataModule1.tblnotes.Delete;

    ACanDelete := true;
    // DataModule1.tblnotes.Destroy;

  end;

  ListNotes;
end;

procedure TForm1.lvNotesItemClick(const Sender: TObject; const AItem: TListViewItem);
var
  img: TBitmap;
begin
  // DataModuleMain.tblnotes.IndexName := 'ID';

  if DataModule1.tblnotes.Locate('ID', AItem.Tag) then
  begin

    FUncomittedNote := TUneNote.Create(false);

    FUncomittedNote.ID := DataModule1.tblnotesID.Value;
    FUncomittedNote.Description := DataModule1.tblnotesDescription.Value;
    FUncomittedNote.ClientID := DataModule1.tblNotesClientID.Value;
    FUncomittedNote.ClientNom := DataModule1.tblNotesClientNom.Value;

    lbiNotedate.Text := FormatDateTime('"Note prise" dddd "le" d mmmm yyyy "�" hh:mm', DataModule1.tblnotesDate.AsFloat);

    img := TBitmap.Create(0, 0);
    DbImageToBitmap(DataModule1.tblnotes, DataModule1.tblnotesPhoto, img); //
    FUncomittedNote.Photo.Assign(img);
    img.Free;

    AfficheUneNote(FUncomittedNote);

    lbiDeleteNote.Visible := true;
    lbiNotedate.Visible := true;

    ChangeTabActionTakeNote.Execute;
    // txtNote.SetFocus;

  end;
end;

procedure TForm1.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  // imNote.Bitmap.Assign( Image);
  //
  // imNote.BestFit;

  Image1.Bitmap.Assign(Image);

end;

procedure TForm1.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  // imNote.Bitmap.Assign( Image);
  //
  // imNote.BestFit;
  Image1.Bitmap.Assign(Image);

end;

procedure TForm1.cmdAddNoteClick(Sender: TObject);
begin
  FUncomittedNote := TUneNote.Create(true);
  lbiDeleteNote.Visible := false;
  lbiNotedate.Visible := false;

  AfficheUneNote(FUncomittedNote);
  // TabControl.ActiveTab := TabItemTakeNote;
  // VertScrollBox1.ScrollBy(0, 200); // this will scroll to right

  ChangeTabActionTakeNote.Execute;
  txtNote.SetFocus;
end;

procedure TForm1.cmdDeleteNoteClick(Sender: TObject);
begin

  if DataModule1.tblnotes.Locate('ID', FUncomittedNote.ID) then
  begin

    // DataModule1.tblnotes.Edit;
    DataModule1.tblnotes.Delete;

    // DataModule1.tblnotes.Destroy;

  end;
  ChangeTabActionListNotes.Execute;
  ListNotes;
end;

procedure TForm1.cmdListClientCancelButtonClick(Sender: TObject);
begin
  FTTabClientResult.ProcCancel();
end;

procedure TForm1.cmdListClientOKButtonClick(Sender: TObject);
begin
  FTTabClientResult.ProcOK();
end;

procedure TForm1.cmdNotePlayRecClick(Sender: TObject);
begin
  // if (FMic <> nil) and (FMic.State = TCaptureDeviceState.Capturing) then
  // begin
  // FMic.StopCapture;
  // Image1.Opacity := 0;
  // cmdNoteStopRec.Enabled := false;
  // cmdNoteRecRec.Enabled := true;
  // end;

end;

procedure TForm1.cmdNoteRecRecClick(Sender: TObject);
begin
  // get he the default microphone
  // FMic := TCaptureDeviceManager.Current.DefaultAudioCaptureDevice;

  GlowEffect1.Enabled := true;
  FloatAnimation1.Enabled := true;
  Timer1.Enabled := true;

  // if FMic <> nil then
  // begin
  //
  // cmdNoteRecRec.Enabled := false;
  // cmdNoteStopRec.Enabled := true;
  //
  // FMic.FileName := GetDefaultRecordFileName;
  // FMic.StartCapture;
  //
  //
  // end
  // else
  // begin
  // ShowMessage('Audio capturing device not available');
  // end;

end;

procedure TForm1.cmdNoteStopRecClick(Sender: TObject);
begin

  GlowEffect1.Enabled := false;
  FloatAnimation1.Enabled := false;
  Timer1.Enabled := false;


  // if (FMic <> nil) and (FMic.State = TCaptureDeviceState.Capturing) then
  // begin
  // FMic.StopCapture;
  // cmdNoteStopRec.Enabled := false;
  // cmdNoteRecRec.Enabled := true;
  // end;

end;

procedure TForm1.cmdTakeNoteOKClick(Sender: TObject);
begin
  FUncomittedNote.Description := txtNote.Text;

  FUncomittedNote.Photo.Assign(Image1.Bitmap);

  UpdateNoteToDatabase(FUncomittedNote);

  FUncomittedNote.Free;

  ChangeTabActionListNotes.Execute;
end;

procedure TForm1.cmdUpdateClientsClick(Sender: TObject);
begin

  GetClientsFromServer;

end;

procedure TForm1.actLoadClientFromDatabaseExecute(Sender: TObject);
var
  lvi: TListViewItem;
begin
  lvClients.Items.Clear;
  DataModule1.tblClients.First;

  while not DataModule1.tblClients.Eof do
  begin
    lvi := lvClients.Items.Add;
    lvi.Text := DataModule1.tblClientsNom.Value;
    lvi.Detail := DataModule1.tblClientsAdresse.Value;

    lvi.Tag := DataModule1.tblClientsID.Value;

    DataModule1.tblClients.Next;
  end;

end;

procedure TForm1.actRefreshListServeurExecute(Sender: TObject);
begin
  FindTheteringServers;
end;

procedure TForm1.AfficheUneNote(Value: TUneNote);
begin
  txtNote.Text := Value.Description;
  Image1.Bitmap.Assign(Value.Photo);

  lbiClient.ItemData.Detail := Value.ClientNom;

  // imNote.Bitmap.Assign( Value.Photo);
  // imNote.BestFit;
end;

procedure TForm1.UpdateNoteToDatabase(Value: TUneNote);
var
  img: TBitmap;
  // PicStream: TMemoryStream;

begin

  if Value.isNewNote then
  begin
    // DataModuleMain.tblnotes.Active := true;
    DataModule1.tblnotes.Insert;
  end
  else
  begin
    DataModule1.tblnotes.Edit;
  end;

  DataModule1.tblnotesDescription.Value := Value.Description;
  DataModule1.tblnotesDate.Value := Value.NoteDate;
  DataModule1.tblNotesClientID.Value := Value.ClientID;
  DataModule1.tblNotesClientNom.Value := Value.ClientNom;

  img := TBitmap.Create(0, 0);
  img.Assign(Value.Photo);

  BitMapToDBimage(DataModule1.tblnotesPhoto, img);

  // PicStream := TMemoryStream.Create;
  // try
  // Value.Photo.bitmap.SaveToStream(PicStream);
  // PicStream.Seek(0, 0);
  // DataModuleMain.tblnotesPhoto.LoadFromStream(PicStream);
  //
  // except
  // on e: Exception do
  // begin
  // LogMemo.Lines.Add('ERREUR: ' + e.Message)
  // end;
  // end;
  // PicStream.Free;

  DataModule1.tblnotes.Post;
  ListNotes;
end;

procedure TForm1.DbImageToBitmap(const tbl: TFDTable; const blobFld: TBlobField; out img: TBitmap);
var
  PicStream: TStream;
begin
  PicStream := TStream.Create;
  try
    try
      PicStream := tbl.CreateBlobStream(blobFld, TBlobStreamMode.bmRead);
      PicStream.Position := 0;

      img := TBitmap.Create(0, 0);

      img.LoadFromStream(PicStream);
    except
      on e: Exception do
      begin
        ShowMessage(e.message);
        LogMemo.Lines.Add('ERREUR Conversion dbimage to image : ' + e.message)
      end;
    end;
  finally
    PicStream.Free;
  end;

end;

procedure TForm1.BitMapToDBimage(const blobFld: TBlobField; var img: TBitmap);
var
  PicStream: TMemoryStream;
begin
  PicStream := TMemoryStream.Create;
  try
    try
      img.SaveToStream(PicStream);
      PicStream.Position := 0; // .Destroy  .Seek(0, 0);
      blobFld.LoadFromStream(PicStream);

    except
      on e: Exception do
      begin
        ShowMessage(e.message);
        LogMemo.Lines.Add('ERREUR Conversion image to dbimage : ' + e.message)
      end;
    end;
  finally

    PicStream.Free;
  end
end;

procedure TForm1.FormShow(Sender: TObject);
begin

  // FindWalls;
 // FindTheteringServers;
end;

procedure TForm1.GetClientsFromServer;
var
  // LStream: TMemoryStream;
  remRes: TRemoteResource;
  sl: TStringList;
  ClientObj: TClient;
  ClientJSON: string;
begin

  // if not Connected then
  // Connected := TakePhotoAppProfile.Connect(TakePhotoManager.RemoteProfiles[LbWalls.ItemIndex]);

  // memo1.Lines.Text := '';
  // try
  remRes := TetheringTakePhotoAppProfile.GetRemoteResourceValue(TetheringManager.RemoteProfiles[0], 'ProjectList');
  LogMemo.Lines.Add(remRes.ToJsonString);
  // except
  // memo1.Lines.Text := '#ERR';

  // end;
  // Result := True;

  // pbsScoreboard.Active := False;
  // FClientColl.Clear;
  DataModule1.DeleteAllClient;

  sl := TStringList.Create;
  try
    sl.Delimiter := Data_Delimiter;
    sl.DelimitedText := remRes.Value.AsString; // AResource.Value.AsString;
    for ClientJSON in sl do
    begin
      ClientObj := TJSON.JsonToObject<TClient>(ClientJSON);
      DataModule1.AddClientToDatabase(ClientObj)
      // FClientColl.Add(PlayerObj);
    end;
  finally
    sl.Free;
  end;

  DataModule1.SetLastClientsUpdateDate;

  // UpdateProjectList;

  // pbsScoreboard.Active := True;
end;

function TForm1.GetDefaultRecordFileName: string;
begin
{$IFDEF ANDROID}
  Result := IOUtils.TPath.GetHomePath + '/test.mp3';
{$ENDIF}
{$IFDEF IOS}
  Result := TPath.GetHomePath + '/Documents/test.mp3';
{$ENDIF}
end;

procedure TForm1.imNoteDblClick(Sender: TObject);
begin
  if TakePhotoFromCameraAction1.Enabled then
  begin

    TakePhotoFromCameraAction1.Execute;
  end
  else if TakePhotoFromLibraryAction1.Enabled then
  begin
    TakePhotoFromLibraryAction1.Execute;
  end;

end;

procedure TForm1.DoInitialization;
begin

  FThread := TDoInittializationThread.Create(self);
  FThread.FreeOnTerminate := true;

  FThread.Start;

end;

procedure TForm1.DoMakeActiveTabClients(const DoShowOkButton: Boolean);
var
  lastUpdate: TDateTime;
begin

  actLoadClientFromDatabase.Execute;
  ChangeTabActionListClients.Execute;
  lastUpdate := DataModule1.GetLastClientsUpdateDate;

  if (lastUpdate = NullDate) then
  begin
    lblLastClientUpdateDate.Text := 'Jamais !';
  end
  else
  begin
    lblLastClientUpdateDate.Text := FormatDateTime('"Derni�re maj" yyyy.mm.dd', lastUpdate);
  end;

end;

procedure TForm1.RefreshListTheteringServers;
var
  i: Integer;
  // LLicense: string;
begin
  FCurrentManagerIdentifier := '';
  FConnected := false;

  lbiStatusServer.ItemData.Detail := StrAucuneConnectionAu;

  // Iterate through the Remote Profiles
  for i := 0 to TetheringManager.RemoteProfiles.Count - 1 do
  begin
    // Check if the Remote Profile's "Text" value matches our Local Profile's
    if TetheringManager.RemoteProfiles[i].ProfileText = StrAMPhotoReceiverApp then
    begin
      // If we have a match, check to ensure it's not TakePhotoAppProfile LOCAL profile
      if TetheringManager.RemoteProfiles[i].ProfileIdentifier <> TetheringTakePhotoAppProfile.Identifier then
      begin

        // If it's not our LOCAL profile, connect with the Remote Profile
        if TetheringTakePhotoAppProfile.Connect(TetheringManager.RemoteProfiles[i]) then
        begin

          FConnected := true;

          FCurrentManagerIdentifier := TetheringManager.RemoteProfiles[i].ProfileText;

          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin

              lbiStatusServer.ItemData.Detail := FCurrentManagerIdentifier;
              LogMemo.Lines.Add(Format('Connection effectu�e au serveur  %s (%s)', [TetheringManager.RemoteProfiles[i].ProfileText,
                TetheringManager.RemoteProfiles[i].ProfileIdentifier]));
              FConnected := true;

              // LogMemo.Lines.Add(Format('Checking license for profile %s', [TetheringManager.RemoteProfiles[I].ProfileIdentifier]));
              // // Obtain the "License Resource" value from the Remote Profile
              // LLicense := TakePhotoAppProfile.GetRemoteResourceValue(TetheringManager.RemoteProfiles[I], 'License').Value.AsString;
              // LogMemo.Lines.Add(Format('License for Profile %s = %s', [TetheringManager.RemoteProfiles[I].ProfileIdentifier, LLicense]));

            end);





          // Check if this license is the same as ours
          // if LLicense = FLicense then
          // begin
          // // if it is, inform the user then shut down this instance.
          // MessageDlg('Your License Key is already in use!',    TMsgDlgType.mtError,      [TMsgDlgBtn.mbOK],
          // 0);
          // Application.Terminate;
          // end;

        end
        else
        begin

          // Log that we were unable to connect to the Remote Profile
          LogMemo.Lines.Add(Format('Unable to connect to Remote Profile %s', [TetheringManager.RemoteProfiles[i].ProfileIdentifier]));
        end;

      end
      else
      begin
        // Log that we encountered our Local Profile (shouldn't happen, though)
        LogMemo.Lines.Add('Encountered our Local Profile on the Remote Profiles list! Weird!');
      end;
    end
    else
    begin
      // if the Text doesn't match, log the problem.
      LogMemo.Lines.Add(Format('Remote Profile %s does not match our Local Profile.', [TetheringManager.RemoteProfiles[i].ProfileIdentifier]));
    end;
  end;







  //
  // for I := 0 to TetheringManager.RemoteProfiles.Count - 1 do
  // begin
  // if (TetheringManager.RemoteProfiles[I].ProfileText = 'AM.PhotoReceiverApp') then
  // begin
  // FCurrentManagerIdentifier :=TetheringManager.RemoteProfiles[I].ProfileText;
  // end;
  // end;
  //
  // if FCurrentManagerIdentifier<>'' then
  // begin
  /// /    LbWalls.ItemIndex := 0;
  // FConnected         := TakePhotoAppProfile.Connect(TetheringManager.RemoteProfiles[0]);
  // end;
  // // Connect to the first one
  //

  cmdSend.Enabled := FConnected;

end;

procedure TForm1.FindTheteringServers;
var
  i: Integer;
begin
  FCurrentManagerIdentifier := '';
  FConnected := false;
  for i := TetheringManager.PairedManagers.Count - 1 downto 0 do
  begin
    TetheringManager.UnPairManager(TetheringManager.PairedManagers[i]);
  end;
  TetheringManager.DiscoverManagers;
end;

procedure TForm1.TetheringManagerEndAutoConnect(Sender: TObject);
begin

  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      LogMemo.Lines.Add(Format('AutoConnect Complete, Found %d Remote Managers', [TetheringManager.RemoteManagers.Count]));
    end);

end;

procedure TForm1.TetheringManagerEndManagersDiscovery(const Sender: TObject; const ARemoteManagers: TTetheringManagerInfoList);
var
  i: Integer;
begin
  for i := 0 to ARemoteManagers.Count - 1 do
  begin
    if (ARemoteManagers[i].ManagerText = StrAMPhotoReceiverMana) then
    begin
      TetheringManager.PairManager(ARemoteManagers[i]);
    end;
  end;

end;

procedure TForm1.TetheringManagerEndProfilesDiscovery(const Sender: TObject; const ARemoteProfiles: TTetheringProfileInfoList);
begin

  TThread.Synchronize(TThread.CurrentThread, // tthread.CurrentThread,
    procedure
    begin
      LogMemo.Lines.Add(Format('Profile Discovery Complete, Found %d Remote Profiles', [ARemoteProfiles.Count]));
    end);

  RefreshListTheteringServers;

end;

procedure TForm1.TetheringManagerPairedToRemote(const Sender: TObject; const [Ref] AManagerInfo: TTetheringManagerInfo);
begin

  // Log that we've paired to a Remote Manager and provide details
  LogMemo.Lines.Add(Format('We have paired with a Remote Manager %s' + #13#10 + #9 + 'Manager Name: %s' + #13#10 + #9 + 'Manager Text: %s' + #13#10 + #9 + 'Connection String: %s',
    [AManagerInfo.ManagerIdentifier, AManagerInfo.ManagerName, AManagerInfo.ManagerText, AManagerInfo.ConnectionString]));

  // LogMemo.Lines.Add(Format('Paired with Remote Manager %s (%s)',[AManagerInfo.ManagerText,AManagerInfo.ManagerIdentifier ]));

end;

procedure TForm1.TetheringManagerRemoteManagerShutdown(const Sender: TObject; const AManagerIdentifier: string);
begin
  // RefreshList;
end;

procedure TForm1.TetheringManagerRequestManagerPassword(const Sender: TObject; const ARemoteIdentifier: string; var Password: string);
begin
  // Log the request
  // CRITICAL: We MUST Snynchronize the UI update because this Event is being
  // called from a Thread, and isn't Synchronized internally.
  TThread.Synchronize(TThread.CurrentThread, // tthread.CurrentThread,
    procedure
    begin
      LogMemo.Lines.Add(Format('Remote Manager %s requested for a password...', [ARemoteIdentifier]));
    end);
  // Provide the expected password
  // CRITICAL: Because this doesn't interact with the UI in any way, we don't
  // need to Sync

  LogMemo.Lines.Add(ARemoteIdentifier);

  Password := 'AtelierMathieu';

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ProgressBar1.Value := ProgressBar1.Value + 1;
end;

constructor TDoInittializationThread.Create(owner: TForm);
begin
  FOwner := owner;
  inherited Create(true);
end;

procedure TDoInittializationThread.Execute;
begin
  inherited;

  DataModule1 := TDataModule1.Create(FOwner);

  DataModule1.OpenDatabase;

  Form1.TetheringManager.Enabled := true;
  Form1.TetheringTakePhotoAppProfile.Enabled := true;

  Synchronize(
    procedure
    begin
      Form1.ListNotes;
      Form1.FindTheteringServers;
    end);

end;

{ TTabClientResult }

procedure TTabResults.Clear;
begin
  // self.modalresult := mrNone;
  self.ID := -1;
  self.Nom := EmptyStr;
  self.ProcCancel := nil;
  self.ProcOK := nil;
end;

end.
