%% This module disables UTF-8 validation.

-module(ws_dont_validate_utf8_h).
-behavior(cowboy_websocket).

-export([init/2]).
-export([websocket_handle/2]).
-export([websocket_info/2]).

init(Req, State) ->
	{cowboy_websocket, Req, State, #{
		validate_utf8 => false
	}}.

websocket_handle({text, Data}, State) ->
	{reply, {text, Data}, State};
websocket_handle({binary, Data}, State) ->
	{reply, {binary, Data}, State};
websocket_handle(_, State) ->
	{ok, State}.

websocket_info(_, State) ->
	{ok, State}.
