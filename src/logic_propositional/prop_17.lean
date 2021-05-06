namespace prop_17

variables A B : Prop

theorem prop_17 : ¬ (¬ A ∧ ¬ B) → (A ∨ B) :=
assume h1: ¬ (¬ A ∧ ¬ B),
show A ∨ B, from or.elim (classical.em A)
    (assume h2: A, or.inl h2)
    (assume h3: ¬ A,
     show A ∨ B, from or.inr
        (show B, from (classical.by_contradiction
            (assume h4: ¬ B,
             have h5: ¬ A ∧ ¬ B, from and.intro h3 h4,
             h1 h5))))

-- end namespace
end prop_17