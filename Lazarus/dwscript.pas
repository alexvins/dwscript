{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit dwscript;

interface

uses
  dwsComConnector, dwsComp, dwsCompiler, dwsCompilerUtils, dwsConnectorExprs, dwsConnectorSymbols, dwsConstExprs, 
  dwsConvExprs, dwsCoreExprs, dwsDataContext, dwsDateTime, dwsDebugFunctions, dwsDebugger, dwsEncoding, dwsErrors, 
  dwsExprList, dwsExprs, dwsExternalSymbols, dwsFileSystem, dwsFunctions, dwsGlobalVars, dwsGlobalVarsFunctions, 
  dwsHtmlFilter, dwsInfo, dwsJSON, dwsJSONConnector, dwsJSONPath, dwsLanguageExtension, dwsMagicExprs, 
  dwsMath3DFunctions, dwsMathComplexFunctions, dwsMathFunctions, dwsMethodExprs, dwsOperators, dwsPascalTokenizer, 
  dwsRelExprs, dwsResultFunctions, dwsSampling, dwsSetOfExprs, dwsStack, dwsStringFunctions, dwsStringResult, 
  dwsStrings, dwsSymbols, dwsSystemOperators, dwsTimeFunctions, dwsTokenizer, dwsUnitSymbols, dwsUtils, 
  dwsVariantFunctions, dwsVCLGUIFunctions, dwsWebUtils, dwsXPlatform, dwsXPlatformUI, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('dwscript', @Register);
end.
