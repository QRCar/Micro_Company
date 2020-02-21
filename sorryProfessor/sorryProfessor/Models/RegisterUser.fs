namespace sorryProfessor

open System
    

[<CLIMutable>]
type RegisterUser =
    {
      id: Guid
      login: String
      mutable password: String
      firstname: String
      lastname: String
      school: String
      promo: int
      classe: String
    }