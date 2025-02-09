alias ls='eza --icons=always' # basic replacement for ls with eza
alias l='eza --long -bF --icons=always' # extended details with binary sizes and type indicators
alias ll='eza --long -a --icons=always' # long format, including hidden files
alias llm='eza --long -a --sort=modified --icons=always' # long format, including hidden files, sorted by modification date
alias la='eza -a --group-directories-first --icons=always' # Show all files, with directories listed first
alias lx='eza -a --group-directories-first --extended --icons=always' # Show all files and extended attributes, directories first
alias tree='eza --tree --icons=always' # tree view
alias lS='eza --oneline --icons=always' # Display one entry per line
alias lT='eza --tree --long --icons=always' # Tree view with extended details
alias lr='eza --recurse --all --icons=always' # Recursively list all files, including hidden ones
alias lg='eza --grid --color=always --icons=always' # Display entries as a grid with color
alias ld='eza --only-dirs --icons=always' # List only directories
alias lf='eza --only-files --icons=always' # List only files
alias lC='eza --color-scale=size --long --icons=always' # Use color scale based on file size
alias li='eza --icons=always --grid --icons=always' # Display with icons in grid format
alias lh='eza --hyperlink --all --icons=always' # Display all entries as hyperlinks
alias lX='eza --across --icons=always' # sort the grid across, rather than downwards
alias lt='eza --long --sort=type --icons=always' # Sort by file type in long format
alias lsize='eza --long --sort=size --icons=always' # Sort by size in long format
alias lmod='eza --long --modified --sort=modified --icons=always' # Sort by modification date in long format, using the modified timestamp
alias ldepth='eza --level=2 --icons=always' # Limit recursion depth to 2
alias lignore='eza --git-ignore --icons=always' # Ignore files mentioned in .gitignore
alias lcontext='eza --long --context --icons=always' # Show security context

