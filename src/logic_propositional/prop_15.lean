namespace prop_15

variables A B C : Prop

open classical

theorem prop_15 : ((A ∧ B) → C) → ((A → C) ∨ (B → C)) :=
assume h1 : (A ∧ B) → C,
show (A → C) ∨ (B → C), from or.elim (classical.em B)
    (assume h2: B,
     show (A → C) ∨ (B → C), from or.inl
        (assume h3: A,
         h1 (and.intro h3 h2)))
    (assume h4: ¬ B,
     show (A → C) ∨ (B → C), from or.inr
        (assume h5: B,
         have h6: false, from h4 h5,
         show C, from (classical.by_contradiction
            (assume hnc: ¬ C,
             h6))))

-- end namespace
end prop_15