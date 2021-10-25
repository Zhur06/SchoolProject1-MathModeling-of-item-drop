unit ChildUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  Arr = array of array [1..2] of real;

  TChildForm = class(TForm)
    PaintBox1: TPaintBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PaintBox1Paint(Sender: TObject);
    // procedure FormClose(Sender: TObject; var Action: TCloseAction);
   // Function fillArrayOfV(h, g:integer):Arr;
    //procedure PaintBox1Paint(Sender: TObject);
  private
    { Private declarations }
  public
    t: integer;
    A: Arr;
    { Public declarations }
  end;



var
  ChildForm: TChildForm;

implementation

uses MainUnit, IniFiles;

{$R *.dfm}

procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  MainForm.CF :=  MainForm.CF - 1;
end;

procedure TChildForm.PaintBox1Paint(Sender: TObject);
var counter, j1, j2, otstup, otstup2: integer;
begin
  otstup := 20;
  otstup2 := 15;

For j2 := 0 to length(MainForm.hA) - 1 do
begin
  t := 0;
  setlength(A, 1);
  A[t][1] := 0;                                             //1 - скорость
  A[t][2] := 0;                                             //2 - пройтенный путь
  While A[t][2] < MainForm.hA[j2].h do                             //Цикл который увеличивает время на 1 секунду и высчитывает для нее скорость и пройденный путь с условием выхода что пройденный путь стал больше чем начальная высота
  begin
    t := t + 1;                                             //Увеличение времени на секунду

    SetLength(A, length(A) + 1);                            //Увеличение размера массива с данными

    A[t][1] := t * 10;                            //просчет скорости по формуле v = at
    A[t][2] := A[t - 1][2] + A[t][1];  //Просчет пройденного пути  S = S0 + vt
  end;


  if t <> 0 then
  With PaintBox1, canvas do     //Отрисовка этого массива
  begin
    Brush.Color := clWhite;                                                     //Установка цвета кисти
    Pen.Color := MainForm.hA[j2].Color;
    Pen.Width := 1;
    Pen.Style := psSolid;

    MoveTo(0, Height - otstup);                                                 //создание осей и делений на них !!!! выводятся последние значения
    LineTo(Width, Height - otstup);
    MoveTo(otstup, 0);
    LineTo(otstup, Height);

    For j1 := 1 to (Height div otstup2) - 1 do                                  //Вертикальная ось
    begin
      MoveTo(otstup - 5, Height - otstup - (j1*otstup2));
      LineTo(otstup + 5, Height - otstup - (j1*otstup2));

      TextOut(0, Height - otstup - (j1*otstup2), IntToStr(j1 * otstup2));
    end;

    For j1 := 1 to (Width div 10) - 1 do                                        //горизонтальная ось
    begin
      MoveTo(otstup + (j1*otstup2), Height - otstup - 5);
      LineTo(otstup + (j1*otstup2), Height - otstup + 5);

      TextOut(otstup + (j1*otstup2), Height - otstup, IntToStr(Round(j1 / ((Width - otstup) / Round(A[t][1])))));
    end;


    MoveTo(otstup, Height - otstup);                                            //Перемещение начала линии в левый нижний угол

    For counter := 0 to t do
    begin
      LineTo(((Width - otstup) div t) * counter + otstup, Round((Height - otstup) - A[counter][1]));
    end;
end;
end;
end;

end.
