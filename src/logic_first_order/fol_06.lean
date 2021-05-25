namespace fol_06

variable A : Type
variables P Q : A → Prop

variable h : ¬ ∃ x, P x ∨ Q x
include h

theorem fol_06 : ∀ x, ¬ P x ∧ ¬ Q x :=
assume s,
have h1: ∀ t, ¬ (P t ∨ Q t), from
  (assume t: A,
   classical.by_contradiction
    (assume h2: ¬¬(P t ∨ Q t),
     have h3: P t ∨ Q t, from classical.by_contradiction h2,
     h (exists.intro t h3))),

have h4: ¬ (P s ∨ Q s), from h1 s,

have h5: ¬ P s, from classical.by_contradiction
  (assume h6: ¬¬P s,
   have h7: P s, from classical.by_contradiction h6,
   have h8: P s ∨ Q s, from or.inl h7,
   h4 h8),
have h9: ¬ Q s, from classical.by_contradiction
  (assume h10: ¬¬Q s,
   have h11: Q s, from classical.by_contradiction h10,
   have h12: P s ∨ Q s, from or.inr h11,
   h4 h12),

have h13: ¬ P s ∧ ¬ Q s, from and.intro h5 h9,
show ¬P s ∧ ¬Q s, from h13

end fol_06