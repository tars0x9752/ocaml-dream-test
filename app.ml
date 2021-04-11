let render path_param =
  let open Tyxml.Html in
  html (head (title (txt "Home")) []) (body [ h1 [ txt path_param ] ])

let html_to_string html = Format.asprintf "%a" (Tyxml.Html.pp ()) html

let () =
  Dream.run @@ Dream.logger
  @@ Dream.router
       [
         Dream.get "/" (fun _ -> Dream.respond "Hello, world!");
         Dream.get "/:word" (fun request ->
             render (Dream.param "word" request)
             |> html_to_string |> Dream.respond);
       ]
  @@ Dream.not_found
