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
    Button1: TButton;
    Button6: TButton;
    TabSheet3: TTabSheet;
    Edit4: TEdit;
    Edit5: TEdit;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    hg1: TMenuItem;
    procedure h1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure v1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure hg1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    h, V, al, g: integer;

    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses ChildUnit, IniFiles, ChildUnit2, ChildUnit3;

{$R *.dfm}

//-----------------�������� ������� �������-------------------------------------

procedure TMainForm.h1Click(Sender: TObject);
begin
  ChildForm := TChildForm.Create(Self);
end;

//-----------------���������� ������ ��� ������� �������------------------------

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

//-----------------���������� ������ ��� ������� ������� �� �����---------------

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

//-----------------���������� ������ ������� ������� � ����---------------------

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

//-----------------�������� ������� �������-------------------------------------

procedure TMainForm.v1Click(Sender: TObject);
begin
  ChildForm2 := TChildForm2.Create(Self);
end;

//-----------------���������� ������ ��� ������� �������------------------------

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

//-----------------���������� ������ ��� ������� ������� �� �����---------------

procedure TMainForm.Button6Click(Sender: TObject);
var ini: TIniFile; //str: string;
begin
  if OpenDialog1.Execute then
  begin
    ini := TIniFile.Create(OpenDialog1.FileName);
    try
      v := ini.ReadInteger('2', 'v', 0);
      Edit2.Text := IntToStr(h);

      al := ini.ReadInteger('2', 'al', 0);
      Edit3.Text := IntToStr(al);
    finally
      ini.Free;
    end;
  end;
end;

//-----------------���������� ������ ������� ������� � ����---------------------

procedure TMainForm.Button5Click(Sender: TObject);
var ini: TIniFile; strV, strAl: string; c: integer;
begin
  strV := Edit2.Text;                                                           //�������� ��� � ���� ��� ����� �������� ������������ ���� �����
  for c:=1 to length(strV) do
  begin
    if not (strV[c] in ['0'..'9']) then
    begin
      Edit2.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  strAl := Edit3.Text;                                                          //�������� ��� � ���� ��� ����� ���� ������������ ���� �����
  for c:=1 to length(strAl) do
  begin
    if not (strAl[c] in ['0'..'9']) then
    begin
      Edit3.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  if SaveDialog1.Execute then                                                   //������� �������� � ����
  begin
    ini := TIniFile.Create(SaveDialog1.FileName);
    ini.WriteInteger('2', 'v', StrToInt(strV));
    ini.WriteInteger('2', 'al', StrToInt(strAl));
  end;
end;

//-----------------�������� �������� �������------------------------------------

procedure TMainForm.hg1Click(Sender: TObject);
begin
  ChildForm3 := TChildForm3.Create(Self);
end;

//-----------------���������� ������ ��� �������� �������-----------------------

procedure TMainForm.Button7Click(Sender: TObject);
var str: string; c: integer;
begin
  str := Edit4.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit4.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  h := StrToInt(str);

  str := Edit5.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit5.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  g := StrToInt(str);
end;

//-----------------���������� ������ ��� �������� ������� �� �����---------------

procedure TMainForm.Button9Click(Sender: TObject);
var ini: TIniFile; //str: string;
begin
  if OpenDialog1.Execute then
  begin
    ini := TIniFile.Create(OpenDialog1.FileName);
    try
      h := ini.ReadInteger('2', 'h', 0);
      Edit4.Text := IntToStr(h);

      g := ini.ReadInteger('2', 'h', 0);
      Edit5.Text := IntToStr(g);
    finally
      ini.Free;
    end;
  end;
end;

//-----------------���������� ������ �������� ������� � ����--------------------

procedure TMainForm.Button8Click(Sender: TObject);
var ini: TIniFile; strH, strG: string; c: integer;
begin
  strH := Edit4.Text;                                                           //�������� ��� � ���� ��� ����� ������ ������������ ���� �����
  for c:=1 to length(strH) do
  begin
    if not (strH[c] in ['0'..'9']) then
    begin
      Edit4.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  strG := Edit5.Text;                                                           //�������� ��� � ���� ��� ����� ��������� ������������ ���� �����
  for c:=1 to length(strG) do
  begin
    if not (strG[c] in ['0'..'9']) then
    begin
      Edit5.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  if SaveDialog1.Execute then                                                   //������� �������� � ����
  begin
    ini := TIniFile.Create(SaveDialog1.FileName);
    ini.WriteInteger('3', 'h', StrToInt(strH));
    ini.WriteInteger('3', 'g', StrToInt(strG));
  end;
end;

end.
