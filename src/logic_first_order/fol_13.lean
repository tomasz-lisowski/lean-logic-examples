namespace fol_13

variable A : Type
variable P : A → Prop
variable c : A
include c

theorem fol_13 : (∀ x y, P x ∨ P y) → ∃ x, P x :=
assume h1: ∀ x y, P x ∨ P y,
have h2: P c ∨ P c, from h1 c c,
have h3: P c, from or.elim h2
  (assume h4: P c,
   h4)
  (assume h5: P c,
   h5),
exists.intro c h3

end fol_13