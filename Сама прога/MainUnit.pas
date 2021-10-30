unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls;

type
  Pic = class
  public
    v: integer;
    al: integer;
    m: integer;
    k: integer;
    color: TColor;
  end;

  TMainForm = class(TForm)
    GroupBox1: TGroupBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Edit2: TEdit;
    Edit3: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button11: TButton;
    GroupBox4: TGroupBox;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Button15: TButton;
    GroupBox6: TGroupBox;
    Button18: TButton;
    Button19: TButton;
    GroupBox8: TGroupBox;
    Button22: TButton;
    Button23: TButton;
    TabSheet4: TTabSheet;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    GroupBox9: TGroupBox;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Button28: TButton;
    GroupBox10: TGroupBox;
    Button29: TButton;
    Button30: TButton;
    GroupBox11: TGroupBox;
    Button31: TButton;
    Button32: TButton;
    procedure v1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Edit15Enter(Sender: TObject);
    procedure Edit15Exit(Sender: TObject);
    procedure Edit16Enter(Sender: TObject);
    procedure Edit16Exit(Sender: TObject);
    procedure Edit17Enter(Sender: TObject);
    procedure Edit17Exit(Sender: TObject);
    procedure Edit18Enter(Sender: TObject);
    procedure Edit18Exit(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Edit19Change(Sender: TObject);
    procedure Edit20Change(Sender: TObject);
    procedure Edit21Change(Sender: TObject);
    procedure Edit19Enter(Sender: TObject);
    procedure Edit19Exit(Sender: TObject);
    procedure Edit20Enter(Sender: TObject);
    procedure Edit20Exit(Sender: TObject);
    procedure Edit21Enter(Sender: TObject);
    procedure Edit21Exit(Sender: TObject);
  private
    { Private declarations }
  public
    pictureA: array of Pic;
    CF2, CF5: integer;
    Sizing: boolean;
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses IniFiles, ChildUnit2, ChildUnit5;

{$R *.dfm}

//################# ������ ������� #############################################

//----------------- �������� ������� ������� -----------------------------------

procedure TMainForm.v1Click(Sender: TObject);
begin
  CF2 := CF2 + 1;
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

  if CF2 <> 0 then
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

  if CF2 <> 0 then
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

//################# ����� ��� ���������� #######################################

//----------------- �������� ��� ����� � ������ --------------------------------

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

//----------------- ��������� ������ �������� ������� --------------------------

procedure TMainForm.Button11Click(Sender: TObject);
begin
  ChildForm2 := TChildForm2.Create(Self);
  CF2 := CF2 + 1;
end;

//################# ��������� ������ �������� ##################################

//----------------- ���������� ������ ------------------------------------------

procedure TMainForm.Button13Click(Sender: TObject);
var str: string; r, g, b, c: integer;
begin
  str := Edit12.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit12.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  r := StrToInt(str);
  if r > 255 then r := 255;

  str := Edit13.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit13.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  g := StrToInt(str);
  if g > 255 then g := 255;

  str := Edit14.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit14.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  b := StrToInt(str);
  if b > 255 then b := 255;

  if length(pictureA) > 0 then pictureA[length(pictureA) - 1].color := RGB(r, g, b);
end;

//----------------- ������������� ����� ��������� ����� ------------------------

procedure TMainForm.Edit12Change(Sender: TObject);
begin
  Edit19.Text := Edit12.Text;
end;

procedure TMainForm.Edit19Change(Sender: TObject);
begin
  Edit12.Text := Edit19.Text;
end;

procedure TMainForm.Edit13Change(Sender: TObject);
begin
  Edit20.Text := Edit13.Text;
end;

procedure TMainForm.Edit20Change(Sender: TObject);
begin
  Edit13.Text := Edit20.Text;
end;

procedure TMainForm.Edit14Change(Sender: TObject);
begin
  Edit21.Text := Edit14.Text;
end;

procedure TMainForm.Edit21Change(Sender: TObject);
begin
  Edit14.Text := Edit21.Text;
end;

//------------------------------------------------------------------------------

procedure TMainForm.Button17Click(Sender: TObject);
var Max1, Max2: integer;
begin
  Canvas.Font.Size := Canvas.Font.Size + 1;
  //��������� ������ ���� ������ � �.�.

  Max1 := Canvas.TextWidth('������� ������ �� �����') + 4;
  Max2 := Canvas.TextHeight('������� ������ �� �����') + 4;

  //������� ������ ����
  Edit2.Font.Size := Canvas.Font.Size;
  Edit3.Font.Size := Canvas.Font.Size;
  Button4.Font.Size := Canvas.Font.Size;
  Button5.Font.Size := Canvas.Font.Size;
  Button6.Font.Size := Canvas.Font.Size;
  Button11.Font.Size := Canvas.Font.Size;

  Button15.Font.Size := Canvas.Font.Size;
  Edit12.Font.Size := Canvas.Font.Size;
  Edit13.Font.Size := Canvas.Font.Size;
  Edit14.Font.Size := Canvas.Font.Size;

  Edit2.Width := Max1;
  Edit3.Width := Max1;
  Button4.Width := Max1;
  Button5.Width := Max1;
  Button6.Width := Max1;
  Button11.Width := Max1;

  Button15.Width := Max1 - 8;
  Edit12.Width := Max1 - 32;
  Edit13.Width := Max1 - 32;
  Edit14.Width := Max1 - 32;

  Edit2.Height := Max2;
  Edit3.Height := Max2;
  Button4.Height := Max2;
  Button5.Height := Max2;
  Button6.Height := Max2;
  Button11.Height := Max2;

  Button15.Height := Max2;
  Edit12.Height := Max2;
  Edit13.Height := Max2;
  Edit14.Height := Max2;

  //������� ������ � �����
  Edit15.Font.Size := Canvas.Font.Size;
  Edit16.Font.Size := Canvas.Font.Size;
  Edit17.Font.Size := Canvas.Font.Size;
  Edit18.Font.Size := Canvas.Font.Size;
  Button24.Font.Size := Canvas.Font.Size;
  Button25.Font.Size := Canvas.Font.Size;
  Button26.Font.Size := Canvas.Font.Size;
  Button27.Font.Size := Canvas.Font.Size;

  Button28.Font.Size := Canvas.Font.Size;
  Edit19.Font.Size := Canvas.Font.Size;
  Edit20.Font.Size := Canvas.Font.Size;
  Edit21.Font.Size := Canvas.Font.Size;

  Edit15.Width := Max1;
  Edit16.Width := Max1;
  Edit17.Width := Max1;
  Edit18.Width := Max1;
  Button24.Width := Max1;
  Button25.Width := Max1;
  Button26.Width := Max1;
  Button27.Width := Max1;

  Button28.Width := Max1 - 8;
  Edit19.Width := Max1 - 32;
  Edit20.Width := Max1 - 32;
  Edit21.Width := Max1 - 32;

  Edit15.Height := Max2;
  Edit16.Height := Max2;
  Edit17.Height := Max2;
  Edit18.Height := Max2;
  Button24.Height := Max2;
  Button25.Height := Max2;
  Button26.Height := Max2;
  Button27.Height := Max2;

  Button28.Height := Max2;
  Edit19.Height := Max2;
  Edit20.Height := Max2;
  Edit21.Height := Max2;

  //��� ��������
  PageControl1.Width := 24 + Max1;
  GroupBox1.Width := 24 + Max1;
  GroupBox4.Width := 24 + Max1;
  GroupBox6.Width := 24 + Max1;
  GroupBox8.Width := 24 + Max1;
  GroupBox9.Width := 24 + Max1;
  GroupBox10.Width := 24 + Max1;
  GroupBox11.Width := 24 + Max1;
end;

procedure TMainForm.Button16Click(Sender: TObject);
var Max1, Max2: integer;
begin
  Canvas.Font.Size := Canvas.Font.Size - 1;
  //��������� ������ ���� ������ � �.�.

  Max1 := Canvas.TextWidth('������� ������ �� �����') + 4;
  Max2 := Canvas.TextHeight('������� ������ �� �����') + 4;

  //������� ������ ����
  Edit2.Font.Size := Canvas.Font.Size;
  Edit3.Font.Size := Canvas.Font.Size;
  Button4.Font.Size := Canvas.Font.Size;
  Button5.Font.Size := Canvas.Font.Size;
  Button6.Font.Size := Canvas.Font.Size;
  Button11.Font.Size := Canvas.Font.Size;

  Button15.Font.Size := Canvas.Font.Size;
  Edit12.Font.Size := Canvas.Font.Size;
  Edit13.Font.Size := Canvas.Font.Size;
  Edit14.Font.Size := Canvas.Font.Size;

  Edit2.Width := Max1;
  Edit3.Width := Max1;
  Button4.Width := Max1;
  Button5.Width := Max1;
  Button6.Width := Max1;
  Button11.Width := Max1;

  Button15.Width := Max1 - 8;
  Edit12.Width := Max1 - 32;
  Edit13.Width := Max1 - 32;
  Edit14.Width := Max1 - 32;

  Edit2.Height := Max2;
  Edit3.Height := Max2;
  Button4.Height := Max2;
  Button5.Height := Max2;
  Button6.Height := Max2;
  Button11.Height := Max2;

  Button15.Height := Max2;
  Edit12.Height := Max2;
  Edit13.Height := Max2;
  Edit14.Height := Max2;

  //������� ������ � �����
  Edit15.Font.Size := Canvas.Font.Size;
  Edit16.Font.Size := Canvas.Font.Size;
  Edit17.Font.Size := Canvas.Font.Size;
  Edit18.Font.Size := Canvas.Font.Size;
  Button24.Font.Size := Canvas.Font.Size;
  Button25.Font.Size := Canvas.Font.Size;
  Button26.Font.Size := Canvas.Font.Size;
  Button27.Font.Size := Canvas.Font.Size;

  Button28.Font.Size := Canvas.Font.Size;
  Edit19.Font.Size := Canvas.Font.Size;
  Edit20.Font.Size := Canvas.Font.Size;
  Edit21.Font.Size := Canvas.Font.Size;

  Edit15.Width := Max1;
  Edit16.Width := Max1;
  Edit17.Width := Max1;
  Edit18.Width := Max1;
  Button24.Width := Max1;
  Button25.Width := Max1;
  Button26.Width := Max1;
  Button27.Width := Max1;

  Button28.Width := Max1 - 8;
  Edit19.Width := Max1 - 32;
  Edit20.Width := Max1 - 32;
  Edit21.Width := Max1 - 32;

  Edit15.Height := Max2;
  Edit16.Height := Max2;
  Edit17.Height := Max2;
  Edit18.Height := Max2;
  Button24.Height := Max2;
  Button25.Height := Max2;
  Button26.Height := Max2;
  Button27.Height := Max2;

  Button28.Height := Max2;
  Edit19.Height := Max2;
  Edit20.Height := Max2;
  Edit21.Height := Max2;

  //��� ��������
  PageControl1.Width := 24 + Max1;
  GroupBox1.Width := 24 + Max1;
  GroupBox4.Width := 24 + Max1;
  GroupBox6.Width := 24 + Max1;
  GroupBox8.Width := 24 + Max1;
  GroupBox9.Width := 24 + Max1;
  GroupBox10.Width := 24 + Max1;
  GroupBox11.Width := 24 + Max1;
end;

procedure TMainForm.Button22Click(Sender: TObject);
begin
  Sizing := true;

  if CF2 > 0 then
  begin
    PatBlt(ChildForm2.PaintBox1.Canvas.Handle, 0, 0, ChildForm2.ClientWidth, ChildForm2.ClientHeight, WHITENESS);

    ChildForm2.PaintBox1Paint(Self);
  end;

  if CF5 > 0 then
  begin
    PatBlt(ChildForm5.PaintBox1.Canvas.Handle, 0, 0, ChildForm5.ClientWidth, ChildForm5.ClientHeight, WHITENESS);

    ChildForm5.PaintBox1Paint(Self);
  end;
end;

procedure TMainForm.Button23Click(Sender: TObject);
begin
  Sizing := False;

  if CF2 > 0 then
  begin
    PatBlt(ChildForm2.PaintBox1.Canvas.Handle, 0, 0, ChildForm2.ClientWidth, ChildForm2.ClientHeight, WHITENESS);

    ChildForm2.PaintBox1Paint(Self);
  end;

  if CF5 > 0 then
  begin
    PatBlt(ChildForm5.PaintBox1.Canvas.Handle, 0, 0, ChildForm5.ClientWidth, ChildForm5.ClientHeight, WHITENESS);

    ChildForm5.PaintBox1Paint(Self);
  end;
end;

procedure TMainForm.Edit19Enter(Sender: TObject);
begin
  if Edit19.Text = 'You have typed something that was not a number' then Edit19.Text := ''
  else if Edit19.Text = '0' then Edit19.Text := '';
end;

procedure TMainForm.Edit19Exit(Sender: TObject);
begin
  if Edit19.Text = 'You have typed something that was not a number' then Edit19.Text := '0'
  else if Edit19.Text = '' then Edit19.Text := '0';
end;

procedure TMainForm.Edit20Enter(Sender: TObject);
begin
  if Edit20.Text = 'You have typed something that was not a number' then Edit20.Text := ''
  else if Edit20.Text = '0' then Edit20.Text := '';
end;

procedure TMainForm.Edit20Exit(Sender: TObject);
begin
  if Edit20.Text = 'You have typed something that was not a number' then Edit20.Text := '0'
  else if Edit20.Text = '' then Edit20.Text := '0';
end;

procedure TMainForm.Edit21Enter(Sender: TObject);
begin
  if Edit21.Text = 'You have typed something that was not a number' then Edit21.Text := ''
  else if Edit21.Text = '0' then Edit21.Text := '';
end;

procedure TMainForm.Edit21Exit(Sender: TObject);
begin
  if Edit21.Text = 'You have typed something that was not a number' then Edit21.Text := '0'
  else if Edit21.Text = '' then Edit21.Text := '0';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit15Enter(Sender: TObject);
begin
  if Edit15.Text = '������� v' then Edit15.Text := ''
  else if Edit15.Text = 'You have typed something that was not a number' then Edit15.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit15Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit15.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit15.Text := '������� v';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit16Enter(Sender: TObject);
begin
  if Edit16.Text = '������� ���� � ���������' then Edit16.Text := ''
  else if Edit16.Text = 'You have typed something that was not a number' then Edit16.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit16Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit16.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit16.Text := '������� ���� � ���������';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit17Enter(Sender: TObject);
begin
  if Edit17.Text = '������� m' then Edit17.Text := ''
  else if Edit17.Text = 'You have typed something that was not a number' then Edit17.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit17Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit17.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit17.Text := '������� m';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit18Enter(Sender: TObject);
begin
  if Edit18.Text = '������� k �������������' then Edit18.Text := ''
  else if Edit18.Text = 'You have typed something that was not a number' then Edit18.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit18Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit18.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit18.Text := '������� k �������������';
end;

//################# ����� ������� ##############################################

//----------------- �������� ������� -------------------------------------------

procedure TMainForm.Button27Click(Sender: TObject);
begin
  CF5 := CF5 + 1;
  ChildForm5 := TChildForm5.Create(Self);
end;

//----------------- ���������� ������ ��� ������ ������� -----------------------

procedure TMainForm.Button24Click(Sender: TObject);
var str: string; c: integer;
begin
  str := Edit15.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit15.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  SetLength(pictureA, length(pictureA) + 1);
  pictureA[length(pictureA) - 1] := Pic.Create;
  pictureA[length(pictureA) - 1].V := StrToInt(str);

  str := Edit16.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit16.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  pictureA[length(pictureA) - 1].al := StrToInt(str);

  str := Edit17.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit17.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  pictureA[length(pictureA) - 1].m := StrToInt(str);

  str := Edit18.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit18.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  pictureA[length(pictureA) - 1].k := StrToInt(str);

  pictureA[length(pictureA) - 1].Color := clBlack;

  if CF5 <> 0 then
    ChildForm5.PaintBox1Paint(Self);
end;

//----------------- ���������� ������ ��� ������� ������� �� ����� -------------

procedure TMainForm.Button26Click(Sender: TObject);
var ini: TIniFile;
begin
  if OpenDialog1.Execute then
  begin
    ini := TIniFile.Create(OpenDialog1.FileName);
    try
      SetLength(pictureA, length(pictureA) + 1);
      pictureA[length(pictureA) - 1] := Pic.Create;
      pictureA[length(pictureA) - 1].v := ini.ReadInteger('2', 'v', 0);
      Edit15.Text := IntToStr(pictureA[length(pictureA) - 1].v);

      pictureA[length(pictureA) - 1].al := ini.ReadInteger('2', 'al', 0);
      Edit16.Text := IntToStr(pictureA[length(pictureA) - 1].al);

      pictureA[length(pictureA) - 1].m := ini.ReadInteger('2', 'm', 0);
      Edit17.Text := IntToStr(pictureA[length(pictureA) - 1].m);

      pictureA[length(pictureA) - 1].k := ini.ReadInteger('2', 'k', 0);
      Edit18.Text := IntToStr(pictureA[length(pictureA) - 1].k);
    finally
      ini.Free;
    end;
  end;

  if CF2 <> 0 then
    ChildForm2.PaintBox1Paint(Self);
end;

//----------------- ���������� ������ ������� ������� � ���� -------------------

procedure TMainForm.Button25Click(Sender: TObject);
var ini: TIniFile; strV, strAl, strM, strK: string; c: integer;
begin
  strV := Edit15.Text;                                                           //�������� ��� � ���� ��� ����� �������� ������������ ���� �����
  for c:=1 to length(strV) do
  begin
    if not (strV[c] in ['0'..'9']) then
    begin
      Edit15.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  strAl := Edit16.Text;                                                          //�������� ��� � ���� ��� ����� ���� ������������ ���� �����
  for c:=1 to length(strAl) do
  begin
    if not (strAl[c] in ['0'..'9']) then
    begin
      Edit16.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  strM := Edit17.Text;                                                          //�������� ��� � ���� ��� ����� ���� ������������ ���� �����
  for c:=1 to length(strM) do
  begin
    if not (strM[c] in ['0'..'9']) then
    begin
      Edit17.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  strK := Edit18.Text;                                                          //�������� ��� � ���� ��� ����� ���� ������������ ���� �����
  for c:=1 to length(strK) do
  begin
    if not (strK[c] in ['0'..'9']) then
    begin
      Edit18.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  if SaveDialog1.Execute then                                                   //������� �������� � ����
  begin
    ini := TIniFile.Create(SaveDialog1.FileName);
    ini.WriteInteger('2', 'v', StrToInt(strV));
    ini.WriteInteger('2', 'al', StrToInt(strAl));
    ini.WriteInteger('2', 'm', StrToInt(strM));
    ini.WriteInteger('2', 'k', StrToInt(strK));
  end;
end;

end.
