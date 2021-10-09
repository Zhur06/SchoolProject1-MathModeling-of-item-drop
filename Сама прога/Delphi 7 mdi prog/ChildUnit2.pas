unit ChildUnit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Arr = array of array [1..2] of real;

  TChildForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Function fillArrayOfV(h, g:integer):Arr;
    procedure PaintBox1Paint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChildForm2: TChildForm2;
  A: Arr;
  t: integer;

implementation

uses ChildUnit;

{$R *.dfm}

procedure TChildForm2.Button1Click(Sender: TObject);
var str: string; c, h: integer;
begin
  str := Edit1.Text;
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit1.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  h := StrToInt(str);

  A := fillArrayOfV(h, 10);


end;

procedure TChildForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

Function TChildForm2.fillArrayOfV(h, g:integer):Arr;
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
        Line(counter, Height - (A[counter div (Width div t) + 1][1]*(Height div A[t][1]) + 5), counter, Height);
    end;
  end;
end;
end.
