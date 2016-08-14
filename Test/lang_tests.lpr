program lang_tests;

{$mode objfpc}{$H+}

uses
  Interfaces, Forms, dwsXPlatformTests, UAlgorithmsTests,
  GuiTestRunner;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;
end.

