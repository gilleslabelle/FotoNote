unit MainMobileAppV2;

interface

uses
  ClientsU, NotesU, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, System.Sensors, IPPeerClient, IPPeerServer, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  Data.Bind.Components, System.Tether.Manager, System.Tether.AppProfile, System.Sensors.Components, FMX.MediaLibrary.Actions, System.Classes, System.Actions, FMX.ActnList,
  FMX.StdActns, FMX.StdCtrls, FMX.ListView, FMX.ListBox, FMX.Objects, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.Layouts, FMX.Controls, FMX.TabControl, FMX.Types,
  FMX.Dialogs, FMX.Forms, FMX.Graphics, System.ImageList, FMX.ImgList, FMX.Edit, FMX.MultiView, FMX.Effects, FMX.Filter.Effects,
  Data.DB, FireDAC.Comp.Client, FMX.Bind.GenData, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.ObjectScope;

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

  TMainForm = class(TForm)
    ActionList1: TActionList;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    Button1: TButton;
    Button2: TButton;
    Layout1: TLayout;
    LocationSensor1: TLocationSensor;
    lblTitle: TLabel;
    Layout2: TLayout;
    Label2: TLabel;
    TetheringManager: TTetheringManager;
    TakePhotoAppProfile: TTetheringAppProfile;
    BtRefresh: TButton;
    ImCaptured: TImage;
    LayoutNote: TLayout;
    Label3: TLabel;
    LayoutPhoto: TLayout;
    lblPhoto: TLabel;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    LogMemo: TMemo;
    cmdSend: TButton;
    lblConnection: TLabel;
    cmdUpdateProjets: TButton;
    TabControl: TTabControl;
    TabItemTakeNote: TTabItem;
    TabItemClients: TTabItem;
    tabLog: TTabItem;
    lvClients: TListView;
    BindingsList1: TBindingsList;
    LayoutClient: TLayout;
    lblClient: TLabel;
    ToolBarMain: TToolBar;
    ImageList1: TImageList;
    SpeedButton1: TSpeedButton;
    Layout3: TLayout;
    SpeedButton2: TSpeedButton;
    TabItemListNotes: TTabItem;
    cmdParam: TSpeedButton;
    ToolBar2: TToolBar;
    cmdAddNote: TSpeedButton;
    MultiView1: TMultiView;
    ToolBar1: TToolBar;
    cmdTakeNoteCancel: TSpeedButton;
    cmdTakeNoteOK: TSpeedButton;
    lvNotes: TListView;
    cmdStatus: TButton;
    txtNote: TEdit;
    ChangeTabActionListNotes: TChangeTabAction;
    ChangeTabActionTakeNote: TChangeTabAction;
    ChangeTabActionLog: TChangeTabAction;
    ToolBar3: TToolBar;
    SpeedButton3: TSpeedButton;
    cmdDeleteNote: TSpeedButton;
    lblNomClientSelectionne: TLabel;
    cmdSelectNoteClient: TSpeedButton;
    ChangeTabActionListClients: TChangeTabAction;
    ToolBar4: TToolBar;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    ListBox1: TListBox;
    lbiStatusServer: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    TabItemServeur: TTabItem;
    Memo1: TMemo;
    Button4: TButton;
    actRefreshListServeur: TAction;
    ChangeTabActionServeur: TChangeTabAction;
    ListBoxItem3: TListBoxItem;
    ToolBar5: TToolBar;
    SpeedButton6: TSpeedButton;
    StyleBook1: TStyleBook;
    ToolBar6: TToolBar;
    ToolBarDeleteNote: TToolBar;
    ToolBar8: TToolBar;
    PrototypeBindSource1: TPrototypeBindSource;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure LocationSensor1LocationChanged(Sender: TObject; const [Ref] OldLocation, NewLocation: TLocationCoord2D);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);

    procedure TetheringManagerRequestManagerPassword(const Sender: TObject; const RemoteIdentifier: string; var Password: string);
    procedure TetheringManagerEndManagersDiscovery(const Sender: TObject; const RemoteManagers: TTetheringManagerInfoList);
    procedure TetheringManagerEndProfilesDiscovery(const Sender: TObject; const RemoteProfiles: TTetheringProfileInfoList);
    // procedure TetheringManagerRemoteManagerShutdown(const Sender: TObject; const ManagerIdentifier: string);
    procedure BtRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    // procedure LbWallsItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    // procedure TetheringManagerEndAutoConnect(Sender: TObject);
    procedure TetheringManagerPairedToRemote(const Sender: TObject; const [Ref] AManagerInfo: TTetheringManagerInfo);
    procedure cmdSendClick(Sender: TObject);
    procedure cmdUpdateProjetsClick(Sender: TObject);
    procedure TetheringManagerEndAutoConnect(Sender: TObject);
    procedure TetheringManagerRemoteManagerShutdown(const Sender: TObject; const AManagerIdentifier: string);
    procedure cmdAddNoteClick(Sender: TObject);
    procedure cmdTakeNoteCancelClick(Sender: TObject);
    procedure cmdTakeNoteOKClick(Sender: TObject);
    procedure lvNotesItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure lvNotesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure actRefreshListServeurExecute(Sender: TObject);
    procedure lbiStatusServerClick(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
  strict private
    // FCurrentManagerInfo: TTetheringManagerInfo;
    FCurrentManagerIdentifier: string;
    FClientColl:               TClientColl;
    FIsFormActivated:          Boolean;
    FThread:                   TDoInittializationThread;
  private
    // FGeocoder: TGeocoder;
    FFConnected:     Boolean;
    FUncomittedNote: TUneNote;
    // procedure OnGeocodeReverseEvent(const Address: TCivicAddress);
    { Private declarations }

    function SendImage: Boolean;
    // procedure FindWalls;
    // function CheckPhotoWalls: Boolean;
    // procedure RefreshList;
    // function BitmapToJSON(img: TBitmap): string;
    procedure FindWalls;
    procedure RefreshList;
    // procedure FindWalls;
    // function GetCurrentTetheringProfileInfo: TTetheringProfileInfo;
    procedure UpdateProjectList;
    procedure SetFConnected(const Value: Boolean);
    procedure UpdateNoteToDatabase(Value: TUneNote);
    procedure AfficheUneNote(Value: TUneNote);
    procedure ListNotes;
    procedure DoInitialization;
    procedure DbImageToBitmap(tbl: TFDTable; blobFld: TBlobField; out img: TImage);
    procedure BitMapToDBimage(blobFld: TBlobField; img: TImage);
  public
    { Public declarations }
    property FConnected: Boolean read FFConnected write SetFConnected;
  end;

var
  MainForm: TMainForm;

implementation

uses IdCoder, IdCoderMIME, REST.JSON, MsgObjU, UtilsU, System.Hash,  UtilsU_FMX,
  System.JSON, System.SysUtils, MainDataModule;

resourcestring
  StrAMPhotoReceiverMana = 'AM.PhotoReceiverManager';
  StrAucuneConnectionAu = 'Aucune connection'; // au serveur ! ';
  StrAMPhotoReceiverApp = 'AM.PhotoReceiverApp';

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}
{$R *.iPhone4in.fmx IOS}

procedure TMainForm.lbiStatusServerClick(Sender: TObject);
begin
  MultiView1.ShowMaster;
  ChangeTabActionServeur.Execute;
end;

procedure TMainForm.ListBoxItem2Click(Sender: TObject);
begin
  MultiView1.ShowMaster;
  ChangeTabActionServeur.Execute;

end;

procedure TMainForm.ListBoxItem3Click(Sender: TObject);
begin
  MultiView1.ShowMaster;
  ChangeTabActionListClients.Execute;

end;

procedure TMainForm.ListNotes;
var
  lvi: TListViewItem;
  img: TImage;

begin
  // DataModuleMain.tblnotes.Active := true;

  lvNotes.Items.Clear;
  DataModule1.tblnotes.First;

  while not DataModule1.tblnotes.Eof do
  begin
    lvi      := lvNotes.Items.Add;
    lvi.Text := DataModule1.tblnotesDescription.Value;

    lvi.Detail  := FormatDateTime(  '"Note prise" dddd "le" d mmmm yyyy "à" hh:mm', DataModule1.tblnotesDate.AsFloat);



    lvi.Tag := DataModule1.tblnotesID.Value;

    img := TImage.Create(self);
    DbImageToBitmap(DataModule1.tblnotes, DataModule1.tblnotesPhoto, img);
    lvi.Bitmap.Assign(img.Bitmap);
    DataModule1.tblnotes.Next;
    img.Free;
  end;

end;

procedure TMainForm.LocationSensor1LocationChanged(Sender: TObject; const [Ref] OldLocation, NewLocation: TLocationCoord2D);

// var
// URLString: String;
begin
  // code for previous step goes here

  // MapView1.Location := TMapCoordinate.Create(NewLocation.Latitude, NewLocation.Longitude);

  // try
  //
  // // Setup an instance of TGeocoder
  // if not Assigned(FGeocoder) then
  // begin
  // if Assigned(TGeocoder.Current) then
  // begin
  // FGeocoder := TGeocoder.Current.Create;
  // end;
  // if Assigned(FGeocoder) then
  // begin
  // FGeocoder.OnGeocodeReverse := OnGeocodeReverseEvent;
  // end;
  // end;
  //
  // // Translate location to address
  // if Assigned(FGeocoder) and not FGeocoder.Geocoding then
  // begin
  // FGeocoder.GeocodeReverse(NewLocation);
  //
  // end;
  // except
  /// /    Label1.Text := 'Geocoder service error';
  // end;

end;

procedure TMainForm.lvNotesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
begin
  if DataModule1.tblnotes.Locate('ID', lvNotes.Items[AIndex].Tag) then
  begin
    DataModule1.tblnotes.Destroy;

  end;

  ListNotes;

end;

procedure TMainForm.DbImageToBitmap(tbl: TFDTable; blobFld: TBlobField; out img: TImage);
var
  PicStream: TStream;
begin
  PicStream := TStream.Create;
  try
    try
      PicStream := tbl.CreateBlobStream(blobFld, TBlobStreamMode.bmRead);
      img.Bitmap.LoadFromStream(PicStream);
    except
      on e: Exception do
      begin
        LogMemo.Lines.Add('ERREUR Conversion dbimage to image : ' + e.Message)
      end;
    end;
  finally
    PicStream.Free;
  end;

end;

procedure TMainForm.BitMapToDBimage(blobFld: TBlobField; img: TImage);
var
  PicStream: TMemoryStream;
begin
  PicStream := TMemoryStream.Create;
  try
    try
      img.Bitmap.SaveToStream(PicStream);
      PicStream.Seek(0, 0);
      blobFld.LoadFromStream(PicStream);

    except
      on e: Exception do
      begin
        LogMemo.Lines.Add('ERREUR Conversion image to dbimage : ' + e.Message)
      end;
    end;
  finally

    PicStream.Free;
  end
end;

procedure TMainForm.lvNotesItemClick(const Sender: TObject; const AItem: TListViewItem);
var
  PicStream: TStream;
  img:       TImage;
begin
  // DataModuleMain.tblnotes.IndexName := 'ID';

  if DataModule1.tblnotes.Locate('ID', AItem.Tag) then
  begin

    FUncomittedNote := TUneNote.Create(false);

    FUncomittedNote.Description := DataModule1.tblnotesDescription.Value;


    img:=   TImage.Create(Self);
    DbImageToBitmap(DataModule1.tblnotes, DataModule1.tblnotesPhoto, img); //
    FUncomittedNote.Photo.Bitmap.Assign(img.Bitmap);
    img.Free;
    // PicStream := TStream.Create;
    // try
    // PicStream := DataModuleMain.tblnotes.CreateBlobStream( DataModuleMain.tblnotesPhoto, TBlobStreamMode.bmRead);
    // FUncomittedNote.Photo.Bitmap.LoadFromStream(PicStream);
    // except
    // end;
    //
    // PicStream.Free;

    AfficheUneNote(FUncomittedNote);

    // FUncomittedNote.Free;

    ToolBarDeleteNote.Visible := true;
    ChangeTabActionTakeNote.Execute;

  end;
end;

// procedure TMainForm.OnGeocodeReverseEvent(const Address: TCivicAddress);
// begin
//
/// /  Label1.Text := Format('%s, %s, %s, %s, %s, %s, %s, %s, %s, %s', [Address.SubLocality, Address.AdminArea, Address.CountryCode, Address.CountryName, Address.FeatureName,
/// /    Address.Locality, Address.PostalCode, Address.SubAdminArea, Address.SubLocality, Address.SubThoroughfare, Address.Thoroughfare]);
//
// end;

procedure TMainForm.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  ImCaptured.Bitmap := Image;

end;

procedure TMainForm.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  ImCaptured.Bitmap := Image;

end;

function TMainForm.SendImage: Boolean;
var
  LStream:        TMemoryStream;
  msg:            TMsgObj;
  SendJSONObj:    TJSONObject;
  md5jsonPair:    TJSONPair;
  jsonDataPair:   TJSONPair;
  b:              TBytes;
  long:           Integer;
  DataJSONObject: TJSONObject;
  resultat:       Boolean;
begin
  Result := false;
  if not ImCaptured.Bitmap.IsEmpty and FConnected then
  begin
    // if not FConnected then
    // begin
    // Connected := TakePhotoAppProfile.Connect(TetheringManager.RemoteProfiles[LbWalls.ItemIndex]);
    // end;
    LStream := TMemoryStream.Create;
    try
      // ImCaptured.Bitmap.SaveToStream(LStream);
      // Result := TakePhotoAppProfile.SendStream(TakePhotoManager.RemoteProfiles[LbWalls.ItemIndex], 'Photo from mobile', LStream);

      msg        := TMsgObj.Create(TetheringManager.Identifier);
      msg.Nom    := 'Gillles é à  ç |#####123';
      msg.Imgstr := Base64FromBitmap(ImCaptured.Bitmap);
      msg.Note   := txtNote.Text;
      msg.Date   := now;

      TMonitor.Enter(TakePhotoAppProfile);
      try

        SendJSONObj := TJSONObject.Create;

        DataJSONObject := TJSON.ObjectToJsonObject(msg);

        md5jsonPair  := TJSONPair.Create('MD5', CalcMd5(DataJSONObject.ToString));
        jsonDataPair := TJSONPair.Create('dataObjet', DataJSONObject);

        SendJSONObj.AddPair(md5jsonPair);
        SendJSONObj.AddPair(jsonDataPair);

        setlength(b, SendJSONObj.EstimatedByteSize);
        long := SendJSONObj.ToBytes(b, 0);

        LStream.WriteData(b, long);

        try

          resultat := TakePhotoAppProfile.SendStream(TetheringManager.RemoteProfiles[0], 'Photo stream from mobile', LStream);
          Result   := true;
          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              if resultat then
              begin
                LogMemo.Lines.Add('Note envoyée avec succès');
              end;
            end);

        except
          on e: ETetheringException do
          begin

            ShowMessage(e.Message);
            LogMemo.Lines.Add('Erreur d''envoi : ' + e.Message);
          end;
        end;

      finally
        TMonitor.Exit(TakePhotoAppProfile);
      end;

    finally
      LStream.Free;
    end;
  end
  else
  begin
    ShowMessage('SVP, Choisir une photo');

  end;
end;

procedure TMainForm.SetFConnected(const Value: Boolean);
begin
  FFConnected := Value;
  if FConnected then
  begin
    cmdStatus.ImageIndex := 1;
  end
  else
  begin
    cmdStatus.ImageIndex := 0;
  end;
end;

procedure TMainForm.cmdAddNoteClick(Sender: TObject);
begin
  FUncomittedNote           := TUneNote.Create(true);
  ToolBarDeleteNote.Visible := false;

  AfficheUneNote(FUncomittedNote);
  TabControl.ActiveTab := TabItemTakeNote;
end;

// function TForm3.BitmapToJSON(img: TBitmap): string;
//
// var
// jsonObj: TJSONObject;
// mStream: TMemoryStream;
// begin
// jsonObj := TJSONObject.Create;
// try
// mStream := TMemoryStream.Create;
// try
// img.SaveToStream(mStream);
// // ImCaptured.Bitmap.SaveToStream(mStream);
// mStream.Position := 0;
// jsonObj.AddPair('file', TIdEncoderMIME.EncodeStream(mStream));
//
// Result := jsonObj.ToString;
//
// TIdDecoderMIME.DecodeStream((jsonObj.Get('file').JsonValue as TJSONString).Value, mStream);
// mStream.Position := 0;
//
// finally
// mStream.Free;
// end;
//
// // RESTRequest1.Params.Clear;
// // aParam := RESTRequest1.Params.AddItem;
// // aParam.Value := jsonObj.ToString;
// // aParam.ContentType := ctAPPLICATION_JSON;
// finally
// jsonObj.Free;
// end;
//
// // RESTRequest1.method := rmPost
// // RESTRequest1.Resource := 'UploadImage';
// // RESTRequest1.Execute;
//
// end;

procedure TMainForm.UpdateNoteToDatabase(Value: TUneNote);
var
  img: TImage;
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
  DataModule1.tblnotesDate.Value        := Value.NoteDate;
  DataModule1.tblnotesClientID.Value    := Value.ClientID;
  DataModule1.tblnotesClientNom.Value   := Value.ClientNom;

  BitMapToDBimage(DataModule1.tblnotesPhoto, Value.Photo);

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

procedure TMainForm.actRefreshListServeurExecute(Sender: TObject);
begin
  FindWalls
end;

procedure TMainForm.AfficheUneNote(Value: TUneNote);
begin
  txtNote.Text := Value.Description;

  ImCaptured.Bitmap.Assign( Value.Photo.Bitmap);

end;

procedure TMainForm.BtRefreshClick(Sender: TObject);
begin
  FindWalls;

end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    ImCaptured.Bitmap.LoadFromFile(OpenDialog1.FileName);
    FUncomittedNote.Photo.Bitmap.LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TMainForm.cmdUpdateProjetsClick(Sender: TObject);
var
  // LStream: TMemoryStream;
  remRes:     TRemoteResource;
  sl:         TStringList;
  PlayerObj:  TClient;
  PlayerJSON: string;
begin

  // if not Connected then
  // Connected := TakePhotoAppProfile.Connect(TakePhotoManager.RemoteProfiles[LbWalls.ItemIndex]);

  // memo1.Lines.Text := '';
  // try
  remRes := TakePhotoAppProfile.GetRemoteResourceValue(TetheringManager.RemoteProfiles[0], 'ProjectList');
  LogMemo.Lines.Add(remRes.ToJsonString);
  // except
  // memo1.Lines.Text := '#ERR';

  // end;
  // Result := True;

  // pbsScoreboard.Active := False;
  FClientColl.Clear;
  sl := TStringList.Create;
  try
    sl.Delimiter     := Data_Delimiter;
    sl.DelimitedText := remRes.Value.AsString; // AResource.Value.AsString;
    for PlayerJSON in sl do
    begin
      PlayerObj := TJSON.JsonToObject<TClient>(PlayerJSON);
      FClientColl.Add(PlayerObj);
    end;
  finally
    sl.Free;
  end;

  UpdateProjectList;
  // pbsScoreboard.Active := True;

end;

procedure TMainForm.cmdSendClick(Sender: TObject);
begin
  SendImage;
end;

procedure TMainForm.cmdTakeNoteCancelClick(Sender: TObject);
begin
  FUncomittedNote.Free;
  ChangeTabActionListNotes.Execute;

end;

procedure TMainForm.cmdTakeNoteOKClick(Sender: TObject);
begin

  FUncomittedNote.Description := txtNote.Text;

  // FUncomittedNote.Photo :=

  UpdateNoteToDatabase(FUncomittedNote);

  FUncomittedNote.Free;

  ChangeTabActionListNotes.Execute;

end;

procedure TMainForm.RefreshList;
var
  I: Integer;
  // LLicense: string;
begin
  FCurrentManagerIdentifier := '';
  FConnected                := false;

  lblConnection.Text := StrAucuneConnectionAu;

  // Iterate through the Remote Profiles
  for I := 0 to TetheringManager.RemoteProfiles.Count - 1 do
  begin
    // Check if the Remote Profile's "Text" value matches our Local Profile's
    if TetheringManager.RemoteProfiles[I].ProfileText = StrAMPhotoReceiverApp then
    begin
      // If we have a match, check to ensure it's not TakePhotoAppProfile LOCAL profile
      if TetheringManager.RemoteProfiles[I].ProfileIdentifier <> TakePhotoAppProfile.Identifier then
      begin

        // If it's not our LOCAL profile, connect with the Remote Profile
        if TakePhotoAppProfile.Connect(TetheringManager.RemoteProfiles[I]) then
        begin

          FConnected := true;

          FCurrentManagerIdentifier := TetheringManager.RemoteProfiles[I].ProfileText;

          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin

              lblConnection.Text := FCurrentManagerIdentifier;
              LogMemo.Lines.Add(Format('Connection effectuée au serveur  %s (%s)', [TetheringManager.RemoteProfiles[I].ProfileText,
                TetheringManager.RemoteProfiles[I].ProfileIdentifier]));
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
          LogMemo.Lines.Add(Format('Unable to connect to Remote Profile %s', [TetheringManager.RemoteProfiles[I].ProfileIdentifier]));
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
      LogMemo.Lines.Add(Format('Remote Profile %s does not match our Local Profile.', [TetheringManager.RemoteProfiles[I].ProfileIdentifier]));
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

procedure TMainForm.FindWalls;
var
  I: Integer;
begin
  FCurrentManagerIdentifier := '';
  FConnected                := false;
  for I                     := TetheringManager.PairedManagers.Count - 1 downto 0 do
  begin
    TetheringManager.UnPairManager(TetheringManager.PairedManagers[I]);
  end;
  TetheringManager.DiscoverManagers;
end;

//
procedure TMainForm.FormActivate(Sender: TObject);
begin
  if not FIsFormActivated then
  begin
    FIsFormActivated := true;
    DoInitialization;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FIsFormActivated := false;

  TabControl.ActiveTab := TabItemListNotes;

  TabControl.TabPosition := TTabPosition.None;

  ToolBarDeleteNote.Visible := false;

  FConnected                := false;
  FCurrentManagerIdentifier := '';
  lblConnection.Text        := StrAucuneConnectionAu;
  FClientColl               := TClientColl.Create;
  // TakePhotoAppProfile.Resources.FindByName('License').Value := '12345';
  // This is a unique GUID generated when our application is executed
  LogMemo.Lines.Add('Local Identifier: ' + TetheringManager.Identifier);
  // Now let's AutoConnect to all available Tethering Managers

  // TetheringManager.AutoConnect(2000);
  // TetheringManager.DiscoverManagers;

  // MultiView1.Mode := TMultiViewMode.PlatformBehaviour;

  cmdStatus.ImageIndex := 0;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin

  // DataModuleMain.FDConnection1.Connected:= true;
  // DataModuleMain.tblnotes.Active := true;

  FindWalls;
  // ListNotes;
end;

procedure TMainForm.DoInitialization;
begin

  FThread                 := TDoInittializationThread.Create(self);
  FThread.FreeOnTerminate := true;

  FThread.Start;

end;

procedure TMainForm.TetheringManagerEndAutoConnect(Sender: TObject);
begin

  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      LogMemo.Lines.Add(Format('AutoConnect Complete, Found %d Remote Managers', [TetheringManager.RemoteManagers.Count]));
    end);

end;

procedure TMainForm.TetheringManagerEndManagersDiscovery(const Sender: TObject; const RemoteManagers: TTetheringManagerInfoList);
var
  I: Integer;
begin
  for I := 0 to RemoteManagers.Count - 1 do
  begin
    if (RemoteManagers[I].ManagerText = StrAMPhotoReceiverMana) then
    begin
      TetheringManager.PairManager(RemoteManagers[I]);
    end;
  end;
end;

procedure TMainForm.TetheringManagerEndProfilesDiscovery(const Sender: TObject; const RemoteProfiles: TTetheringProfileInfoList);
begin

  TThread.Synchronize(TThread.CurrentThread, // tthread.CurrentThread,
    procedure
    begin
      LogMemo.Lines.Add(Format('Profile Discovery Complete, Found %d Remote Profiles', [RemoteProfiles.Count]));
    end);

  RefreshList;

end;

procedure TMainForm.TetheringManagerPairedToRemote(const Sender: TObject; const [Ref] AManagerInfo: TTetheringManagerInfo);
begin

  // Log that we've paired to a Remote Manager and provide details
  LogMemo.Lines.Add(Format('We have paired with a Remote Manager %s' + #13#10 + #9 + 'Manager Name: %s' + #13#10 + #9 + 'Manager Text: %s' + #13#10 + #9 + 'Connection String: %s',
    [AManagerInfo.ManagerIdentifier, AManagerInfo.ManagerName, AManagerInfo.ManagerText, AManagerInfo.ConnectionString]));

  // LogMemo.Lines.Add(Format('Paired with Remote Manager %s (%s)',[AManagerInfo.ManagerText,AManagerInfo.ManagerIdentifier ]));

end;

procedure TMainForm.TetheringManagerRemoteManagerShutdown(const Sender: TObject; const AManagerIdentifier: string);
begin
  RefreshList;
end;

procedure TMainForm.TetheringManagerRequestManagerPassword(const Sender: TObject; const RemoteIdentifier: string; var Password: string);
begin

  // Log the request
  // CRITICAL: We MUST Snynchronize the UI update because this Event is being
  // called from a Thread, and isn't Synchronized internally.
  TThread.Synchronize(TThread.CurrentThread, // tthread.CurrentThread,
    procedure
    begin
      LogMemo.Lines.Add(Format('Remote Manager %s requested for a password...', [RemoteIdentifier]));
    end);
  // Provide the expected password
  // CRITICAL: Because this doesn't interact with the UI in any way, we don't
  // need to Sync

  LogMemo.Lines.Add(RemoteIdentifier);

  Password := 'AtelierMathieu';

end;

procedure TMainForm.UpdateProjectList;
var
  unproj: TClient;
  lvi:    TListViewItem;

begin

  lvClients.Items.Clear;
  // cbClients.Items.Clear;
  for unproj in FClientColl do

  begin

    lvi        := lvClients.Items.Add;
    lvi.Text   := unproj.Nom;
    lvi.Detail := Format('%s %s', [unproj.Adresse, unproj.Ville]);

    // lvClients.Items.Add(unproj.Nom);

  end;
end;

{ TDoInittializationThread }

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

  Synchronize(
    procedure
    begin
      // FormWelcome.cmdStartModeBrowse.Visible := true;
      // FormWelcome.cmdStartModeBrowse.Enabled := true;
      // FormWelcome.LayoutInitMsg.Visible := false;

      // FormWelcome.Visible := false;

      // MainForm.Show;
      // MainForm.lbiSortDistance.Visible := MainForm.FisGPPLocationValid;

      // MainForm.LoadCimetieres2;
      MainForm.ListNotes;
    end);

end;

end.
