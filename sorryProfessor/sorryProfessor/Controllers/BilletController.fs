namespace sorryProfessor.Controllers

open System
open Microsoft.AspNetCore.Mvc
open Microsoft.Extensions.Logging
open sorryProfessor.Provider.BilletProvider
open getBillet
open postBillet
open sorryProfessor



[<ApiController>]
[<Route("[controller]")>]
type BilletController (logger : ILogger<BilletController>) =
    inherit ControllerBase()
    
    [<HttpGet>]
    member __.Get() : Billet[] =
         [|
            for user in getAllBillet ->
                { id = user.id
                  date = user.date
                  excuse = user.excuse
                  id_user = user.id_user
                }
        |]
         
    [<HttpGet("{billetid}")>]    
    member __.GetById(billetid:Guid) : Billet =
        getBilletById billetid
        
    
    [<HttpGet("/billet/user/{userid}")>]    
    member __.GetByIdUser(userid:Guid) : Billet[] =
        getBilletbyUser userid
        
        
    //-------------------------POST----------------------//
    
    [<HttpPost>]
    member __.AddBillet([<FromBody>]billet : Billet)=
        addBillet billet