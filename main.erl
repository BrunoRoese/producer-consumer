%%%-------------------------------------------------------------------
%%% @author brunoroese
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Jun 2024 22:27
%%%-------------------------------------------------------------------
-module(main).
-author("brunoroese").

%% API
-export([main/0]).

main() ->
  Buffer = spawn(buffer, buffer, [queue:new()]),

  spawn(producer, start, [Buffer]),
  spawn(producer, start, [Buffer]),

  spawn(consumer, consumer, [Buffer]),
  spawn(consumer, consumer, [Buffer]),
  spawn(consumer, consumer, [Buffer]),
  spawn(consumer, consumer, [Buffer]).
