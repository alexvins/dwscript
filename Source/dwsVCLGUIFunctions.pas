{**********************************************************************}
{                                                                      }
{    "The contents of this file are subject to the Mozilla Public      }
{    License Version 1.1 (the "License"); you may not use this         }
{    file except in compliance with the License. You may obtain        }
{    a copy of the License at http://www.mozilla.org/MPL/              }
{                                                                      }
{    Software distributed under the License is distributed on an       }
{    "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express       }
{    or implied. See the License for the specific language             }
{    governing rights and limitations under the License.               }
{                                                                      }
{    The Initial Developer of the Original Code is Matthias            }
{    Ackermann. For other initial contributors, see contributors.txt   }
{    Subsequent portions Copyright Creative IT.                        }
{                                                                      }
{    Current maintainer: Eric Grange                                   }
{                                                                      }
{**********************************************************************}
unit dwsVCLGUIFunctions;

{$I dws.inc}

interface

uses
   {$IFNDEF FPC} Windows, {$ENDIF} Forms, Dialogs, Classes,
   dwsUtils, dwsStrings,
   dwsFunctions, dwsExprs, dwsSymbols, dwsMagicExprs, dwsExprList;

type

  TShowMessageFunc = class(TInternalMagicProcedure)
    procedure DoEvalProc(const args : TExprBaseListExec); override;
  end;

  TInputBoxFunc = class(TInternalMagicStringFunction)
    procedure DoEvalAsString(const args : TExprBaseListExec; var Result : UnicodeString); override;
  end;

  TdwsGUIFunctions = class(TComponent)
  end;

implementation

{ TShowMessageFunc }

// DoEvalProc
//
procedure TShowMessageFunc.DoEvalProc(const args : TExprBaseListExec);
begin
   {$IFDEF FPC}
   ShowMessage(UTF8Encode(args.AsString[0]));
   {$ELSE}
   ShowMessage(args.AsString[0]);
   {$ENDIF}
end;

{ TInputBoxFunc }

// DoEvalAsString
//
procedure TInputBoxFunc.DoEvalAsString(const args : TExprBaseListExec; var Result : UnicodeString);
begin
   {$IFDEF FPC}
   Result:=UTF8Decode(InputBox(UTF8Encode(args.AsString[0]), UTF8Encode(args.AsString[1]), UTF8Encode(args.AsString[2])));
   {$ELSE}
   Result:=InputBox(args.AsString[0], args.AsString[1], args.AsString[2]);
   {$ENDIF}
end;

initialization

   RegisterInternalProcedure(TShowMessageFunc, 'ShowMessage', ['msg', SYS_STRING]);
   RegisterInternalStringFunction(TInputBoxFunc, 'InputBox', ['aCaption', SYS_STRING, 'aPrompt', SYS_STRING, 'aDefault', SYS_STRING]);
  
end.
