initial_item(item('<start>', [Start], 0, 0)) :- 
	startsymbol(Start).

initial_item( item(A,[],I,I1) ):-
		word(I1, Aterm),
		lex(Aterm, A),
		I is I1-1.			   

final_item(item(Start, [],  0, Length), Start) :-
	startsymbol(Start), 
	sentencelength(Length).

item_to_key(item(_A, [B|_Beta], _I, J), Hash) :-
	B =.. [Bcat|_],
	hash_term(a(J, Bcat), Hash).

item_to_key(item(A, [], I, _J), Hash) :-
	A =.. [Acat|_],
	hash_term(p(I, Acat), Hash).

inference(kayrule,
	[item(A, [B|Beta], I, J),
	item(B , [], J, K) ],
	item(A, Beta, I, K),     
	[]).

inference(buclatd,
	[item(A, [B|Beta], I, J)],
	item(B, Gama, J, J),     
	[(B ---> Gama)]).

inference(buclabu,
	[item(B , [], J, K)],
	item(A, [B|Beta] , J, J),     
	[(A ---> [B|Beta] )]).

test:- tell('4.parse-ded-ft/rez_ded_kay_td_bu.doc'),parse(X).
testf:-tell('4.parse-ded-ft/rez_ded_kay_td_bu-trasare.doc'),assert(trasare),parse(X),nl,nl,listing(word),listing(stored),listing(key_index),retract(trasare).
