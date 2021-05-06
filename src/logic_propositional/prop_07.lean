namespace prop_07

variable P : Prop

theorem prop_7 : P → ¬ ¬ P :=
assume h1: P,
assume h2: ¬ P,
show false, from h2 h1

-- end namespace
end prop_07