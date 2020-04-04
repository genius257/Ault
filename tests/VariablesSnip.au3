#AutoIt3Wrapper_Run_AU3Check=n

Local $l
Local $l1, $l2, $l3

Global $g
Global $g1, $g2, $g3

Const $c = 1
Const $c1 = 1, $c2 = 2, $c3 = 3

Enum $e
Enum $e1, $e2, $e3
Enum Step 1 $e4, $e5, $e6
Enum Step *1 $e7, $e8, $e9

Dim $a[0]
Dim $a[1] = [1]
Dim $a = [0]

Redim $a[3]
$a[0] = 0
$a[1] = 1
$a[2] = 2

$a = DllCall('shlwapi.dll', 'int', 'StrCmpLogicalW', 'wstr', $l1, 'wstr', $l2)[0]

$a

$b = True
$b = False

$n = 1
$n = 1 + 2 - 3 * 4 / 5 ^ 6
$n = 0.5
$n = .5
$n = 9.66e+0
$n = 0xFF

$n += 1
$n -= 1
$n *= 1
$n /= 1

$s = "a"
$s = 'a'
$s = "a" & "b" & "c"
$s = 'a' & 'b' & 'c'

$s &= "a"
$s &= 'a'

$v = Default
$v = Null

$v == $v
$v <> $v
$v > $v
$v >= $v
$v < $v
$v <= $v
