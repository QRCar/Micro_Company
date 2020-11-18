module sorryProfessor.Provider.BilletProvider

open System
open System.Security.Policy
open Store
open sorryProfessor
                      
                       
module getBillet =
    
    let getAllBillet = dapperQuery<Billet> "Select id, date, excuse, id_user from master.billet order by date desc"
    
    let getBilletById id = dapperMapParameterizedQuery<Billet>
                               "Select id, date, excuse, id_user from master.billet
                               where id = @id order by date desc"
                               (Map ["id", id]) |> Seq.head
    
    let getBilletbyUser id = dapperMapParameterizedQuery<Billet>
                               "Select id, date, excuse, id_user from master.billet
                               where id_user = @id_user order by date desc"
                               (Map ["id_user", id]) |> Seq.toArray

    let addBillet billet =
        dapperMapParameterizedQueryModel<unit> "Insert into master.billet VALUES (@id, @date,
                                            @excuse, @id_user)"
                                            (billet)