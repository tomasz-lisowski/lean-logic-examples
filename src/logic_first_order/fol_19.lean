namespace fol_19

variable U : Type
variable f : U → U → U
variable P : U → Prop

theorem fol_19 : (∀ x, P (f x x)) → (∀ x, ∃ y, P (f x y)) :=
assume h1: ∀ x, P (f x x),
assume t: U,
have h2: P (f t t), from h1 t,
show ∃ y, P (f t y), from exists.intro t h2

end fol_19