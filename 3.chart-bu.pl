:- dynamic arc/5.

inits(paragraph).



r(paragraph, [s, paragraph]).
r(paragraph, [point, paragraph]).
r(paragraph, [point]).

r(s, [s1, s1]).
r(s, [s1, s2]).
r(s, [vp, vp]).

r(s1, [np, vp]).
r(s1, [np2, vp]).
r(s1, [conj, vp2]).
r(s2, [vp3, np]).

r(np, [n]).
r(np, [n, adj]).
r(np, [prep, np]).
r(np, [prep, np2]).
r(np, [art, np]).
r(np, [n, np]).
r(np, [adj, np]).
r(np, [pron, n]).
r(np, [conj, np]).
r(np2, [n, vp]).
r(np2, [conj, pron]).
r(np2, [pron]).

r(vp, [v, np]).
r(vp, [v, vp]).
r(vp, [pron, vp]).
r(vp, [conj, vp2]).
r(vp, [v, adv]).
r(vp, [prep, v]).
r(vp, [adv, vp]).
r(vp2, [v, np]).
r(vp2, [v, adv]).
r(vp3, [v]).



w(n, alex).
w(n, birou).
w(n, carte).
w(n, paginile).
w(n, atentie).
w(n, sensul).
w(n, cuvant).
w(n, cartea).
w(n, note).
w(n, margine).
w(n, atentia).
w(n, pasaje).
w(n, rabdare).
w(n, final).
w(n, copertile).

w(v, asaza).
w(v, deschide).
w(v, citeste).
w(v, incercand).
w(v, inteleaga).
w(v, este).
w(v, atrag).
w(v, par).
w(v, continua).
w(v, descifrat).
w(v, inchide).
w(v, ramane).
w(v, admirand).

w(adv, greu).
w(adv, ganditor).
w(adv, final).

w(adj, veche).
w(adj, plina).
w(adj, scrise).
w(adj, uzate).
w(adj, ingalbenite).

w(pron, se).
w(pron, fiecarui).
w(pron, ii).
w(pron, el).
w(pron, unele).

w(prep, la).
w(prep, cu).
w(prep, de).
w(prep, pe).

w(conj, si).
w(conj, sa).
w(conj, care).
w(conj, dar).

w(art, o).

w(point, '.').



test(S) :-
    V0 is 1, inits(Sym), parse(V0, Vn, S),
    dofor(arc(V0, Vn, Sym, [], As), mwrite(As)),
    nl, retract2.

parse(V0, Vn, S) :-
    init_chart(V0, Vn, S),
    inits(_Sym). % , active(V0, Sym).

init_chart(V, V, []).
init_chart(V0, Vn, [W | Rw]) :-
    V1 is V0 + 1, dofor(w(N, W), 
    add_arc(V0, V1, N, [], [W, N])),
    init_chart(V1, Vn, Rw).

% active(V, LN) :-
%     dofor(r(LN, RN), add_arc(V, V, LN, RN, [LN])).

add_arc(V1, V2, Ln, RRn, Ap) :-
    arc(V1, V2, Ln, RRn, Ap), !.

add_arc(V1, V2, Ln, [], Aln) :-
    asserta(arc(V1, V2, Ln, [], Aln)),
    dofor(r(NLn, [Ln | RRn]),
          add_arc(V1, V1, NLn, [Ln | RRn], [NLn])),
    dofor(arc(V0, V1, NLn, [Ln | RRn], ANLn),
          add_arc(V0, V2, NLn, RRn, [Aln | ANLn])).

add_arc(V1, V2, Ln, [FRn | RRn], Aln) :-
    asserta(arc(V1, V2, Ln, [FRn | RRn], Aln)),
    dofor(arc(V2, V3, FRn, [], AFRn),
          add_arc(V1, V3, Ln, RRn, [AFRn | Aln])).
    % , active(V2, FRn).

dofor(X, Y) :-
    X, do(Y), fail.
dofor(_X, _Y).

do(Y) :-
    Y, !.

mwrite(Arb) :-
    invers(Arb, Ia),
    write(Ia), nl.

invers([], []) :- !.
invers(A, A) :- atomic(A).
invers([H | T], Ia) :-
    invers(H, Ih),
    invers(T, It),
    my_append(It, [Ih], Ia).

my_append([], L, L).
my_append([H | T], L, [H | S]) :-
    my_append(T, L, S).

retract1 :-
    retract(arc(A, B, C, D, E)).
    % X = arc(A, B, C, D, E),
    % write(X), nl, retract2.
retract1.



testp(P, As) :-
    P = [alex, se, asaza, la, birou, si, deschide, o, carte, veche, '.',
        citeste, paginile, cu, atentie, incercand, sa, inteleaga, sensul, fiecarui, cuvant, '.',
        cartea, este, plina, de, note, scrise, pe, margine, care, ii, atrag, atentia, '.',
        unele, pasaje, ii, par, greu, de, descifrat, dar, el, continua, cu, rabdare, '.',
        la, final, inchide, cartea, si, ramane, ganditor, admirand, copertile, uzate, si, paginile, ingalbenite, '.'],
    V0 is 1, inits(Sym), parse(V0, Vn, P),
    dofor(arc(V0, Vn, Sym, [], As), mwrite(As)). % , nl, retract2.



test_doc :- tell('3.chart/3.chart-bu.doc'),
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
    V0 is 1, inits(Sym), 
    parse(V0, Vn, P),
    arc(V0, Vn, Sym, [], A), 
    I1 is I + 1, 
    test(_S1, _A1, I1).

test_all :-
    tell('3.chart/3.chart-bu-1000.doc'),
    findall((E, ' : ', A), test(E, A, 0), L),
    nl, write_l(L).

write_l([]) :- !.
write_l([H | T]) :-
    write(H), nl, 
    write_l(T).

test_time :-
    statistics(walltime, [Start, _]),
    test_all,
    statistics(walltime, [End, _]),
    Time is End - Start,
    nl, retract1, nl,
    format('All solutions found in ~3d seconds.~n', [Time]), told.
