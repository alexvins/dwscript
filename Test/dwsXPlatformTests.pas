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
{    Copyright Eric Grange / Creative IT                               }
{                                                                      }
{**********************************************************************}
unit dwsXPlatformTests;

interface

uses
   Classes, SysUtils,
   {$ifdef FPC}
   fpcunit, testutils, testregistry
   {$else}
   TestFrameWork, TestUtils
   {$endif}
   ;

type

   {$ifdef FPC}

   { TTestCase }

   TTestCase = class (fpcunit.TTestCase)
      public
         procedure CheckEquals(const expected, actual: UnicodeString; const msg: UnicodeString = ''); overload;
   end;
   TTestCaseClass = class of TTestCase;
   ETestFailure = class (Exception);
   {$else}
   TTestCase = class(TestFrameWork.TTestCase)
      public
         procedure CheckEquals(const expected, actual: RawByteString; const msg: String = ''); overload;
         procedure CheckEquals(const expected : String; const actual: RawByteString; const msg: String = ''); overload;
         procedure CheckEquals(const expected : String; const actual: Variant; const msg: String = ''); overload;
   end;
   ETestFailure = TestFrameWork.ETestFailure;

   TTestCaseClass = class of TTestCase;
   {$endif}



procedure RegisterTest(const testName : String; aTest : TTestCaseClass);

// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
implementation
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

// RegisterTest
//
procedure RegisterTest(const testName : String; aTest : TTestCaseClass);
begin
   {$ifdef FPC}
   testregistry.RegisterTest(aTest);
   {$else}
   TestFrameWork.RegisterTest(testName, aTest.Suite);
   {$endif}
end;

// CheckEquals
//
{$ifdef FPC}
function __ComparisonMsg(const aExpected: UnicodeString; const aActual: UnicodeString; const aCheckEqual: boolean=true): UnicodeString;
// aCheckEqual=false gives the error message if the test does *not* expect the results to be the same.
const
  SCompare = ' expected: <%s> but was: <%s>';
  SCompareNotEqual = ' expected: not equal to <%s> but was: <%s>';
begin
  if aCheckEqual then
    Result := UnicodeFormat(UnicodeString(SCompare), [aExpected, aActual])
  else {check unequal requires opposite error message}
    Result := UnicodeFormat(UnicodeString(SCompareNotEqual), [aExpected, aActual]);
end;

procedure TTestCase.CheckEquals(const expected, actual: UnicodeString; const msg: UnicodeString);
begin
   AssertTrue( UTF8Encode (msg + __ComparisonMsg(Expected, Actual)), UnicodeCompareStr(Expected, Actual) = 0);
end;

{$else}

procedure TTestCase.CheckEquals(const expected, actual: RawByteString; const msg: String);
begin
   OnCheckCalled;
   if (expected <> actual) then
      FailNotEquals(String(expected), String(actual), msg, CallerAddr);
end;

procedure TTestCase.CheckEquals(const expected : String; const actual: RawByteString; const msg: String);
begin
   OnCheckCalled;
   if (expected <> String(actual)) then
      FailNotEquals(String(expected), String(actual), msg, CallerAddr);
end;

procedure TTestCase.CheckEquals(const expected : String; const actual: Variant; const msg: String);
begin
   OnCheckCalled;
   if (expected <> actual) then
      FailNotEquals(String(expected), String(actual), msg, CallerAddr);
end;

{$endif}

end.

