prev_team([chihaya, iori, ritsuko]).
prev_team([makoto, azusa, haruka]).
prev_team([yayoi, yukiho, ami, mami]).

candidate(X, OrderedMember) :- findall(Team,
                                       (prev_team(Team), not(member(X, Team))),
                                       List),
                               flatten(List, Members),
                               sort(Members, OrderedMember).

new_team(Team, N) :- length(Team, N),
                     forall(select(X, Team, TeamExceptX), /* forall-> OK, foeach-> doesn't work ...*/
                             (candidate(X, Candidates), 
                              ord_subset(TeamExceptX, Candidates))).
