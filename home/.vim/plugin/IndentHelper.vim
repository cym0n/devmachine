"Version: 2.1
"Author: Cymon

function XMLFormat()
	"an element for every row
	execute("%s/> *</>\r</g")
	"to manage elements opening and closing in itsel
	execute('%s/\(<[^>]*\/>\)/\r\1/g')
	let s:indent = 0
	let s:n = 1
	"browse the XML
	while s:n <= line("$")
		cal cursor(s:n, 1)
		"line is indented as estabilished at the line before
		let s:counter = 0
		while s:counter < s:indent
			execute("s/^/\t/")
			let s:counter += 1
		endwhile
		let s:theline = getline(".")		
		if s:theline =~ "<\?"
			"comment line
			"es: <?xml version="1.0" encoding="UTF-8"?>
			"NO ACTION
		elseif s:theline =~ "<\!"
			"directive line
			"es: <!DOCTYPE record SYSTEM dcr4.5.dtd>
			"NO ACTION
		elseif s:theline =~ "<[^\/]"
			"element opening
			if s:theline =~ "<\/"
				"element opening and closing in the same line
				"es: <value>24214</value>
				"NO ACTION
			elseif s:theline =~ "\/>"
				"element opening and closing in itself
				"es: <value/>
				"NO ACTION
			else
				let s:indent = s:indent + 1
			endif
		elseif s:theline =~ "<\/"
			"element closing
			let s:indent = s:indent - 1
			execute("s/^\t//")
		endif
		let s:n += 1
	endwhile
	"erase empty lines
	execute("%s/^[\ \t]*\n//g")
endfunction

function JHashFormat()
	"an element for every row
	execute("%s/{/{\r/g")
	execute("%s/, /, \r/g")
	execute("%s/}/\r}/g")
	let s:indent = 0
	let s:n = 1
	"browse the XML
	while s:n <= line("$")
		cal cursor(s:n, 1)
		"line is indented as estabilished at the line before
		let s:counter = 0
		while s:counter < s:indent
			execute("s/^/\t/")
			let s:counter += 1
		endwhile
		let s:theline = getline(".")		
		if s:theline =~ "{"
			let s:indent = s:indent + 1
		elseif s:theline =~ "}"
			let s:indent = s:indent - 1
			execute("s/^\t//")
		endif
		let s:n += 1
	endwhile
endfunction

