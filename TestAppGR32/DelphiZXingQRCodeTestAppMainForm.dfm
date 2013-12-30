object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Delphi port of ZXing QRCode (Graphics32)'
  ClientHeight = 104
  ClientWidth = 298
  Color = clBtnFace
  Constraints.MinHeight = 131
  Constraints.MinWidth = 306
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    298
    104)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 22
    Height = 13
    Caption = 'Text'
  end
  object Label2: TLabel
    Left = 8
    Top = 61
    Width = 43
    Height = 13
    Caption = 'Encoding'
  end
  object Label3: TLabel
    Left = 159
    Top = 61
    Width = 52
    Height = 13
    Caption = 'Quiet zone'
  end
  object Label4: TLabel
    Left = 224
    Top = 13
    Width = 38
    Height = 13
    Caption = 'Preview'
  end
  object edtText: TEdit
    Left = 8
    Top = 32
    Width = 203
    Height = 21
    TabOrder = 0
    Text = 'Hello world'
    OnChange = edtTextChange
  end
  object cmbEncoding: TComboBox
    Left = 8
    Top = 77
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 1
    Text = 'Auto'
    OnChange = cmbEncodingChange
    Items.Strings = (
      'Auto'
      'Numeric'
      'Alphanumeric'
      'ISO-8859-1'
      'UTF-8 without BOM'
      'UTF-8 with BOM')
  end
  object QRBox: TPaintBox32
    Left = 224
    Top = 29
    Width = 67
    Height = 67
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    OnPaintBuffer = QRBoxPaintBuffer
  end
  object SpinEditQuietZone: TSpinEdit
    Left = 159
    Top = 77
    Width = 52
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 4
  end
end
