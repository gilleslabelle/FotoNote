unit UtilsU;

interface

const

NullDate = -700000;
InvalidDate = NullDate + 1;

// uses FMX.Graphics,System.Classes, System.NetEncoding, sysUtils;


// function StringToComponentProc(Value: string): TComponent;
// function ComponentToStringProc(Component: TComponent): string;
function CalcMd5(valeur: string): string;

implementation

uses
  System.Hash,System.SysUtils;

//  System.Classes, System.NetEncoding, System.SysUtils, System.Hash;

function CalcMd5(valeur: string): string;
var
  Hash: THashMD5;
begin
  Hash := THashMD5.Create;
  Hash.Update(valeur);

  Result := Hash.HashAsString;

end;

// function ComponentToStringProc(Component: TComponent): string;
// var
// BinStream:TMemoryStream;
// StrStream: TStringStream;
// s: string;
// begin
// BinStream := TMemoryStream.Create;
// try
// StrStream := TStringStream.Create(s);
// try
// BinStream.WriteComponent(Component);
// BinStream.Seek(0, soFromBeginning);
// ObjectBinaryToText(BinStream, StrStream);
// StrStream.Seek(0, soFromBeginning);
// Result:= StrStream.DataString;
// finally
// StrStream.Free;
// end;
// finally
// BinStream.Free
// end;
// end;
//
// function StringToComponentProc(Value: string): TComponent;
// var
// StrStream:TStringStream;
// BinStream: TMemoryStream;
// begin
// StrStream := TStringStream.Create(Value);
// try
// BinStream := TMemoryStream.Create;
// try
// ObjectTextToBinary(StrStream, BinStream);
// BinStream.Seek(0, soFromBeginning);
// Result:= BinStream.ReadComponent(nil);
// finally
// BinStream.Free;
// end;
// finally
// StrStream.Free;
// end;
// end;


// function Base64FromBitmap(Bitmap: TBitmap): string;
// var
// Input: TBytesStream;
// Output: TStringStream;
// Encoding: TBase64Encoding;
// begin
// Input := TBytesStream.Create;
// try
// Bitmap.SaveToStream(Input);
// Input.Position := 0;
// Output := TStringStream.Create('', TEncoding.ASCII);
// try
// Encoding := TBase64Encoding.Create(0);
// try
// Encoding.Encode(Input, Output);
// Result := Output.DataString;
// finally
// Encoding.Free;
// end;
// finally
// Output.Free;
// end;
// finally
// Input.Free;
// end;
// end;
//
// procedure BitmapFromBase64(Base64: string; Bitmap: TBitmap);
// var
// Input: TStringStream;
// Output: TBytesStream;
// Encoding: TBase64Encoding;
// begin
// Input := TStringStream.Create(Base64, TEncoding.ASCII);
// try
// Output := TBytesStream.Create;
// try
// Encoding := TBase64Encoding.Create(0);
// try
// Encoding.Decode(Input, Output);
// Output.Position := 0;
// Bitmap.LoadFromStream(Output);
// finally
// Encoding.Free;
// end;
// finally
// Output.Free;
// end;
// finally
// Input.Free;
// end;
// end;
//

//function Base64FromBitmap(Bitmap: TBitmap): string;
//var
//  Stream:   TBytesStream;
//  Encoding: TBase64Encoding;
//begin
//  Stream := TBytesStream.Create;
//  try
//    Bitmap.SaveToStream(Stream);
//    Encoding := TBase64Encoding.Create(0);
//    try
//      Result := Encoding.EncodeBytesToString(Copy(Stream.Bytes, 0, Stream.Size));
//    finally
//      Encoding.Free;
//    end;
//  finally
//    Stream.Free;
//  end;
//end;
//
//procedure BitmapFromBase64(Base64: string; Bitmap: TBitmap);
//var
//  Stream:   TBytesStream;
//  Bytes:    TBytes;
//  Encoding: TBase64Encoding;
//begin
//  Stream := TBytesStream.Create;
//  try
//    Encoding := TBase64Encoding.Create(0);
//    try
//      Bytes := Encoding.DecodeStringToBytes(Base64);
//      Stream.WriteData(Bytes, Length(Bytes));
//      Stream.Position := 0;
//      Bitmap.LoadFromStream(Stream);
//    finally
//      Encoding.Free;
//    end;
//  finally
//    Stream.Free;
//  end;
//end;
//
end.
