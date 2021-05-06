namespace prop_04

variables A B C D : Prop

theorem prop_4 (h1 : A ∨ B) (h2 : A → C) (h3 : B → D) : C ∨ D :=
show C ∨ D, from or.elim h1
    (assume h4: A,
     have h5: C, from h2 h4,
     show C ∨ D, from or.inl h5)
    (assume h6: B,
     have h7: D, from h3 h6,
     show C ∨ D, from or.inr h7)

-- end namespace
end prop_04