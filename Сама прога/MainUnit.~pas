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
    Edit2: TEdit;
    Edit3: TEdit;
    Button4: TButton;
    Button5: TButton;
    N2: TMenuItem;
    v1: TMenuItem;
    procedure h1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure v1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    h, V, al: integer;

    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses ChildUnit, IniFiles, ChildUnit2;

{$R *.dfm}

//-----------------Создание первого графика-------------------------------------

procedure TMainForm.h1Click(Sender: TObject);
begin
  ChildForm := TChildForm.Create(Self);
end;

//-----------------Считывание данных для первого графика------------------------

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

//-----------------Считывание данных для первого графика из файла---------------

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

//-----------------Сохранение данных первого графика в файл---------------------

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

//-----------------Создание второго рисунка-------------------------------------

procedure TMainForm.v1Click(Sender: TObject);
begin
  ChildForm2 := TChildForm2.Create(Self);
end;

//-----------------Считывание данных для второго рисунка------------------------

procedure TMainForm.Button4Click(Sender: TObject);
var str: string; c: integer;
begin
  str := Edit2.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit2.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  V := StrToInt(str);

  str := Edit3.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit3.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  al := StrToInt(str);
end;

end.
