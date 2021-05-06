namespace prop_05

variables A B : Prop

theorem prop_5 : (¬ A ∧ ¬ B) → ¬ (A ∨ B) :=
assume h1: ¬ A ∧ ¬ B,
have h2: ¬ A, from and.left h1,
have h3: ¬ B, from and.right h1,
assume h4: A ∨ B,
show false, from or.elim h4
  (assume h5: A,
   h2 h5)
  (assume h6: B,
   h3 h6)

-- end namespace
end prop_05