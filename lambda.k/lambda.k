// Left off on lesson 3

require "substitution.k"

module LAMBDA-SYNTAX
  imports DOMAINS
  imports SUBSTITUTION

  syntax Val ::= Id
         | "lambda" Id "." Exp [binder]

  syntax Exp ::= Val
         // strict means evaluate arguments before construct symantics. argument order not specified.
         | Exp Exp             [left, strict]
         | "(" Exp ")"         [bracket]

  // Make Val a subcategory of builtin KResult so Vals k doesn't try to evaluate them anymore
  syntax KResult ::= Val

  // Not sure where this line was leftover from
  //syntax KVariable ::= Id

  rule (lambda X:Id . E:Exp) V:Val => E[V / X] [anywhere]
endmodule

module LAMBDA
  imports LAMBDA-SYNTAX
endmodule
