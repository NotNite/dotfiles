function fish_prompt
  # if we're in ssh, show username and hostname
  if set -q SSH_CONNECTION
    printf '%s%s%s@%s%s ' \
      (set_color blue) \
      "$USER" \
      (set_color -o blue) \
      (hostname -s) \
      (set_color normal)
  end

  set prompt_character '$'
  set prompt_color '-o'

  if test "$USER" = "root"
    set prompt_character '#'
    set prompt_color red -o
  end

  printf '%s%s%s%s ' \
    (prompt_pwd) \
    (set_color $prompt_color) \
    $prompt_character \
    (set_color normal)
end
