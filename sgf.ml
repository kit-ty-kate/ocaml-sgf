(** SGF abstract syntax tree *)
(** Test comment *)

type double     = One | Two

type color      = Black | White

type collection = gametree list

and gametree    = sequence * gametree list

and sequence    = node list

and node        = property list

and property    = propident * propvalue list

and propident   = ucletter list

and propvalue   = cvaluetype

and cvaluetype  =
  | ValueType of valuetype
  | Compose   of valuetype * valuetype

and valuetype   =
  | None
  | Number     of int
  | Real       of float
  | Double     of double
  | Color      of color
  | SimpleText of string
