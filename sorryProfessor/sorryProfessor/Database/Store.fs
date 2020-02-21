module Store

open System.Collections.Generic
open Dapper
open System.Data.SqlClient
open System.Dynamic
open sorryProfessor.SqlBuilder

let ConnStr = config.Item("database:constring") // config.GetSection("App").Get<AppSettings>()
let db = new SqlConnection(ConnStr)


let dapperQuery<'Result> (query:string) =
    db.Query<'Result>(query)

let dapperMapParameterizedQuery<'Result> (query:string) (param : Map<string,_>) : 'Result seq =
    let expando = ExpandoObject()
    let expandoDictionary = expando :> IDictionary<string,obj>
    for paramValue in param do
        expandoDictionary.Add(paramValue.Key, paramValue.Value :> obj)

    db.Query<'Result>(query, param)
    
let dapperMapParameterizedQueryString<'Result> (query:string) (param : Map<string, string>) : 'Result seq =
    let expando = ExpandoObject()
    let expandoDictionary = expando :> IDictionary<string,obj>
    for paramValue in param do
        expandoDictionary.Add(paramValue.Key, paramValue.Value :> obj)

    db.Query<'Result>(query, param)
    
let dapperMapParameterizedQueryModel<'Result> (query:string) (param : 'Model) : 'Result seq =

    db.Query<'Result>(query, param)
    
