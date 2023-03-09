livre(auteur(fredric, dard), titre('l"espion'), prix(45)).
livre(auteur(victor, hugo), titre('les misérables'), prix(300)).
livre(auteur(eugene, delonay), titre('pendule de foucault'), prix(125)).
livre(auteur(victor, hugo), titre('fantasia chez les ploucs'), prix(200)).
livre(auteur(eugene, chang), titre('le silence'), prix(180)).
livre(auteur(umberto, ecco), titre('le nom de la rose'), prix(185)).
livre(auteur(umberto, ecco), titre('pendule de foucault'), prix(195)).

livre_E_P(E,P) :- livre(E,T,P), print(T).