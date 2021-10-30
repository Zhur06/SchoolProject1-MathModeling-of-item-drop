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
    MainForm.CF2 :=  MainForm.CF2 - 1;
end;

procedure TChildForm2.PaintBox1Paint(Sender: TObject);
var counter, j2: integer; maxx, maxy: real;
begin
For j2 := 0 to length(MainForm.pictureA) - 1 do
begin
  SetLength(A, 1);
  A[0][1] := MainForm.pictureA[j2].V * cos(MainForm.pictureA[j2].al * pi/180);                            //ѕереводим данную нам скорость на ее проекции на оси плоскости
  A[0][2] := MainForm.pictureA[j2].V * sin(MainForm.pictureA[j2].al * pi/180);

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
    if A[counter][3] > maxx then
      maxx := A[counter][3];
    if A[counter][4] > maxy then
      maxy := A[counter][4];
  end;

//-------------------------ќтрисовка--------------------------------------------

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
      {if ((Width - maxx) >= (Height - maxy)) then  }
        if Width >= Height then
          LineTo(Round((Width / maxx) * A[counter][3]), Round(Height - ((Width / maxx) * A[counter][4])))
        else
          LineTo(Round((Height / maxx) * A[counter][3]), Round(Height - ((Height / maxx) *  A[counter][4])));
      {else  //uncorrect way
        if Width >= Height then //Uncorrect way
          LineTo(Round((Width / maxy) * A[counter][3]), Round(Height - ((Width / maxy) * A[counter][4])))
        else
          LineTo(Round((Height / maxy) * A[counter][3]), Round((Height - ((Height / maxy) * A[counter][4])))); }
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
