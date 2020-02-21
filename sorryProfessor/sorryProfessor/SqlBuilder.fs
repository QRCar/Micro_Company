module sorryProfessor.SqlBuilder

open System.IO
open Microsoft.Extensions.Configuration

let builder = 
    let ret = new ConfigurationBuilder()
    FileConfigurationExtensions.SetBasePath(ret, Directory.GetCurrentDirectory()) |> ignore
    JsonConfigurationExtensions.AddJsonFile(ret, "appSettings.json")

let config = builder.Build ()