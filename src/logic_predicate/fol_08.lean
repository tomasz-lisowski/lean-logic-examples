namespace fol_08

variable A : Type
variable f : A → A
variable P : A → Prop

variable  h : ∀ x, P x → P (f x)
include h

theorem fol_08 : ∀ y, P y → P (f (f y)) :=
assume y (h1: P y),
have h2: P y → P (f y), from h y,
have h3: P (f y), from h2 h1,
have h4: P (f y) → P (f (f y)), from h (f y),
show P (f (f y)), from h4 h3

end fol_08