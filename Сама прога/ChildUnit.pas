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
var counter, j1, j2, otstup, otstup2: integer;
begin
  otstup := 20;
  otstup2 := 15;

For j2 := 0 to length(MainForm.hA) - 1 do
begin
  t := 0;
  setlength(A, 1);
  A[t][1] := 0;                                             //1 - ��������
  A[t][2] := 0;                                             //2 - ���������� ����
  While A[t][2] < MainForm.hA[j2].h do                             //���� ������� ����������� ����� �� 1 ������� � ����������� ��� ��� �������� � ���������� ���� � �������� ������ ��� ���������� ���� ���� ������ ��� ��������� ������
  begin
    t := t + 1;                                             //���������� ������� �� �������

    SetLength(A, length(A) + 1);                            //���������� ������� ������� � �������

    A[t][1] := t * 10;                            //������� �������� �� ������� v = at
    A[t][2] := A[t - 1][2] + A[t][1];  //������� ����������� ����  S = S0 + vt
  end;


  if t <> 0 then
  With PaintBox1, canvas do     //��������� ����� �������
  begin
    Brush.Color := clWhite;                                                     //��������� ����� �����
    Pen.Color := MainForm.hA[j2].Color;
    Pen.Width := 1;
    Pen.Style := psSolid;
    {
    MoveTo(0, Height - otstup);
    LineTo(Width, Height - otstup);
    MoveTo(otstup, 0);
    LineTo(otstup, Height);

    For j1 := 1 to (Height div otstup2) - 1 do                                  //������������ ���
    begin
      MoveTo(otstup - 5, Height - otstup - (j1*otstup2));
      LineTo(otstup + 5, Height - otstup - (j1*otstup2));

      TextOut(0, Height - otstup - (j1*otstup2), IntToStr(j1 * otstup2));
    end;

    For j1 := 1 to (Width div 10) - 1 do                                        //�������������� ���
    begin
      MoveTo(otstup + (j1*otstup2), Height - otstup - 5);
      LineTo(otstup + (j1*otstup2), Height - otstup + 5);

      TextOut(otstup + (j1*otstup2), Height - otstup, IntToStr(j1 div (Width - otstup) div Round(A[t][1])));  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    end;  }


    MoveTo(otstup, Height - otstup);                                            //����������� ������ ����� � ����� ������ ����

    For counter := 0 to t do
    begin
      LineTo(((Width - otstup) div t) * counter + otstup, Round((Height - otstup) - A[counter][1]));
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
