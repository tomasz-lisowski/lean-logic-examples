namespace fol_15_16

-- Show that reflexivity is sufficient to derive the rules for symmetry and transitivity.

theorem foo {A : Type} {a b c : A} : a = b → c = b → a = c :=
assume h1: a = b,
assume h2: c = b,
show a = c, from
calc
a     = b : by rw h1
  ... = c : by rw ← h2

section
  variable A : Type
  variables a b c : A

  example (h1 : a = b) (h2 : c = b) : a = c :=
  foo h1 h2
end

section

  variable {A : Type}
  variables {a b c : A}

  -- Proof using foo and rfl, without using eq.symm.
  theorem fol_15 (h : b = a) : a = b :=
  show a = b, by rw h

  -- Using foo and fol_15 to prove transitivity.
  theorem fol_16 (h1 : a = b) (h2 : b = c) : a = c :=
  show a = c, from
  calc
  a     = b : by rw h1
    ... = c : by rw h2

end

end fol_15_16