namespace prop_03

variables A B : Prop

theorem prop_3 : ¬ (A ∧ B) → (A → ¬ B) :=
assume h1: ¬ (A ∧ B),
assume h2: A,
assume h3: B,
have h4: A ∧ B, from and.intro h2 h3,
show false, from h1 h4

-- end namespace
end prop_03