namespace fol_18

variable U : Type
variables P Q : U → Prop
variable c : U

theorem fol_18 (h : ∃ x, P x ∧ Q x ∧ ∀ y, P y → x = y) : P c → Q c :=
assume h1: P c,
have h2: P c ∧ Q c ∧ ∀ y, P y → c = y, from exists.elim h
  (assume s (h3: P s ∧ Q s ∧ ∀ y, P y → s = y),
   have h4: _, from and.right h3,
   have h5: _, from and.right h4,
   have h6: P c → s = c, from h5 c,
   have h7: s = c, from h6 h1,
   have h8: c = s, from eq.symm h7,
   begin
     rw h8,
     from h3
   end),
show Q c, from and.left (and.right h2)

end fol_18