unit ChildUnit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  Arr = array of array [1..4] of real;                                          //1 - ???????? ?? x 2 - ???????? ?? y 3 - ?????????? x 4 - ?????????? y  5 - ?????

  TChildForm2 = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function MathOfNoAtmosfereFlight(var maxx, maxy, Gmaxx, Gmaxy, t: real; j2, width: integer; var maxCounter: integer): Arr;
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

//################# ???????? ###################################################

function TChildForm2.MathOfNoAtmosfereFlight(var maxx, maxy, Gmaxx, Gmaxy, t: real; j2, width: integer; var maxCounter: integer): Arr;
var counter: integer; t0: real;
begin
  SetLength(Result, 1);
  Result[0][1] := MainForm.pictureA[j2].V * cos(MainForm.pictureA[j2].al * pi/180);                            //????????? ?????? ??? ???????? ?? ?? ???????? ?? ??? ?????????
  Result[0][2] := MainForm.pictureA[j2].V * sin(MainForm.pictureA[j2].al * pi/180);

  t0 := (Result[0][2]*2)/10;

  Result[0][3] := 0;
  Result[0][4] := 0;

  t := 0;
  counter := 0;

  Repeat
    SetLength(Result, length(Result) + 1);
    counter := counter + 1;
    if MainForm.ScaleCB.Checked then t := t + (t0 / width)
    else t := counter;
    //Result[counter][5] := t;

    Result[counter][1] := Result[counter - 1][1];                                                   //??????? ????????? ?????? ??????? ????????
    Result[counter][2] := Result[0][2] - (10 * t);

    Result[counter][3] := Result[0][1] * t;                                     //??????? ????????? ????
    Result[counter][4] := Result[0][2] * t - 5 * Power(t, 2) ;
  Until Result[counter][4] <= 0;

  maxCounter := counter;

  For counter := 0 to maxCounter do                                                      //?????????? ???????????? ???????? x ? y
  begin
    if Result[counter][3] > maxx then
      maxx := Result[counter][3];
    if Result[counter][4] > maxy then
      maxy := Result[counter][4];
  end;


  if maxx > Gmaxx then
    Gmaxx := maxx;
  if maxy > Gmaxy then
    Gmaxy := maxy;
end;

//-------------------------?????????--------------------------------------------

procedure TChildForm2.PaintBox1Paint(Sender: TObject);
var counter, j2, maxCounter: integer; maxx, maxy, Gmaxx, Gmaxy: real; A: Array of Arr;
begin
SetLength(A, length(MainForm.pictureA));

For j2 := 0 to length(MainForm.pictureA) - 1 do
  A[j2] := MathOfNoAtmosfereFlight(maxx, maxy, Gmaxx, Gmaxy, t, j2, PaintBox1.Width, maxCounter);
PatBlt(ChildForm2.PaintBox1.Canvas.Handle, 0, 0, ChildForm2.ClientWidth, ChildForm2.ClientHeight, WHITENESS);
For j2 := 0 to length(MainForm.pictureA) - 1 do
begin
  if t <> 0 then
  With PaintBox1, Canvas do
  begin
    Brush.Color := clWhite;                                                     //????????? ????? ?????
    Pen.Color := MainForm.pictureA[j2].color;
    Pen.Width := 1;
    Pen.Style := psSolid;

    MoveTo(0, Height);                                                          //??????????? ?????? ????? ? ????? ?????? ????
  if MainForm.ScaleCB.Checked then
    For counter := 0 to maxCounter do
    begin
      if Width >= Height then
        LineTo(Round((Width / Gmaxx) * A[j2][counter][3]), Round(Height - ((Width / Gmaxx) * A[j2][counter][4])))
      else
        LineTo(Round((Height / Gmaxx) * A[j2][counter][3]), Round(Height - ((Height / Gmaxx) *  A[j2][counter][4])));
    end
  else
    For counter := 0 to length(A[j2]) - 1 do
    begin
      LineTo(Round(A[j2][counter][3]), Round(Height - A[j2][counter][4]));
    end;
  end;
end;

A := nil;

end;
end.
