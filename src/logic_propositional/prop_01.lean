namespace prop_01

variables A B : Prop

theorem prop_1 : A ∧ (A → B) → B :=
assume h1 : A ∧ (A → B),
show B, from
    (have h2: A → B, from and.right h1,
     have h3: A, from and.left h1,
     show B, from h2 h3)

-- end namespace
end prop_01