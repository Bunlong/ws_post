-module(ws_post_post_websocket, [Req, SessionId]).
-behaviour(boss_service_handler).

-export([init/0, handle_join/3, handle_incoming/4, handle_broadcast/2, handle_close/4,
  terminate/2]).

init() ->
  {ok, []}.

handle_join(URL, Pid, State) ->
  {noreply, State}.

handle_incoming(_URL, Pid, Message, State) ->
  Pid ! {text, [Message]},
  {noreply, State}.

handle_broadcast(_Message, State) ->
  {noreply, State}.

handle_close(_Reason, _URL, _Pid, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.
