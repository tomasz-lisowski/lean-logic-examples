namespace fol_02

variable A : Type
variables P Q : A → Prop

theorem fol_02 : ¬ (∀ x, P x ∨ Q x) → ¬ (∀ x, P x) :=
assume h1: ¬ (∀ x, P x ∨ Q x),
assume h2: ∀ x, P x,
have h3: ∀ x, P x ∨ Q x, from
  (assume t: A,
   have h4: P t, from h2 t,
   show P t ∨ Q t, from or.inl h4),
show false, from h1 h3

end fol_02