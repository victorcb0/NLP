paragraph(paragraph(S, P)) --> s(S), paragraph(P).
paragraph(paragraph(PT, P)) --> point(PT), paragraph(P).
paragraph(paragraph(PT)) --> point(PT).

s(s(S1, S2)) --> s1(S1), s1(S2).
s(s(S1, S2)) --> s1(S1), s2(S2).
s(s(VP1, VP2)) --> vp(VP1), vp(VP2).

s1(s1(NP, VP)) --> np(NP), vp(VP).
s1(s1(NP, VP)) --> np2(NP), vp(VP).
s1(s1(C, VP)) --> conj(C), vp2(VP).
s2(s2(VP, NP)) --> vp3(VP), np(NP).

np(np(N)) --> n(N).
np(np(N, Adj)) --> n(N), adj(Adj).
np(np(PP, NP)) --> prep(PP), np(NP).
np(np(PP, NP)) --> prep(PP), np2(NP).
np(np(Art, NP)) --> art(Art), np(NP).
np(np(N, NP)) --> n(N), np(NP).
np(np(Adj, NP)) --> adj(Adj), np(NP).
np(np(PR, N)) --> pron(PR), n(N).
np(np(C, NP)) --> conj(C), np(NP).
np2(np2(N, VP)) --> n(N), vp(VP).
np2(np2(C, PR)) --> conj(C), pron(PR).
np2(np2(PR)) --> pron(PR).

vp(vp(V, NP)) --> v(V), np(NP).
vp(vp(V, VP)) --> v(V), vp(VP).
vp(vp(PR, VP)) --> pron(PR), vp(VP).
vp(vp(C, VP)) --> conj(C), vp2(VP).
vp(vp(V, Adv)) --> v(V), adv(Adv).
vp(vp(PP, V)) --> prep(PP), v(V).
vp(vp(Adv, VP)) --> adv(Adv), vp(VP).
vp2(vp2(V, NP)) --> v(V), np(NP).
vp2(vp2(V, Adv)) --> v(V), adv(Adv).
vp3(vp3(V)) --> v(V).



n(n(alex)) --> [alex].
n(n(birou)) --> [birou].
n(n(carte)) --> [carte].
n(n(paginile)) --> [paginile].
n(n(atentie)) --> [atentie].
n(n(sensul)) --> [sensul].
n(n(cuvant)) --> [cuvant].
n(n(cartea)) --> [cartea].
n(n(note)) --> [note].
n(n(margine)) --> [margine].
n(n(atentia)) --> [atentia].
n(n(pasaje)) --> [pasaje].
n(n(rabdare)) --> [rabdare].
n(n(final)) --> [final].
n(n(copertile)) --> [copertile].

v(v(asaza)) --> [asaza].
v(v(deschide)) --> [deschide].
v(v(citeste)) --> [citeste].
v(v(incercand)) --> [incercand].
v(v(inteleaga)) --> [inteleaga].
v(v(este)) --> [este].
v(v(atrag)) --> [atrag].
v(v(par)) --> [par].
v(v(continua)) --> [continua].
v(v(descifrat)) --> [descifrat].
v(v(inchide)) --> [inchide].
v(v(ramane)) --> [ramane].
v(v(admirand)) --> [admirand].

adv(adv(greu)) --> [greu].
adv(adv(ganditor)) --> [ganditor].
adv(adv(final)) --> [final].

adj(adj(veche)) --> [veche].
adj(adj(plina)) --> [plina].
adj(adj(scrise)) --> [scrise].
adj(adj(uzate)) --> [uzate].
adj(adj(ingalbenite)) --> [ingalbenite].

pron(pron(se)) --> [se].
pron(pron(fiecarui)) --> [fiecarui].
pron(pron(ii)) --> [ii].
pron(pron(el)) --> [el].
pron(pron(unele)) --> [unele].

prep(prep(la)) --> [la].
prep(prep(cu)) --> [cu].
prep(prep(de)) --> [de].
prep(prep(pe)) --> [pe].

conj(conj(si)) --> [si].
conj(conj(sa)) --> [sa].
conj(conj(care)) --> [care].
conj(conj(dar)) --> [dar].

art(art(o)) --> [o].

point(point('.')) --> ['.'].



test1(S, A) :-
    s(A, [alex, se, asaza, la, birou, si, deschide, o, carte, veche], []), s(A, S, []).

test2(S, A) :-
    s(A, [citeste, paginile, cu, atentie, incercand, sa, inteleaga, sensul, fiecarui, cuvant], []), s(A, S, []).

test3(S, A) :-
    s(A, [cartea, este, plina, de, note, scrise, pe, margine, care, ii, atrag, atentia], []), s(A, S, []).

test4(S, A) :-
    s(A, [unele, pasaje, ii, par, greu, de, descifrat, dar, el, continua, cu, rabdare], []), s(A, S, []).

test5(S, A) :-
    s(A, [la, final, inchide, cartea, si, ramane, ganditor, admirand, copertile, uzate, si, paginile, ingalbenite], []), s(A, S, []).

testp(P, A) :-
    paragraph(A, [alex, se, asaza, la, birou, si, deschide, o, carte, veche, '.',
                  citeste, paginile, cu, atentie, incercand, sa, inteleaga, sensul, fiecarui, cuvant, '.',
                  cartea, este, plina, de, note, scrise, pe, margine, care, ii, atrag, atentia, '.',
                  unele, pasaje, ii, par, greu, de, descifrat, dar, el, continua, cu, rabdare, '.',
                  la, final, inchide, cartea, si, ramane, ganditor, admirand, copertile, uzate, si, paginile, ingalbenite, '.'], []), paragraph(A, P, []).



test_doc :- tell('1.dcg-td/1.dcg-td.doc'),
    testp(P, A),
    write([prop, =, P]), nl,
    write([arb, =, A]), told.



test(_, _, 1000) :- !.
test(P, A, I) :-
    paragraph(A, [alex, se, asaza, la, birou, si, deschide, o, carte, veche, '.',
                  citeste, paginile, cu, atentie, incercand, sa, inteleaga, sensul, fiecarui, cuvant, '.',
                  cartea, este, plina, de, note, scrise, pe, margine, care, ii, atrag, atentia, '.',
                  unele, pasaje, ii, par, greu, de, descifrat, dar, el, continua, cu, rabdare, '.',
                  la, final, inchide, cartea, si, ramane, ganditor, admirand, copertile, uzate, si, paginile, ingalbenite, '.'], []),
    paragraph(A, P, []),
    I1 is I + 1,
    test(_, _, I1).

test_all :-
    tell('1.dcg-td/1.dcg-td-1000.doc'),
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
