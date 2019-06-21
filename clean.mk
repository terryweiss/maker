
CLEAN-MK.DESCRIPTION:=##@clean-mk Recipes for cleaning up after yourself

clean:##@clean-mk Clean up the out dir by deleting everything in it
	${call show-msg,Cleaning ${OUT-DIR}}
	@${TIME} ${RMDIR} ${OUT-DIR}/*

dist-clean: clean##@clean-mk Clean up the out dir *and* the node_modules directory by deleting everything in it
	${call start-msg,Cleaning ${LIB}}
	@${TIME} ${RMDIR} ${LIB}*
ifneq (${DOCS-OUT},)
	${call show-msg,Cleaning ${DOCS-OUT}}
	@${RMDIR} ${DOCS-OUT}*
endif
	@${call end-msg,Cleaning ${LIB}}