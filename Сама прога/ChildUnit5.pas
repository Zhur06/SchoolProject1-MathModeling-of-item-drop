unit ChildUnit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ChildUnit2;

type
  TChildForm5 = class(TForm)
    PaintBox1: TPaintBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PaintBox1Paint(Sender: TObject);
  private
    function MathOfAtmosfereFlight(var maxx, maxy, Gmaxx, Gmaxy, t: real; j2, width: integer; var maxCounter: integer): Arr;
    { Private declarations }
  public
    t: real;
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

//################# ???????? ###################################################

function TChildForm5.MathOfAtmosfereFlight(var maxx, maxy, Gmaxx, Gmaxy, t: real; j2, width: integer; var maxCounter: integer): ChildUnit2.Arr;
var counter: integer; t0: real;
begin
if (MainForm.pictureA5[j2].k > 0) and (MainForm.pictureA5[j2].m > 0) then
begin
  SetLength(Result, 1);
  Result[0][1] := MainForm.pictureA5[j2].V * cos(MainForm.pictureA5[j2].al * pi/180);  //????????? ?????? ??? ???????? ?? ?? ???????? ?? ??? ?????????
  Result[0][2] := MainForm.pictureA5[j2].V * sin(MainForm.pictureA5[j2].al * pi/180);

  t0 := ln(Power((Result[0][2]/(10 * MainForm.pictureA5[j2].m)) + 1, (MainForm.pictureA5[j2].m/MainForm.pictureA5[j2].k)));

  Result[0][3] := 0;
  Result[0][4] := 0;

  t := 0;
  counter := 0;

  Repeat
    SetLength(Result, length(Result) + 1);
    counter := counter + 1;
    if MainForm.ScaleCB.Checked then t := t + (t0 / width)
    else t := counter;

    //??????? ????????? ?????? ??????? ????????

    Result[counter][1] := Round(Result[0][1]{Vox}*Power(exp(1){e}, -(MainForm.pictureA5[j2].k / MainForm.pictureA5[j2].m) * t {-(k/m)t}){ e ^ (-(k/m)t) }){ Vox * e ^ (-(k/m)t) };
    Result[counter][2] := Round((Result[0][2]{Voy}*Power(exp(1){e}, -(MainForm.pictureA5[j2].k / MainForm.pictureA5[j2].m) * t {-(k/m)t}){ e ^ (-(k/m)t) }){ Voy * e ^ (-(k/m)t) } - ((10 {g} * MainForm.pictureA5[j2].m{m})/MainForm.pictureA5[j2].k{k}){gm/k}*(1 - Power(exp(1){e}, -((MainForm.pictureA5[j2].k{k} / MainForm.pictureA5[j2].m{m}){k/m} * t){-(k/m)*t}){ e ^ (-(k/m)t) }) { 1 - e ^ (-(k/m)t) }) { Voy * e ^ (- (k/m)t) - (gm/k)(1 - e ^  };

    Result[counter][3] := Result[0][1]{Vox} * (MainForm.pictureA5[j2].m / MainForm.pictureA5[j2].k){m/k} * (1 - Power(exp(1){e}, -(MainForm.pictureA5[j2].k / MainForm.pictureA5[j2].m) * t {-(k/m)t}){ e ^ (-(k/m)t) }){1 - e ^ (-(k/m)t)};                                           //??????? ????????? ????
    Result[counter][4] := (MainForm.pictureA5[j2].m / MainForm.pictureA5[j2].k){m/k} * (((Result[0][2]{Voy} + (MainForm.pictureA5[j2].m * 10){mg}/ MainForm.pictureA5[j2].k){Voy + mg/k} * (1 - Power(exp(1){e}, -(MainForm.pictureA5[j2].k / MainForm.pictureA5[j2].m) * t {-(k/m)t}){ e ^ (-(k/m)t) }){ 1 - e ^ (-(k/m)t) }) - 10 * t);

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
end
else Result := ChildForm2.MathOfNoAtmosfereFlight(maxx, maxy, Gmaxx, Gmaxy, t, j2, width, maxCounter);
end;

//-------------------------?????????--------------------------------------------

procedure TChildForm5.PaintBox1Paint(Sender: TObject);
var counter, j2, maxCounter: integer; maxx, maxy, Gmaxx, Gmaxy: real; A: Array of ChildUnit2.Arr;
begin
SetLength(A, length(MainForm.pictureA5));

For j2 := 0 to length(MainForm.pictureA5) - 1 do
  A[j2] := MathOfAtmosfereFlight(maxx, maxy, Gmaxx, Gmaxy, t, j2, PaintBox1.Width, maxCounter);

PatBlt(ChildForm5.PaintBox1.Canvas.Handle, 0, 0, ChildForm5.ClientWidth, ChildForm5.ClientHeight, WHITENESS);

For j2 := 0 to length(MainForm.pictureA5) - 1 do
begin
  if t > 1 then
  With PaintBox1, Canvas do
  begin
    Brush.Color := clWhite;                                                     //????????? ????? ?????
    Pen.Color := MainForm.pictureA5[j2].color;
    Pen.Width := 1;
    Pen.Style := psSolid;

    MoveTo(0, Height);                                                          //??????????? ?????? ????? ? ????? ?????? ????

  if MainForm.ScaleCB.Checked then
  begin
    For counter := 0 to maxCounter do
    begin
        if Width >= Height then
          LineTo(Round((Width / Gmaxx) * A[j2][counter][3]), Round(Height - ((Width / Gmaxx) * A[j2][counter][4])))
        else
          LineTo(Round((Height / Gmaxx) * A[j2][counter][3]), Round(Height - ((Height / Gmaxx) *  A[j2][counter][4])));
    end;
  end
  else
    For counter := 0 to maxCounter do
    begin
      LineTo(Round(A[j2][counter][3]), Round(Height - A[j2][counter][4]));
    end;
  end;
end;
A := 0;
end;

end.
