

import category_theory.category

open category_theory

universes u_1 v_1

section
variables (C : Type u_1) [CC : category.{u_1} C]
include CC

def zorpodo {A B X Y : C} (i : category.hom A B) (p : category.hom X Y) :=
	forall (f : category.hom A X) (g : category.hom B Y) ,
		(category.comp f p = category.comp i g) ->
		exists (h : category.hom B X) ,
			(and (category.comp i h = f) (category.comp h p = g))





end

#check zorpodo

