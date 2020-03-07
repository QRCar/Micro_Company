namespace sorryProfessor.Controllers

open System
open Microsoft.AspNetCore.Mvc
open Microsoft.Extensions.Logging
open sorryProfessor.Provider.VoteProvider
open getVote
open postVote
open sorryProfessor

[<ApiController>]
[<Route("[controller]")>]
type VoteController (logger : ILogger<VoteController>) =
    inherit ControllerBase()
    
    [<HttpGet>]
    member __.Get() : Guid[] =
        getNbVote
        
        
    [<HttpGet("/vote/{billetid}")>]
    member __.GetById(billetid : Guid) : int =
        GetNbVoteById billetid
    
    
    [<HttpGet("/vote/later")>]
    member __.GetLater() : Guid[] =
        getLaterUser
        
        
    [<HttpPost>]
    member __.Post([<FromBody>]vote : Vote) =
        makeVote vote