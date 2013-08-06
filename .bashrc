# Privileged access
if [ $UID -ne 0 ]; then
  alias sudo='sudo '
  alias root='sudo -s'
  alias reboot='sudo systemctl reboot'
  alias netctl='sudo netctl'
  alias osxkill='sudo killall -HUP mDNSResponder' # OS X 10.7 & 10.8
  alias osmkill='dscacheutil -flushcache;sudo killall -HUP mDNSResponder' # OS X 10.9 Mavericks
fi

# ls 
alias ls='ls -GhF'                  # linux: --color=auto; Mac: -G 
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

# Add some color to grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
 
# Some other useful stuff
alias ports='netstat -tulanp' # show open ports
alias mkdir='mkdir -pv' # mkdir, create parent 
alias h='history'
alias j='jobs -l'
alias cls='clear'

# Make Bash nicer 
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'

# OS X VNC
alias vnc='/System/Library/CoreServices/Screen\ Sharing.app/Contents/MacOS/Screen\ Sharing'

# Memory
alias meminfo='free -m -l -t' # pass options to free 
 
# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
# get top process eating cpu 
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
alias cpuinfo='lscpu' # Get server cpu info
 
# get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# Development; edit vhost, hosts and fast access to our local web root
# remember OS X; Permissions issues in web root?
# $ sudo chmod -R o+w /Library/WebServer/Documents 
alias vhosts='sudo vim /etc/apache2/extra/httpd-vhosts.conf'
alias hosts='sudo vim /etc/hosts'
alias home='cd /Library/WebServer/Documents'

# --------- Functions to make life easier 

# cd and ls in one
cl() {
if [ -d "$1" ]; then
  cd "$1"
  ls
  else
  echo "bash: cl: '$1': Directory not found"
fi
}

# --------- Rails specific

# compile sass 
# prerequisites: SASS gem; $gem install sass; MUST be in project $DIR
alias watch="echo 'Watching /stylesheets/sass/*.scss and outputting to /stylesheets/*.css' && sass --watch stylesheets/sass:stylesheets" 

# ruby/rails testing
alias ccmb='clear && bundle exec rake cucumber'
alias ccmb:w='clear && bundle exec rake cucumber:wip'
alias rsp='clear && bundle exec rake spec'

# ruby/rails sunspot
alias solr='bundle exec rake sunspot:solr:start'
alias solr:s='bundle exec rake sunspot:solr:stop'
alias solr:i='bundle exec rake sunspot:solr:reindex'

# rails/rake
alias routes='bundle exec rake routes'
alias migrate='bundle exec rake db:migrate'
alias migrate:r='bundle exec rake db:migrate:reset'

