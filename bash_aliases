alias hgrep='history|ag'
alias ll='ls -ltrh'
alias la='ls -a'
alias be='bundle exec'
alias duh='du -h --max-depth=1'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

alias dc='docker-compose'
alias dcu='docker-compose up'
alias nobinding='find . -type f -iname '*.rb' -exec sed -i '/binding.pry/d' "{}" +;'
alias findlogging='ag --ruby --coffee "console.log|binding.pry|\*888|save_and_open_screenshot"'

alias open='xdg-open'

function gp() {
  logging=`findlogging`
  if [ -z "$logging" ]; then
    git push
  else
    echo "There is logging leftover. Remove it, or use <git push> push it anyway:"
    echo $logging
  fi
}
