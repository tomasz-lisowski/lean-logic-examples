namespace fol_11
open classical

axiom not_iff_not_self (P : Prop) : ¬ (P ↔ ¬ P)

-- Example of using the axiom:
example (Q : Prop) : ¬ (Q ↔ ¬ Q) :=
not_iff_not_self Q

section
  variable Person : Type
  variable shaves : Person → Person → Prop
  variable barber : Person
  variable h : ∀ x, shaves barber x ↔ ¬ shaves x x
include h

  theorem fol_11 : false :=
  have h1: shaves barber barber ↔ ¬ shaves barber barber, from h barber,
  have h2: shaves barber barber → ¬ shaves barber barber, from h1.mp,
  have h3: shaves barber barber, from iff.elim_right h1
    (assume h4: shaves barber barber,
     have h5: ¬ shaves barber barber, from h2 h4,
     h5 h4),
  have h6: ¬ shaves barber barber, from h2 h3,
  h6 h3
end

#check fol_11

end fol_11