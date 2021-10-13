object MainForm: TMainForm
  Left = 429
  Top = 266
  Width = 1305
  Height = 675
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 265
    Height = 616
    Align = alLeft
    Caption = '   '#1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093'   '
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 261
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Button1: TButton
        Left = 16
        Top = 8
        Width = 145
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080#1079' '#1092#1072#1081#1083#1072
        TabOrder = 0
      end
    end
    object PageControl1: TPageControl
      Left = 2
      Top = 56
      Width = 261
      Height = 558
      ActivePage = TabSheet1
      Align = alClient
      MultiLine = True
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = #1043#1088#1072#1092#1080#1082' '#1090#1086#1083#1100#1082#1086' '#1086#1090' h'
        object Edit1: TEdit
          Left = 8
          Top = 8
          Width = 121
          Height = 21
          TabOrder = 0
          Text = #1042#1074#1077#1076#1080#1090#1077' h'
        end
        object Button2: TButton
          Left = 8
          Top = 32
          Width = 153
          Height = 25
          Caption = #1057#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1103#1095#1077#1077#1082
          TabOrder = 1
          OnClick = Button2Click
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1043#1088#1072#1092#1080#1082' '#1086#1090' h '#1080' g'
        ImageIndex = 1
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 320
    Top = 16
    object N1: TMenuItem
      Caption = #1043#1088#1072#1092#1080#1082#1080
      object h1: TMenuItem
        Caption = #1052#1086#1076#1077#1083#1100' '#1087#1072#1076#1077#1085#1080#1103' '#1090#1086#1083#1100#1082#1086' '#1086#1090' h'
        OnClick = h1Click
      end
    end
    object N2: TMenuItem
      Caption = #1057#1095#1080#1090#1099#1074#1072#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
      object N3: TMenuItem
        Caption = #1042#1074#1086#1076#1080#1090#1100' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1042#1079#1103#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 200
    Top = 24
  end
end
