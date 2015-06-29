# ================================================================
# 2015/04/28 Thomas
# Purpose: Not used at this time
# ================================================================

module UtilsPropertyHelper
	properties = Utils::Properties.load_from_file('../config/config.properties')
	username_default = properties.get{:username_default}
end