open Claudius

let tick t s _prev _i =
  let palsize = Palette.size (Screen.palette s) in
  Framebuffer.init (Screen.dimensions s) (fun x y ->
      let ft = (Float.of_int t) /. 15. 
      and fx = (Float.of_int x) /. 100. 
      and fy = (Float.of_int y) /. 100. in
      let wave = sin (fx +. ft) +. cos (fy -. ft) +. sin (fx *. fy /. 15.) in
      let fc = (wave *. Float.of_int(palsize / 2)) in
      ((int_of_float fc) + palsize) mod palsize
  )

let () =
  Screen.create 640 480 1 (Palette.generate_plasma_palette 1024) |>
  Base.run "Personal Project: Wave Ripples" None tick