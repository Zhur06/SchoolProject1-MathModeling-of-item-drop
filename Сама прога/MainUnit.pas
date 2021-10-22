unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls;

type
  Col = class
  public
    h, g: integer;
    color: TColor;
  end;

  Pic = class
  public
    v: integer;
    al: integer;
    color: TColor;
  end;

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
    N3: TMenuItem;
    h2: TMenuItem;
    hg2: TMenuItem;
    v2: TMenuItem;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    PopupMenu1: TPopupMenu;
    GroupBox2: TGroupBox;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button13: TButton;
    GroupBox3: TGroupBox;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Button14: TButton;
    GroupBox4: TGroupBox;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Button15: TButton;
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
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure h2Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
  private
    { Private declarations }
  public
    //g: Array of integer;
    hA: Array of Col;
    pictureA: array of Pic;
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses ChildUnit, IniFiles, ChildUnit2, ChildUnit3, ChildUnit4;

{$R *.dfm}

//################# ������ ������ ##############################################

//----------------- �������� ������� ������� -----------------------------------

procedure TMainForm.h1Click(Sender: TObject);
begin
  ChildForm := TChildForm.Create(Self);
end;

//----------------- ���������� ������ ��� ������� ������� ----------------------

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

  SetLength(hA, length(hA) + 1);
  hA[Length(hA) - 1] := Col.Create;

  hA[length(hA) - 1].h := StrToInt(str);
  hA[length(hA) - 1].g := 10;
  hA[length(hA) - 1].color := clBlack;

  if Assigned(ChildForm) then
    ChildForm.PaintBox1Paint(Self);
end;

//----------------- ���������� ������ ��� ������� ������� �� ����� -------------

procedure TMainForm.Button1Click(Sender: TObject);
var ini: TIniFile;
begin
  if OpenDialog1.Execute then
  begin
    ini := TIniFile.Create(OpenDialog1.FileName);
    try
      SetLength(hA, length(hA) + 1);
      hA[Length(hA) - 1] := Col.Create;
      hA[length(hA) - 1].h := ini.ReadInteger('1', 'h', 0);
      hA[length(hA) - 1].color := clBlack;
      Edit1.Text := IntToStr(hA[length(hA) - 1].h);
    finally
      ini.Free;
    end;
  end;
  if Assigned(ChildForm) then
    ChildForm.PaintBox1Paint(Self);
end;

//----------------- ���������� ������ ������� ������� � ���� -------------------

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

//################# ������ ������ ##############################################

//----------------- �������� ������� ������� -----------------------------------

procedure TMainForm.v1Click(Sender: TObject);
begin
  ChildForm2 := TChildForm2.Create(Self);
end;

//----------------- ���������� ������ ��� ������� ������� ----------------------

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
  SetLength(pictureA, length(pictureA) + 1);
  pictureA[length(pictureA) - 1] := Pic.Create;
  pictureA[length(pictureA) - 1].V := StrToInt(str);

  str := Edit3.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit3.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  pictureA[length(pictureA) - 1].al := StrToInt(str);
  pictureA[length(pictureA) - 1].Color := clBlack;

  if Assigned(ChildForm2) then
    ChildForm2.PaintBox1Paint(Self);
end;

//----------------- ���������� ������ ��� ������� ������� �� ����� -------------

procedure TMainForm.Button6Click(Sender: TObject);
var ini: TIniFile;
begin
  if OpenDialog1.Execute then
  begin
    ini := TIniFile.Create(OpenDialog1.FileName);
    try
      SetLength(pictureA, length(pictureA) + 1);
      pictureA[length(pictureA) - 1] := Pic.Create;
      pictureA[length(pictureA) - 1].v := ini.ReadInteger('2', 'v', 0);
      Edit2.Text := IntToStr(pictureA[length(pictureA) - 1].v);

      pictureA[length(pictureA) - 1].al := ini.ReadInteger('2', 'al', 0);
      Edit3.Text := IntToStr(pictureA[length(pictureA) - 1].al);
    finally
      ini.Free;
    end;
  end;

  if Assigned(ChildForm2) then
    ChildForm2.PaintBox1Paint(Self);
end;

//----------------- ���������� ������ ������� ������� � ���� -------------------

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

//################# ������ ������ ##############################################

//----------------- �������� �������� ������� ----------------------------------

procedure TMainForm.hg1Click(Sender: TObject);
begin
  ChildForm3 := TChildForm3.Create(Self);
end;

//----------------- ���������� ������ ��� �������� ������� ---------------------

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
  SetLength(hA, length(hA) + 1);
  hA[Length(hA) - 1] := Col.Create;

  hA[length(hA) - 1].h := StrToInt(str);

  str := Edit5.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit5.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  hA[length(hA) - 1].g := StrToInt(str);

  if Assigned(ChildForm3) then
    ChildForm3.PaintBox1Paint(Self);
end;

//----------------- ���������� ������ ��� �������� ������� �� ����� ------------

procedure TMainForm.Button9Click(Sender: TObject);
var ini: TIniFile;
begin
  if OpenDialog1.Execute then
  begin
    ini := TIniFile.Create(OpenDialog1.FileName);
    try
      SetLength(hA, length(hA) + 1);
      hA[length(hA) - 1].h := ini.ReadInteger('2', 'h', 0);
      Edit4.Text := IntToStr(hA[length(hA) - 1].h);

      hA[length(hA) - 1].g := ini.ReadInteger('2', 'g', 0);
      Edit5.Text := IntToStr(hA[length(hA) - 1].g);
    finally
      ini.Free;
    end;
  end;
  if Assigned(ChildForm3) then
    ChildForm3.PaintBox1Paint(Self);
end;

//----------------- ���������� ������ �������� ������� � ���� ------------------

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

//################# ����� ��� ���������� #######################################

//----------------- �������� ��� ����� � ������ --------------------------------

procedure TMainForm.Edit1Enter(Sender: TObject);
begin
  if Edit1.Text = '������� h' then Edit1.Text := ''
  else if Edit1.Text = 'You have typed something that was not a number' then Edit1.Text := '';
end;

//------------------------------------------------------------------------------


procedure TMainForm.Edit1Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit1.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit1.Text := '������� h';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit2Enter(Sender: TObject);
begin
  if Edit2.Text = '������� v' then Edit2.Text := ''
  else if Edit2.Text = 'You have typed something that was not a number' then Edit2.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit2Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit2.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit2.Text := '������� v';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit3Enter(Sender: TObject);
begin
  if Edit3.Text = '������� ���� � ���������' then Edit3.Text := ''
  else if Edit3.Text = 'You have typed something that was not a number' then Edit3.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit3Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit3.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit3.Text := '������� ���� � ���������';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit4Enter(Sender: TObject);
begin
  if Edit4.Text = '������� h' then Edit4.Text := ''
  else if Edit4.Text = 'You have typed something that was not a number' then Edit4.Text := '';
end;

//------------------------------------------------------------------------------


procedure TMainForm.Edit4Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit4.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit4.Text := '������� h';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit5Enter(Sender: TObject);
begin
  if Edit5.Text = '������� g' then Edit5.Text := ''
  else if Edit5.Text = 'You have typed something that was not a number' then Edit5.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit5Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit5.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit5.Text := '������� g';
end;

//----------------- ��������� ������ �������� ������� --------------------------

procedure TMainForm.h2Click(Sender: TObject);
begin
  ChildForm4 := TChildForm4.Create(Self);
end;

procedure TMainForm.Button10Click(Sender: TObject);
begin
  ChildForm := TChildForm.Create(Self);
end;

procedure TMainForm.Button11Click(Sender: TObject);
begin
  ChildForm2 := TChildForm2.Create(Self);
end;

procedure TMainForm.Button12Click(Sender: TObject);
begin
  ChildForm3 := TChildForm3.Create(Self);
end;

//################# ��������� ������ �������� ##################################

//----------------- ���������� ������ ------------------------------------------

procedure TMainForm.Button13Click(Sender: TObject);
var str: string; r, g, b, c: integer;
begin
  str := Edit6.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit6.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  r := StrToInt(str);

  str := Edit7.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit7.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  g := StrToInt(str);

  str := Edit8.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit8.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  b := StrToInt(str);

  if length(hA) > 0 then hA[length(hA) - 1].color := RGB(r, g, b);
  if length(pictureA) > 0 then pictureA[length(pictureA) - 1].color := RGB(r, g, b);
end;

//----------------- ������������� ����� ��������� ����� ------------------------

procedure TMainForm.Edit6Change(Sender: TObject);
begin
  Edit12.Text := Edit6.Text;
  Edit9.Text := Edit6.Text;
end;


procedure TMainForm.Edit12Change(Sender: TObject);
begin
  Edit6.Text := Edit12.Text;
  Edit9.Text := Edit12.Text;
end;

procedure TMainForm.Edit9Change(Sender: TObject);
begin
  Edit12.Text := Edit9.Text;
  Edit6.Text := Edit9.Text;
end;



procedure TMainForm.Edit7Change(Sender: TObject);
begin
  Edit13.Text := Edit7.Text;
  Edit10.Text := Edit7.Text;
end;

procedure TMainForm.Edit13Change(Sender: TObject);
begin
  Edit7.Text := Edit13.Text;
  Edit10.Text := Edit13.Text;
end;


procedure TMainForm.Edit10Change(Sender: TObject);
begin
  Edit13.Text := Edit10.Text;
  Edit7.Text := Edit10.Text;
end;

procedure TMainForm.Edit8Change(Sender: TObject);
begin
  Edit14.Text := Edit8.Text;
  Edit11.Text := Edit8.Text;
end;

procedure TMainForm.Edit14Change(Sender: TObject);
begin
  Edit8.Text := Edit14.Text;
  Edit11.Text := Edit14.Text;
end;

procedure TMainForm.Edit11Change(Sender: TObject);
begin
  Edit14.Text := Edit11.Text;
  Edit8.Text := Edit11.Text;
end;

//------------------------------------------------------------------------------

end.
