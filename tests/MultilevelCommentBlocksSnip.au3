#cs
    $a = 1
    #cs
        $b = 2
        #cs
            $c = 3
        #ce
        $b = 2
    #ce
    $a = 2
    invalid?
    #cs
    #ce
bug ;magic #cs block
#ce
$a = 1

#cs
  #cs
  #ce
bug ;this is parsed, but it's between the inner #cs block
#ce
$b = 2
