# ================================================================
# 2015/03/12 Thomas batch file
# "rem" are comments, "@" is to make sure nothing get displayed
# ================================================================

@cls
@echo BEGIN: %Date%, %time%

@rspec %1
@rem rspec spec

@echo END: %date%, %time%		#This does not appear, due to "rspec". Not sure how to fix