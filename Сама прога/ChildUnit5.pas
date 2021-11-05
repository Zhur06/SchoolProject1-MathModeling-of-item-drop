unit ChildUnit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  Arr = array of array [1..4] of real;                                          //1 - скорость по x 2 - скорость по y 3 - координата x 4 - координата y

  TChildForm5 = class(TForm)
    PaintBox1: TPaintBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PaintBox1Paint(Sender: TObject);
  private
    { Private declarations }
  public
    t: integer;
    A: Array of Arr;
    { Public declarations }
  end;

var
  ChildForm5: TChildForm5;

implementation

uses MainUnit, Math;

{$R *.dfm}

procedure TChildForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.CF5 := MainForm.CF5 - 1;
  Action := caFree;
end;

//------------------------------------------------------------------------------

procedure TChildForm5.PaintBox1Paint(Sender: TObject);
var counter, j2: integer; maxx, maxy, Gmaxx, Gmaxy: real;
begin
PatBlt(ChildForm5.PaintBox1.Canvas.Handle, 0, 0, ChildForm5.ClientWidth, ChildForm5.ClientHeight, WHITENESS);

SetLength(A, length(MainForm.pictureA));

For j2 := 0 to length(MainForm.pictureA) - 1 do
begin
  SetLength(A[j2], 1);
  A[j2][0][1] := MainForm.pictureA[j2].V * cos(MainForm.pictureA[j2].al * pi/180);  //ѕереводим данную нам скорость на ее проекции на оси плоскости
  A[j2][0][2] := MainForm.pictureA[j2].V * sin(MainForm.pictureA[j2].al * pi/180);


  A[j2][0][3] := 0;
  A[j2][0][4] := 0;

  t := 0;

  Repeat
    SetLength(A[j2], length(A[j2]) + 1);
    t := t + 1;

    if (MainForm.pictureA[j2].k > 0) and (MainForm.pictureA[j2].m > 0) then     //–ассчет координат нового вектора скорости
    begin
      A[j2][t][1] := Round(A[j2][0][1]{Vox}*Power(exp(1){e}, -(MainForm.pictureA[j2].k / MainForm.pictureA[j2].m) * t {-(k/m)t}){ e ^ (-(k/m)t) }){ Vox * e ^ (-(k/m)t) };
      A[j2][t][2] := Round((A[j2][0][2]{Voy}*Power(exp(1){e}, -(MainForm.pictureA[j2].k / MainForm.pictureA[j2].m) * t {-(k/m)t}){ e ^ (-(k/m)t) }){ Voy * e ^ (-(k/m)t) } - ((10 {g} * MainForm.pictureA[j2].m{m})/MainForm.pictureA[j2].k{k}){gm/k}*(1 - Power(exp(1){e}, -((MainForm.pictureA[j2].k{k} / MainForm.pictureA[j2].m{m}){k/m} * t){-(k/m)*t}){ e ^ (-(k/m)t) }) { 1 - e ^ (-(k/m)t) }) { Voy * e ^ (- (k/m)t) - (gm/k)(1 - e ^  };
    end
    else
    begin
      A[j2][t][1] := A[j2][t - 1][1];                                                   //≈сли сопротивление или масса 0
      A[j2][t][2] := A[j2][0][2] - (10 * t);
    end;

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
  if t > 1 then
  With PaintBox1, Canvas do
  begin
    Brush.Color := clWhite;                                                     //”становка цвета кисти
    Pen.Color := MainForm.pictureA[j2].color;
    Pen.Width := 1;
    Pen.Style := psSolid;

    MoveTo(0, Height);                                                          //ѕеремещение начала линии в левый нижний угол

  if MainForm.ScaleCB.Checked then
  begin
    For counter := 0 to t do
    begin
        if Width >= Height then
          LineTo(Round((Width / Gmaxx) * A[j2][counter][3]), Round(Height - ((Width / Gmaxx) * A[j2][counter][4])))
        else
          LineTo(Round((Height / Gmaxx) * A[j2][counter][3]), Round(Height - ((Height / Gmaxx) *  A[j2][counter][4])));
    end;
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
