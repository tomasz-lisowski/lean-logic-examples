namespace prop_02

variables A B : Prop

theorem prop_2 : A → ¬ (¬ A ∧ B) :=
assume h1: A,
assume h2: ¬ A ∧ B,
have h3: ¬ A, from and.left h2,
show false, from h3 h1

-- end namespace
end prop_02