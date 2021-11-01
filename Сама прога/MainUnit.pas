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
    Button5: TButton;
    Button6: TButton;
    Button11: TButton;
    GroupBox8: TGroupBox;
    Button22: TButton;
    Button23: TButton;
    TabSheet4: TTabSheet;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    GroupBox11: TGroupBox;
    Button31: TButton;
    Button32: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    GroupBox5: TGroupBox;
    GroupBox7: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox6: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox10: TGroupBox;
    ColorDialog1: TColorDialog;
    Button1: TButton;
    Button2: TButton;
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Button11Click(Sender: TObject);
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
    procedure Button26Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    pictureA: array of Pic;
    CF2, CF5: integer;
    Sizing: boolean;
    ChoozedColor: TColor;
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses IniFiles, ChildUnit2, ChildUnit5;

{$R *.dfm}

//----------------- Выбор модели -----------------------------------------------

procedure TMainForm.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: PageControl1.ActivePage := TabSheet2;
    1: PageControl1.ActivePage := TabSheet4;
  end;
end;

//################# ВТОРОЙ РИСУНОК #############################################


//----------------- Черчение рисунка -------------------------------------------

procedure TMainForm.Button11Click(Sender: TObject);
var str: string; c: integer;
begin
  if CF2 = 0 then                                                               //Создание второй формы и отрисовка в ней графика
  begin
    str := Edit2.Text;                                                          //Считывание данных
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
    pictureA[length(pictureA) - 1].Color := ChoozedColor;

    ChildForm2 := TChildForm2.Create(Self);                                     //Создание самой формы
    CF2 := CF2 + 1;
  end
  else                                                                          //То же самое в существующей
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
    pictureA[length(pictureA) - 1].Color := ChoozedColor;

    ChildForm2.PaintBox1Paint(Self);
  end;
end;

//----------------- Считывание данных для второго рисунка из файла -------------

procedure TMainForm.Button6Click(Sender: TObject);
var ini: TIniFile;
begin
  if OpenDialog1.Execute then
  begin
    ini := TIniFile.Create(OpenDialog1.FileName);
    try
      Edit2.Text := IntToStr(ini.ReadInteger('2', 'v', 0));
      Edit3.Text := IntToStr(ini.ReadInteger('2', 'al', 0));
    finally
      ini.Free;
    end;
  end;
end;

//----------------- Сохранение данных второго рисунка в файл -------------------

procedure TMainForm.Button5Click(Sender: TObject);
var ini: TIniFile; strV, strAl: string; c: integer;
begin
  strV := Edit2.Text;                                                           //Проверка что в поле для ввода скорости пользователь ввел число
  for c:=1 to length(strV) do
  begin
    if not (strV[c] in ['0'..'9']) then
    begin
      Edit2.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  strAl := Edit3.Text;                                                          //Проверка что в поле для ввода угла пользователь ввел число
  for c:=1 to length(strAl) do
  begin
    if not (strAl[c] in ['0'..'9']) then
    begin
      Edit3.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  if SaveDialog1.Execute then                                                   //Перенос значений в файл
  begin
    ini := TIniFile.Create(SaveDialog1.FileName);
    ini.WriteInteger('2', 'v', StrToInt(strV));
    ini.WriteInteger('2', 'al', StrToInt(strAl));
  end;
end;

//################# ПЯТЫЙ РИСУНОК ##############################################


//----------------- Черчение Рисунка -------------------------------------------

procedure TMainForm.Button27Click(Sender: TObject);
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

  pictureA[length(pictureA) - 1].Color := ChoozedColor;

  if CF5 = 0 then
  begin
    CF5 := CF5 + 1;
    ChildForm5 := TChildForm5.Create(Self);
  end
  else
    ChildForm5.PaintBox1Paint(Self);
end;

//----------------- Считывание данных для пятого рисунка из файла --------------

procedure TMainForm.Button26Click(Sender: TObject);
var ini: TIniFile;
begin
  if OpenDialog1.Execute then
  begin
    ini := TIniFile.Create(OpenDialog1.FileName);
    try
      Edit15.Text := IntToStr(ini.ReadInteger('2', 'v', 0));
      Edit16.Text := IntToStr(ini.ReadInteger('2', 'al', 0));
      Edit17.Text := IntToStr(ini.ReadInteger('2', 'm', 0));
      Edit18.Text := IntToStr(ini.ReadInteger('2', 'k', 0));
    finally
      ini.Free;
    end;
  end;
end;

//----------------- Сохранение данных пятого рисунка в файл --------------------

procedure TMainForm.Button25Click(Sender: TObject);
var ini: TIniFile; strV, strAl, strM, strK: string; c: integer;
begin
  strV := Edit15.Text;                                                           //Проверка что в поле для ввода скорости пользователь ввел число
  for c:=1 to length(strV) do
  begin
    if not (strV[c] in ['0'..'9']) then
    begin
      Edit15.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  strAl := Edit16.Text;                                                          //Проверка что в поле для ввода угла пользователь ввел число
  for c:=1 to length(strAl) do
  begin
    if not (strAl[c] in ['0'..'9']) then
    begin
      Edit16.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  strM := Edit17.Text;                                                          //Проверка что в поле для ввода угла пользователь ввел число
  for c:=1 to length(strM) do
  begin
    if not (strM[c] in ['0'..'9']) then
    begin
      Edit17.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  strK := Edit18.Text;                                                          //Проверка что в поле для ввода угла пользователь ввел число
  for c:=1 to length(strK) do
  begin
    if not (strK[c] in ['0'..'9']) then
    begin
      Edit18.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;

  if SaveDialog1.Execute then                                                   //Перенос значений в файл
  begin
    ini := TIniFile.Create(SaveDialog1.FileName);
    ini.WriteInteger('2', 'v', StrToInt(strV));
    ini.WriteInteger('2', 'al', StrToInt(strAl));
    ini.WriteInteger('2', 'm', StrToInt(strM));
    ini.WriteInteger('2', 'k', StrToInt(strK));
  end;
end;

//################# ШТУКИ ДЛЯ ИНТЕРФЕЙСА #######################################

//----------------- Стирание при входе в ячейку --------------------------------

procedure TMainForm.Edit2Enter(Sender: TObject);
begin
  if Edit2.Text = 'Введите v' then Edit2.Text := ''
  else if Edit2.Text = 'You have typed something that was not a number' then Edit2.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit2Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit2.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit2.Text := 'Введите v';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit3Enter(Sender: TObject);
begin
  if Edit3.Text = 'Введите угол к горизонту' then Edit3.Text := ''
  else if Edit3.Text = 'You have typed something that was not a number' then Edit3.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit3Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit3.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit3.Text := 'Введите угол к горизонту';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit15Enter(Sender: TObject);
begin
  if Edit15.Text = 'Введите v' then Edit15.Text := ''
  else if Edit15.Text = 'You have typed something that was not a number' then Edit15.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit15Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit15.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit15.Text := 'Введите v';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit16Enter(Sender: TObject);
begin
  if Edit16.Text = 'Введите угол к горизонту' then Edit16.Text := ''
  else if Edit16.Text = 'You have typed something that was not a number' then Edit16.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit16Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit16.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit16.Text := 'Введите угол к горизонту';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit17Enter(Sender: TObject);
begin
  if Edit17.Text = 'Введите m' then Edit17.Text := ''
  else if Edit17.Text = 'You have typed something that was not a number' then Edit17.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit17Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit17.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit17.Text := 'Введите m';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit18Enter(Sender: TObject);
begin
  if Edit18.Text = 'Введите k сопротивления' then Edit18.Text := ''
  else if Edit18.Text = 'You have typed something that was not a number' then Edit18.Text := '';
end;

//------------------------------------------------------------------------------

procedure TMainForm.Edit18Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit18.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit18.Text := 'Введите k сопротивления';
end;

//################# МАСШТАБИРОВАНИЕ ############################################

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

//################# ВЫБОР ЦВЕТА ################################################

procedure TMainForm.Button1Click(Sender: TObject);
begin
if ColorDialog1.Execute then
  ChoozedColor := ColorDialog1.Color;
end;

end.
