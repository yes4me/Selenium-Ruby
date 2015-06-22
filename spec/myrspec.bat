rem ================================================================
rem 2015/03/12 Thomas batch file
rem "rem" are comments, "@" is to make sure nothing get displayed
rem ================================================================

@cls

@echo BEGIN: %Date%, %time%
@rspec -r ../config/local.rb %1
@echo END: %date%, %time%		rem This does not appear, due to "rspec". Not sure how to fix