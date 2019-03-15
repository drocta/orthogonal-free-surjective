
import category_theory.category

import category_theory.concrete_category


open category_theory

section

universes u_1 u_2


inductive my_empty : Type u_1

inductive my_unit : Type u_1
| star : my_unit


-- typical example for c is a typeclass, like topological_space , with hom being something like continuous.
variables (c : Type u_1 -> Type u_2) (hom : (Pi {alpha beta : Type u_1}, c alpha -> c beta -> (alpha -> beta) -> Prop))

-- `c alpha` and `c beta` are like two objects of the category (I think), and alpha and beta are the underlying sets.
-- so, the element of (alpha -> beta) is a particular function between the sets
-- and the Prop is whether that particular function is a morphism ?
-- so, for `c x` to be free over x, then, need need that, for any 
-- wait, that doesn't seem right? concrete categories are characterized by having a (faithful) functor /into/ Set,
-- not having a functor /from/ Set.

-- ok, so continuous : (f : alpha -> beta) -> forall s, is_open s -> is_open (preimage f s)
-- where alpha and beta are each a topological_space , (topological_space is a typeclass)


variable my_concrete_category : concrete_category @hom


#check @forget
#check @forget c @hom my_concrete_category
#check (@forget c @hom my_concrete_category).obj
#check (@forget c @hom my_concrete_category).map


-- should the statement that an object X is free over a set/type of generators include the function from
-- the set of generators to the underlying set of X, in the statement,
-- or should it just assert that such a function exists?
-- I suspect the former, but it would be nice to be able to let said function be implicit.
-- todo: this currently only states that such a g exists. It should say that a _unique_ g exists.
def is_free_over (X : bundled c) (generators_of_X : Type u_1 ) (i : generators_of_X -> (@forget c @hom my_concrete_category).obj X) : Prop :=
  forall (Y : bundled c) (f : generators_of_X -> ((@forget c @hom my_concrete_category).obj Y)),
    ∃! (g : has_hom.hom X Y), f = ((@forget c @hom my_concrete_category).map g) ∘ i



#check is_free_over

end

