namespace prop_12

variables A B C : Prop

theorem prop_12 : (A → (B → C)) → ((B ∧ ¬ C) → ¬ A) :=
assume h1: A → (B → C),
assume h2: B ∧ ¬ C,
have h3: B, from and.left h2,
have h4: ¬ C, from and.right h2,
have h5: ¬ (B → C), from
    (assume h6: B → C,
     have h7: C, from h6 h3,
     h4 h7),
show ¬ A, from (classical.by_contradiction
    (assume h8: ¬ ¬ A,
     have h9: A, from (classical.by_contradiction h8),
     have h10: B → C, from h1 h9,
     h5 h10))

-- end namespace
end prop_12