man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

% Variant 3. Zhdanoff Alexander
% TODO: Нарисовать связи, чтобы можно было показать

%11
daughter(X,Y):- parent(Y,X),woman(X),!.
daughter(X):- parent(X,Y),woman(Y),!.

daughter(duhovlad).

%12
wife(X, Y) :- man(Y),woman(X),parent(X, Z),parent(Y, Z),!.
wife(X):- man(X),parent(X,Z),parent(Y,Z),woman(Y),!.

wife(duhovlad).

%13
grand_ma(X,Y) :- parent(Z,Y), parent(X,Z),!.
grand_ma(X) :- parent(Z,X),parent(Y,Z),woman(Y),!.

grand_ma(duhovlad).

%14
grand_ma_and_da(X,Y) :- grandma(X,Y),woman(Y);grandma(Y,X),woman(X).


%15
%рекурсия вверх

%min(X,Y):-
%    (X<Y, X; Y).
%

minCallUp(0,9):-!.
minCallUp(X,RES):-
    NEWX is X div 10,
    minCallUp(NEWX,TAILRES),
    DIGIT is X mod 10,
   (DIGIT<TAILRES, RES is DIGIT;RES is TAILRES).

%16
%рекурсия вниз

minTC(X, RES):- minTC(X,9,RES).
minTC(0, RES, RES):-!.
minTC(X, MIN, RES):-
    DIGIT is X mod 10,
    NEWX is X div 10,
    (DIGIT < MIN, minTC(NEWX, DIGIT, RES);minTC(NEWX, MIN, RES)).

%17
%рекурсия вверх



%18
%рекурсия вниз

%19
%fib(N,X):-

%20
%fib(N,X):-

