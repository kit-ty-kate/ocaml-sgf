(*
 * Copyright (c) 2012 Vincent Bernardoff <vb@luminar.eu.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *)

%{
open Ast
%}

%token<string> PROPNAME PROPCONTENT
%token LPAR RPAR SEMI EOF

%start <Ast.collection> collection

%%

collection:
| col = gametree+ EOF { (col:collection) }

gametree:
| LPAR seq = sequence RPAR { Leaf seq }
| LPAR seq = sequence gt = gametree+ RPAR { Node (seq, gt) }

sequence:
| seq = node+ { (seq:sequence) }

node:
| SEMI pl = property+ { (pl:node) }

property:
| name = PROPNAME vl = PROPCONTENT+ { property_of_tuple name vl }
