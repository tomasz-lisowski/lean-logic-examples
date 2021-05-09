namespace fol_05

variable A : Type
variables P Q : A → Prop

theorem fol_05 : (∃ x, P x ∨ Q x) → (∀ x, ¬ Q x) → ∃ y, P y :=
assume h1: ∃ x, P x ∨ Q x,
assume h2: ∀ x, ¬ Q x,
show ∃ (y : A), P y, from
  (exists.elim h1
   (assume t (h3: P t ∨ Q t),
    have h4: P t, from or.elim h3
      (assume h5: P t,
       h5)
      (assume h6: Q t,
       have h7: ¬ Q t, from h2 t,
       have h8: false, from h7 h6,
       false.elim h8),
     exists.intro t h4))

end fol_05