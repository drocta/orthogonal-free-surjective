

import category_theory.category

open category_theory

universes u_1 v_1

section
variables (C : Type u_1) [CC : category.{v_1 u_1} C]
include CC

def orthogonal {A B X Y : C} (i : has_hom.hom A B) (p : has_hom.hom X Y) :=
	forall (f : has_hom.hom A X) (g : has_hom.hom B Y) ,
		(category_struct.comp f p = category_struct.comp i g) ->
		exists (h : has_hom.hom B X) ,
			(and (category_struct.comp i h = f) (category_struct.comp h p = g))
end

#check orthogonal

