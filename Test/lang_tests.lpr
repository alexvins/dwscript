program lang_tests;

{$mode objfpc}{$H+}

uses
  sysutils, Interfaces, Forms, dwsXPlatformTests, UAlgorithmsTests, UScriptTests, UdwsUnitTests, UCornerCasesTests,
  GuiTestRunner;

{$R *.res}

begin
  //if FileExists('heap.trc') then
  //  DeleteFile('heap.trc');
  //SetHeapTraceOutput('heap.trc');

  Set8087CW($133F);
  FormatSettings.DecimalSeparator:='.';
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;
end.

