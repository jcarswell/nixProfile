complete -c bat -n "__fish_use_subcommand" -s l -l language -d 'Set the language for syntax highlighting.'
complete -c bat -n "__fish_use_subcommand" -s m -l map-syntax -d 'Map a file extension or name to an existing syntax.'
complete -c bat -n "__fish_use_subcommand" -l theme -d 'Set the color theme for syntax highlighting.'
complete -c bat -n "__fish_use_subcommand" -l style -d 'Comma-separated list of style elements to display (*auto*, full, plain, changes, header, grid, numbers).' -r -f -a "auto full plain changes header grid numbers"
complete -c bat -n "__fish_use_subcommand" -l line-range -d 'Only print the lines from N to M.'
complete -c bat -n "__fish_use_subcommand" -l color -d 'When to use colors (*auto*, never, always).' -r -f -a "auto never always"
complete -c bat -n "__fish_use_subcommand" -l decorations -d 'When to show the decorations (*auto*, never, always).' -r -f -a "auto never always"
complete -c bat -n "__fish_use_subcommand" -l paging -d 'Specify when to use the pager (*auto*, never, always).' -r -f -a "auto never always"
complete -c bat -n "__fish_use_subcommand" -l wrap -d 'Specify the text-wrapping mode (*auto*, never, character).' -r -f -a "auto never character"
complete -c bat -n "__fish_use_subcommand" -l tabs -d 'Set the tab width to T spaces.'
complete -c bat -n "__fish_use_subcommand" -l terminal-width -d 'Set the width of the terminal'
complete -c bat -n "__fish_use_subcommand" -l list-languages -d 'Display all supported languages.'
complete -c bat -n "__fish_use_subcommand" -l list-themes -d 'Display all supported highlighting themes.'
complete -c bat -n "__fish_use_subcommand" -s p -l plain -d 'Show plain style (alias for \'--style=plain\').'
complete -c bat -n "__fish_use_subcommand" -s n -l number -d 'Show line numbers (alias for \'--style=numbers\').'
complete -c bat -n "__fish_use_subcommand" -s u -l unbuffered
complete -c bat -n "__fish_use_subcommand" -l no-config -d 'Do not use the configuration file'
complete -c bat -n "__fish_use_subcommand" -l config-file -d 'Show path to the configuration file.'
complete -c bat -n "__fish_use_subcommand" -s h -l help -d 'Print this help message.'
complete -c bat -n "__fish_use_subcommand" -s V -l version -d 'Show version information.'
complete -c bat -n "__fish_use_subcommand" -f -a "cache" -d 'Modify the syntax-definition and theme cache'
complete -c bat -n "__fish_seen_subcommand_from cache" -l source -d 'Use a different directory to load syntaxes and themes from.'
complete -c bat -n "__fish_seen_subcommand_from cache" -l target -d 'Use a different directory to store the cached syntax and theme set.'
complete -c bat -n "__fish_seen_subcommand_from cache" -s i -l init -d 'Initialize the syntax/theme cache.'
complete -c bat -n "__fish_seen_subcommand_from cache" -s c -l clear -d 'Remove the cached syntax definitions and themes.'
complete -c bat -n "__fish_seen_subcommand_from cache" -s d -l config-dir -d 'Show bat\'s configuration directory.'
complete -c bat -n "__fish_seen_subcommand_from cache" -l blank -d 'Create completely new syntax and theme sets (instead of appending to the default sets).'
complete -c bat -n "__fish_seen_subcommand_from cache" -s h -l help -d 'Prints help information'
complete -c bat -n "__fish_seen_subcommand_from cache" -s V -l version -d 'Prints version information'
