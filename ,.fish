function , --description 'Commajump'
	set found_paths (grep $argv ~/.commajump | grep -v (pwd)\$)
	set found_folders (printf '%s\0' $found_paths | xargs -0 basename | grep -in $argv)

	if test (count $found_folders) -ne 0
		set found_paths $found_paths[(for i in $found_folders; echo $i; end | \
			cut -d':' -f1 | \
			paste -d' ' -s -)]
	end

	set found_directory (for i in $found_paths; echo $i; end | \
		uniq -c | \
		sort -nr | \
		head -1 | \
		xargs | \
		tr -s ' ' | \
		cut -d' ' -f2-)

	if not test -z $found_directory; and not test -d $found_directory
		grep -v \^$found_directory\$ ~/.commajump > ~/.commajump.temp
		and mv ~/.commajump{.temp,}
		and echo Nonexistent path $found_directory pruned.
	end

	if test -z $found_directory
		echo No directories matching "'$argv'" found.
		return 1
	end

	cd $found_directory
end
