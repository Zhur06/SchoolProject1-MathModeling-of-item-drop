unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    h1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure h1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ChildUnit;

{$R *.dfm}

procedure TForm1.h1Click(Sender: TObject);
begin
  TChildForm.Create(Self);
end;

end.
