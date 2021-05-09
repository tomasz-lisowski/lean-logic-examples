namespace fol_01

variable A : Type
variable R : A → A → Prop

theorem fol_01 : (∀ x y, R x y) → (∀ x, R x x) :=
assume h1: (∀ x y, R x y),
show ∀ x, R x x, from
  (assume hx: A,
   h1 hx hx)

end fol_01