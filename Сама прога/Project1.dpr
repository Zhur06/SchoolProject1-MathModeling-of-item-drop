program Project1;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  ChildUnit2 in 'ChildUnit2.pas' {ChildForm2},
  ChildUnit5 in 'ChildUnit5.pas' {ChildForm5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
