# This theme was created using the agnoster.zsh-theme as a base
#
# # README
#

### Segment drawing
CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Lennyface ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
function precmd (){
  RAND_EAR_NUM=$[RANDOM % 27 + 1]
  RAND_EYE_NUM=$[RANDOM % 80 + 1]
  RAND_MOUTH_NUM=$[RANDOM % 37 + 1]
}
function lennyface () {

  LEFT_EAR_ARRAY=("\u71" "\u2A2" "\u2E2E" "\u295" "\u1597" "\u1566" "\u1566\u28" "\u1559\u28" "\u1633" "\u156E" "\u1573" "\u28" "\u5B" "\u5C\u5F" "\uB67" "\uB68" "\u291C\u28" "\u261E" "\u146B" "\u1474" "\u30FD\u28" "\u5C\u28" "\u4E41\u28" "\u2514\u5B" "\u28\u3065" "\u28\uE07" "\u7C")

  RIGHT_EAR_ARRAY=("\u70" "\u2A1" "\u3F" "\u294" "\u1598" "\u1565" "\u29\u1565" "\u29\u1557" "\u1630" "\u156D" "\u1572" "\u29" "\u5D" "\u5F\u2F\uAF" "\uB68" "\uB67" "\u29\u290F" "\u261E" "\u1477" "\u1477" "\u29\uFF89" "\u29\u2F" "\u29\u310F" "\u5D\u2518" "\u29\u3065" "\u29\uE07" "\u7C")

  LEFT_EYE_ARRAY=("\u2310\u25A0" "\u360" "\uB0\u21C0" "\uB4\u2022" "\uB4" "\u60" "\uF3" "\uF2" "\u1B8\u335" "\u15D2" "\u27C3" "\u2AA7" "\u2AA6" "\u2AA9" "\u2AA8" "\u2AB0" "\u2AD1" "\u2A34" "\u2A7F" "\u2A7E" "\u2A7A" "\u2A79" "\u25E5\u25B6" "\u224B" "\uAE6\uA81" "\u36F" "\u33F" "\u34C" "\u70D" "\u25C9" "\u2609" "\u30FB" "\u25B0" "\u1D54" "\uFF9F" "\u25A1" "\u263C" "\u2A" "\u60" "\u2686" "\u229C" "\u274D" "\uFFE3" "\u2500" "\u273F" "\u2022" "\u54" "\u5E" "\u2C7A" "\u40" "\u20D" "\u78" "\u2D" "\u24" "\u20C" "\u298" "\uA74A" "\u2E1F" "\uE4F" "\u2D32" "\u25A0" "\uFF9F" "\u25D5" "\u25D4" "\u2727" "\u25A0" "\u2665" "\u361\uB0" "\uAC" "\uBA" "\u2A36" "\u2A31" "\u23D3" "\u23D2" "\u235C" "\u2364" "\u1696" "\u1D17" "\uCA0" "\u3C3")

  RIGHT_EYE_ARRAY=("\u25A0" "\uB0" "\u21BC" "\u2022\u60" "\u60" "\uB4" "\uF2" "\uF3" "\u321\u1B7" "\u15D5" "\u27C4" "\u2AA6" "\u2AA7" "\u2AA8" "\u2AA9" "\u2AAF" "\u2AD2" "\u2A35" "\u2A80" "\u2A7D" "\u2A79" "\u2A7A" "\u25C0\u25E4" "\u224B" "\uAE6\uA81" "\u36F\u20" "\u33F" "\u34C" "\u70D" "\u25C9" "\u2609" "\u30FB" "\u25B0" "\u1D54" "\uFF9F" "\u25A1" "\u263C" "\u2A" "\u60" "\u2686" "\u229C" "\u274D" "\uFFE3" "\u2500" "\u273F" "\u2022" "\u54" "\u5E" "\u2C7A" "\u40" "\u20D" "\u78" "\u2D" "\u24" "\u20C" "\u298" "\uA74A" "\u2E1F" "\uE4F" "\u2D32" "\u25A0" "\uFF9F" "\u25D5" "\u25D4" "\u2727" "\u25A0" "\u2665" "\u361\uB0" "\uAC" "\uBA" "\u2A36" "\u2A31" "\u23D3" "\u23D2" "\u235C" "\u2364" "\u1696" "\u1D17" "\uCA0" "\u3C3")

  MOUTH_ARRAY=("\u1D25" "\u15DD" "\u76" "\u460" "\u15DC" "\u13B2" "\u30EE" "\u256D\u35C\u296\u256E" "\u35F\u644\u35C" "\u296" "\u35F\u296" "\u3C9" "\uB3" "\u3B5" "\uFE4F" "\u25A1" "\u644\u35C" "\u203F" "\u256D\u256E" "\u203F\u203F" "\u25BE" "\u2038" "\u414" "\u2200" "\u21" "\u4EBA" "\u2E" "\u30ED" "\u5F" "\u47D" "\uD0C" "\u23E0" "\u23CF" "\u234A" "\u2358" "\u30C4" "\u76CA")

  echo $LEFT_EAR_ARRAY[RAND_EAR_NUM]$LEFT_EYE_ARRAY[RAND_EYE_NUM]$MOUTH_ARRAY[RAND_MOUTH_NUM]$RIGHT_EYE_ARRAY[RAND_EYE_NUM]$RIGHT_EAR_ARRAY[RAND_EAR_NUM]
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Prompt Components ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Context: user@hostname
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
   prompt_segment black green "%(!.%{%F{yellow}%}.) `lennyface`"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green black
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:git:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    echo -n "${ref/refs\/heads\// }${vcs_info_msg_0_%% }${mode}"
  fi
}

prompt_hg() {
  local rev status
  if $(hg id >/dev/null 2>&1); then
    if $(hg prompt >/dev/null 2>&1); then
      if [[ $(hg prompt "{status|unknown}") = "?" ]]; then
        # if files are not added
        prompt_segment red white
        st='±'
      elif [[ -n $(hg prompt "{status|modified}") ]]; then
        # if any modification
        prompt_segment yellow black
        st='±'
      else
        # if working copy is clean
        prompt_segment green black
      fi
      echo -n $(hg prompt "☿ {rev}@{branch}") $st
    else
      st=""
      rev=$(hg id -n 2>/dev/null | sed 's/[^-0-9]//g')
      branch=$(hg id -b 2>/dev/null)
      if `hg st | grep -q "^\?"`; then
        prompt_segment red black
        st='±'
      elif `hg st | grep -q "^[MA]"`; then
        prompt_segment yellow black
        st='±'
      else
        prompt_segment green black
      fi
      echo -n "☿ $rev@$branch" $st
    fi
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment magenta black '%c ➜ '
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment blue black "(`basename $virtualenv_path`)"
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_context
  prompt_dir
  prompt_git
  prompt_hg
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '
