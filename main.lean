import .free
-- import .orthogonal -- not being used yet, so commenting out because it takes a while to compile.

universes u v w

#check my_unit.{u}
#check my_unit.star

open category_theory

-- todo : maybe the definition of initial and final objects should be in another file?

section

variables (C : Type u) [CC : category.{v u} C]
include CC

def initial_object (I : C) : Prop :=
	forall (X : C), ∃! ( i : I ⟶  X), true


end


#check initial_object

#check my_empty.cases_on

#check empty.cases_on

def emptyf {X : Type w} (impossibility : my_empty.{u} ) :  X :=
begin
induction impossibility
end

#check emptyf

section

variables (c : Type u -> Type v) (hom : (Pi {alpha beta : Type u}, c alpha -> c beta -> (alpha -> beta) -> Prop))

#check concrete_category

variable C : concrete_category @hom

#check @is_free_over

variable [C2 : category (bundled c)]

#check @initial_object
#check @initial_object (bundled c)
#check @initial_object (bundled c) C2


theorem free_over_empty_implies_initial (A : (bundled c)) [C3 : category (bundled c)]: (@is_free_over c @hom C A my_empty.{u} emptyf) -> (@initial_object (bundled c) C3 A) :=
	sorry


end

