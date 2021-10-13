program Project1;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  ChildUnit in 'ChildUnit.pas' {ChildForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
