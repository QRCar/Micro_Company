module sorryProfessor.Provider.VoteProvider

open System
open Store
open sorryProfessor

module getVote=

    // with nbvote
    //Select id_billet, COUNT(*) as nbvote from master.user_billet
    //group by id_billet order by nbvote desc
    let getNbVote = dapperQuery<Guid>"Select id_billet from master.user_billet
                                        group by  id_billet order by COUNT(*) desc" |> Seq.toArray

    let getLaterUser = dapperQuery<Guid>"Select id_user from master.billet
                                        group by  id_user order by COUNT(*) desc" |> Seq.toArray
                                            
    let GetNbVoteById id_billet = dapperMapParameterizedQuery<int>"Select COUNT(id_billet) as nbVote from master.user_billet
                                                                where id_billet = @id_billet"
                                                                (Map ["id_billet", id_billet]) |> Seq.head
    
module postVote=
    
    let makeVote vote= dapperMapParameterizedQueryModel<unit> "insert into master.user_billet
                                    Values (@id_user, @id_billet)"
                                    (vote)