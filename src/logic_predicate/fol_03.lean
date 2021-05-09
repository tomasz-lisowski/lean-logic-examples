namespace fol_03

variable A : Type
variables P Q : A → Prop

theorem fol_03 : ((∃ x, P x) → (∀ x, Q x)) → ∀ y, P y → Q y :=
assume h1: (∃ x, P x) → (∀ x, Q x),
assume y: A,
show P y → Q y, from
  (assume h2: P y,
   have h3: ∃ x, P x, from exists.intro y h2,
   have h4: ∀ x, Q x, from h1 h3,
   show Q y, from h4 y)

end fol_03