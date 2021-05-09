namespace fol_09

variable A : Type
variables P Q : A → Prop

theorem fol_09 : ((∀ x, P x → Q x) ∧ (∃ x, P x)) → ∃ x, Q x :=
assume h1: (∀ x, P x → Q x) ∧ (∃ x, P x),
have h2: ∀ x, P x → Q x, from and.left h1,
have h3: ∃ x, P x, from and.right h1,
show ∃ x, Q x, from exists.elim h3
  (assume t (h4: P t),
   have h5: P t → Q t, from h2 t,
   have h6: Q t, from h5 h4,
   show ∃ x, Q x, from exists.intro t h6)

end fol_09