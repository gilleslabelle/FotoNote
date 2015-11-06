unit NotesU;

interface

uses
  System.Generics.Collections, FMX.Graphics, FMX.Objects;

type
  TUneNote = class
  strict private
    FClientNom:   string;
    FClientID:    integer;
    FNoteDate:    TDateTime;
    FPhoto:       TImage;
    FDescription: string;
    FisNewNote:   boolean;
    procedure SetClientID(const Value: integer);
    procedure SetClientNom(const Value: string);
    procedure SetDescription(const Value: string);
    procedure SetNoteDate(const Value: TDateTime);
    procedure SetPhoto(const Value: TImage);
  private

  public
    constructor Create(isNewNote: boolean);
    destructor Destroy; override;
    property Description: string read FDescription write SetDescription;
    property NoteDate: TDateTime read FNoteDate write SetNoteDate;
    property Photo: TImage read FPhoto write SetPhoto;
    property ClientID: integer read FClientID write SetClientID;
    Property ClientNom: string read FClientNom write SetClientNom;
    function isNewNote: boolean;

  end;

  TNoteColl = class(TObjectList<TUneNote>)
  public
      constructor Create;
    destructor Destroy; override;

  end;

  // constructor Create;
  // destructor Destroy; overload;
implementation

uses System.SysUtils;
{ TUneNote }

constructor TUneNote.Create(isNewNote: boolean);
begin
  inherited Create;
  FisNewNote   := isNewNote;
  FDescription := '';
  FNoteDate    := now;

  FClientNom := '';
  FClientID  := -1;
//  FPhoto     := nil
    FPhoto:=       TImage.Create(nil);
end;

destructor TUneNote.Destroy;
begin

end;

function TUneNote.isNewNote: boolean;
begin
  result := FisNewNote;
end;

procedure TUneNote.SetClientID(const Value: integer);
begin
  FClientID := Value;
end;

procedure TUneNote.SetClientNom(const Value: string);
begin
  FClientNom := Value;
end;

procedure TUneNote.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TUneNote.SetNoteDate(const Value: TDateTime);
begin
  FNoteDate := Value;
end;

procedure TUneNote.SetPhoto(const Value: TImage);
begin
  FPhoto := Value;
end;

{ TNoteColl }

constructor TNoteColl.Create;
begin
  inherited Create(true);
end;

destructor TNoteColl.Destroy;
begin

  inherited;
end;

end.