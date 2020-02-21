namespace sorryProfessor

open FSharp.Data.Sql
open Store

module queryUser =

    let ctx = Store.context
    
    let selectAll = query {
        for user in context.Master.User do
        select user
    }
