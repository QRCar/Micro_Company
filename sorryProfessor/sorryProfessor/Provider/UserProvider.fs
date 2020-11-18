namespace sorryProfessor

open System
open System.Security.Policy
open Store
open Provider.UtilsProvider
open HashPassword
                      
                       
module getUser =
    let getAllUser = dapperQuery<User> "Select id, login, firstname, lastname, school, promo, classe from dbo.[user]"
    
    let getUserById id = dapperMapParameterizedQuery<User>
                          "Select id, login, firstname, lastname, school, promo, classe from dbo.[user] where id = @UserId"
                          (Map ["UserId", id]) |> Seq.head
                          
    let getPasswordById id = dapperMapParameterizedQuery<String>
                                "Select password from master.[user] where id = @UserId"
                                (Map ["UserId", id]) |> Seq.head
                                
module postUser =
    
    let loginUser (login) =
        dapperMapParameterizedQuery<Guid>
            "Select id from master.[user] where login = @login"
            (Map ["login", login]) |> Seq.head
                                
    let registerUser registerUser =
        registerUser.password <- strongHash registerUser.password
        dapperMapParameterizedQueryModel<unit> "Insert into master.[user] VALUES (@id, @firstname,
                                            @lastname, @school, @promo, @classe,
                                            @password, @login)"
                                            (registerUser)