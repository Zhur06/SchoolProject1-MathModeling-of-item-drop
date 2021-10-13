unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    h1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    GroupBox1: TGroupBox;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    Button2: TButton;
    procedure h1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    h: integer;
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses ChildUnit, ChildUnit2;

{$R *.dfm}

procedure TMainForm.h1Click(Sender: TObject);
begin
  ChildForm := TChildForm.Create(Self);
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  ChildForm2 := TChildForm2.Create(Self);
end;

procedure TMainForm.Button2Click(Sender: TObject);
var str: string; c: integer;
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
  MainForm.h := StrToInt(str);
end;

end.
