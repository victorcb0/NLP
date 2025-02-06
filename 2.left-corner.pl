leaf(n) --> [alex].
leaf(n) --> [birou].
leaf(n) --> [carte].
leaf(n) --> [paginile].
leaf(n) --> [atentie].
leaf(n) --> [sensul].
leaf(n) --> [cuvant].
leaf(n) --> [cartea].
leaf(n) --> [note].
leaf(n) --> [margine].
leaf(n) --> [atentia].
leaf(n) --> [pasaje].
leaf(n) --> [rabdare].
leaf(n) --> [final].
leaf(n) --> [copertile].

leaf(v) --> [asaza].
leaf(v) --> [deschide].
leaf(v) --> [citeste].
leaf(v) --> [incercand].
leaf(v) --> [inteleaga].
leaf(v) --> [este].
leaf(v) --> [atrag].
leaf(v) --> [par].
leaf(v) --> [continua].
leaf(v) --> [descifrat].
leaf(v) --> [inchide].
leaf(v) --> [ramane].
leaf(v) --> [admirand].

leaf(adv) --> [greu].
leaf(adv) --> [ganditor].
leaf(adv) --> [final].

leaf(adj) --> [veche].
leaf(adj) --> [plina].
leaf(adj) --> [scrise].
leaf(adj) --> [uzate].
leaf(adj) --> [ingalbenite].

leaf(pron) --> [se].
leaf(pron) --> [fiecarui].
leaf(pron) --> [ii].
leaf(pron) --> [el].
leaf(pron) --> [unele].

leaf(prep) --> [la].
leaf(prep) --> [cu].
leaf(prep) --> [de].
leaf(prep) --> [pe].

leaf(conj) --> [si].
leaf(conj) --> [sa].
leaf(conj) --> [care].
leaf(conj) --> [dar].

leaf(art) --> [o].

leaf(point) --> ['.'].



lcd(s, paragraph) :- !.
lcd(point, paragraph) :- !.

lcd(s, paragraph) :- !.
lcd(s1, s) :- !.
lcd(vp, s) :- !.

lcd(np, s1) :- !.
lcd(np2, s1) :- !.
lcd(conj, s1) :- !.

lcd(vp3, s2) :- !.

lcd(n, np) :- !.
lcd(prep, np) :- !.
lcd(art, np) :- !.
lcd(adj, np) :- !.
lcd(pron, np) :- !.
lcd(conj, np) :- !.

lcd(n, np2) :- !.
lcd(conj, np2) :- !.
lcd(pron, np2) :- !.

lcd(v, vp3).
lcd(v, vp) :- !.

lcd(pron, vp) :- !.
lcd(conj, vp) :- !.
lcd(prep, vp) :- !.
lcd(adv, vp) :- !.
lcd(v, vp2) :- !.

lc(X, X) :- !.
lc(X, Y) :- lcd(X, Y), !.
lc(X, Y) :- lcd(X, Z), lc(Z, Y).



parse(Nterm, As, [W0 | W1], Wn) :-
     leaf(Pterm, [W0 | W1], W1),
     lc(Pterm, Nterm),
     Ap =.. [Pterm, W0],
     P =.. [Pterm, Nterm, Ap, As, W1, Wn],
     call(P).



paragraph(paragraph, A, A) --> [].

s(s, A, A) --> [].
s(Nt, S, As) --> {lc(paragraph, Nt)}, parse(paragraph, P), paragraph(Nt, paragraph(S, P), As), !.

point(point, A, A) --> [].
point(Nt, PT, As) --> {lc(paragraph, Nt)}, parse(paragraph, P), paragraph(Nt, paragraph(PT, P), As), !.
point(Nt, PT, As) --> {lc(paragraph, Nt)}, paragraph(Nt, paragraph(PT), As), !.   

s1(s1, A, A) --> [].
s1(Nt, S1, As) --> {lc(s, Nt)}, parse(s1, S11), s(Nt, s(S1, S11), As).
s1(Nt, S1, As) --> {lc(s, Nt)}, parse(s2, S2), s(Nt, s(S1, S2), As).
s2(s2, A, A) --> [].

n(n, A, A) --> [].
n(Nt, N, As) --> {lc(np, Nt)}, np(Nt, np(N), As).
n(Nt, N, As) --> {lc(np, Nt)}, parse(adj, Adj), np(Nt, np(N, Adj), As).
n(Nt, N, As) --> {lc(np, Nt)}, parse(np, NP), np(Nt, np(N, NP), As).
n(Nt, N, As) --> {lc(np2, Nt)}, parse(vp, VP), np2(Nt, np2(N, VP), As).

np(np, A, A) --> [].
np(Nt, NP, As) --> {lc(s1, Nt)}, parse(vp, VP), s1(Nt, s1(NP, VP), As).

np2(np2, A, A) --> [].
np2(Nt, NP2, As) --> {lc(s1, Nt)}, parse(vp, VP), s1(Nt, s1(NP2, VP), As).

v(v, A, A) --> [].
v(Nt, V, As) --> {lc(vp, Nt)}, parse(np, NP), vp(Nt, vp(V, NP), As).
v(Nt, V, As) --> {lc(vp, Nt)}, parse(vp, VP), vp(Nt, vp(V, VP), As).
v(Nt, V, As) --> {lc(vp, Nt)}, parse(adv, Adv), vp(Nt, vp(V, Adv), As).
v(Nt, V, As) --> {lc(vp2, Nt)}, parse(np, NP), vp2(Nt, vp2(V, NP), As).
v(Nt, V, As) --> {lc(vp2, Nt)}, parse(adv, Adv), vp2(Nt, vp2(V, Adv), As).
v(Nt, V, As) --> {lc(vp3, Nt)}, vp3(Nt, vp3(V), As).

vp(vp, A, A) --> [].
vp(Nt, VP1, As) --> {lc(s, Nt)}, parse(vp, VP2), s(Nt, s(VP1, VP2), As).

vp2(vp2, A, A) --> [].

vp3(vp3, A, A) --> [].
vp3(Nt, VP, As) --> {lc(s2, Nt)}, parse(np, NP), s2(Nt, s2(VP, NP), As).

conj(conj, A, A) --> [].
conj(Nt, Conj, As) --> {lc(s1, Nt)}, parse(vp2, VP2), s1(Nt, s1(Conj, VP2), As).
conj(Nt, Conj, As) --> {lc(np, Nt)}, parse(np, NP), np(Nt, np(Conj, NP), As).
conj(Nt, Conj, As) --> {lc(np2, Nt)}, parse(pron, PR), np2(Nt, np2(Conj, PR), As).
conj(Nt, Conj, As) --> {lc(vp, Nt)}, parse(vp2, VP2), vp(Nt, vp(Conj, VP2), As).

adj(adj, A, A) --> [].
adj(Nt, Adj, As) --> {lc(np, Nt)}, parse(np, NP), np(Nt, np(Adj, NP), As).

pron(pron, A, A) --> [].
pron(Nt, PR, As) --> {lc(np, Nt)}, parse(n, N), np(Nt, np(PR, N), As).
pron(Nt, PR, As) --> {lc(np2, Nt)}, np2(Nt, np2(PR), As).
pron(Nt, PR, As) --> {lc(vp, Nt)}, parse(vp, VP), vp(Nt, vp(PR, VP), As).

prep(prep, A, A) --> [].
prep(Nt, PP, As) --> {lc(np, Nt)}, parse(np, NP), np(Nt, np(PP, NP), As).
prep(Nt, PP, As) --> {lc(np, Nt)}, parse(np2, NP2), np(Nt, np(PP, NP2), As).
prep(Nt, PP, As) --> {lc(vp, Nt)}, parse(v, V), vp(Nt, vp(PP, V), As).

art(art, A, A) --> [].
art(Nt, Art, As) --> {lc(np, Nt)}, parse(np, NP), np(Nt, np(Art, NP), As).

adv(adv, A, A) --> [].
adv(Nt, Adv, As) --> {lc(vp, Nt)}, parse(vp, VP), vp(Nt, vp(Adv, VP), As).



test1(_S, A) :- 
    parse(s, A, [alex, se, asaza, la, birou, si, deschide, o, carte, veche], []).

test2(_S, A) :- 
    parse(s, A, [citeste, paginile, cu, atentie, incercand, sa, inteleaga, sensul, fiecarui, cuvant], []).

test3(_S, A) :- 
    parse(s, A, [cartea, este, plina, de, note, scrise, pe, margine, care, ii, atrag, atentia], []).

test4(_S, A) :- 
    parse(s, A, [unele, pasaje, ii, par, greu, de, descifrat, dar, el, continua, cu, rabdare], []).

test5(_S, A) :- 
    parse(s, A, [la, final, inchide, cartea, si, ramane, ganditor, admirand, copertile, uzate, si, paginile, ingalbenite], []).

testp(_P, A) :- 
    parse(paragraph, A, [alex, se, asaza, la, birou, si, deschide, o, carte, veche, '.',
              		citeste, paginile, cu, atentie, incercand, sa, inteleaga, sensul, fiecarui, cuvant, '.',
              		cartea, este, plina, de, note, scrise, pe, margine, care, ii, atrag, atentia, '.',
              		unele, pasaje, ii, par, greu, de, descifrat, dar, el, continua, cu, rabdare, '.',
              		la, final, inchide, cartea, si, ramane, ganditor, admirand, copertile, uzate, si, paginile, ingalbenite, '.'], []).



test_doc :- tell('2.left-corner/2.left-corner.doc'),
    testp(P, A),
    write([prop, =, P]), nl,
    write([arb, =, A]), told.



test(_, _, 1000) :- !.
test(P, A, I) :-
    P = [alex, se, asaza, la, birou, si, deschide, o, carte, veche, '.',
         citeste, paginile, cu, atentie, incercand, sa, inteleaga, sensul, fiecarui, cuvant, '.',
         cartea, este, plina, de, note, scrise, pe, margine, care, ii, atrag, atentia, '.',
         unele, pasaje, ii, par, greu, de, descifrat, dar, el, continua, cu, rabdare, '.',
         la, final, inchide, cartea, si, ramane, ganditor, admirand, copertile, uzate, si, paginile, ingalbenite, '.'],
    parse(paragraph, A, P, []),
    I1 is I + 1,
    test(_, _, I1).

test_all :-
    tell('2.left-corner/2.left-corner-1000.doc'),
    findall((E, ' : ', A), test(E, A, 0), L),
    nl, write_l(L).

write_l([]) :- !.
write_l([H | T]) :-
    write(H), nl,
    write_l(T).

test_time :-
    statistics(walltime, [Start, _]),
    test_all, nl,
    statistics(walltime, [End, _]),
    Time is End - Start,
    format('All solutions in ~3d seconds.~n', [Time]), told.
