program Project1;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  ChildUnit in 'ChildUnit.pas' {ChildForm},
  ChildUnit2 in 'ChildUnit2.pas' {ChildForm2},
  ChildUnit3 in 'ChildUnit3.pas' {ChildForm3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
