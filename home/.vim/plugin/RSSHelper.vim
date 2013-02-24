function RSSgen( cat, chan )
	%s/\t/#/g
	%s/^/a:cat#a:chan#/g
	%s/#\([^#]\+\)$/#dispatche.do?ty_key=\1/
	%s/#\([^#]\+\)#\([^#]\+\)$/#\1#\1#\2/
endfunction
