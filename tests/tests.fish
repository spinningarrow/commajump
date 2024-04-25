function commatest
	fish -c "set -x COMMAJUMP_PATH (pwd)/tests/commajumpfile; functions -e __commajump_add; source "(pwd)"/,.fish; , $argv; pwd" | tail -1
end

# setup
sed s:@pwd@:(pwd): (pwd)/tests/commajumpfile.original > (pwd)/tests/commajumpfile
set dir (dirname (status --current-filename))

@test "it does not change the directory when directory is not known to commajump" (commatest unknown) = (pwd)

@test "it changes to a directory matching the query" (commatest foo) = "$dir/dirs/foo"

@test "it changes to the more-often used directory when there are multiple matches" (commatest ba) = "$dir/dirs/baz"

@test "it matches the path if no known folder names match" (commatest moe) = "$dir/dirs/larry/moe/curly"

commatest nonexistent > /dev/null
@test "it removes nonexistent directories" (grep -q nonexistent $dir/commajumpfile) $status -eq 1

# teardown
rm (pwd)/tests/commajumpfile
