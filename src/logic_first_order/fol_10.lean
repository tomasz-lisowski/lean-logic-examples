namespace fol_10

variable A : Prop
variables P Q : A → Prop

theorem fol_10 : ((∃ x, P x ∨ Q x) ∧ (¬ ∃ x, P x)) → ¬ ∀ x, (Q x → P x) :=
assume h1: (∃ x, P x ∨ Q x) ∧ (¬ ∃ x, P x),
have h2: ∃ x, P x ∨ Q x, from and.left h1,
have h3: ¬ ∃ x, P x, from and.right h1,
assume h4: ∀ x, Q x → P x,
show false, from exists.elim h2
  (assume s (h5: P s ∨ Q s),
   have h6: Q s, from or.elim h5
    (assume h7: P s,
     have h8: false, from h3 (exists.intro s h7),
     false.elim h8)
    (assume h9: Q s,
     h9),
   have h10: Q s → P s, from h4 s,
   have h11: P s, from h10 h6,
   have h12: false, from h3 (exists.intro s h11),
   false.elim h12)

end fol_10