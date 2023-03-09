
%------------------------
% enfant(Enfant, Pere)
%-----------------------
enfant(marie, jean).
enfant(pierre, jean).
enfant(jacques, jean).
enfant(eric,  pierre).
enfant(thomas, pierre).
enfant(vincent,jacques).
enfant(loic,jacques).
enfant(michele,jacques).
enfant(david,thomas).
enfant(christine,thomas).

% 2e série
enfant(alex, sylvie).
enfant(sophie, sylvie).
enfant(olivier, jose).
enfant(valentine, jose).
enfant(loic, kate).
enfant(loic, kevine).

% II.

enfant(alex,jean).
enfant(sophie,jean).
enfant(laure,paul).
enfant(mark,paul).

%VII
enfant(yves,pedro).
enfant(pedro,yannick).
enfant(luc,yannick).


%-------------------------
% enfant(Enfant, Mere)
%------------------------
enfant(mark, marie).
enfant(laure,marie).
enfant(serge,laure).
enfant(charlotte,laure).


enfant(alex,jean).
enfant(sophie,jean).
enfant(mark,paul).
enfant(laure, paul).
enfant(marie,sylvie).
enfant(pierre,sylvie).
enfant(jacques,sylvie).
enfant(vincent,helene).
enfant(loic,helene).
enfant(michele,helene).
enfant(olivier,bernadette).
enfant(valentine,bernadette).

% II

enfant(jacques,sylvie).
enfant(marie, sylvie).
enfant(pierre, sylvie).
enfant(loic,helene).
enfant(michele,helene).
enfant(vincent,helene).
enfant(olivier,bernadette).
enfant(valentine,bernadette).

%VII
enfant(yves,brigitte).
enfant(elisabeth,brigitte).
enfant(luc,elisabeth).

%--------------------
% epouse(Femme,Mari)
%-----------------------
epouse(sylvie, jean).
epouse(marie, paul).
epouse(helene, jacques).

% 2e série
epouse(bernadette, jose).
epouse(velentine, loic).

%VII
epouse(brigitte,pedro).
epouse(elisabeth,yannick).
%--------------------------------------------------------------------------------

homme(jean).
homme(loic).
homme(jose).
homme(jacques).
homme(pierre).
homme(paul).
homme(alex).
homme(olivier).
homme(vincent).
homme(eric).
homme(thomas).
homme(mark).
homme(david).
homme(serge).

%VII
homme(pedro).
homme(yannick).

femme(X) :-
    nonvar(X),
    not(homme(X)). % \+homme(X)

epoux(Mari, Femme) :- epouse(Femme, Mari).

% V

pere(Dad,Enf) :- enfant(Enf,Dad), homme(Dad) ; epoux(Dad,Mom), enfant(Enf,Mom).

mere(Mam,Enf) :- enfant(Enf,Mam), femme(Mam) ; epouse(Mam,Dad), enfant(Enf,Dad).

parent(Par, Enf) :- pere(Par, Enf) ; mere(Par, Enf).

fils(Enf,Par) :- enfant(Enf,Par), homme(Enf).

fille(Enf,Par) :- enfant(Enf,Par), femme(Enf).

% VI : Qui est "le frère du fils du mari de la mère du père de la soeur du fils de la mère de loic" ?
% Jacques (de tête)
% Et pour Alex ?
% Personne car Jean n'a pas de frère. (de tête)

% Fr1 est le frère de Fr2 (qui est h ou f)
frere(Fr1,Fr2) :- parent(P,Fr1), parent(P,Fr2), homme(Fr1), Fr1 \= Fr2.
% So1 est la soeur de So2 (qui est h ou f)
soeur(So1,So2) :- parent(P,So1), parent(P,So2), femme(So1), So1 \= So2.

rel(P1,P2) :- mere(Mam,P1), fils(F1,Mam), soeur(So1, F1), pere(Pere, So1), mere(Mam2, Pere), epoux(Mari,Mam2), fils(F2,Mari), frere(P2, F2).
% On obtient bien le résultat attendu (pierre, jacques ou alex)

gd_pere(GdP,Enf) :- parent(P,Enf), parent(GdP,P), homme(GdP).
% En effet, gd_pere(pedro,pedro). retourne true.




