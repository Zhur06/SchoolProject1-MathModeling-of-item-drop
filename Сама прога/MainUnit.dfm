object MainForm: TMainForm
  Left = 1010
  Top = 344
  Width = 889
  Height = 725
  Caption = #1054#1089#1085#1086#1074#1085#1086#1077' '#1086#1082#1085#1086
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
    Height = 666
    Align = alLeft
    Caption = '   '#1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093'  '#1044#1083#1103' '#1086#1090#1088#1080#1089#1086#1074#1082#1080' '#1074#1099#1073#1077#1088#1080#1090#1077' '#1074#1099#1096#1077'  '
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 2
      Top = 15
      Width = 261
      Height = 649
      ActivePage = TabSheet4
      Align = alClient
      MultiLine = True
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1043#1088#1072#1092#1080#1082' '#1090#1086#1083#1100#1082#1086' '#1086#1090' h'
        object Edit1: TEdit
          Left = 8
          Top = 8
          Width = 153
          Height = 21
          Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1074#1099#1089#1086#1090#1091' '#1089' '#1082#1086#1090#1086#1088#1086#1081' '#1074#1099' '#1073#1088#1086#1089#1072#1077#1090#1077' '#1090#1077#1083#1086' ('#1074' '#1084')'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = #1042#1074#1077#1076#1080#1090#1077' h'
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
        end
        object Button2: TButton
          Left = 8
          Top = 32
          Width = 153
          Height = 25
          Hint = 
            #1050#1083#1080#1082#1085#1080#1090#1077' '#1095#1089#1102#1076#1072' '#1077#1089#1083#1080' '#1093#1086#1090#1080#1090#1077' '#1089#1095#1080#1090#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1089#1074#1077#1088#1093#1091'. '#1053#1086#1074#1099#1081' '#1088#1080#1089#1091#1085#1086 +
            #1082' '#1085#1072#1088#1080#1089#1091#1077#1090' '#1087#1086#1074#1077#1088#1093' '#1089#1090#1072#1088#1086#1075#1086
          Caption = #1057#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1103#1095#1077#1077#1082
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 8
          Top = 64
          Width = 153
          Height = 25
          Hint = #1055#1077#1088#1077#1085#1086#1089#1080#1090' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1089#1074#1077#1088#1093#1091' '#1074' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
          Caption = #1042#1085#1077#1089#1090#1080' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1074' '#1092#1072#1081#1083
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button1: TButton
          Left = 8
          Top = 96
          Width = 153
          Height = 25
          Hint = 
            #1057#1095#1080#1090#1099#1074#1072#1077#1090' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1080#1079' '#1091#1082#1072#1079#1072#1085#1085#1086#1075#1086' '#1092#1072#1081#1083#1072' '#1080' '#1074#1087#1080#1089#1099#1074#1072#1077#1090' '#1080#1093' '#1074' '#1103#1095#1077#1081#1082#1080' '#1089 +
            #1074#1077#1088#1093#1091
          Caption = #1057#1095#1080#1090#1072#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = Button1Click
        end
        object Button10: TButton
          Left = 8
          Top = 136
          Width = 153
          Height = 25
          Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100' '#1075#1088#1072#1092#1080#1082
          TabOrder = 4
          OnClick = Button10Click
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 466
          Width = 253
          Height = 137
          Align = alBottom
          Caption = '  '#1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1075#1088#1072#1092#1080#1082#1072'  '
          TabOrder = 5
          object Edit6: TEdit
            Left = 40
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = Edit6Change
            OnEnter = Edit6Enter
            OnExit = Edit6Exit
          end
          object Edit7: TEdit
            Left = 40
            Top = 48
            Width = 121
            Height = 21
            TabOrder = 1
            Text = '0'
            OnChange = Edit7Change
            OnEnter = Edit7Enter
            OnExit = Edit7Exit
          end
          object Edit8: TEdit
            Left = 40
            Top = 72
            Width = 121
            Height = 21
            TabOrder = 2
            Text = '0'
            OnChange = Edit8Change
            OnEnter = Edit8Enter
            OnExit = Edit8Exit
          end
          object Panel1: TPanel
            Left = 16
            Top = 24
            Width = 17
            Height = 17
            Caption = 'R'
            TabOrder = 3
          end
          object Panel2: TPanel
            Left = 16
            Top = 48
            Width = 17
            Height = 17
            Caption = 'G'
            TabOrder = 4
          end
          object Panel3: TPanel
            Left = 16
            Top = 72
            Width = 17
            Height = 17
            Caption = 'B'
            TabOrder = 5
          end
          object Button13: TButton
            Left = 16
            Top = 96
            Width = 145
            Height = 25
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1094#1074#1077#1090
            TabOrder = 6
            OnClick = Button13Click
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 416
          Width = 253
          Height = 50
          Align = alBottom
          Caption = ' '#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1088#1072#1079#1084#1077#1088#1072' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072' '
          TabOrder = 6
          object Button16: TButton
            Left = 8
            Top = 16
            Width = 33
            Height = 25
            Caption = '-'
            TabOrder = 0
            OnClick = Button16Click
          end
          object Button17: TButton
            Left = 48
            Top = 16
            Width = 33
            Height = 25
            Caption = '+'
            TabOrder = 1
            OnClick = Button17Click
          end
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
          Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1085#1072#1095#1072#1083#1100#1085#1091#1102' '#1089#1082#1086#1088#1086#1089#1090#1100' '#1090#1077#1083#1072' ('#1074' '#1084'/'#1089')'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = #1042#1074#1077#1076#1080#1090#1077' v'
          OnEnter = Edit2Enter
          OnExit = Edit2Exit
        end
        object Edit3: TEdit
          Left = 8
          Top = 32
          Width = 153
          Height = 21
          Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1091#1075#1086#1083' '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1074#1099' '#1087#1088#1086#1089#1072#1077#1090#1077' '#1090#1077#1083#1086' ('#1074' '#1075#1088#1072#1076#1091#1089#1072#1093')'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = #1042#1074#1077#1076#1080#1090#1077' '#1091#1075#1086#1083' '#1082' '#1075#1086#1088#1080#1079#1086#1085#1090#1091
          OnEnter = Edit3Enter
          OnExit = Edit3Exit
        end
        object Button4: TButton
          Left = 8
          Top = 56
          Width = 153
          Height = 25
          Hint = 
            #1050#1083#1080#1082#1085#1080#1090#1077' '#1095#1089#1102#1076#1072' '#1077#1089#1083#1080' '#1093#1086#1090#1080#1090#1077' '#1089#1095#1080#1090#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1089#1074#1077#1088#1093#1091'. '#1053#1086#1074#1099#1081' '#1088#1080#1089#1091#1085#1086 +
            #1082' '#1085#1072#1088#1080#1089#1091#1077#1090' '#1087#1086#1074#1077#1088#1093' '#1089#1090#1072#1088#1086#1075#1086
          Caption = #1057#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1103#1095#1077#1077#1082
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 8
          Top = 88
          Width = 153
          Height = 25
          Hint = #1055#1077#1088#1077#1085#1086#1089#1080#1090' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1089#1074#1077#1088#1093#1091' '#1074' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
          Caption = #1042#1085#1077#1089#1090#1080' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1074' '#1092#1072#1081#1083
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 8
          Top = 120
          Width = 153
          Height = 25
          Hint = 
            #1057#1095#1080#1090#1099#1074#1072#1077#1090' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1080#1079' '#1091#1082#1072#1079#1072#1085#1085#1086#1075#1086' '#1092#1072#1081#1083#1072' '#1080' '#1074#1087#1080#1089#1099#1074#1072#1077#1090' '#1080#1093' '#1074' '#1103#1095#1077#1081#1082#1080' '#1089 +
            #1074#1077#1088#1093#1091
          Caption = #1057#1095#1080#1090#1072#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = Button6Click
        end
        object Button11: TButton
          Left = 8
          Top = 160
          Width = 153
          Height = 25
          Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100' '#1075#1088#1072#1092#1080#1082
          TabOrder = 5
          OnClick = Button11Click
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 466
          Width = 253
          Height = 137
          Align = alBottom
          Caption = '  '#1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1075#1088#1072#1092#1080#1082#1072'  '
          TabOrder = 6
          object Edit12: TEdit
            Left = 40
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = Edit12Change
          end
          object Edit13: TEdit
            Left = 40
            Top = 48
            Width = 121
            Height = 21
            TabOrder = 1
            Text = '0'
            OnChange = Edit13Change
          end
          object Edit14: TEdit
            Left = 40
            Top = 72
            Width = 121
            Height = 21
            TabOrder = 2
            Text = '0'
            OnChange = Edit14Change
          end
          object Panel7: TPanel
            Left = 16
            Top = 24
            Width = 17
            Height = 17
            Caption = 'R'
            TabOrder = 3
          end
          object Panel8: TPanel
            Left = 16
            Top = 48
            Width = 17
            Height = 17
            Caption = 'G'
            TabOrder = 4
          end
          object Panel9: TPanel
            Left = 16
            Top = 72
            Width = 17
            Height = 17
            Caption = 'B'
            TabOrder = 5
          end
          object Button15: TButton
            Left = 16
            Top = 96
            Width = 145
            Height = 25
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1094#1074#1077#1090
            TabOrder = 6
            OnClick = Button13Click
          end
        end
        object GroupBox6: TGroupBox
          Left = 0
          Top = 416
          Width = 253
          Height = 50
          Align = alBottom
          Caption = ' '#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1088#1072#1079#1084#1077#1088#1072' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072' '
          TabOrder = 7
          object Button18: TButton
            Left = 8
            Top = 16
            Width = 33
            Height = 25
            Caption = '-'
            TabOrder = 0
            OnClick = Button16Click
          end
          object Button19: TButton
            Left = 48
            Top = 16
            Width = 33
            Height = 25
            Caption = '+'
            TabOrder = 1
            OnClick = Button17Click
          end
        end
        object GroupBox8: TGroupBox
          Left = 0
          Top = 368
          Width = 253
          Height = 48
          Align = alBottom
          Caption = '  '#1052#1072#1089#1096#1090#1072#1073#1080#1088#1086#1074#1072#1085#1080#1077
          TabOrder = 8
          object Button22: TButton
            Left = 8
            Top = 16
            Width = 41
            Height = 25
            Caption = 'On'
            TabOrder = 0
            OnClick = Button22Click
          end
          object Button23: TButton
            Left = 56
            Top = 16
            Width = 41
            Height = 25
            Caption = 'Off'
            TabOrder = 1
            OnClick = Button23Click
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1043#1088#1072#1092#1080#1082' '#1087#1072#1076#1077#1085#1080#1103' '#1086#1090' h '#1080' g'
        ImageIndex = 2
        object Edit4: TEdit
          Left = 8
          Top = 8
          Width = 153
          Height = 21
          Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1074#1099#1089#1086#1090#1091' '#1089' '#1082#1086#1090#1086#1088#1086#1081' '#1073#1088#1086#1089#1072#1077#1090#1077' '#1090#1077#1083#1086' ('#1074' '#1084')'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = #1042#1074#1077#1076#1080#1090#1077' h'
          OnEnter = Edit4Enter
          OnExit = Edit4Exit
        end
        object Edit5: TEdit
          Left = 8
          Top = 32
          Width = 153
          Height = 21
          Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1091#1089#1082#1086#1088#1077#1085#1080#1077' '#1089#1074#1086#1073#1086#1076#1085#1086#1075#1086' '#1087#1072#1076#1077#1085#1080#1103' '#1090#1077#1083#1072' ('#1074' '#1084'/'#1089'^2)'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = #1042#1074#1077#1076#1080#1090#1077' g'
          OnEnter = Edit5Enter
          OnExit = Edit5Exit
        end
        object Button7: TButton
          Left = 8
          Top = 56
          Width = 153
          Height = 25
          Hint = 
            #1050#1083#1080#1082#1085#1080#1090#1077' '#1095#1089#1102#1076#1072' '#1077#1089#1083#1080' '#1093#1086#1090#1080#1090#1077' '#1089#1095#1080#1090#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1089#1074#1077#1088#1093#1091'. '#1053#1086#1074#1099#1081' '#1088#1080#1089#1091#1085#1086 +
            #1082' '#1085#1072#1088#1080#1089#1091#1077#1090' '#1087#1086#1074#1077#1088#1093' '#1089#1090#1072#1088#1086#1075#1086
          Caption = #1057#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1103#1095#1077#1077#1082
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 8
          Top = 88
          Width = 153
          Height = 25
          Hint = #1055#1077#1088#1077#1085#1086#1089#1080#1090' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1089#1074#1077#1088#1093#1091' '#1074' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
          Caption = #1042#1085#1077#1089#1090#1080' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1074' '#1092#1072#1081#1083
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = Button8Click
        end
        object Button9: TButton
          Left = 8
          Top = 120
          Width = 153
          Height = 25
          Hint = 
            #1057#1095#1080#1090#1099#1074#1072#1077#1090' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1080#1079' '#1091#1082#1072#1079#1072#1085#1085#1086#1075#1086' '#1092#1072#1081#1083#1072' '#1080' '#1074#1087#1080#1089#1099#1074#1072#1077#1090' '#1080#1093' '#1074' '#1103#1095#1077#1081#1082#1080' '#1089 +
            #1074#1077#1088#1093#1091
          Caption = #1057#1095#1080#1090#1072#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = Button9Click
        end
        object Button12: TButton
          Left = 8
          Top = 160
          Width = 153
          Height = 25
          Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100' '#1075#1088#1072#1092#1080#1082
          TabOrder = 5
          OnClick = Button12Click
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 466
          Width = 253
          Height = 137
          Align = alBottom
          Caption = '  '#1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1075#1088#1072#1092#1080#1082#1072'  '
          TabOrder = 6
          object Edit9: TEdit
            Left = 40
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = Edit9Change
          end
          object Edit10: TEdit
            Left = 40
            Top = 48
            Width = 121
            Height = 21
            TabOrder = 1
            Text = '0'
            OnChange = Edit10Change
          end
          object Edit11: TEdit
            Left = 40
            Top = 72
            Width = 121
            Height = 21
            TabOrder = 2
            Text = '0'
            OnChange = Edit11Change
          end
          object Panel4: TPanel
            Left = 16
            Top = 24
            Width = 17
            Height = 17
            Caption = 'R'
            TabOrder = 3
          end
          object Panel5: TPanel
            Left = 16
            Top = 48
            Width = 17
            Height = 17
            Caption = 'G'
            TabOrder = 4
          end
          object Panel6: TPanel
            Left = 16
            Top = 72
            Width = 17
            Height = 17
            Caption = 'B'
            TabOrder = 5
          end
          object Button14: TButton
            Left = 16
            Top = 96
            Width = 145
            Height = 25
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1094#1074#1077#1090
            TabOrder = 6
            OnClick = Button13Click
          end
        end
        object GroupBox7: TGroupBox
          Left = 0
          Top = 416
          Width = 253
          Height = 50
          Align = alBottom
          Caption = ' '#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1088#1072#1079#1084#1077#1088#1072' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072' '
          TabOrder = 7
          object Button20: TButton
            Left = 8
            Top = 16
            Width = 33
            Height = 25
            Caption = '-'
            TabOrder = 0
            OnClick = Button16Click
          end
          object Button21: TButton
            Left = 48
            Top = 16
            Width = 33
            Height = 25
            Caption = '+'
            TabOrder = 1
            OnClick = Button17Click
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #1041#1088#1086#1089#1086#1082' '#1074' '#1089#1088#1077#1076#1077
        ImageIndex = 3
        object Edit15: TEdit
          Left = 8
          Top = 8
          Width = 153
          Height = 21
          TabOrder = 0
          Text = #1042#1074#1077#1076#1080#1090#1077' v'
          OnEnter = Edit15Enter
          OnExit = Edit15Exit
        end
        object Edit16: TEdit
          Left = 8
          Top = 32
          Width = 153
          Height = 21
          TabOrder = 1
          Text = #1042#1074#1077#1076#1080#1090#1077' '#1091#1075#1086#1083' '#1082' '#1075#1086#1088#1080#1079#1086#1085#1090#1091
          OnEnter = Edit16Enter
          OnExit = Edit16Exit
        end
        object Edit17: TEdit
          Left = 8
          Top = 56
          Width = 153
          Height = 21
          TabOrder = 2
          Text = #1042#1074#1077#1076#1080#1090#1077' m'
          OnEnter = Edit17Enter
          OnExit = Edit17Exit
        end
        object Edit18: TEdit
          Left = 8
          Top = 80
          Width = 153
          Height = 21
          TabOrder = 3
          Text = #1042#1074#1077#1076#1080#1090#1077' k '#1089#1086#1087#1088#1086#1090#1080#1074#1083#1077#1085#1080#1103
          OnEnter = Edit18Enter
          OnExit = Edit18Exit
        end
        object Button24: TButton
          Left = 8
          Top = 104
          Width = 153
          Height = 25
          Caption = #1057#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1103#1095#1077#1077#1082
          TabOrder = 4
          OnClick = Button24Click
        end
        object Button25: TButton
          Left = 8
          Top = 136
          Width = 153
          Height = 25
          Caption = #1042#1085#1077#1089#1090#1080' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1074' '#1092#1072#1081#1083
          TabOrder = 5
          OnClick = Button25Click
        end
        object Button26: TButton
          Left = 8
          Top = 168
          Width = 153
          Height = 25
          Caption = #1057#1095#1080#1090#1072#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
          TabOrder = 6
          OnClick = Button26Click
        end
        object Button27: TButton
          Left = 8
          Top = 208
          Width = 153
          Height = 25
          Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100' '#1075#1088#1072#1092#1080#1082
          TabOrder = 7
          OnClick = Button27Click
        end
        object GroupBox9: TGroupBox
          Left = 0
          Top = 466
          Width = 253
          Height = 137
          Align = alBottom
          Caption = '  '#1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1075#1088#1072#1092#1080#1082#1072'  '
          TabOrder = 8
          object Edit19: TEdit
            Left = 40
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = Edit12Change
          end
          object Edit20: TEdit
            Left = 40
            Top = 48
            Width = 121
            Height = 21
            TabOrder = 1
            Text = '0'
            OnChange = Edit13Change
          end
          object Edit21: TEdit
            Left = 40
            Top = 72
            Width = 121
            Height = 21
            TabOrder = 2
            Text = '0'
            OnChange = Edit14Change
          end
          object Panel10: TPanel
            Left = 16
            Top = 24
            Width = 17
            Height = 17
            Caption = 'R'
            TabOrder = 3
          end
          object Panel11: TPanel
            Left = 16
            Top = 48
            Width = 17
            Height = 17
            Caption = 'G'
            TabOrder = 4
          end
          object Panel12: TPanel
            Left = 16
            Top = 72
            Width = 17
            Height = 17
            Caption = 'B'
            TabOrder = 5
          end
          object Button28: TButton
            Left = 16
            Top = 96
            Width = 145
            Height = 25
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1094#1074#1077#1090
            TabOrder = 6
            OnClick = Button13Click
          end
        end
        object GroupBox10: TGroupBox
          Left = 0
          Top = 416
          Width = 253
          Height = 50
          Align = alBottom
          Caption = ' '#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1088#1072#1079#1084#1077#1088#1072' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072' '
          TabOrder = 9
          object Button29: TButton
            Left = 8
            Top = 16
            Width = 33
            Height = 25
            Caption = '-'
            TabOrder = 0
            OnClick = Button16Click
          end
          object Button30: TButton
            Left = 48
            Top = 16
            Width = 33
            Height = 25
            Caption = '+'
            TabOrder = 1
            OnClick = Button17Click
          end
        end
        object GroupBox11: TGroupBox
          Left = 0
          Top = 368
          Width = 253
          Height = 48
          Align = alBottom
          Caption = '  '#1052#1072#1089#1096#1090#1072#1073#1080#1088#1086#1074#1072#1085#1080#1077
          TabOrder = 10
          object Button31: TButton
            Left = 8
            Top = 16
            Width = 41
            Height = 25
            Caption = 'On'
            TabOrder = 0
            OnClick = Button22Click
          end
          object Button32: TButton
            Left = 56
            Top = 16
            Width = 41
            Height = 25
            Caption = 'Off'
            TabOrder = 1
            OnClick = Button23Click
          end
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
      object hg1: TMenuItem
        Caption = #1052#1086#1076#1077#1083#1100' '#1087#1072#1076#1077#1085#1080#1103' '#1086#1090' h '#1080' g'
        OnClick = hg1Click
      end
    end
    object N2: TMenuItem
      Caption = #1056#1080#1089#1091#1085#1082#1080
      object v1: TMenuItem
        Caption = #1052#1086#1076#1077#1083#1100' '#1087#1086#1083#1077#1090#1072' '#1090#1077#1083#1072' '#1089' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1089#1082#1086#1088#1086#1089#1090#1100#1102' v'
        OnClick = v1Click
      end
      object N3: TMenuItem
        Caption = #1052#1086#1076#1077#1083#1100' '#1087#1086#1083#1077#1090#1072' '#1090#1077#1083#1072' '#1089' '#1091#1095#1077#1090#1086#1084' '#1089#1088#1077#1076#1099
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 328
  end
  object SaveDialog1: TSaveDialog
    Left = 302
  end
end
