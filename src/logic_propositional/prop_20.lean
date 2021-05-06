namespace prop_20

variables P Q : Prop

theorem prop_20 : ¬ ¬ (P ∧ Q) → ¬ ¬ Q :=
assume h1: ¬ ¬ (P ∧ Q),
have h2: P ∧ Q, from (classical.by_contradiction
  (assume h2: ¬ (P ∧ Q),
   h1 h2)),
assume h3: ¬ Q,
have h4: Q, from and.right h2,
show false, from h3 h4

-- end namespace
end prop_20