build:
	npx --package elm@0.19.1-5 elm make src/Main.elm --debug

test:
	elm-verify-examples -r

watch:
	while fswatch --one-event src tests; do elm make src/Main.elm --debug && open index.html && elm-verify-examples -r; sleep 1; done