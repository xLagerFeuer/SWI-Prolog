% Variant 3. Zhdanoff Alexander
% 11-13: 39, 45, 51

readlist(X,Y):-readlist([],X,0,Y).
readlist(A,A,G,G):-!.
readlist(A,B,C,D):- C1 is C+1,read(X),append(A,[X],A1),readlist(A1,B,C1,D).

% 39
% ��� ������������� ������. ���������� ������� ������� ��� �������� �
% ������� ���������, � ����� - � ���������.

writeEven([]) :- !.
writeEven([H]) :- write(H), !.
writeEven([EV1|[_| EV2]]) :-
    write(EV1), writeEven(EV2).

% solve39()
solve39([H|T]) :-
    writeEven([H|T]),
    writeEven(T).

% 45
% ��� ������������� ������ � �������� a..b. ���������� �����
% ����� ���������, �������� ������� �������� � ���� ��������.

search([], _, _, _) :- !.
search([H|T], A, B, [H|T2]) :- H >= A, H =< B, search(T, A, B, T2).
search([_|T], A, B, T2) :- search(T, A, B, T2).

getSum([], RES, RES) :- !.
getSum([H|T], ACC, Sum) :- ACC2 is ACC + H, getSum(T, ACC2, Sum).
getSum([H|T], Sum) :- getSum([H|T], 0, Sum).

%solve45(+List, ?A, ?B, -Sum)
solve45(List, A, B, Sum) :-
    search(List, A, B, ResList),
    getSum(ResList, Sum).

% 51
% ��� ���������� ������ ��������� ��� ������ L1 � L2, ��� �������� L1
% ��� ��������������� �������� ��������� ������, � ������� ������ L2 �
% ������� i ����������, ������� ��� ������� ������ L1 � ����� �������
% ����������� � ��������.

contains([], _):- !, fail.
contains([H|_], H):- !, true.
contains([_|T], N):- contains(T, N).

append51([],X,X).
append51([X|T],Y,[X|T1]) :- append51(T,Y,T1).

increment([], _, _) :- !.
increment([[P1|Freq]|T], P1, [[P1|Freq1]|T]) :-
    Freq1 is Freq + 1.
increment([P|T], H, [P|T1]) :-
    increment(T, H, T1).

search51([], ResUniqal, ResNEnum, ResUniqal, ResNEnum) :- !.
search51([H|T], Uniqal, NEnum, ResUniqal, ResNEnum) :-
    contains(Uniqal, H),
    increment(NEnum, H, NEnum1),
    search51(T, Uniqal, NEnum1, ResUniqal, ResNEnum).
search51([H|T], Uniqal, NEnum, ResUniqal, ResNEnum) :-
    append51(NEnum, [[H|1]], NEnum1),
    append51(Uniqal, [H], Uniqal1),
    search51(T, Uniqal1, NEnum1, ResUniqal, ResNEnum).

% solve51(+List, ?Uniqal, ?NEnum)
solve51(List, Uniqal, NEnum) :-
    search51(List, [], [], Uniqal, NEnum).


% 14
% �������� ���� ������: ���������, �����, ������. ������ ������ ����������:
% ����������, ��� ���� �� ��� �������, ������ ������, ������ - �����, �� �� � ���� ���� ����� �� ������������� �������.
% ��������� ����� � ������� �� ������?

haircolor(white).
haircolor(rishii).
haircolor(black).
person(belokurov).
person(rishov).
person(chernov).

itnot(belokurov, white).
itnot(rishov, rishii).
itnot(chernov, black).

findAll(Person, Hair) :- person(Person),haircolor(Hair), not(itnot(Person, Hair)).

% 15
% ������� 15. ��� ������� ����� � �����, ������� � ����� ������� � ���-
% ���. ��������, ��� ������ � ��� ����� ������ � ������ ���������. ��
% �����, �� ������ ���� �� ���� ������. ������ ���� � ������� ������.
% ���������� ����� ������ � ������ �� ������ �� ������.

person(anya).
person(valya).
person(natasha).

colors(white).
colors(green).
colors(blue).

dress(anya, white).
dress(valya, green).
dress(natasha, blue).

shoes(anya, white).
shoes(valya, blue).
shoes(natasha, green).

colorsPerson(Person, Colordress, Colorshoes) :-
    dress(Person, Colordress),
    shoes(Person, Colorshoes).

% 16

person(borisov).
person(ivanov).
person(semenov).

proffesion(tokar).
proffesion(slesar).
proffesion(svarshik).

person2proffesion(borisov, tokar).
person2proffesion(ivanov, slesar).
person2proffesion(semenov, svarshik).


person(borisova).

native(borisov, borisova).

name2proffesion(Name, Proffesion) :-
    person(name),
    proffesion(Proffesion),
    person2proffesion(Name, Proffesion).

% 17

item(bottle).
item(stakan).
item(jug).
item(jar).

drink(milk).
drink(lemonade).
drink(kvass).
drink(water).

itnot(water, bottle).
itnot(milk, bottle).

drinkbetween(lemonade, jug, kvass).
itembetween(stakan, jar, milk).
% �������������
itnot(kvass, jug).
itnot(lemonade, jug).

itnot(milk, stakan).
itnot(milk, jar).

itnot(lemonade, jar).
itnot(water, jar).

item2drink(stakan, lemonade).
item2drink(jug, milk).
item2drink(bottle, water).
item2drink(jar, kvass).

verify17(X, Y) :-
    not(itnot(X, Y)),
    item(X),
    drink(Y),
    item2drink(X, Y).

% 18

person(voronov).
person(pavlov).
person(levickii).
person(saharov).

proffesion(dancer).
proffesion(artist).
proffesion(singer).
proffesion(writer).

itnot(voronov, singer).
itnot(levickii, singer).

itnot(pavlov, artist).
itnot(pavlov, writer).

itnot(saharov, writer).
itnot(voronov, writer).

itnot(levickii, artist).

person2proffesion(levickii, writer).
verify18(X, Y) :-
    not(itnot(X, Y))
    ;
    person2proffesion(X, Y).

% 19

person(mike).
person(simon).
person(richard).

nation(amercian).
nation(australian).
nation(israeli).

pr(basketball).
pr(tennis).
pr(kriket).

itnot(mike, american).
it(simon, israeli).
it(richard, american).
it(mike, australian).

p2pr(mike, basketball).
p2pr(simon, kriket).
p2pr(richard, tennis).

% 20.3

person(pyotr).
person(roman).
person(sergey).

faculty(physic).
faculty(chemic).
faculty(math).

cond1(pyotr, math).
res1(sergey, chemic).

cond2(roman, chemic).
res2(pyotr, math).

cond3(sergey, physic).
res3(roman, chemic).

% verify20(X, Y) :-
