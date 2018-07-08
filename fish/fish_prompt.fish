function fish_prompt

  set -l normal (set_color normal)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l yellow (set_color yellow)
  set -l green (set_color green)

  set -l cwd $blue(pwd | sed "s:^$HOME:~:")

  echo -e ''

  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b cyan black) '[' (basename "$VIRTUAL_ENV") ']' $normal ' '
  end

  echo -n -s $cwd $normal

  if git_is_repo
    set -l git_branch (git_branch_name)

    if git_is_dirty
      set git_info '(' $yellow $git_branch "±" $normal ')'
    else
      set git_info '(' $green $git_branch $normal ')'
    end
    echo -n -s ' · ' $git_info $normal
  end

  echo -e ''
  echo -e -n -s (set_color red)'⟩ ' $normal
end
