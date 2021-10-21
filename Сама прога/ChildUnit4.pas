unit ChildUnit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TChildForm4 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    tt: integer;
    //ChildForm: TForm;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChildForm4: TChildForm4;

implementation

uses ChildUnit, MainUnit;

{$R *.dfm}

procedure TChildForm4.Button1Click(Sender: TObject);
var str: string; c: integer;
begin

  str := Edit1.Text;                                                            //—читывание данных из €чейки
  for c:=1 to length(str) do
  begin
    if not (str[c] in ['0'..'9']) then
    begin
      Edit1.Text := 'You have typed something that was not a number';
      EXIT;
    end;
  end;
  tt := StrToInt(str);

//------------------------------------------------------------------------------

  if not Assigned(ChildForm) then
  begin
    ChildForm := TChildForm.Create(Self);
  end;

  if tt >= ChildForm.t then Exit;

  Panel1.Caption := IntToStr(Round(ChildForm.A[tt][2]));
  Panel2.Caption := IntToStr(Round(ChildForm.A[tt][1]));
end;

procedure TChildForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//------------------------------------------------------------------------------

procedure TChildForm4.Edit1Enter(Sender: TObject);
begin
  if Edit1.Text = '¬ведите сюда врем€' then Edit1.Text := ''
  else if Edit1.Text = 'You have typed something that was not a number' then Edit1.Text := '';
end;

//------------------------------------------------------------------------------

procedure TChildForm4.Edit1Exit(Sender: TObject);
var i: integer; numberic: boolean;
begin
  numberic := true;
  For i := 0 to length(Edit1.Text) - 1 do
    if i in [0..9] then numberic := false;
  if numberic then Edit1.Text := '¬ведите сюда врем€';
end;

end.
