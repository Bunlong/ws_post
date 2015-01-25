-module(ws_post_post_websocket, [Req, SessionId]).
-compile(export_all).

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
