namespace prop_16

variables A B : Prop

theorem prop_16 : ((¬ A → B) ∧ (¬ A → ¬ B)) → A :=
assume h1: (¬ A → B) ∧ (¬ A → ¬ B),
have h2: ¬ A → B, from and.left h1,
have h3: ¬ A → ¬ B, from and.right h1,
show A, from (classical.by_contradiction
    (assume h4: ¬ A,
     have h5: B, from h2 h4,
     have h6: ¬ B, from h3 h4,
     show false, from h6 h5))

-- end namespace
end prop_16