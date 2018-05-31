function commatest
	set -x COMMAJUMP_PATH (pwd)/tests/commajumpfile
	fish -c "functions -e __commajump_add; source "(pwd)"/,.fish; , $argv; pwd"
end

function setup
	cp (pwd)/tests/commajumpfile{.original,}
end

function teardown
	rm (pwd)/tests/commajumpfile
end

test "it changes to a directory matching the query"
	"$DIRNAME/dirs/foo" = (commatest foo)
end

test "it does not change the directory when directory is not known to commajump"
	(pwd) = (commatest unknown)
end

test "it changes to the more-often used directory when there are multiple matches"
	"$DIRNAME/dirs/baz" = (commatest ba)
end

test "it matches the path if no known folder names match"
	"$DIRNAME/dirs/larry/moe/curly" = (commatest moe)
end

test "it removes nonexistent directories"
	"$DIRNAME/dirs/nonexistent" != (commatest nonexistent; cat $DIRNAME/commajumpfile)
end
