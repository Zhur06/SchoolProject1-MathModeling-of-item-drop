unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    procedure Image1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  h: integer;
implementation

{$R *.dfm}


procedure TForm2.Image1Click(Sender: TObject);
begin
  Form2.Image1.Canvas.Font.Size:= 24;
  Form2.Image1.Canvas.TextOut(50,50,'���� ����');

  Form2.Image1.Canvas.Font.Size:= 14;
  Form2.Image1.Canvas.TextOut(220,200,'������');
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
  h := StrToInt(Edit1.Text);
end;

end.
