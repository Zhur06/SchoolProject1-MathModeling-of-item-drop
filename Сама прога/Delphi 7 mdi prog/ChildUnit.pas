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
    Function fillArrayOfV(h, g:integer):Arr;
    procedure PaintBox1Paint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  ChildForm: TChildForm;
  A: Arr;
  t: integer;
implementation

{$R *.dfm}


procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

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


procedure TChildForm.PaintBox1Paint(Sender: TObject);
var counter: integer;
begin
  With PaintBox1, canvas do
  begin
    Brush.Color := clBlack;

    For counter := 0 to Width do
    begin
      if counter div (Width div t) + 2 <= length(A) then
        Rectangle(counter, Round(Height - A[counter div (Width div t) + 1][1] * (Height div round(A[t][1]))), counter, Height);
    end;
  end;
end;
end.
