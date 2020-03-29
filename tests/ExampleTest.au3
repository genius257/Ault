#include "..\ault\Parser.au3"
#include "..\ault\AST.au3"
#include "..\ault\ASTUtils.au3"
#include "..\ault\Deparser.au3"
#include "..\ault\ErrorHandler.au3"

#include "../au3pm/au3unit/Unit/assert.au3"

Local $a = _Ault_ParseFile("ExampleScript.au3", $AL_FLAG_AUTOINCLUDE + $AL_FLAG_AUTOLINECONT)

assertEquals(0, @error, @error ? _Ault_ErrorMsg($a) : "")

assertEquals("Func _MyFunction(Byref $a, $b = 12)"&@CRLF&"    Local $ret = 0"&@CRLF&"    If $a = 1 Then"&@CRLF&"        $ret += 12"&@CRLF&"    EndIf"&@CRLF&"    If Not Mod($b, 2) Then"&@CRLF&"        $ret = $ret * 2"&@CRLF&"    EndIf"&@CRLF&"    Return $ret"&@CRLF&"EndFunc"&@CRLF&@CRLF&"Local $a = 1"&@CRLF&"Local $b = 2"&@CRLF&"Local $foo = _MyFunction($a, $b)"&@CRLF&"ConsoleWrite($foo & @LF)"&@CRLF, _Ault_Deparse($a))

