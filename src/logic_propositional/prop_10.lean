namespace prop_10

variables A B : Prop

theorem prop_10 : ¬ (A ∨ ¬ B) ∨ (¬ A ∧ ¬ B) → ¬ A :=
assume h1: ¬ (A ∨ ¬ B) ∨ (¬ A ∧ ¬ B),
assume h2: A,
show false, from or.elim h1
    (assume h3: ¬(A ∨ ¬B),
     h3 (or.inl h2))
    (assume h4: ¬A ∧ ¬B,
     have h5: ¬ A, from and.left h4,
     h5 h2)

-- end namespace
end prop_10