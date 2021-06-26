add basic rec keyword
  $ $MERLIN single add-rec -position 1:10 test.ml <<EOF
  > let f x = f x
  > EOF
  {
    "class": "return",
    "value": {
      "start": {
        "line": 1,
        "col": 4
      },
      "end": {
        "line": 1,
        "col": 5
      }
    },
    "notifications": [
      "add-rec: expression
  expression
  case
  expression
  value_binding
  structure_item
  structure",
      "add-rec ident = : f",
      "add-rec value binding: f
  "
    ]
  }

add basic rec keyword

  $ $MERLIN single add-rec -position 4:3 test.ml <<EOF
  > let f x y =
  >   let _a = 1 in
  >   let _b = 2 in
  >   f
  > EOF
  {}

with a module

  $ $MERLIN single add-rec -position 3:36 test.ml <<EOF
  > module M = struct
  >   let f x =
  >     let g y = if y = 0 then () else g (y - 1) in
  >     g x
  > end
  > EOF
  {}