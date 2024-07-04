%%%-------------------------------------------------------------------
%%% @author brunoroese
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Jun 2024 21:10
%%%-------------------------------------------------------------------
-module(consumer).
-author("brunoroese").

%% API
-export([consumer/1]).

consumer(Buffer) ->
  io:format("{ Consumer Pid: ~p ~n }", [self()]),

  Buffer ! { consume, self() },

  receive
    { not_empty, Value } ->
      if
        [Value] =/= 0 -> do(Value, Buffer);
        true -> consumer(Buffer)
      end;
      { empty } ->
        io:format("Lista vazia ~n"),
        timer:sleep(9000),
        consumer(Buffer)
  end.

do([Value], Buffer) when is_integer(Value) ->
  io:format("Valor consumido: ~p ~n", [Value]),
  io:format("Dormindo por: ~p ~n", [Value * 2]),
  timer:sleep(Value * 2),
  consumer(Buffer).
