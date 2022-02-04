module PI-SYNTAX
  imports ID

  // Processes
  syntax Proc ::= Norm
        | Proc "|" Proc         [klabel(Par), left]
        | "!" Proc              [klabel(Replicate)]
        | "(" "v" Id ")" Proc   [binder klabel(New)]
        | "(" Proc ")"          [bracket]

  // Normal Processes
  syntax Norm ::= Pi "." Proc   [klabel(Prefix)]
        | "@"
        | Norm "+" Norm         [klabel(Plus)]
     // | Pi                    // Milner shorthand

  // Atomic Actions
  syntax Pi ::= Id "(" Id ")"    [binder] // Receive
              | Id "~" Id                 // Send

  syntax priority repl new pre > Plus > par
endmodule

module PI
  imports PI-SYNTAX

  configuration <T> // T stands for top-level, k conven
                  <par>
                    <proc multiplicity="*">
                      <k>
                        $PGM:Proc // Proc is top-level
                      </k>
                    </proc>
                  </par>
                </T>

  // Structural equivalences

  // Symmetric monoid
  // P | 0 <=> P
  // (P | Q) | R <=> P | (Q | R)
  rule
    <k> P:Process | Q:Process => P </k>
endmodule

// Questions:
// Why can I just refer to a name like "x"? Is that what DOMAINS gets me? (reference below)
// Since I've commented out the shorthand, x~y shouldn't be a thing. How do I tell kompile that the top level entity should be a Proc?
// How do we teach kframework the actual reduction rules? Maybe involves importing SUBSTITUTION ?


// Helpful references:
// Our zoom sesssion: https://youtu.be/iX5L8lGynNo?t=32m23s
// Official lambda example:  https://github.com/kframework/k5/blob/master/k-distribution/tutorial/1_k/1_lambda/lesson_1/lambda.k
// DOMAINS package: https://github.com/kframework/k5/blob/master/k-distribution/include/builtin/domains.k
