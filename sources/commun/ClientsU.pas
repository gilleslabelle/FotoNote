unit ClientsU;

interface

uses
  System.Generics.Collections;

type
  TClient = class
  strict private
    FTelephone:   string;
    FNom:         string;
    FLati:        double;
    FDescription: string;
    FVille:       string;
    FLong:        double;
    FAdresse:     string;

  public
    constructor Create(aName: string); overload;
    destructor Destroy; override;
    property Nom: string read FNom;
    property Adresse: string read FAdresse write FAdresse;
    property Ville: string read FVille write FVille;
    property Telephone: string read FTelephone write FTelephone;
    property Long: double read FLong write FLong;
    property Lati: double read FLati write FLati;
    property Description: string read FDescription write FDescription;

  end;

  TClientColl = class(TObjectList<TClient>);
  // constructor Create;
  // destructor Destroy; overload;
  // end;

implementation

{ TProjet }

constructor TClient.Create(aName: string);
begin

  inherited Create;

  FNom := aName;
end;

destructor TClient.Destroy;
begin
  inherited Destroy;
end;

{ TProjectColl }

end.
