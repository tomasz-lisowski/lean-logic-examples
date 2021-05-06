namespace prop_13

variables A B C : Prop

theorem prop_13 : (A → (B → C)) → ((A ∧ B) → C) :=
assume h1: A → (B → C),
assume h2: A ∧ B,
have h3: A, from and.left h2,
have h4: B, from and.right h2,
have h5: B → C, from h1 h3,
show C, from h5 h4

-- end namespace
end prop_13