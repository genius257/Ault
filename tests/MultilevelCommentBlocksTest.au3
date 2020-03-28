#include "..\ault\Parser.au3"
#include "..\ault\AST.au3"
#include "..\ault\ASTUtils.au3"
#include "..\ault\Deparser.au3"
#include "..\ault\ErrorHandler.au3"

#include "../au3pm/au3unit/Unit/assert.au3"

Local $a = _Ault_ParseFile("MultilevelCommentBlocksSnip.au3", $AL_FLAG_AUTOINCLUDE + $AL_FLAG_AUTOLINECONT)

assertEquals(0, @error, @error ? _Ault_ErrorMsg($a) : "")

assertEquals("$a = 1"&@CRLF&"$b = 2"&@CRLF, _Ault_Deparse($a))
