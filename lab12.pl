% Variant 3. Zhdanov Alexander


% 11
% max prime divider x

isPrime(X, CURR) :-
    CURR >= X
    ->  true
    ;   X mod CURR =:= 0
    ->  false
    ;   NEXTCURR is CURR + 1,
        isPrime(X, NEXTCURR).
isPrime(X) :-
    isPrime(X, 2).

isDiv(X, DIV) :- DIV mod X =:= 0.

task11(_, _, 1) :- !.
task11(X, RES, ITER) :-
    (isDiv(ITER, X), isPrime(ITER),
     RES is ITER;
     ITERprev is ITER-1, task11(X, RES, ITERprev)).
task11(X, RES) :-
    task11(X, RES, X).

% 12
% gcd max odd nonprime divider x && digits product x

gcd(0, Y, Y) :- !.
gcd(X, Y, RES) :- X =< Y, gcd(Y, X, RES).
gcd(X, Y, RES) :- X > Y, X1 is X mod Y, gcd(X1, Y, RES).

isodd(X) :- X mod 2 =\= 0.
iseven(X) :- X mod 2 =:= 0.

nonprime(_, 1) :- !, fail.
nonprime(X, ITER) :- X mod ITER =:= 0, !, true.
nonprime(X, ITER) :- ITER1 is ITER - 1, nonprime(X, ITER1).
isnonprime(X) :- nonprime(X, X-1).

mnPrimeDiv(_, 1, 1) :- !.
mnPrimeDiv(X, ITER, RES) :-
    isDiv(ITER, X), isnonprime(ITER), isodd(ITER),
    RES is ITER, !.
mnPrimeDiv(X, ITER, RES) :- ITER1 is ITER - 1, mnPrimeDiv(X, ITER1, RES).
mnPrimeDiv(X, RES) :- mnPrimeDiv(X, X, RES).

prod(0, RES, RES) :- !.
prod(X, ACC, RES) :-
    DIGIT is X mod 10,
    ACC1 is ACC * DIGIT,
    NEWX is X div 10,
    prod(NEWX, ACC1, RES).
prod(X, RES) :- prod(X, 1, RES).

findX(X, RES) :- iseven(X), NEWX is X / 2, findX(NEWX, RES).
findX(X, RES) :- mnPrimeDiv(X, RES).
findY(X, RES) :- prod(X, RES).

% gcd(X, Y).
task12(DIGITS, RES) :-
    findX(DIGITS, X),
    findY(DIGITS, Y),
    write(X), write(" "), write(Y),
    gcd(X, Y, RES).

% 13
% d < 1000: 1/d, find max longest period for repeating decimal, w/o
% lists
% example: d = 5 => 0,(2), L = 1. d = 6 => 0,(16), L = 2. etc.
%
% length of the period of fraction is equal to the exponent to
% which 10 belongs modulo b

while13(_, COUNTS, 1, COUNTS).
while13(D, COUNTS, R, RES) :-
    R =\= 1,
    R1 is (10 * R) mod D,
    COUNTS1 is COUNTS + 1,
    while13(D, COUNTS1, R1, RES).

% solve13(+D, -RES)
solve13(D, RES) :-
    while13(D, 1, 10, RES).

% 14
% predicat: return list length

length14([],0).
length14([_|T], CNTS) :- length(T,I), CNTS is I + 1.

% 15?20
% Variant 3 ? 3,11,13,15,27,30

getelem([Head|_], 0, Head) :- !.
getelem([_|Tail], I, ELEM) :-
    I1 is I-1,
    getelem(Tail, I1, ELEM).

% 15.3
% max

% max(, var(MAX)) :-
%   var(MAX), % check if MAX is unbounded,
%   MAX is 0,
%   max(_, MAX).

max([], MAX , MAX) :- !.
max([Head|Tail], CURR, MAX) :-
    (Head >= CURR, CURR1 is Head; CURR1 is CURR),
    max(Tail, CURR1, MAX).

%solve15(+List, +I)
solve15(List, I) :-
    getelem(List, I, ELEM),
    max(List, 0, MAX),
    MAX =:= ELEM.

% 16.11
% between

findNonX([H|T], X, RES) :-
    X =\= H -> RES is H, !
    ;
    findNonX(T, X, RES).


%solve16(+List, -RES)
solve16(List, RES) :-
    getelem(List, 0, X),
    getelem(List, 1, Y),
    getelem(List, 2, Z),
    X =:= Y -> findNonX(List, X, RES), !
    ;
    X =:= Z -> findNonX(List, X, RES), !
    ;
    Y =:= Z -> findNonX(List, Y, RES).

% 17.13
% ?????????? ???????? ????????????? ?? ????????????, ? ????? ???????

min([], MIN , MIN) :- !.
min([Head|Tail], CURR, MIN) :-
    (Head < CURR, CURR1 is Head; CURR1 is CURR),
    min(Tail, CURR1, MIN).

concat1(B, [], B) :- !.
concat1([], B, B) :- !.
concat1([H|T], B, [H|T2]) :-
    concat1(T, B, T2).

cut([H|T], H, ACC, ACC, [H|T]) :- !.
cut([H|T], TRGT, RESH, ACC, REST) :-
    concat1(ACC,[H], ACC2),
    cut(T, TRGT, RESH, ACC2, REST).

% solve17(+List, -ResList)
solve17(List, ResList) :-
    min(List, 100, MIN), % 100 replace to +inf
    cut(List, MIN, CUTTED, [], OTHERPART),
    concat1(OTHERPART, CUTTED, ResList).


% 18.15
% localmin

localmin([L|[CURR|[U|_]]], 1) :- CURR < L, CURR < U.

% localmin(+List, +I)
localmin([_|T], I) :-
    I1 is I - 1,
    localmin(T, I1).

% 19.27
% left shift

% solve19(+List, -ResList)
solve19(List, ResList) :-
    getelem(List, 1, ELEM),
    cut(List, ELEM, Before, [], After),
    concat1(After, Before, ResList).

% 20.30
% localmax

localmax([L|[CURR|[U|_]]], 1) :- CURR > L, CURR > U.

% localmin(+List, +I)
localmax([_|T], I) :-
    I1 is I - 1,
    localmax(T, I1).
