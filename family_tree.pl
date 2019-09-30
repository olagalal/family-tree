male(omar).
male(mohamed).
male(maher).
male(ahmed).
male(amr).
male(kamal).
male(ali).
male(maged).
male(fathi).

female(yasmeen).
female(mona).
female(sara).
female(ghada).
female(samar).
female(soad).
female(dina).
female(magda).
female(aya).
female(hala).
female(esraa).

parent(omar,mohamed).
parent(omar,mona).
parent(yasmeen,mohamed).
parent(yasmeen,mona).

parent(maher,amr).
parent(maher,ahmed).
parent(mona,amr).
parent(mona,ahmed).

parent(mohamed,ghada).
parent(mohamed,samar).
parent(mohamed,soad).
parent(sara,ghada).
parent(sara,samar).
parent(sara,soad).

parent(amr,kamal).
parent(ghada,kamal).

parent(ahmed,magda).
parent(dina,magda).

parent(ahmed,ali).
parent(ahmed,aya).
parent(samar,ali).
parent(samar,aya).

parent(maged,hala).
parent(soad,hala).

parent(ali,fathi).
parent(hala,fathi).

parent(kamal,esraa).
parent(aya,esraa).

mother(X,Y) :-
    parent(X,Y),female(X).

father(X,Y) :-
    parent(X,Y),male(X).

grandfather(Z,Y) :-
    male(Z),
    parent(X,Y),
    parent(Z,X).


grandmother(Z,Y) :-
    female(Z),
    parent(X,Y),
    parent(Z,X).


brother(X,Y) :-
    male(X),
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

sister(X,Y) :-
    female(X),
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

uncle(X,Y) :-
    brother(X,P),
    parent(P,Y).

uncle(X,Y) :-
    sister(X,P),
    parent(P,Y).

aunt(X,Y) :-
    female(X),
    sister(X,MOM),
    mother(MOM,Y).

aunt(X,Y) :-
    female(X),
    sister(X,DAD),
    father(DAD,Y).

son(X,Y) :-
    male(X),
    parent(Y,X).

daughter(X,Y) :-
    female(X),
    parent(Y,X).


cousin(X,Y) :-
    uncle(UNC,X),
    father(UNC,Y).

cousin(X,Y):-
    aunt(UNC,X),
    mother(UNC,Y).

husband(omar,yasmeen).
husband(maher,mona).
husband(mohamed,sara).
husband(amr,ghada).
husband(ahmed,dina).
husband(ahmed,samar).
husband(maged,soad).
husband(ali,hala).
husband(kamal,aya).

wife(X,Y) :-
    female(X),
    husband(Y,X).

granddaughter(X,Y) :-
    female(X),
    parent(Y,DAD),
    daughter(X,DAD).

grandson(X,Y) :-
    male(X),
    parent(Y,DAD),
    son(X,DAD).

nephew(X,Y) :-
    male(X),
    parent(DAD,X),
    brother(DAD,Y).

nephew(X,Y) :-
    male(X),
    parent(DAD,X),
    sister(DAD,Y).

niece(X,Y) :-
    female(X),
    parent(DAD,X),
    brother(DAD,Y).

niece(X,Y):-
    female(X),
    parent(DAD,X),
    sister(DAD,Y).



