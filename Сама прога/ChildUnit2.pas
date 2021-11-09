unit ChildUnit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  PpointsOfGraphic = ^pointsOfGraphic;

  pointsOfGraphic = record
    x, y, Vx, Vy: real;

    nextPoint: PpointsOfGraphic;
  end;

  TChildForm2 = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function MathOfNoAtmosfereFlight(var maxx, maxy, Gmaxx, Gmaxy, t: real; j2, width: integer; var maxCounter: integer): PpointsOfGraphic;
  private
    { Private declarations }
  public
    t: real;
    //A: array of Arr;
    { Public declarations }
  end;

var
  ChildForm2: TChildForm2;

implementation

uses MainUnit, Math;

{$R *.dfm}

procedure TChildForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
    MainForm.CF2 :=  MainForm.CF2 - 1;
end;

//################# РАССЧЕТЫ ###################################################

function TChildForm2.MathOfNoAtmosfereFlight(var maxx, maxy, Gmaxx, Gmaxy, t: real; j2, width: integer; var maxCounter: integer): PpointsOfGraphic;
var counter: integer; t0: real; CurrentL, Old: PpointsOfGraphic;
begin
  Result^.Vx := MainForm.pictureA[j2].V * cos(MainForm.pictureA[j2].al * pi/180);                            //Переводим данную нам скорость на ее проекции на оси плоскости
  Result^.Vy := MainForm.pictureA[j2].V * sin(MainForm.pictureA[j2].al * pi/180);

  t0 := (Result.Vy*2)/10;

  Result^.x := 0;
  Result^.y := 0;

  t := 0;
  counter := 0;

  Old := Result;

  Repeat
    New(CurrentL);
    Old^.nextPoint := CurrentL;

    counter := counter + 1;
    if MainForm.ScaleCB.Checked then t := t + (t0 / width)
    else t := counter;

    CurrentL^.Vx := Result^.Vx;                                                   //Рассчет координат нового вектора скорости
    CurrentL^.Vy := Result^.Vy - (10 * t);

    CurrentL^.x := Result^.Vx * t;                                     //Рассчет координат тела
    CurrentL^.y := Result^.Vy * t - 5 * Power(t, 2) ;

    Old := CurrentL;
  Until CurrentL^.y <= 0;

  maxCounter := counter;

  CurrentL := Result;
  Old := Result;

  Repeat                                                      //нахождение максимальных значений x и y
    CurrentL := CurrentL^.nextPoint;

    if CurrentL^.x > maxx then
      maxx := CurrentL^.x;
    if CurrentL^.y > maxy then
      maxy := CurrentL^.y;
  Until CurrentL^.nextPoint = nil;


  if maxx > Gmaxx then
    Gmaxx := maxx;
  if maxy > Gmaxy then
    Gmaxy := maxy;
end;

//-------------------------Отрисовка--------------------------------------------

procedure TChildForm2.PaintBox1Paint(Sender: TObject);
var counter, j2, maxCounter: integer; maxx, maxy, Gmaxx, Gmaxy: real; A: Array of PpointsOfGraphic; Current, Next: PpointsOfGraphic;
begin

SetLength(A, length(MainForm.pictureA));

For j2 := 0 to length(MainForm.pictureA) - 1 do
begin
  New(A[j2]);
  A[j2] := MathOfNoAtmosfereFlight(maxx, maxy, Gmaxx, Gmaxy, t, j2, PaintBox1.Width, maxCounter);
end;

PatBlt(ChildForm2.PaintBox1.Canvas.Handle, 0, 0, ChildForm2.ClientWidth, ChildForm2.ClientHeight, WHITENESS);
For j2 := 0 to length(MainForm.pictureA) - 1 do
begin
  if t <> 0 then
  With PaintBox1, Canvas do
  begin
    Brush.Color := clWhite;                                                     //Установка цвета кисти
    Pen.Color := MainForm.pictureA[j2].color;
    Pen.Width := 1;
    Pen.Style := psSolid;

    MoveTo(0, Height);                                                          //Перемещение начала линии в левый нижний угол

    Current := A[j2];
  if MainForm.ScaleCB.Checked then
    For counter := 0 to maxCounter do
    begin
      if Width >= Height then
        LineTo(Round((Width / Gmaxx) * Current^.x), Round(Height - ((Width / Gmaxx) * Current^.y)))
      else
        LineTo(Round((Height / Gmaxx) * Current^.x), Round(Height - ((Height / Gmaxx) *  Current^.y)));

      Current := Current.nextPoint;
    end
  else
    For counter := 0 to maxCounter do
    begin
      LineTo(Round(Current^.x), Round(Height - Current^.y));
      Current := Current^.nextPoint;
    end;
  end;
end;

For counter := 0 to length(A) - 1 do
begin
if not (A[counter]^.nextPoint = nil) then
begin
  Current := A[counter]^.nextPoint;

  Dispose(A[counter]);
  A[counter] := nil;

  While not (Current^.nextPoint = nil) do
  begin
    Next := Current^.nextPoint;
    Dispose(Current);
    Current := Next;
  end;

  Dispose(Current);
  Next := nil;
  //A[counter] := nil;
end
else
begin
  Dispose(A[counter]);
  A[counter] := nil;
end;

end;
end;
end.
