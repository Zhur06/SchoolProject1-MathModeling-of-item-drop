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
    color: TColor;
  end;

  Pic5 = class
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
    TabSheet4: TTabSheet;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox6: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ColorDialog1: TColorDialog;
    GroupBox10: TGroupBox;
    Label8: TLabel;
    RunBtn: TButton;
    ColorChooseBtn: TButton;
    Panel1: TPanel;
    ScaleCB: TCheckBox;
    GroupBox4: TGroupBox;
    SaveToFileBtn: TButton;
    ReadFromFileBtn: TButton;
    GroupBox7: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    ClearBtn: TButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    procedure SaveToFileBtnClick(Sender: TObject);
    procedure ReadFromFileBtnClick(Sender: TObject);
    procedure RunBtnClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ColorChooseBtnClick(Sender: TObject);
    procedure ScaleCBClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure RePaint();
    procedure Draw2();
    procedure Draw5();
    procedure ReadFromFile2();
    procedure SaveToFile2();
    procedure ReadFromFile5();
    procedure SaveToFile5();
  public
    pictureA: array of Pic; pictureA5: array of Pic5;
    CF2, CF5: integer;
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

procedure TMainForm.Draw2();
var V, al: integer;
begin
  V := StrToIntDef(Edit2.Text, 0);
  al := StrToIntDef(Edit3.Text, 0);

  if (V <= 0) or (V > 10000000) then begin ShowMessage('Некорректное значение в поле скорости !' + #13 + 'Допустимые значения: от 1 до 10 000 000 м/с'); EXIT; end;
  if (al <= 0) or (al >= 90) then begin ShowMessage('Некорректное значение в поле угла броска !' + #13 + 'Допустимые значения: от 1 до 89 градусов'); EXIT; end;

  SetLength(pictureA, length(pictureA) + 1);
  pictureA[length(pictureA) - 1] := Pic.Create;

  pictureA[length(pictureA) - 1].V := V;
  pictureA[length(pictureA) - 1].al := al;


  pictureA[length(pictureA) - 1].Color := ChoozedColor;

  if CF2 = 0 then
  begin
    ChildForm2 := TChildForm2.Create(Self);                                     //Создание самой формы
    CF2 := CF2 + 1;
  end
  else
  begin
    ChildForm2.PaintBox1Paint(Self);
  end;
end;

//----------------- Считывание данных для второго рисунка из файла -------------

procedure TMainForm.ReadFromFile2();
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

procedure TMainForm.SaveToFile2();
var ini: TIniFile; v, al: integer;
begin
  v := StrToIntDef(Edit2.Text, 0);
  if (V <= 0) or (V > 10000000) then begin ShowMessage('Некорректное значение в поле скорости !' + #13 + 'Допустимые значения: от 1 до 10 000 000 м/с'); EXIT; end;

  al := StrToIntDef(Edit3.Text, 0);
  if (al <= 0) or (al >= 90) then begin ShowMessage('Некорректное значение в поле угла броска !' + #13 + 'Допустимые значения: от 1 до 89 градусов'); EXIT; end;

  if SaveDialog1.Execute then                                                   //Перенос значений в файл
  begin
    ini := TIniFile.Create(SaveDialog1.FileName);
    ini.WriteInteger('2', 'v', v);
    ini.WriteInteger('2', 'al', al);
  end;
end;

//################# ПЯТЫЙ РИСУНОК ##############################################


//----------------- Черчение Рисунка -------------------------------------------

procedure TMainForm.Draw5();
var V, al, m, k: integer;
begin
  V := StrToIntDef(Edit15.Text, 0);
  al := StrToIntDef(Edit16.Text, 0);
  m := StrToIntDef(Edit17.Text, 0);
  k := StrToIntDef(Edit18.Text, 0);

  if (V <= 0) or (V > 10000000) then begin ShowMessage('Некорректное значение в поле скорости !' + #13 + 'Допустимые значения: от 1 до 10 000 000 м/с'); EXIT; end;
  if (al <= 0) or (al >= 90) then begin ShowMessage('Некорректное значение в поле угла броска !' + #13 + 'Допустимые значения: от 1 до 89 градусов'); EXIT; end;
  if m <= 0 then begin ShowMessage('Некорректное значение в поле массы !' + #13 + 'Допустимые значения: от 1 кг'); EXIT; end;
  if k <= 0 then begin ShowMessage('Некорректное значение в поле коэфциента сопротивления !' + #13 + 'Допустимые значения: от 1'); EXIT; end;

  SetLength(pictureA5, length(pictureA5) + 1);
  pictureA5[length(pictureA5) - 1] := Pic5.Create;

  pictureA5[length(pictureA5) - 1].V := V;
  pictureA5[length(pictureA5) - 1].al := al;
  pictureA5[length(pictureA5) - 1].m := m;
  pictureA5[length(pictureA5) - 1].k := k;

  pictureA5[length(pictureA5) - 1].Color := ChoozedColor;

  if CF5 = 0 then
  begin
    CF5 := CF5 + 1;
    ChildForm5 := TChildForm5.Create(Self);
  end
  else
    ChildForm5.PaintBox1Paint(Self);
end;

//----------------- Считывание данных для пятого рисунка из файла --------------

procedure TMainForm.ReadFromFile5();
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

procedure TMainForm.SaveToFile5();
var ini: TIniFile; v, al, m, k: integer;
begin
  v := StrToIntDef(Edit15.Text, 0);
  if (V <= 0) or (V > 10000000) then begin ShowMessage('Некорректное значение в поле скорости !' + #13 + 'Допустимые значения: от 1 до 10 000 000 м/с'); EXIT; end;

  al := StrToIntDef(Edit16.Text, 0);
  if (al <= 0) or (al >= 90) then begin ShowMessage('Некорректное значение в поле угла броска !' + #13 + 'Допустимые значения: от 1 до 89 градусов'); EXIT; end;

  m := StrToIntDef(Edit17.Text, 0);
  k := StrToIntDef(Edit18.Text, 0);

  if m <= 0 then begin ShowMessage('Некорректное значение в поле массы !' + #13 + 'Допустимые значения: от 1 кг'); EXIT; end;
  if k <= 0 then begin ShowMessage('Некорректное значение в поле коэфциента сопротивления !' + #13 + 'Допустимые значения: от 1'); EXIT; end;

  if SaveDialog1.Execute then                                                   //Перенос значений в файл
  begin
    ini := TIniFile.Create(SaveDialog1.FileName);
    ini.WriteInteger('2', 'v', v);
    ini.WriteInteger('2', 'al', al);
    ini.WriteInteger('2', 'm', m);
    ini.WriteInteger('2', 'k', k);
  end;
end;

//----------------- Перерисовка ------------------------------------------------

procedure TMainForm.RePaint();
begin
  if CF2 > 0 then
    ChildForm2.PaintBox1Paint(Self);

  if CF5 > 0 then
    ChildForm5.PaintBox1Paint(Self);
end;

//----------------- Выбор Цвета ------------------------------------------------

procedure TMainForm.ColorChooseBtnClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    ChoozedColor := ColorDialog1.Color;
  Panel1.Color := ChoozedColor;
end;

//----------------- Масштабирование --------------------------------------------

procedure TMainForm.ScaleCBClick(Sender: TObject);
begin
  RePaint();
end;

//----------------- Отрисовка Графиков -----------------------------------------

procedure TMainForm.RunBtnClick(Sender: TObject);
begin
if length(pictureA) >= 9 then
  ShowMessage('Вы начертили 10 или более графиков' + #13 + 'Если у вас не много памяти, то программа может начать чертить некорректно из-за ее недостатка' + #13 + 'Рекомендуется очистить память при помощи кнопки "Стереть все графики"');
case ComboBox1.ItemIndex of
  0: Draw2;
  1: Draw5;
end;
end;

//----------------- Сохранение/Чтение в/из файл(а) -----------------------------

procedure TMainForm.SaveToFileBtnClick(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: SaveToFile2;
    1: SaveToFile5;
  end;
end;

procedure TMainForm.ReadFromFileBtnClick(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: ReadFromFile2;
    1: ReadFromFile5;
  end;
end;

procedure TMainForm.ClearBtnClick(Sender: TObject);
begin
  pictureA := nil;
  pictureA5 := nil;
  RePaint;
end;

end.
