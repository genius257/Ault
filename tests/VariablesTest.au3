#include <Array.au3>
#include "..\ault\Parser.au3"
#include "..\ault\AST.au3"
#include "..\ault\ASTUtils.au3"
#include "..\ault\Deparser.au3"
#include "..\ault\ErrorHandler.au3"

#include "../au3pm/au3unit/Unit/assert.au3"

Local $a = _Ault_ParseFile("VariablesSnip.au3", $AL_FLAG_AUTOINCLUDE + $AL_FLAG_AUTOLINECONT)

assertEquals(0, @error, @error ? _Ault_ErrorMsg($a) : "")

assertEquals( _
    "#AutoIt3Wrapper_Run_AU3Check=n"&@CRLF& _
    "Local $l"&@CRLF& _
    "Local $l1, $l2, $l3"&@CRLF& _
    "Global $g"&@CRLF& _
    "Global $g1, $g2, $g3"&@CRLF& _
    "Const $c = 1"&@CRLF& _
    "Const $c1 = 1, $c2 = 2, $c3 = 3"&@CRLF& _
    "Enum $e"&@CRLF& _
    "Enum $e1, $e2, $e3"&@CRLF& _
    "Enum Step 1 $e4, $e5, $e6"&@CRLF& _
    "Enum Step *1 $e7, $e8, $e9"&@CRLF& _
    "Dim $a[0]"&@CRLF& _
    "Dim $a[1] = [1]"&@CRLF& _
    "Dim $a = [0]"&@CRLF& _
    "Redim $a[3]"&@CRLF& _
    "$a[0] = 0"&@CRLF& _
    "$a[1] = 1"&@CRLF& _
    "$a[2] = 2"&@CRLF& _
    "$a"&@CRLF& _
    "$b = True"&@CRLF& _
    "$b = False"&@CRLF& _
    "$n = 1"&@CRLF& _
    "$n = 1 + 2 - 3 * 4 / 5 ^ 6"&@CRLF& _
    "$n = 0.5"&@CRLF& _
    "$n = .5"&@CRLF& _
    "$n = 9.66e+0"&@CRLF& _
    "$n = 0xFF"&@CRLF& _
    "$n += 1"&@CRLF& _
    "$n -= 1"&@CRLF& _
    "$n *= 1"&@CRLF& _
    "$n /= 1"&@CRLF& _
    '$s = "a"'&@CRLF& _
    "$s = 'a'"&@CRLF& _
    '$s = "a" & "b" & "c"'&@CRLF& _
    "$s = 'a' & 'b' & 'c'"&@CRLF& _
    '$s &= "a"'&@CRLF& _
    "$s &= 'a'"&@CRLF& _
    "$v = Default"&@CRLF& _
    "$v = Null"&@CRLF& _
    "$v == $v"&@CRLF& _
    "$v <> $v"&@CRLF& _
    "$v > $v"&@CRLF& _
    "$v >= $v"&@CRLF& _
    "$v < $v"&@CRLF& _
    "$v <= $v"&@CRLF, _
    _Ault_Deparse($a) _
)
