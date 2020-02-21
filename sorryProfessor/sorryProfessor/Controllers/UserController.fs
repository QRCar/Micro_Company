namespace sorryProfessor.Controllers

open Microsoft.AspNetCore.Authentication
open Microsoft.AspNetCore.Authentication
open Microsoft.AspNetCore.Authentication
open Microsoft.AspNetCore.Authentication
open Microsoft.AspNetCore.Http
open Microsoft.AspNetCore.Http
open System
open System.Web.Http.Results
open System.Web.Http.Results
open Microsoft.AspNetCore.Mvc
open Microsoft.AspNetCore.Mvc
open Microsoft.AspNetCore.Mvc
open Microsoft.Extensions.Logging
open sorryProfessor
open getUser
open sorryProfessor.Provider.UtilsProvider

[<ApiController>]
[<Route("[controller]")>]
type UserController (logger : ILogger<UserController>) =
    inherit ControllerBase()
    
    [<HttpGet>]
    member __.Get() : User[] =
        [|
            for user in getAllUser ->
                { id = user.id
                  login = user.login
                  firstname = user.firstname
                  lastname = user.lastname
                  school = user.school
                  promo = user.promo
                  classe = user.classe
                }
        |]
        
    [<HttpGet("/user/{userid}")>]    
    member __.GetById(userid:Guid) : User =
        getUserById userid
        
                        //POST
    //------------------------------------------------//
    
    [<HttpPost("/user/login")>]
    member __.Login([<FromBody>]login: Login) =
        let id = loginUser login.login
        if id = Guid.Empty then
            StatusCodes.Status400BadRequest
        else
            let registerPassword = getPasswordById id
            if HashPassword.verify registerPassword login.password then
                StatusCodes.Status200OK
            else
                StatusCodes.Status400BadRequest

        
    [<HttpPost>]
    member __.Register([<FromBody>]user : RegisterUser)=
        registerUser user