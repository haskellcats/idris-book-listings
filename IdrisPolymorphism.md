# Idris Polymorphism

If you evaluate the empty list in Haskell's REPL you will get this:

```
haskell> []
[] :: [t]
```

In Idris's REPL you will get this:

```
idris> []
(input):Can't infer argument elem to []
idris> :let myEmpty = []
(input):Can't infer argument elem to []
idris> the (List Char) []
[] : List Char
idris> the (List Int) []
[] : List Int
```

What gives! First understand the explicit type of Haskell's [] result.
`[] :: forall t . [t]` Polymorphic types have these forall binders which
are basically giving you permission to choose any type and substitute it
in the body where the variable occurs free. This process, called
"instantiation", also drops the forall. The forall's are often omitted in
Haskell type signatures for brevity, but they become important when doing
rank-2 function types. Back to idris.

```
idris> :t []
[] : List elem
```

This looks basically like the Haskell version. The difference here is
that Idris is omitting a first class version of the forall a, which you
can see by turning on visible implicits.

```
idris> :set showimplicits
idris> :t []
[] : {elem : Type} -> List elem
```

So the expression [] is really a (dependent) function! Because the argument
is an implicit, attempting to use [] causes idris to scramble and find a
suitable argument and then apply it. When you have [] with no other context
there's no argument more suitable than any other and idris complains. Giving
an explicit type using `the` solves it, though you are left not being able to
bind a polymorphic empty list to a variable like Haskell. I'm guessing this
won't really be a problem in practice.

To make it not complain, you can make the polymorphism explicit with a lambda
or a "smart constructor" that makes the implicit explicit.

```
idris> :let polyEmpty = \t => [] {elem=t}
polyEmpty : (a : Type) -> List a
idris> polyEmpty Char
[] : List Char
```

So you lose the automagic assignment of the proper type. Kind of pointless
but interesting nonetheless!
