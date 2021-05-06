namespace prop_08

variable P : Prop

theorem prop_8 : ¬ ¬ ¬ P → ¬ P :=
assume h1: ¬ ¬ ¬ P,
show ¬ P, from (classical.by_contradiction h1)

-- end namespace
end prop_08