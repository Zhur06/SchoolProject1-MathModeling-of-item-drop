program Project1;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  ChildUnit in 'ChildUnit.pas' {ChildForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
