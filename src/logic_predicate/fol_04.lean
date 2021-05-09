namespace fol_04

variable A : Type
variable R : A → A → Prop

theorem fol_04 : (∃ x, ¬ R x x) → (∃ x, ∃ y, ¬ R x y) :=
assume h1: ∃ x, ¬ R x x,
exists.elim h1
  (assume t (h2: ¬ R t t),
   show ∃ (x y : A), ¬R x y, from exists.intro t
    (exists.intro t h2))

end fol_04