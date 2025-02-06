%:- ensure_loaded('4.parse-ded/inf-top-.pl').

% :- ensure_loaded('4.parse-ded/inf-bott.pl').

%:- ensure_loaded('4.parse-ded/inf-earley.pl').

%:- ensure_loaded('4.parse-ded/inf2-earley.pl').

% :- ensure_loaded('4.parse-ded/inf-ccg.pl').

:- ensure_loaded('4.parse-ded/inf-cyk.pl').

%:- ensure_loaded('4.parse-ded/inf-kay-td.pl').

%:- ensure_loaded('4.parse-ded/inf-kay-bu.pl').

%:- ensure_loaded('4.parse-ded/inf-kay-tdbu.pl').

initial_items(Items) :-
	all_solutions(Item, initial_item(Item), Items).

