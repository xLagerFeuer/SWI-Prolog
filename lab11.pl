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
% Visual tree

%11
daughter(X):- parent(X,Y),woman(Y),write(Y),nl,fail.
daughter(X,Y):- parent(Y,X),woman(X).

daughter(zhdana).

%12
%wife(X, Y)
%wife(X)

%13
%grand_ma(X,Y)
%grand_ma(X)

%14
%grand_ma_and_da(X,Y)

%15
%�������� �����

%min()

%16
%�������� ����

%min()

%17
%�������� �����

%18
%�������� ����

%19
%fib(N,X):-

%20
%fib(N,X):-
