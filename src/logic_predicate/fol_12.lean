namespace fol_12

variable A : Type
variable P : A → Prop
variable R : A → A → Prop

theorem fol_12 : (∀ y, P y → (∀ x, R x y)) → (∃ y, P y) → (∃ z, ∀ x, R x z) :=
assume h1: ∀ y, P y → (∀ x, R x y),
assume h2: ∃ y, P y,
exists.elim h2
  (assume t (h3: P t),
   have h4: P t → (∀ x, R x t), from h1 t,
   have h5: ∀ x, R x t, from h4 h3,
   exists.intro t h5)

end fol_12