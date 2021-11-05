object MainForm: TMainForm
  Left = 378
  Top = 129
  Width = 804
  Height = 847
  Caption = #1054#1089#1085#1086#1074#1085#1086#1077' '#1086#1082#1085#1086
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 353
    Height = 808
    Align = alLeft
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 2
      Top = 15
      Width = 349
      Height = 74
      Align = alTop
      Caption = '  '#1042#1099#1073#1086#1088' '#1052#1086#1076#1077#1083#1080'  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 32
        Width = 61
        Height = 20
        Caption = #1052#1086#1076#1077#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ComboBox1: TComboBox
        Left = 88
        Top = 32
        Width = 249
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        OnChange = ComboBox1Change
        Items.Strings = (
          #1058#1088#1072#1077#1082#1090#1086#1088#1080#1103' '#1073#1088#1086#1089#1082#1072' '#1090#1077#1083#1072' '#1074' '#1074#1072#1082#1091#1091#1084#1077
          #1058#1088#1072#1077#1082#1090#1086#1088#1080#1103' '#1073#1088#1086#1089#1082#1072' '#1090#1077#1083#1072' '#1074' '#1089#1088#1077#1076#1077)
      end
    end
    object GroupBox5: TGroupBox
      Left = 2
      Top = 89
      Width = 349
      Height = 64
      Align = alTop
      Caption = '  '#1060#1086#1088#1084#1091#1083#1099'  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object PageControl1: TPageControl
      Left = 2
      Top = 153
      Width = 349
      Height = 375
      Align = alClient
      MultiLine = True
      TabOrder = 2
      object TabSheet2: TTabSheet
        Caption = #1056#1080#1089#1091#1085#1086#1082' '#1073#1088#1086#1089#1082#1072' '#1090#1077#1083#1072
        ImageIndex = 1
        TabVisible = False
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 341
          Height = 105
          Align = alTop
          Caption = '   '#1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093'  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label3: TLabel
            Left = 8
            Top = 64
            Width = 198
            Height = 20
            Caption = #1059#1075#1086#1083' '#1082' '#1075#1086#1088#1080#1079#1086#1085#1090#1091', '#1075#1088#1072#1076#1091#1089#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 8
            Top = 24
            Width = 103
            Height = 20
            Caption = #1057#1082#1086#1088#1086#1089#1090#1100', '#1084'/'#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Edit2: TEdit
            Left = 216
            Top = 24
            Width = 113
            Height = 28
            Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1085#1072#1095#1072#1083#1100#1085#1091#1102' '#1089#1082#1086#1088#1086#1089#1090#1100' '#1090#1077#1083#1072' ('#1074' '#1084'/'#1089')'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object Edit3: TEdit
            Left = 216
            Top = 64
            Width = 113
            Height = 28
            Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1091#1075#1086#1083' '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1074#1099' '#1087#1088#1086#1089#1072#1077#1090#1077' '#1090#1077#1083#1086' ('#1074' '#1075#1088#1072#1076#1091#1089#1072#1093')'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #1041#1088#1086#1089#1086#1082' '#1074' '#1089#1088#1077#1076#1077
        ImageIndex = 3
        TabVisible = False
        object GroupBox6: TGroupBox
          Left = 0
          Top = 0
          Width = 341
          Height = 180
          Align = alTop
          Caption = '  '#1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093'  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label4: TLabel
            Left = 8
            Top = 24
            Width = 103
            Height = 20
            Caption = #1057#1082#1086#1088#1086#1089#1090#1100', '#1084'/'#1089
          end
          object Label5: TLabel
            Left = 8
            Top = 64
            Width = 198
            Height = 20
            Caption = #1059#1075#1086#1083' '#1082' '#1075#1086#1088#1080#1079#1086#1085#1090#1091', '#1075#1088#1072#1076#1091#1089#1099
          end
          object Label6: TLabel
            Left = 8
            Top = 104
            Width = 70
            Height = 20
            Caption = #1052#1072#1089#1089#1072', '#1082#1075
          end
          object Label7: TLabel
            Left = 8
            Top = 144
            Width = 181
            Height = 20
            Caption = 'k '#1089#1086#1087#1088#1086#1090#1080#1074#1083#1077#1085#1080#1103' '#1089#1088#1077#1076#1099
          end
          object Edit15: TEdit
            Left = 216
            Top = 24
            Width = 113
            Height = 26
            Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1085#1072#1095#1072#1083#1100#1085#1091#1102' '#1089#1082#1086#1088#1086#1089#1090#1100' '#1090#1077#1083#1072' ('#1074' '#1084'/'#1089')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object Edit16: TEdit
            Left = 216
            Top = 64
            Width = 113
            Height = 26
            Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1091#1075#1086#1083' '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1074#1099' '#1087#1088#1086#1089#1072#1077#1090#1077' '#1090#1077#1083#1086' ('#1074' '#1075#1088#1072#1076#1091#1089#1072#1093')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object Edit17: TEdit
            Left = 216
            Top = 104
            Width = 113
            Height = 26
            Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1084#1072#1089#1089#1091' '#1089#1085#1072#1088#1103#1076#1072' ('#1074' '#1082#1075')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object Edit18: TEdit
            Left = 216
            Top = 144
            Width = 113
            Height = 26
            Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1082#1086#1101#1092#1094#1080#1077#1085#1090' '#1089#1086#1087#1088#1086#1090#1080#1074#1083#1077#1085#1080#1103' '#1089#1088#1077#1076#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
        end
      end
    end
    object GroupBox10: TGroupBox
      Left = 2
      Top = 646
      Width = 349
      Height = 160
      Align = alBottom
      Caption = '  '#1054#1090#1088#1080#1089#1086#1074#1082#1072'  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label8: TLabel
        Left = 8
        Top = 72
        Width = 109
        Height = 20
        Caption = #1062#1074#1077#1090' '#1075#1088#1072#1092#1080#1082#1072
      end
      object RunBtn: TButton
        Left = 8
        Top = 112
        Width = 321
        Height = 33
        Hint = #1057#1086#1079#1076#1072#1077#1090' '#1089#1087#1088#1072#1074#1072' '#1086#1082#1085#1086' '#1074' '#1082#1086#1090#1086#1088#1086#1084' '#1073#1091#1076#1077#1090' '#1080#1079#1086#1073#1088#1072#1078#1077#1085' '#1074#1072#1096' '#1075#1088#1072#1092#1080#1082
        Caption = #1053#1072#1095#1077#1088#1090#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = RunBtnClick
      end
      object Button1: TButton
        Left = 304
        Top = 64
        Width = 25
        Height = 33
        Caption = '...'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Panel1: TPanel
        Left = 136
        Top = 80
        Width = 161
        Height = 5
        Color = clBlack
        TabOrder = 2
      end
      object ScaleCB: TCheckBox
        Left = 8
        Top = 32
        Width = 321
        Height = 17
        Alignment = taLeftJustify
        Caption = #1052#1072#1089#1096#1090#1072#1073#1080#1088#1086#1074#1072#1085#1080#1077
        TabOrder = 3
        OnClick = ScaleCBClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 528
      Width = 349
      Height = 118
      Align = alBottom
      Caption = '  '#1057#1086#1093#1088#1072#1085#1077#1085#1080#1077'/'#1063#1090#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093'  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object SaveToFileBtn: TButton
        Left = 8
        Top = 24
        Width = 321
        Height = 33
        Hint = #1055#1077#1088#1077#1085#1086#1089#1080#1090' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1089#1074#1077#1088#1093#1091' '#1074' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1092#1072#1081#1083
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = SaveToFileBtnClick
      end
      object ReadFromFileBtn: TButton
        Left = 8
        Top = 64
        Width = 321
        Height = 33
        Hint = 
          #1057#1095#1080#1090#1099#1074#1072#1077#1090' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1080#1079' '#1091#1082#1072#1079#1072#1085#1085#1086#1075#1086' '#1092#1072#1081#1083#1072' '#1080' '#1074#1087#1080#1089#1099#1074#1072#1077#1090' '#1080#1093' '#1074' '#1103#1095#1077#1081#1082#1080' '#1089 +
          #1074#1077#1088#1093#1091
        Caption = #1057#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1092#1072#1081#1083#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ReadFromFileBtnClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 600
    Top = 184
  end
  object SaveDialog1: TSaveDialog
    Left = 622
    Top = 72
  end
  object ColorDialog1: TColorDialog
    Left = 392
    Top = 64
  end
end
