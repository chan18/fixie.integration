module FSharp.Tests.AsyncTests

open System
open Shouldly

let ``Should Support Passing Async<T> Tests``() =
    async {
        let! result = async { return "Result" }
        result.ShouldBe("Result")
    }

let ``Should Support Passing Task<T> Tests``() =
    async {
        let! result = async { return "Result" }
        result.ShouldBe("Result")
    } |> Async.StartAsTask

let ``Should Support Failing Async<T> Tests``() =
    async {
        let! result = async { return "This test is written to fail, to demonstrate async test case execution." }
        raise (Exception(result))
    }

let ``Should Support Failing Task<T> Tests``() =
    async {
        let! result = async { return "This test is written to fail, to demonstrate async test case execution." }
        raise (Exception(result))
    } |> Async.StartAsTask