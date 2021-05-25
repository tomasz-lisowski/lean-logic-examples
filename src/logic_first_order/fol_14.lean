namespace fol_14

variable A : Type
variable P : A → Prop
variables c d : A

theorem fol_14 (h : ∀ x, P c → P x) : P c → P d :=
assume h1: P c,
show P d, from (h d) h1

end fol_14