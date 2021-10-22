unit ChildUnit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  Arr = array of array [1..2] of real;
  TChildForm3 = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject);
  private
    { Private declarations }
  public
    t : integer;
    A : Arr;
    { Public declarations }
  end;

var
  ChildForm3: TChildForm3;

implementation

uses MainUnit;

{$R *.dfm}

procedure TChildForm3.PaintBox1Paint(Sender: TObject);
var counter, j2: integer;
begin
  t := 0;
  setlength(A, 1);
  A[t][1] := 0;                                             //1 - ��������
  A[t][2] := 0;                                             //2 - ���������� ����

For j2 := 0 to length(MainForm.hA) - 1 do
begin
  While A[t][2] < MainForm.hA[j2].h do                             //���� ������� ����������� ����� �� 1 ������� � ����������� ��� ��� �������� � ���������� ���� � �������� ������ ��� ���������� ���� ���� ������ ��� ��������� ������
  begin
    t := t + 1;                                             //���������� ������� �� �������

    SetLength(A, length(A) + 1);                            //���������� ������� ������� � ������

    A[t][1] := t * MainForm.hA[j2].g;                            //������� �������� �� ������� v = at
    A[t][2] := A[t - 1][2] + A[t][1];  //������� ����������� ����  S = S0 + vt
  end;


  if t <> 0 then
  With PaintBox1, canvas do     //��������� ����� �������
  begin
    Brush.Color := clBlack;                                                     //��������� ����� �����
    Pen.Color := clBlack;
    Pen.Width := 1;
    Pen.Style := psSolid;


    MoveTo(0, Height);                                                          //����������� ������ ����� � ����� ������ ����

    For counter := 0 to t do
    begin
      LineTo((Width div t) * counter, Round(Height - A[counter][1]));
    end;

    {
    For counter := 0 to Width do                                                //���� ��������� ����� �� ������ �������
    begin
      if counter div (Width div t) + 2 <= length(A) then
        LineTo(counter, Round(Height - A[counter div (Width div t) + 1][1] * (Height div round(A[t][1]))));
    end;}
  end;
end;
end;

end.
