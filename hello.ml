let () =
  Dream.run @@ Dream.logger
  @@ Dream.router
       [
         Dream.get "/" (fun _ -> Dream.respond "Hello, world!");
         Dream.get "/echo/:word" (fun request ->
             Dream.respond (Dream.param "word" request));
       ]
  @@ Dream.not_found
