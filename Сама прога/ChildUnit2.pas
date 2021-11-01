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
    A: Array of Arr;
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
    MainForm.CF2 :=  MainForm.CF2 - 1;
end;

procedure TChildForm2.PaintBox1Paint(Sender: TObject);
var counter, j2: integer; maxx, maxy, Gmaxx, Gmaxy: real;
begin
SetLength(A, length(MainForm.pictureA));

For j2 := 0 to length(MainForm.pictureA) - 1 do
begin
  SetLength(A[j2], 1);
  A[j2][0][1] := MainForm.pictureA[j2].V * cos(MainForm.pictureA[j2].al * pi/180);                            //ѕереводим данную нам скорость на ее проекции на оси плоскости
  A[j2][0][2] := MainForm.pictureA[j2].V * sin(MainForm.pictureA[j2].al * pi/180);

  A[j2][0][3] := 0;
  A[j2][0][4] := 0;

  t := 0;

  Repeat
    SetLength(A[j2], length(A[j2]) + 1);
    t := t + 1;

    A[j2][t][1] := A[j2][t - 1][1];                                                   //–ассчет координат нового вектора скорости
    A[j2][t][2] := A[j2][0][2] - (10 * t);

    A[j2][t][3] := A[j2][t - 1][3] + A[j2][t][1];                                           //–ассчет координат тела
    A[j2][t][4] := A[j2][t - 1][4] + A[j2][t][2];
  Until A[j2][t][4] <= 0;

  For counter := 0 to t do                                                      //нахождение максимальных значений x и y
  begin
    if A[j2][counter][3] > maxx then
      maxx := A[j2][counter][3];
    if A[j2][counter][4] > maxy then
      maxy := A[j2][counter][4];
  end;

  if maxx > Gmaxx then
    Gmaxx := maxx;
  if maxy > Gmaxy then
    Gmaxy := maxy;
end;

//-------------------------ќтрисовка--------------------------------------------

For j2 := 0 to length(MainForm.pictureA) - 1 do
begin
  if t <> 0 then
  With PaintBox1, Canvas do
  begin
    Brush.Color := clWhite;                                                     //”становка цвета кисти
    Pen.Color := MainForm.pictureA[j2].color;
    Pen.Width := 1;
    Pen.Style := psSolid;

    MoveTo(0, Height);                                                          //ѕеремещение начала линии в левый нижний угол

  if MainForm.Sizing then
    For counter := 0 to t do
    begin
      if Width >= Height then
        LineTo(Round((Width / Gmaxx) * A[j2][counter][3]), Round(Height - ((Width / Gmaxx) * A[j2][counter][4])))
      else
        LineTo(Round((Height / Gmaxx) * A[j2][counter][3]), Round(Height - ((Height / Gmaxx) *  A[j2][counter][4])));
    end
  else
    For counter := 0 to t do
    begin
      LineTo(Round(A[j2][counter][3]), Round(Height - A[j2][counter][4]));
    end;
  end;
end;  
end;
end.
