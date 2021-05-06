namespace prop_09

variables X Y : Prop

theorem prop_9 (h : X ∨ Y) (h2 : ¬ X) : Y :=
show Y, from or.elim h
    (assume h1: X,
     show Y, from (classical.by_contradiction
        (assume Y,
         h2 h1)))
    (assume h3: Y,
     h3)

-- end namespace
end prop_09