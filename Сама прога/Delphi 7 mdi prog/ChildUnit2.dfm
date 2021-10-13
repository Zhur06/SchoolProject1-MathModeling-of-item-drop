object ChildForm2: TChildForm2
  Left = 1637
  Top = 338
  Width = 242
  Height = 168
  Caption = 'ChildForm2'
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 0
    Top = 0
    Width = 225
    Height = 21
    TabOrder = 0
    Text = 'Type here your height'
  end
  object Button1: TButton
    Left = 48
    Top = 48
    Width = 121
    Height = 25
    Cursor = crHandPoint
    Caption = 'Click to save changes'
    TabOrder = 1
    OnClick = Button1Click
  end
end
