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
    // procedure FormClose(Sender: TObject; var Action: TCloseAction);
   // Function fillArrayOfV(h, g:integer):Arr;
    //procedure PaintBox1Paint(Sender: TObject);
  private
    { Private declarations }
  public
    t: integer;
    A: Arr;
    { Public declarations }
  end;



var
  ChildForm: TChildForm;

implementation

uses MainUnit, IniFiles;

{$R *.dfm}

procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TChildForm.PaintBox1Paint(Sender: TObject);
var counter: integer;
begin
  t := 0;
  setlength(A, 1);
  A[t][1] := 0;                                             //1 - ��������
  A[t][2] := 0;                                             //2 - ���������� ����
  While A[t][2] < MainForm.h do                             //���� ������� ����������� ����� �� 1 ������� � ����������� ��� ��� �������� � ���������� ���� � �������� ������ ��� ���������� ���� ���� ������ ��� ��������� ������
  begin
    t := t + 1;                                             //���������� ������� �� �������

    SetLength(A, length(A) + 1);                            //���������� ������� ������� � �������

    A[t][1] := t * 10;                            //������� �������� �� ������� v = at
    A[t][2] := A[t - 1][2] + A[t][1];  //������� ����������� ����  S = S0 + vt
  end;
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

end.
