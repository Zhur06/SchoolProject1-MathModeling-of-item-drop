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
  private
    { Private declarations }
  public
  t: integer;
    { Public declarations }
  end;

var
  ChildForm2: TChildForm2;
  A: Arr;

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

  ChildForm2.t := 0;
  setlength(A, 1);
  A[t][1] := 0;
  A[t][2] := 0;
  While A[t][2] < h do
  begin
    t := t + 1;

    SetLength(A, length(A) + 1);

    A[t][1] := t * 10;
    A[t][2] := A[t - 1][2] + A[t][1];
  end;
end;

procedure TChildForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


end.
