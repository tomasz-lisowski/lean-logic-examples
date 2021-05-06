namespace prop_19

variables A B : Prop

theorem prop_19 : (¬ ¬ A ∧ ¬ ¬ (A → B)) → ¬ ¬ B :=
assume h1: ¬ ¬ A ∧ ¬ ¬ (A → B),
have h2: ¬ ¬ A, from and.left h1,
have h3: A, from (classical.by_contradiction
  (assume h4: ¬ A,
   h2 h4)),
have h5: ¬ ¬ (A → B), from and.right h1,
have h6: A → B, from (classical.by_contradiction
  (assume h7: ¬(A → B),
   h5 h7)),
assume h8: ¬ B,
show false, from h8 (h6 h3)

-- end namespace
end prop_19