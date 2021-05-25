namespace fol_17

-- Facts useful for calculation proofs:
#check @add_assoc
#check @add_comm
#check @add_zero
#check @zero_add
#check @mul_assoc
#check @mul_comm
#check @mul_one
#check @one_mul
#check @left_distrib
#check @right_distrib
#check @add_left_neg
#check @add_right_neg
#check @sub_eq_add_neg

variables x y z : int

-- Sub-example 1:
theorem t1 : x - x = 0 :=
calc
x - x   = x + -x : by rw sub_eq_add_neg
    ... = 0      : by rw add_right_neg

-- Sub-example 2:
theorem t2 (h : x + y = x + z) : y = z :=
calc
y       = 0 + y        : by rw zero_add
    ... = (-x + x) + y : by rw add_left_neg
    ... = -x + (x + y) : by rw add_assoc
    ... = -x + (x + z) : by rw h
    ... = (-x + x) + z : by rw add_assoc
    ... = 0 + z        : by rw add_left_neg
    ... = z            : by rw zero_add

theorem fol_17 (h : x + y = z + y) : x = z :=
calc
x       = x + 0        : by rw add_zero
    ... = x + (y + -y) : by rw add_right_neg
    ... = (x + y) + -y : by rw add_assoc
    ... = (z + y) + -y : by rw h
    ... = z + (y + -y) : by rw add_assoc
    ... = z + 0        : by rw add_right_neg
    ... = z            : by rw add_zero


end fol_17