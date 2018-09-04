# Defined in - @ line 0
function sw-versions --description 'alias sw-versions=sw_vers; and echo "---"; and xcodebuild -version'
	sw_vers; and echo "---"; and xcodebuild -version $argv;
end
