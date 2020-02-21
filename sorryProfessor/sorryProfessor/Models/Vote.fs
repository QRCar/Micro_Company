namespace sorryProfessor

open System

[<CLIMutable>]
type Vote =
    {
      id_user: Guid
      id_billet: Guid
    }