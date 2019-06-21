# Pretty text constants
# http://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux


TERM-RESET=tput sgr0
SHOW-MSG-COLOR=tput setaf 12
START-MSG-COLOR=tput setaf 141
END-MSG-COLOR=tput setaf 147

print-var-%: ; @echo $* = $($*) ##@GlobalCommands This is a debugging tool. It allows you to see the value of any variable in the makefile by appending it to this like so: make print-var-HSCONFIG

# Call this function to the user that you are about to do something
define start-msg
$(info $(shell ${START-MSG-COLOR})${1} starting...$(shell ${TERM-RESET}))
endef

# Call this function to the user that you just finished doing something
define end-msg
$(info $(shell ${END-MSG-COLOR})${1}...complete$(shell ${TERM-RESET}))
endef

# Call this function say something meaningful
define show-msg
$(info $(shell ${SHOW-MSG-COLOR})${1}$(shell ${TERM-RESET}))
endef
