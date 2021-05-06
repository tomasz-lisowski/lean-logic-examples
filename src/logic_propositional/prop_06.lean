namespace prop_06

variables A B : Prop

theorem prop_6 : (A -> B) -> (A -> (A /\ B)) :=
assume h1: A → B,
assume h2: A,
have h3: B, from h1 h2,
show A ∧ B, from and.intro h2 h3

-- end namespace
end prop_06