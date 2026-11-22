
% =====================================================================
% Task 3: Simple Relationships
% File: relationships.pl
% =====================================================================

% Facts about people and their relationships
% parent(Parent, Child)

% Grandparents
parent('Jas Bahadur', 'Krishna').
parent('Jas Bahadur', 'Shyam').

parent('Tilmaya', 'Krishna').
parent('Tilmaya', 'Shyam').

% Krishna's family
parent('Krishna', 'Isha').
parent('Krishna', 'Yunish').

parent('Rama', 'Isha').
parent('Rama', 'Yunish').

% Shyam's family
parent('Shyam', 'Sonish').
parent('Anjana', 'Sonish').

% Gender

male('Jas Bahadur').
male('Krishna').
male('Shyam').
male('Yunish').
male('Sonish').

female('Tilmaya').
female('Rama').
female('Isha').
female('Anjana').

% =====================================================================
% Rules for Relationships
% =====================================================================

% Father
father(X, Y) :-
    male(X),
    parent(X, Y).

% Mother
mother(X, Y) :-
    female(X),
    parent(X, Y).

% Grandparent
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Sibling
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Brother
brother(X, Y) :-
    male(X),
    sibling(X, Y).

% Sister
sister(X, Y) :-
    female(X),
    sibling(X, Y).

% Child
child(X, Y) :-
    parent(Y, X).

% Son
son(X, Y) :-
    male(X),
    parent(Y, X).

% Daughter
daughter(X, Y) :-
    female(X),
    parent(Y, X).

% Ancestor (recursive)
ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% Descendant (recursive)
descendant(X, Y) :-
    ancestor(Y, X).
