object MainForm: TMainForm
  Left = 451
  Top = 259
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
        OnClick = Button1Click
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
          Width = 153
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
        object Button3: TButton
          Left = 8
          Top = 64
          Width = 153
          Height = 25
          Caption = #1042#1085#1077#1089#1090#1080' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1074' '#1092#1072#1081#1083
          TabOrder = 2
          OnClick = Button3Click
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1056#1080#1089#1091#1085#1086#1082' '#1073#1088#1086#1089#1082#1072' '#1090#1077#1083#1072
        ImageIndex = 1
        object Edit2: TEdit
          Left = 8
          Top = 8
          Width = 153
          Height = 21
          TabOrder = 0
          Text = #1042#1074#1077#1076#1080#1090#1077' v'
        end
        object Edit3: TEdit
          Left = 8
          Top = 32
          Width = 153
          Height = 21
          TabOrder = 1
          Text = #1042#1074#1077#1076#1080#1090#1077' '#1091#1075#1086#1083' '#1082' '#1075#1086#1088#1080#1079#1086#1085#1090#1091
        end
        object Button4: TButton
          Left = 8
          Top = 56
          Width = 153
          Height = 25
          Caption = #1057#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1103#1095#1077#1077#1082
          TabOrder = 2
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 8
          Top = 88
          Width = 153
          Height = 25
          Caption = #1042#1085#1077#1089#1090#1080' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1074' '#1092#1072#1081#1083
          TabOrder = 3
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 272
    object N1: TMenuItem
      Caption = #1043#1088#1072#1092#1080#1082#1080
      object h1: TMenuItem
        Caption = #1052#1086#1076#1077#1083#1100' '#1087#1072#1076#1077#1085#1080#1103' '#1090#1086#1083#1100#1082#1086' '#1086#1090' h'
        OnClick = h1Click
      end
    end
    object N2: TMenuItem
      Caption = #1056#1080#1089#1091#1085#1082#1080
      object v1: TMenuItem
        Caption = #1052#1086#1076#1077#1083#1100' '#1087#1086#1083#1077#1090#1072' '#1090#1077#1083#1072' '#1089' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1089#1082#1086#1088#1086#1089#1090#1100#1102' v'
        OnClick = v1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 200
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 302
  end
end
