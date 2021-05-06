namespace prop_14

variables A B C : Prop

theorem prop_14 : ((A → C) ∨ (B → C)) → ((A ∧ B) → C) :=
assume h1: ((A → C) ∨ (B → C)),
assume h2: A ∧ B,
have h3: A, from and.left h2,
have h4: B, from and.right h2,
show C, from or.elim h1
    (assume h5: A → C,
     h5 h3)
    (assume h6: B → C,
     h6 h4)

-- end namespace
end prop_14