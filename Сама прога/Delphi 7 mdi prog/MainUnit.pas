unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    h1: TMenuItem;
    GroupBox1: TGroupBox;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    procedure h1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    h: integer;
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses ChildUnit, IniFiles;

{$R *.dfm}

procedure TMainForm.h1Click(Sender: TObject);
begin
  ChildForm := TChildForm.Create(Self);
end;

procedure TMainForm.Button2Click(Sender: TObject);
var str: string; c: integer;
begin
  str := Edit1.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit1.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  h := StrToInt(str);
end;

procedure TMainForm.Button1Click(Sender: TObject);
var ini: TIniFile; //str: string;
begin
  if OpenDialog1.Execute then
  begin
    ini := TIniFile.Create(OpenDialog1.FileName);
    try
      h := ini.ReadInteger('1', 'h', 0);
      Edit1.Text := IntToStr(h);
    finally
      ini.Free;
    end;
  end;
end;

procedure TMainForm.Button3Click(Sender: TObject);
var ini: TIniFile; str: string; c: integer;
begin
  str := Edit1.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit1.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  if SaveDialog1.Execute then
  begin
    ini := TIniFile.Create(SaveDialog1.FileName);
    ini.WriteInteger('1', 'h', StrToInt(str));
  end;
end;

end.
