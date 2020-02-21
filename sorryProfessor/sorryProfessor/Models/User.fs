namespace sorryProfessor

open System

type User =
    {
      id: Guid
      login: String
      firstname: String
      lastname: String
      school: String
      promo: int
      classe: String
    }
    
[<CLIMutable>]   
type Login =
    {
        login: string
        password: string
    }