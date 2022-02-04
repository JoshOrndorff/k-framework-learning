module EXP-SYNTAX
  imports INT

  syntax Exp ::= Int
               | Exp "*" Exp [klabel(Mul)]
               | Exp "/" Exp [klabel(Div)]
               | Exp "+" Exp [left, klable(Add)]
               | "read"      [klabel(Read)]
               | "print" Exp [klabel(Print)]
               | "(" Exp ")" [bracket]


  syntax left Mul Div
endmodule


module EXP
  imports EXP-SYNTAX

  configuration <T>
                  <k>
                    $PGM:Exp
                  </k>
                </T>
endmodule
