unit AM.Gestion.PhotoMobileVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, IPPeerServer,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Tether.Manager,
  System.Tether.AppProfile, System.JSON,
  Vcl.ExtDlgs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Stan.StorageXML,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Controls, Vcl.Buttons,
  Vcl.Bind.Navigator, Data.Bind.Components, Data.Bind.Grid, Vcl.Grids, Data.Bind.DBScope, Vcl.DBGrids;



type
  TfrmPhoto = class(TForm)
    MediaReceiverManager: TTetheringManager;
    MediaReceiverProfile: TTetheringAppProfile;
    Button1: TButton;
    Image1: TImage;
    Button2: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    logMemo: TMemo;
    Button3: TButton;
    FDMemTblClients: TFDMemTable;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    FDMemTblClientsNom: TStringField;
    FDMemTblClientsAdresse: TStringField;
    FDMemTblClientsVille: TStringField;
    FDMemTblClientsLongitude: TFloatField;
    FDMemTblClientsLatitude: TFloatField;
    FDMemTblClientsTelephone: TStringField;
    FDMemTblClientsDescription: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindNavigator1: TBindNavigator;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    TetheringAppProfile1: TTetheringAppProfile;
    CheckBox1: TCheckBox;
    procedure MediaReceiverManagerRequestManagerPassword(const Sender: TObject; const ARemoteIdentifier: string; var Password: string);
    procedure MediaReceiverProfileResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MediaReceiverManagerEndAutoConnect(Sender: TObject);
    procedure MediaReceiverManagerPairedFromLocal(const Sender: TObject; const [Ref] AManagerInfo: TTetheringManagerInfo);
    procedure MediaReceiverManagerPairedToRemote(const Sender: TObject; const [Ref] AManagerInfo: TTetheringManagerInfo);
    procedure MediaReceiverManagerRemoteManagerShutdown(const Sender: TObject; const AManagerIdentifier: string);
    procedure Button3Click(Sender: TObject);
    procedure FDMemTblClientsAfterPost(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    Fstm:     TSTream;
    FLicense: String;
     procedure UpdateProjetsObjects;
  public
    { Public declarations }
  end;

var
  frmPhoto: TfrmPhoto;

implementation

{$R *.dfm}

uses
  Vcl.imaging.jpeg, IdCoder, IdCoderMIME, REST.JSON, MsgObjU, System.NetEncoding, UtilsU,
  ClientsU
  ;

resourcestring
  StrAtelierMathieuPassword = 'AtelierMathieu';

procedure TfrmPhoto.Button1Click(Sender: TObject);
//var
//  ms: TMemoryStream;
begin
  Fstm.Size := 0;
  Image1.Picture.graphic.SaveToStream(Fstm);
  Fstm.Position := 0;
  modalResult   := mrOk;

  // ms := TMemoryStream.Create;
  // image1.Picture.Graphic.SaveToStream(ms);
  //
  // ms.SaveToFile('P:\img.jpg');
  // ms.Free;
end;

procedure TfrmPhoto.Button3Click(Sender: TObject);

begin

    UpdateProjetsObjects;

//  sl := TStringList.Create;
//  ListBox1.Clear;
//  i := System.SysUtils.FindFirst('C:\DataGL\Projets\AM\PhotosMobile\Run\Dossiers\*', faDirectory,  sf);
//  while i = 0 do
//  begin
//    if ((sf.Attr and faDirectory) = faDirectory) and not sametext(sf.Name, '.') and not sametext(sf.Name, '..')  then
//    begin
//      sl.Add(sf.Name);
//      ListBox1.Items.Add(sf.Name) ;
//    end;
//
//    i := System.SysUtils.FindNext(sf);
//  end;
//  System.SysUtils.findclose(sf);
//
//
//  for I := 0 to MediaReceiverProfile.Resources.Count -1  do
//  begin
//    if sametext(MediaReceiverProfile.Resources.Items[i].Name, 'ProjectList') then
//    begin
//      MediaReceiverProfile.Resources.Delete(i);
//      res := MediaReceiverProfile.Resources.Add;
//      res.ResType :=     TRemoteResourceType.Data;
//      res.Name := 'ProjectList';
//      sl.Delimiter := #9;
//
//      res.Value.Create(sl.DelimitedText );
//      break;
//    end;
//  end;
//
//  sl.Free;
//

end;

procedure TfrmPhoto.CheckBox1Click(Sender: TObject);
begin
    TetheringAppProfile1.Visible := CheckBox1.Checked;
    TetheringAppProfile1.Enabled := CheckBox1.Checked;
end;

procedure TfrmPhoto.FDMemTblClientsAfterPost(DataSet: TDataSet);
begin
  FDMemTblClients.SaveToFile('..\..\..\data\Clients.xml');
  UpdateProjetsObjects;
end;

procedure TfrmPhoto.FormCreate(Sender: TObject);
const

  LICENSE_KEYS: Array [0 .. 2] of String = ('{F13D701D-00F8-47CB-904B-09386A98E08F}', '{945221F4-1F3F-49DD-A9AC-CA9118995F14}', '{72BBAAA5-07B8-4ABE-9BCF-2006A4543503}');
var
  res : TLocalResource;
begin

  Randomize; // Otherwise we'll get the same number generated every time
  // Select a random License String from our Array of License Keys
  FLicense := LICENSE_KEYS[Random(2)];
  //
  // Log what License has been chosen
  logMemo.Lines.Add(Format('Local License: %s', [FLicense]));
  // Update our shared Resource in the Tethering Profile with the License key
  MediaReceiverProfile.Resources.FindByName('License').Value := FLicense;


  // Log the unique LOCAL identifier so we can distinguish between instances
  // Essentially, this is a unique GUID generated when our application is executed
  logMemo.Lines.Add('Local Identifier: ' + MediaReceiverManager.Identifier);
  // Now let's look for Remote Mangers with which to pair...
  logMemo.Lines.Add('Scanning for Remote Managers with which to pair...');
  MediaReceiverManager.DiscoverManagers;



  res := MediaReceiverProfile.Resources.Add;
  res.ResType :=   TRemoteResourceType.Data;
  res.Name := 'ProjectList';

//  res.Value.Create();

//  Assert(res.Value.DataType = TResourceType.String, '');

  try
    FDMemTblClients.LoadFromFile('..\..\..\data\Clients.xml');
  except
    FDMemTblClients.CreateDataSet;
  end;

end;

procedure TfrmPhoto.MediaReceiverManagerEndAutoConnect(Sender: TObject);
begin
  logMemo.Lines.Add(Format('AutoConnect Complete, Found %d Remote Managers', [MediaReceiverManager.RemoteManagers.Count]));
end;

procedure TfrmPhoto.MediaReceiverManagerPairedFromLocal(const Sender: TObject; const [Ref] AManagerInfo: TTetheringManagerInfo);
begin
  // Log that we've paired to a Remote Manager and provide details
  logMemo.Lines.Add(Format('A Remote Manager %s has paired with us' + #13#10 + #9 + 'Manager Name: %s' + #13#10 + #9 + 'Manager Text: %s' + #13#10 + #9 + 'Connection String: %s',
    [AManagerInfo.ManagerIdentifier, AManagerInfo.ManagerName, AManagerInfo.ManagerText, AManagerInfo.ConnectionString]));

end;

procedure TfrmPhoto.MediaReceiverManagerPairedToRemote(const Sender: TObject; const [Ref] AManagerInfo: TTetheringManagerInfo);
begin
  // Log that we've paired to a Remote Manager and provide details
  logMemo.Lines.Add(Format('We have paired with a Remote Manager %s' + #13#10 + #9 + 'Manager Name: %s' + #13#10 + #9 + 'Manager Text: %s' + #13#10 + #9 + 'Connection String: %s',
    [AManagerInfo.ManagerIdentifier, AManagerInfo.ManagerName, AManagerInfo.ManagerText, AManagerInfo.ConnectionString]));
end;

procedure TfrmPhoto.MediaReceiverManagerRemoteManagerShutdown(const Sender: TObject; const AManagerIdentifier: string);
begin
  logMemo.Lines.Add('Connectioin lost :' + AManagerIdentifier);
end;

procedure TfrmPhoto.MediaReceiverManagerRequestManagerPassword(const Sender: TObject; const ARemoteIdentifier: string; var Password: string);
begin
  Password := StrAtelierMathieuPassword;

end;

procedure BitmapFromBase64(Base64: string; Bitmap: Vcl.Graphics.TBitmap);
var
  Stream:   TBytesStream;
  Bytes:    TBytes;
  Encoding: TBase64Encoding;
  img:      TWICImage;
begin
  Stream := TBytesStream.Create;
  try
    Encoding := TBase64Encoding.Create(0);
    try
      Bytes := Encoding.DecodeStringToBytes(Base64);
      Stream.WriteData(Bytes, Length(Bytes));
      Stream.Position := 0;

      img := TWICImage.Create;
      img.LoadFromStream(Stream);
      // img.ImageFormat := TWICImageFormat.wifJpeg;
      img.ImageFormat := TWICImageFormat.wifBmp;

      Bitmap.Assign(img);
      // Image1.Picture.Assign(img);
      img.Free;

      // Bitmap.LoadFromStream(Stream);
    finally
      Encoding.Free;
    end;
  finally
    Stream.Free;
  end;
end;

procedure TfrmPhoto.MediaReceiverProfileResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
var
//  img:        TWICImage;
  JsonObject: TJSONObject;

  sstream: TStringStream;

//  sl:         tstringlist;
//  comp:       Tcomponent;
  msg:        TMsgObj;
  jsonMD5:    TJSONValue;
  jsonLeData: TJSONObject;

begin

  sstream := TStringStream.Create();
  sstream.LoadFromStream(AResource.Value.AsStream);

//  JsonObject := TJSONObject.Create;
  // JsonObject := TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes(sstream.DataString), 0) as TJSONObject;
  JsonObject := TJSONObject.ParseJSONValue(sstream.Bytes, 0, sstream.Size) as TJSONObject;

  jsonMD5 := JsonObject.Get('MD5').JsonValue;

  jsonLeData := JsonObject.Get('dataObjet').JsonValue as TJSONObject;

  if jsonMD5.Value =  CalcMd5(jsonLeData.ToString) then
  begin

  msg        := TJSON.JsonToObject<TMsgObj>(jsonLeData);

  // msg:=  TJSON.JsonToObject<TMsgObj>(sstream.DataString);
  BitmapFromBase64(msg.ImgstR, Image1.Picture.Bitmap);

  Memo1.Text := msg.note;

  Label1.Caption := Format('%d x %d', [Image1.Picture.Width, Image1.Picture.Height]);

  end;
end;

procedure TfrmPhoto.UpdateProjetsObjects;
var
  clone: TFDMemTable;
  unClient: TClient;
  SL : TStringList;
begin
  logMemo.Lines.Add('Updating Projets Objects Data');
  clone := TFDMemTable.Create(Self);
  try
    clone.CloneCursor(FDMemTblClients);
    clone.First;
    SL := TStringList.Create;
    try
      while not Clone.Eof do
      begin
        unClient := TClient.Create(clone.FieldByName('Nom').AsString);
        try
          unClient.Adresse := clone.FieldByName('Adresse').AsString;
          unClient.Ville := clone.FieldByName('Ville').AsString;
          unClient.Long := clone.FieldByName('Longitude').AsFloat;
          unClient.Lati := clone.FieldByName('Latitude').AsFloat;
          unClient.Telephone := clone.FieldByName('Telephone').AsString;
          unClient.Description := clone.FieldByName('Description').AsString;

          SL.Add(TJson.ObjectToJsonString(unClient));
        finally
          unClient.Free;
        end;
        Clone.Next;
      end;
      SL.Delimiter := Data_Delimiter;
      MediaReceiverProfile.Resources.FindByName('ProjectList').Value := SL.DelimitedText;
      logMemo.Lines.Add(SL.DelimitedText);
    finally
      SL.Free;
    end;
  finally
    clone.Free;
  end;

end;

end.
