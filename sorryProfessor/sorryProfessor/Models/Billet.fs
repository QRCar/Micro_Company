namespace sorryProfessor

open System

[<CLIMutable>]
type Billet =
    {
      id: Guid
      date: DateTime
      excuse: String
      id_user: Guid
    }