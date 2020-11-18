namespace sorryProfessor.Controllers

open Microsoft.AspNetCore.Http
open System
open System.Net
open System.Net.Http
open System.Net.Http
open System.Net.Http
open System.Web.Http
open Microsoft.AspNetCore.Mvc
open Microsoft.Extensions.Logging
open sorryProfessor
open getUser
open postUser
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
    member __.Login([<FromBody>]login: Login,[<FromQuery>] request : HttpRequestMessage) =
        let id = loginUser login.login
        if id = Guid.Empty then
            new HttpResponseMessage(HttpStatusCode.BadRequest);
        else
            let registerPassword = getPasswordById id
            if HashPassword.verify registerPassword login.password then
                request.CreateResponse<Guid>(HttpStatusCode.OK, id)
            else
                new HttpResponseMessage(HttpStatusCode.BadRequest);
                

        
    [<HttpPost>]
    member __.Register([<FromBody>]user : RegisterUser)=
        registerUser user