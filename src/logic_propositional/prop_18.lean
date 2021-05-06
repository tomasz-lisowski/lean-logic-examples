namespace prop_18

variables P Q : Prop

theorem prop_18 : ¬ (P ∧ Q) → ¬¬ (¬ P ∨ ¬ Q) :=
assume h1: ¬ (P ∧ Q),
assume h2: ¬(¬P ∨ ¬Q),
have h3: ¬ P ∨ ¬ Q, from or.elim
    (classical.em P)
    (assume h4: P,
     have h5: Q, from (classical.by_contradiction
        (assume h6: ¬ Q,
         h2 (or.inr h6))),
     have h7: P ∧ Q, from and.intro h4 h5,
     have h8: false, from h1 h7, classical.by_contradiction
        (assume h9: ¬(¬P ∨ ¬Q),
         h8))
        (assume h10: ¬ P,
         or.inl h10),
show false, from h2 h3

-- end namespace
end prop_18