% family_tree.pl
% Family Tree Program for logic programming assignment

% --------- Facts ---------
male(john).
male(paul).
male(mike).
male(tom).
male(luke).

female(susan).
female(mary).
female(linda).
female(anna).
female(kate).

% Parent relationships
parent(john, mary).
parent(susan, mary).
parent(john, tom).
parent(susan, tom).

parent(paul, linda).
parent(mike, linda).
parent(paul, anna).
parent(mike, anna).

parent(mary, alice).
parent(linda, charlie).
parent(anna, diana).

parent(alice, emma).
parent(alice, frank).
parent(charlie, george).

% --------- Rules ---------
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

cousin(X, Y) :-
    parent(PX, X),
    parent(PY, Y),
    sibling(PX, PY),
    X \= Y.

descendant(A, D) :-
    parent(A, D).
descendant(A, D) :-
    parent(A, X),
    descendant(X, D).

ancestor(D, A) :-
    descendant(A, D).

uncle_aunt(U, N) :-
    parent(P, N),
    sibling(U, P).
