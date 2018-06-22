$letter_A = @"
-++-
+--+
++++
+--+
+--+
"@

$letter_B = @"
+++-
+--+
+++-
+--+
+++-
"@

$letter_C = @"
-+++
+---
+---
+---
-+++
"@

$letteR_D = @"
+++-
+--+
+--+
+--+
+++-
"@

$letter_E = @"
++++
+---
+++-
+---
++++
"@

$letter_F = @"
++++
+---
+++-
+---
+---
"@

$letter_G = @"
-+++
+---
+-++
+--+
-+++
"@

$letter_H = @"
+--+
+--+
++++
+--+
+--+
"@

$letter_I = @"
+++
-+-
-+-
-+-
+++
"@

$letter_J = @"
---+
---+
---+
+--+
-++-
"@

$letter_K = @"
+--+
+-+-
++--
+-+-
+--+
"@

$letter_L = @"
+---
+---
+---
+---
++++
"@

$letter_M = @"
+---+
++-++
+-+-+
+---+
+---+
"@

$letter_N = @"
+--+
++-+
+-++
+--+
+--+
"@

$letter_O = @"
-++-
+--+
+--+
+--+
-++-
"@

$letter_P = @"
+++-
+--+
+++-
+---
+---
"@

$letter_Q = @"
-++--
+--+-
+--+-
+--+-
-++-+
"@

$letter_R = @"
+++-
+--+
+++-
+-+-
+--+
"@

$letter_S = @"
-+++
+---
-++-
---+
+++-
"@

$letter_T = @"
+++
-+-
-+-
-+-
-+-
"@

$letter_U = @"
+--+
+--+
+--+
+--+
++++
"@

$letter_V = @"
+--+
+--+
+--+
+--+
-++-
"@

$letter_W = @"
+---+
+---+
+-+-+
++-++
+---+
"@

$letter_X = @"
+---+
-+-+-
--+--
-+-+-
+---+
"@

$letter_Y = @"
+---+
-+-+-
--+--
--+--
--+--
"@

$letter_Z = @"
++++
---+
-++-
+---
++++
"@

$letter_space = @"
-
-
-
-
-
"@

$letter_dash = @"
--
--
++
--
--
"@

$letter_underscore = @"
---
---
---
---
+++
"@

$letter_height = 5

$useremoji = "pepepanda"
$useremoji = ":$($useremoji):"
$backgroundemoji = ":reeeee:"

function Spell {
    Param(
      [Parameter(Mandatory=$true)]
      [string]$Word
    )

    $out = ""

    For ($i=0; $i -lt $letter_height; $i++) {
        $line = ""
        $Word.ToCharArray() | ForEach-Object {
            If ($_ -eq " ") {
                $let = "space"
            } ElseIf ($_ -eq "-") {
                $let = "dash"
            } ElseIf ($_ -eq "_") {
                $let = "underscore"
            } Else {
                $let = $_
            }
                        
            # Get-Variable gets a variable by string
            $line += "-" + ((Get-Variable -Name "letter_$let" -ValueOnly) -split "`r`n")[$i]
        }
        $out += $line + "`r`n"
    }
    
    $header = ("-"* ($out.Split()[0].Length))
    $out = $header + "`r`n" + $out + $header

    # This has to be incredibly inefficient
    $out -split "`r`n" | % {
        $output += $_ + "-" + "`r`n"
    }

    Write-Output ($output -replace "-",$backgroundemoji -replace '\+',$useremoji)
}



Spell "VWXYZ" | Set-Clipboard