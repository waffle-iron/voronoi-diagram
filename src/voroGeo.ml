type point = int * int
type rect = int * int * int * int
type distance_function = point -> point -> float

let pnorm_distance (p: int)
                   (x1, y1: point)
                   (x2, y2: point): float =
  let dx = float_of_int @@ abs (x1 - x2) in
  let dy = float_of_int @@ abs (y1 - y2) in
  let fp = float_of_int p in
  let inverted_fp = 1.0 /. fp in
  (dx ** fp +. dy ** fp) ** inverted_fp

let euclidean_distance: distance_function = pnorm_distance 2

let taxicab_distance: distance_function = pnorm_distance 1

let generate_random_point (x0, y0, x1, y1: rect): point =
  let width = x1 - x0 + 1 in
  let height = y1 - y0 + 1 in
  (x0 + Random.int width,
   y0 + Random.int height)
