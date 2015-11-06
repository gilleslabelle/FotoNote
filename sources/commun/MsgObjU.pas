unit MsgObjU;

interface

uses System.Classes, System.NetEncoding, sysUtils;

const
  Data_Delimiter = '^';

type

  TMsgObj = class(TComponent)
  strict private
    FDate:       TDateTime;
    FNom:        string;
    FImgstr:     string;
    Flat:        double;
    Flong:       double;
    FNote:       string;
    FIdentifier: string;

  public
    constructor Create(Identifier: string);
    destructor Destroy; override;

  published
    property Nom:    string read FNom write FNom;
    property Date:   TDateTime read FDate write FDate;
    property Imgstr: string read FImgstr write FImgstr;
    property Note:   string read FNote write FNote;
    property long:   double read Flong write Flong;
    property lat:    double read Flat write Flat;

  end;

implementation

{ TMsgObj }

constructor TMsgObj.Create(Identifier: string);
begin
  inherited Create(nil);
  FIdentifier := Identifier;
  // FImg := TBitmap.Create;
  // FImgstr:= TStringStream.Create;

end;

destructor TMsgObj.Destroy;
begin
  // FImg.Free;
  // FImgstr.Free;
end;

initialization

RegisterClass(TMsgObj);

end.
