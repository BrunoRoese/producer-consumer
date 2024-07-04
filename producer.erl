%%%-------------------------------------------------------------------
%%% @author brunoroese
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Jun 2024 20:29
%%%-------------------------------------------------------------------
-module(producer).
-author("brunoroese").

%% API
-export([start/1]).

start(Buffer) ->
  Value = generateValue(),
  io:format("{ PID do produtor: ~p, tempo de espera: ~p ~n", [self(), Value]),

  Buffer ! { produce, Value },

  timer:sleep(Value),

  start(Buffer).

generateValue() ->
  Number = rand:uniform(2) - 1,
  if
    Number == 1 -> 3500;
    true -> 7000
  end.
