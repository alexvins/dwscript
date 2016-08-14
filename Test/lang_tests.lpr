program lang_tests;

{$mode objfpc}{$H+}

uses
  sysutils, Interfaces, Forms, dwsXPlatformTests, UAlgorithmsTests, UScriptTests, UdwsUnitTests, UCornerCasesTests,
  GuiTestRunner;

{$R *.res}

begin
  Set8087CW($133F);
  FormatSettings.DecimalSeparator:='.';
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;
end.

