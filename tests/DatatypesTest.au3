#include <Array.au3>
#include "..\ault\Parser.au3"
#include "..\ault\AST.au3"
#include "..\ault\ASTUtils.au3"
#include "..\ault\Deparser.au3"
#include "..\ault\ErrorHandler.au3"

#include "../au3pm/au3unit/Unit/assert.au3"

Local $a = _Ault_ParseFile("DatatypesSnip.au3", $AL_FLAG_AUTOINCLUDE + $AL_FLAG_AUTOLINECONT)

assertEquals(0, @error, @error ? _Ault_ErrorMsg($a) : "")

assertEquals("#AutoIt3Wrapper_Run_AU3Check=n"&@CRLF&"123"&@CRLF&"-123"&@CRLF&"12.34"&@CRLF&"-12.34"&@CRLF&"1.5e3"&@CRLF&"-1.5e3"&@CRLF&"0x123"&@CRLF&"1+2-3*4/5^6"&@CRLF&'"abc"'&@CRLF&'"a""b"'&@CRLF&"'abc'"&@CRLF&"'a''c'"&@CRLF&'"abc" & "def"'&@CRLF&"'abc' & 'def'"&@CRLF, _Ault_Deparse($a))
