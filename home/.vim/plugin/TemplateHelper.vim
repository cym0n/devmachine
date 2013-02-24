"Version: 1.0
"Author: Cymon

function MakeTemplate()
	%s/\(img\|css\|res\|js\)\//\/static\/\1\//g
	%s/<!--TPL \(.*\) -->.*<!--ENDTPL-->/[% \1 | html %]/g
	%s/\/static\/img\//[% c.config.img_webpath %]/g
	%s/\/static\/res\//[% c.config.res_webpath %]/g
	%s/\/static\/res\//[% c.config.res_webpath %]/g
endfunction
