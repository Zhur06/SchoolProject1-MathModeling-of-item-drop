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
    A, A_noAtmosfere: Arr;
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
var counter, j2: integer; maxx, maxy: real;
begin
For j2 := 0 to length(MainForm.pictureA) - 1 do
begin
  SetLength(A, 1);
  SetLength(A_noAtmosfere, 1);
  A[0][1] := MainForm.pictureA[j2].V * cos(MainForm.pictureA[j2].al * pi/180);  //ѕереводим данную нам скорость на ее проекции на оси плоскости
  A[0][2] := MainForm.pictureA[j2].V * sin(MainForm.pictureA[j2].al * pi/180);

  A_noAtmosfere[0][1] := A[0][1];
  A_noAtmosfere[0][2] := A[0][2];

  A[0][3] := 0;
  A[0][4] := 0;

  A_noAtmosfere[0][3] := 0;
  A_noAtmosfere[0][4] := 0;

  t := 0;

  Repeat
    SetLength(A, length(A) + 1);
    SetLength(A_noAtmosfere, length(A));
    t := t + 1;

    if (MainForm.pictureA[j2].k > 0) and (MainForm.pictureA[j2].m > 0) then     //–ассчет координат нового вектора скорости
    begin
      A[t][1] := Round(A[0][1]{Vox}*Power(exp(1){e}, -(MainForm.pictureA[j2].k / MainForm.pictureA[j2].m) * t {-(k/m)t}){ e ^ (-(k/m)t) }){ Vox * e ^ (-(k/m)t) };
      A[t][2] := Round((A[0][2]{Voy}*Power(exp(1){e}, -(MainForm.pictureA[j2].k / MainForm.pictureA[j2].m) * t {-(k/m)t}){ e ^ (-(k/m)t) }){ Voy * e ^ (-(k/m)t) } - ((10 {g} * MainForm.pictureA[j2].m{m})/MainForm.pictureA[j2].k{k}){gm/k}*(1 - Power(exp(1){e}, -((MainForm.pictureA[j2].k{k} / MainForm.pictureA[j2].m{m}){k/m} * t){-(k/m)*t}){ e ^ (-(k/m)t) }) { 1 - e ^ (-(k/m)t) }) { Voy * e ^ (- (k/m)t) - (gm/k)(1 - e ^  };
    end
    else
    begin
      A[t][1] := A[t - 1][1];                                                   //≈сли сопротивление или масса 0
      A[t][2] := A[0][2] - (10 * t);
    end;

    A_noAtmosfere[t][1] := A_noAtmosfere[t - 1][1];
    A_noAtmosfere[t][2] := A_noAtmosfere[0][2] - (10 * t);


    A[t][3] := A[t - 1][3] + A[t][1];                                           //–ассчет координат тела
    A[t][4] := A[t - 1][4] + A[t][2];

    A_noAtmosfere[t][3] := A_noAtmosfere[t - 1][3] + A_noAtmosfere[t][1];
    A_noAtmosfere[t][4] := A_noAtmosfere[t - 1][4] + A_noAtmosfere[t][2];
  Until (A[t][4] <= 0) and (A_noAtmosfere[t][4] <= 0);

  For counter := 0 to t do                                                      //нахождение максимальных значений x и y
  begin
    if A_noAtmosfere[counter][3] > maxx then
      maxx := A_noAtmosfere[counter][3];
    if A_noAtmosfere[counter][4] > maxy then
      maxy := A_noAtmosfere[counter][4];
  end;

//-------------------------ќтрисовка--------------------------------------------

  if t > 1 then
  With PaintBox1, Canvas do
  begin
    Brush.Color := clWhite;                                                     //”становка цвета кисти
    Pen.Color := MainForm.pictureA[j2].color;
    Pen.Width := 1;
    Pen.Style := psSolid;

    MoveTo(0, Height);                                                          //ѕеремещение начала линии в левый нижний угол

  if MainForm.Sizing then
  begin
    For counter := 0 to t do
    begin
        if Width >= Height then
          LineTo(Round((Width / maxx) * A[counter][3]), Round(Height - ((Width / maxx) * A[counter][4])))
        else
          LineTo(Round((Height / maxx) * A[counter][3]), Round(Height - ((Height / maxx) *  A[counter][4])));
    end;
  end
  else
    For counter := 0 to t do
    begin
      LineTo(Round(A[counter][3]), Round(Height - A[counter][4]));
    end;
  end;
end;
end;

end.
