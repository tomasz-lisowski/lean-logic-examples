
namespace prop_21
/-
An example of a proof without use of classical rules.
-/

variable A : Prop

theorem prop_21 : ¬ (A ↔ ¬ A) :=
assume h1: A ↔ ¬ A,
have h2: A → (A → false), from h1.mp,
have h3: (A → false) → A, from h1.mpr,
have h4: A → false, from (assume h5: A, (h2 h5) h5),
have h6: A, from h3 h4,
show false, from h4 h6

/-
No classical logic used so should print `no axioms`.
-/
#print axioms prop_21

-- end namespace
end prop_21