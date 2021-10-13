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
   // Function fillArrayOfV(h, g:integer):Arr;
    procedure PaintBox1Paint(Sender: TObject);
  private
    { Private declarations }
  public
    h: integer;
    t: integer;
    A: Arr;
    { Public declarations }
  end;



var
  ChildForm: TChildForm;

implementation

uses ChildUnit2, IniFiles;

{$R *.dfm}


procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
 {
Function TChildForm.fillArrayOfV(h, g:integer):Arr;
begin
  t := 0;
  setlength(result, 1);
  result[t][1] := 0;
  result[t][2] := 0;
  While result[t][2] < h do
  begin
    t := t + 1;

    SetLength(result, length(result) + 1);

    result[t][1] := t * g;
    result[t][2] := result[t - 1][2] + result[t][1];
  end;
end;
        }

procedure TChildForm.PaintBox1Paint(Sender: TObject);
var counter: integer;
begin
  ChildForm.t := 0;
  setlength(ChildForm.A, 1);
  ChildForm.A[ChildForm.t][1] := 0;
  ChildForm.A[ChildForm.t][2] := 0;
  While ChildForm.A[ChildForm.t][2] < h do
  begin
    ChildForm.t := ChildForm.t + 1;

    SetLength(ChildForm.A, length(ChildForm.A) + 1);

    ChildForm.A[ChildForm.t][1] := ChildForm.t * 10;
    ChildForm.A[ChildForm.t][2] := ChildForm.A[ChildForm.t - 1][2] + ChildForm.A[ChildForm.t][1];

  With PaintBox1, canvas do
  begin
    Brush.Color := clBlack;

    MoveTo(0, Height);

    For counter := 0 to Width do
    begin
      if counter div (Width div t) + 2 <= length(A) then
        LineTo(counter, Round(Height - A[counter div (Width div t) + 1][1] * (Height div round(A[t][1]))));
    end;
  end;
end;
end.
