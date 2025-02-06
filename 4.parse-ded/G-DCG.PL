paragraph(paragraph(S, P)) ---> [s(S), paragraph(P)].
paragraph(paragraph(PT, P)) ---> [point(PT), paragraph(P)].
paragraph(paragraph(PT)) ---> [point(PT)].

s(s(S1, S2)) ---> [s1(S1), s1(S2)].
s(s(S1, S2)) ---> [s1(S1), s2(S2)].
s(s(VP1, VP2)) ---> [vp(VP1), vp(VP2)].

s1(s1(NP, VP)) ---> [np(NP), vp(VP)].
s1(s1(NP, VP)) ---> [np2(NP), vp(VP)].
s1(s1(C, VP)) ---> [conj(C), vp2(VP)].
s2(s2(VP, NP)) ---> [vp3(VP), np(NP)].

np(np(N)) ---> [n(N)].
np(np(N, Adj)) ---> [n(N), adj(Adj)].
np(np(PP, NP)) ---> [prep(PP), np(NP)].
np(np(PP, NP)) ---> [prep(PP), np2(NP)].
np(np(Art, NP)) ---> [art(Art), np(NP)].
np(np(N, NP)) ---> [n(N), np(NP)].
np(np(Adj, NP)) ---> [adj(Adj), np(NP)].
np(np(PR, N)) ---> [pron(PR), n(N)].
np(np(C, NP)) ---> [conj(C), np(NP)].
np2(np2(N, VP)) ---> [n(N), vp(VP)].
np2(np2(C, PR)) ---> [conj(C), pron(PR)].
np2(np2(PR)) ---> [pron(PR)].

vp(vp(V, NP)) ---> [v(V), np(NP)].
vp(vp(V, VP)) ---> [v(V), vp(VP)].
vp(vp(PR, VP)) ---> [pron(PR), vp(VP)].
vp(vp(C, VP)) ---> [conj(C), vp2(VP)].
vp(vp(V, Adv)) ---> [v(V), adv(Adv)].
vp(vp(PP, V)) ---> [prep(PP), v(V)].
vp(vp(Adv, VP)) ---> [adv(Adv), vp(VP)].
vp2(vp2(V, NP)) ---> [v(V), np(NP)].
vp2(vp2(V, Adv)) ---> [v(V), adv(Adv)].
vp3(vp3(V)) ---> [v(V)].


lex(alex, n(n(alex))).
lex(birou, n(n(birou))).
lex(carte, n(n(carte))).
lex(paginile, n(n(paginile))).
lex(atentie, n(n(atentie))).
lex(sensul, n(n(sensul))).
lex(cuvant, n(n(cuvant))).
lex(cartea, n(n(cartea))).
lex(note, n(n(note))).
lex(margine, n(n(margine))).
lex(atentia, n(n(atentia))).
lex(pasaje, n(n(pasaje))).
lex(rabdare, n(n(rabdare))).
lex(final, n(n(final))).
lex(copertile, n(n(copertile))).

lex(asaza, v(v(asaza))).
lex(deschide, v(v(deschide))).
lex(citeste, v(v(citeste))).
lex(incercand, v(v(incercand))).
lex(inteleaga, v(v(inteleaga))).
lex(este, v(v(este))).
lex(atrag, v(v(atrag))).
lex(par, v(v(par))).
lex(continua, v(v(continua))).
lex(descifrat, v(v(descifrat))).
lex(inchide, v(v(inchide))).
lex(ramane, v(v(ramane))).
lex(admirand, v(v(admirand))).

lex(greu, adv(adv(greu))).
lex(ganditor, adv(adv(ganditor))).
lex(final, adv(adv(final))).

lex(veche, adj(adj(veche))).
lex(plina, adj(adj(plina))).
lex(scrise, adj(adj(scrise))).
lex(uzate, adj(adj(uzate))).
lex(ingalbenite, adj(adj(ingalbenite))).

lex(se, pron(pron(se))).
lex(fiecarui, pron(pron(fiecarui))).
lex(ii, pron(pron(ii))).
lex(el, pron(pron(el))).
lex(unele, pron(pron(unele))).

lex(la, prep(prep(la))).
lex(cu, prep(prep(cu))).
lex(de, prep(prep(de))).
lex(pe, prep(prep(pe))).

lex(si, conj(conj(si))).
lex(sa, conj(conj(sa))).
lex(care, conj(conj(care))).
lex(dar, conj(conj(dar))).

lex(o, art(art(o))).

lex('.', point(point('.'))).



startsymbol(paragraph(_)).

exe([alex, se, asaza, la, birou, si, deschide, o, carte, veche, '.',
                  citeste, paginile, cu, atentie, incercand, sa, inteleaga, sensul, fiecarui, cuvant, '.',
                  cartea, este, plina, de, note, scrise, pe, margine, care, ii, atrag, atentia, '.',
                  unele, pasaje, ii, par, greu, de, descifrat, dar, el, continua, cu, rabdare, '.',
                  la, final, inchide, cartea, si, ramane, ganditor, admirand, copertile, uzate, si, paginile, ingalbenite, '.', .]).
