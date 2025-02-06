%:- use_module(library(readin)).

:- use_module(library(lists)).          %SICStus

%:- use_module('slibrary\lists.pl').

:-use_module(library(terms)).           %SICStus

:- op(1200, xfx,--->).

:- ensure_loaded('4.parse-ded/input').
:- ensure_loaded('4.parse-ded/driver').
:- ensure_loaded('4.parse-ded/items').
:- ensure_loaded('4.parse-ded/inference').
:- ensure_loaded('4.parse-ded/grammars').
:- ensure_loaded('4.parse-ded/utilities').
:- ensure_loaded('4.parse-ded/monitor').
