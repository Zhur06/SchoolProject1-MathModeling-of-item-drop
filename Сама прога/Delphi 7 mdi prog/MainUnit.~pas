unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    h1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure h1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses ChildUnit, ChildUnit2;

{$R *.dfm}

procedure TMainForm.h1Click(Sender: TObject);
begin
  TChildForm.Create(Self);
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  TChildForm2.Create(Self);
end;

end.
