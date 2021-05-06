namespace prop_11

variables A B : Prop

theorem prop_11 (h : ¬ A) : ¬ (A ∨ B) ∨ (¬ A ∧ B) :=
show ¬(A ∨ B) ∨ ¬A ∧ B,
from or.elim (classical.em ¬ B)
   (assume h1: ¬B,
    have h2: ¬ (A ∨ B), from
      (assume h3: A ∨ B,
       show false, from or.elim h3
         (assume h4: A, h h4)
         (assume h4: B, h1 h4)),
    show ¬(A ∨ B) ∨ ¬A ∧ B, from or.inl h2)
      (assume h5: ¬¬B,
       have h6: B, from classical.by_contradiction h5,
       have h7: ¬A ∧ B, from and.intro h h6,
       show ¬(A ∨ B) ∨ ¬A ∧ B, from or.inr h7)

-- end namespace
end prop_11