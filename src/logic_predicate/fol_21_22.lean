namespace fol_21_22

-- Proof of equivalence for:
-- ∃ x, A x ∧ ∀ y, (A y → y = x)
-- (∃ x, A x) ∧ (∀ y y', A y ∧ A y' → y = y')

variable U : Type
variable A : U → Prop

theorem fol_21 : (∃ x, A x ∧ ∀ y, (A y → y = x)) →
  ((∃ x, A x) ∧ (∀ y y', A y ∧ A y' → y = y')) :=
assume h1: (∃ x, A x ∧ (∀ y, A y → y = x)),
exists.elim h1
  (assume t (h2: (A t ∧ ∀ y, A y → y = t)),
   have h3: A t, from and.left h2,
   have h4: ∀ y, A y → y = t, from and.right h2,
   have h5: ∀ y z , A y ∧ A z → y = z, from
    (assume s: U,
     assume k: U,
     have h6: A s → s = t, from h4 s,
     have h7: A k → k = t, from h4 k,
     assume h8: A s ∧ A k,
     have h9: A s, from and.left h8,
     have h10: A k, from and.right h8,
     have h11: s = t, from h6 h9,
     have h12: k = t, from h7 h10,
     show s = k, from eq.trans h11 (eq.symm h12)),
   and.intro (exists.intro t h3) h5)

theorem fol_22 : ((∃ x, A x) ∧ (∀ y y', A y ∧ A y' → y = y')) →
  (∃ x, A x ∧ ∀ y, (A y → y = x)) :=
assume h1: (∃ x, A x) ∧ (∀ y y', A y ∧ A y' → y = y'),
have h2: ∃ x, A x, from and.left h1,
have h3: ∀ y y', A y ∧ A y' → y = y', from and.right h1,
exists.elim h2
  (assume t (h4: A t),
   have h5: ∀ (y : U), A y → y = t, from
    (assume s (h6: A s),
     have h7: A s ∧ A t → s = t, from h3 s t,
     show s = t, from h7 (and.intro h6 h4)),
   have h8: A t ∧ ∀ (y : U), A y → y = t, from and.intro h4 h5,
   exists.intro t h8)

#check fol_21

#check fol_22

end fol_21_22