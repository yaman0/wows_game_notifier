MIX_ENV:=prod

deps: mix.exs
	mix deps.get

_build/prod: lib/** config/** test/** deps
	MIX_ENV=$(MIX_ENV) mix release

.PHONY start-deamon
start-deamon: _build/prod
	_build/prod/rel/wows_game_notifier/bin/wows_game_notifier daemon