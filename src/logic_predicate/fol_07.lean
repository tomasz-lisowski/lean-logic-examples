namespace fol_07

variable A : Type
variable R : A → A → Prop

variable hxy : ∀ x y, R x y ∨ R y x
include hxy

theorem fol_07 : ∀ x, R x x :=
assume s,
have h1: R s s ∨ R s s, from hxy s s,
or.elim h1
  (assume h2: R s s,
   h2)
  (assume h3: R s s,
   h3)

end fol_07