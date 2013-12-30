unit DelphiZXingQRCodeTestAppMainForm;

// Demo app for ZXing QRCode port to Delphi, by Debenu Pty Ltd
// www.debenu.com

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Samples.Spin, GR32, GR32_Image, GR32_OrdinalMaps,
  DelphiZXingQRCode;

type
  TForm1 = class(TForm)
    edtText: TEdit;
    Label1: TLabel;
    cmbEncoding: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    QRBox: TPaintBox32;
    SpinEditQuietZone: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure edtTextChange(Sender: TObject);
    procedure cmbEncodingChange(Sender: TObject);
    procedure edtQuietZoneChange(Sender: TObject);
    procedure QRBoxPaintBuffer(Sender: TObject);
  private
    FBitMap: TBooleanMap;
  public
    procedure UpdateSettings;
  end;

var
  Form1: TForm1;

implementation

uses
  GR32_Polygons, GR32_VectorUtils;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FBitMap := TBooleanMap.Create;
  UpdateSettings;
end;

procedure TForm1.cmbEncodingChange(Sender: TObject);
begin
  UpdateSettings;
end;

procedure TForm1.edtQuietZoneChange(Sender: TObject);
begin
  UpdateSettings;
end;

procedure TForm1.edtTextChange(Sender: TObject);
begin
  UpdateSettings;
end;

procedure TForm1.QRBoxPaintBuffer(Sender: TObject);
var
  Scale: Double;
  X, Y: Integer;
begin
  QRBox.Buffer.Clear(clWhite32);

  if (QRBox.Width < QRBox.Height) then
    Scale := QRBox.Width / FBitMap.Width
  else
    Scale := QRBox.Height / FBitMap.Height;

  for Y := 0 to FBitMap.Height - 1 do
    for X := 0 to FBitMap.Width - 1 do
      if FBitMap[X, Y] then
        PolygonFS_LCD2(QRBox.Buffer, Rectangle(FloatRect(Scale * X, Scale * Y,
          Scale * (X + 1) + 0.5, Scale * (Y + 1) + 0.5)), clBlack32);

(*
        QRBox.Buffer.FillRect(Round(Scale * X), Round(Scale * Y),
          Round(Scale * (X + 1)), Round(Scale * (Y + 1)), clBlack32);
*)
end;

procedure TForm1.UpdateSettings;
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := edtText.Text;
    QRCode.Encoding := TQRCodeEncoding(cmbEncoding.ItemIndex);
    QRCode.QuietZone := StrToIntDef(SpinEditQuietZone.Text, 4);
    FBitMap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
      for Column := 0 to QRCode.Columns - 1 do
        FBitMap[Column, Row] := (QRCode.IsBlack[Row, Column]);
  finally
    QRCode.Free;
  end;

  QRBox.Invalidate;
end;

end.
