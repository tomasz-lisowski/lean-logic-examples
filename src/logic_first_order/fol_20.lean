namespace fol_20

variable U : Type
variable R : U → U → Prop

theorem fol_20 : (∀ x y, R x y → R y x) → (∀ x y z, (R x y ∧ R y z) → R x z) →
  (∀ x y, R x y → R x x) :=
assume h1: ∀ x y, R x y → R y x,
assume h2: ∀ x y z, (R x y ∧ R y z) → R x z,
assume t: U,
assume s: U,
have h3: R t s → R s t, from h1 t s,
have h4: (R t s ∧ R s t) → R t t, from h2 t s t,
assume h5: R t s,
have h6: R s t, from h3 h5,
have h7: R t s ∧ R s t, from and.intro h5 h6,
show R t t, from h4 h7

end fol_20