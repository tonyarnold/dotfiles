# Defined in - @ line 0
function copy-sw-versions --description 'alias copy-sw-versions=sw-versions | pbcopy'
	sw-versions | pbcopy $argv;
end
