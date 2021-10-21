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
var counter: integer; maxx, maxy: real;
begin
  SetLength(A, 1);
  A[0][1] := MainForm.V * cos(MainForm.al * pi/180);                            //ѕереводим данную нам скорость на ее проекции на оси плоскости
  A[0][2] := MainForm.V * sin(MainForm.al * pi/180);

  A[0][3] := 0;
  A[0][4] := 0;

  t := 0;

  Repeat
    SetLength(A, length(A) + 1);
    t := t + 1;

    A[t][1] := A[t - 1][1];                                                   //–ассчет координат нового вектора скорости
    A[t][2] := A[0][2] - (10 * t);

    A[t][3] := A[t - 1][3] + A[t][1];                                           //–ассчет координат тела
    A[t][4] := A[t - 1][4] + A[t][2];
  Until A[t][4] <= 0;

  For counter := 0 to t do                                                      //нахождение максимальных значений x и y
  begin
    if A[counter][3] > maxx then maxx := A[counter][3];
    if A[counter][4] > maxx then maxx := A[counter][4];
  end;

//-------------------------ќтрисовка--------------------------------------------

  if t <> 0 then
  With PaintBox1, Canvas do
  begin
    Brush.Color := clBlack;                                                     //”становка цвета кисти
    Pen.Color := clBlack;
    Pen.Width := 1;
    Pen.Style := psSolid;

    MoveTo(0, Height);                                                          //ѕеремещение начала линии в левый нижний угол

    For counter := 0 to t do
    begin
      if maxx >= maxy then
        LineTo({(Width div Round(maxx)) * }Round(A[counter][3]), {(Height div Round(maxx)) * }Round(Height - A[counter][4]))
      else
        LineTo({(Width div Round(maxy)) * }Round(A[counter][3]), {(Height div Round(maxy)) * }Round(Height - A[counter][4]));
    end;
  end;
end;
end.
