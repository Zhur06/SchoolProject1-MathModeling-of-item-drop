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
    procedure PaintBox1Paint(Sender: TObject);
    Function fillArrayOfV(h, g:real):Arr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  ChildForm: TChildForm;

implementation

{$R *.dfm}


procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TChildForm.PaintBox1Paint(Sender: TObject);
begin
  With PaintBox1, canvas do
  begin
    Brush.Color := clBlack;

    //Rectangle(0,0,Width,Height);
  end;
end;

Function TChildForm.fillArrayOfV(h, g:real):Arr;
var t: integer;
begin
  t := 0;
  setlength(result, 1);
  result[t][1] := 0;
  result[t][2] := 0;
  While result[t][2] < h do
  begin
    t := t + 1;

    result[t][1] := t * g;
    result[t][2] := result[t - 1][2] + result[t][1];
  end;
end;

end.
