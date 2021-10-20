unit ChildUnit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  Arr = array of array [1..4] of real;                                          //1 - скорость по x 2 - скорость по y 3 - координата x 4 - координата y

  TChildForm2 = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    t: integer;
    A: Arr;
    { Public declarations }
  end;

var
  ChildForm2: TChildForm2;

implementation

uses MainUnit;

{$R *.dfm}

procedure TChildForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TChildForm2.PaintBox1Paint(Sender: TObject);
var counter: integer;
begin
  SetLength(A, 1);
  A[0][1] := MainForm.V * cos(MainForm.al * pi/180);                            //Переводим данную нам скорость на ее проекции на оси плоскости
  A[0][2] := MainForm.V * sin(MainForm.al * pi/180);

  A[0][3] := 0;
  A[0][4] := 0;

  t := 0;

  Repeat
    SetLength(A, length(A) + 1);
    t := t + 1;

    A[t][1] := A[t - 1][1];                                                   //Рассчет координат нового вектора скорости
    A[t][2] := A[0][2] - (10 * t);

    A[t][3] := A[t - 1][3] + A[t][1];                                           //Рассчет координат тела
    A[t][4] := A[t - 1][4] + A[t][2];
  Until A[t][4] <= 0;

//-------------------------Отрисовка--------------------------------------------

  if t <> 0 then
  With PaintBox1, Canvas do
  begin
    Brush.Color := clBlack;                                                     //Установка цвета кисти
    Pen.Color := clBlack;
    Pen.Width := 1;
    Pen.Style := psSolid;

    MoveTo(0, Height);                                                          //Перемещение начала линии в левый нижний угол

    For counter := 0 to t do
    begin
      LineTo(Round(A[counter][3]), Round(Height - A[counter][4]));
    end;
  end;
end;
end.
