module Raw :
sig
  type token = Chunk_parser.token
  type item = token History.loc  
  type sync = item History.sync
  type t = item History.t 
end

module Chunked :
sig
  type item = Raw.sync * (int * Outline_utils.kind * Raw.item list * exn list)
  type sync = item History.sync
  type t = item History.t 
end

val parse_step : ?rollback:int -> ?exns:exn list -> Raw.t -> Lexing.lexbuf ->
  Raw.t * Chunked.item

val parse : ?rollback:int -> Raw.t * Chunked.t ->
  Lexing.lexbuf -> Raw.t * Chunked.t
