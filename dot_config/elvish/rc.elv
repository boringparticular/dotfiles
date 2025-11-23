use epm

mkdir -p $epm:managed-dir/git.sr.ht/
echo "{
   \"method\": \"git\",
   \"protocol\": \"https\",
   \"levels\": \"2\"
}" > $epm:managed-dir/git.sr.ht/epm-domain.cfg

epm:install github.com/zzamboni/elvish-modules
epm:install &silent-if-installed=$true git.sr.ht/~ejri/mellon

use github.com/zzamboni/elvish-modules/bang-bang
use github.com/zzamboni/elvish-modules/alias
use git.sr.ht/~ejri/mellon/atuin

eval (starship init elvish)
# eval (atuin init elvish | slurp)
eval (atuin gen-completions --shell elvish | slurp)
set-env CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
eval (carapace _carapace|slurp)
eval (zoxide init elvish | slurp)

# if (has-external atuin) {
#	use git.sr.ht/~ejri/mellon/atuin
#	set edit:insert:binding[Ctrl-r] = { atuin:search }
#	set edit:insert:binding[Up] = { atuin:search-up }
#}
