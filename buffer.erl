%%%-------------------------------------------------------------------
%%% @author brunoroese
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Jun 2024 20:27
%%%-------------------------------------------------------------------
-module(buffer).
-author("brunoroese").

%% API
-export([buffer/1]).

buffer(Queue) ->
  List_size = 10,
  Queue_size = queue:len(Queue),

  io:format("Lista atual: ~p ~n", [Queue]),
  io:format("Tamanho lista atual: ~p ~n", [Queue_size]),

  receive
    { produce, NewValue } ->
      if
        Queue_size < List_size -> buffer(increase_list(Queue, [NewValue]));
        true -> io:format("Lista cheia ~n"), buffer(Queue)
      end;
    { consume, Consumer } ->
      if
        Queue_size > 0 -> buffer(get_last_value(Queue, Consumer));
        true -> io:format("Lista vazia ~n"), Consumer ! { empty }, buffer(Queue)
      end
  end.

get_last_value(Queue, Consumer) ->
  io:format("Pegando o ultimo valor da lista ~n"),
  case queue:out(Queue) of
    {{value, Return}, NewQueue} ->
      Consumer ! { not_empty, Return },
      io:format("Primeiro valor: ~p ~n", [Return]),
      NewQueue
  end.

increase_list(Queue, NewValue) ->
  io:format("Novo valor: ~p ~n", [NewValue]),
  queue:in(NewValue, Queue).


