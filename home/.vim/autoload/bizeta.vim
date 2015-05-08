"Version: 1.0
"Author: Cymon

"Esempio per configurare syntastic per gestire progetto java
"I file come /home/cymon/.vim/custom/EMEA sono elenchi di directory che costituiscono classpath
function bizeta#Emea()
    exec "let g:EclimFileTypeValidate = 0"
    exec "let g:syntastic_java_javac_config_file_enabled=1"
    exec "let g:syntastic_java_javac_config_file='/home/cymon/.vim/custom/EMEA'"
    exec "let g:syntastic_java_javac_executable='LANG=it_IT GDM_LANG=it_IT LC_ALL=it_IT /home/cymon/local/jdk1.3.1_20/bin/javac'"
    exec "let g:syntastic_java_javac_options='-g'"
endfunction

function bizeta#Bs22spec()
    exec "let g:EclimFileTypeValidate = 0"
    exec "let g:syntastic_java_javac_config_file_enabled=1"
    exec "let g:syntastic_java_javac_config_file='/home/cymon/.vim/custom/bs22Spec'"
    exec "let g:syntastic_java_javac_executable='LANG=it_IT GDM_LANG=it_IT LC_ALL=it_IT /home/cymon/local/jdk1.3.1_20/bin/javac'"
    exec "let g:syntastic_java_javac_options='-g'"
endfunction

function bizeta#Bs22gdo()
    exec "let g:EclimFileTypeValidate = 0"
    exec "let g:syntastic_java_javac_config_file_enabled=1"
    exec "let g:syntastic_java_javac_config_file='/home/cymon/.vim/custom/bs22gdo'"
    exec "let g:syntastic_java_javac_executable='LANG=it_IT GDM_LANG=it_IT LC_ALL=it_IT /home/cymon/local/jdk1.3.1_20/bin/javac'"
    exec "let g:syntastic_java_javac_options='-g'"
endfunction

function bizeta#Bs3Ramonda()
    exec "let g:syntastic_java_javac_config_file_enabled=1"
    exec "let g:syntastic_java_javac_config_file='/home/cymon/.vim/custom/BS3Ramonda'"
    exec "let g:syntastic_java_javac_executable='LANG=it_IT GDM_LANG=it_IT LC_ALL=it_IT /home/cymon/local/jdk1.6.0_45/bin/javac'"
    exec "let g:syntastic_java_javac_options='-g'"
endfunction

function bizeta#dmb()
    exec "let g:EclimFileTypeValidate = 0"
    exec "let g:syntastic_java_javac_config_file_enabled=1"
    exec "let g:syntastic_java_javac_config_file='/home/cymon/.vim/custom/dmb'"
    exec "let g:syntastic_java_javac_executable='LANG=it_IT GDM_LANG=it_IT LC_ALL=it_IT /home/cymon/local/jdk1.3.1_20/bin/javac'"
    exec "let g:syntastic_java_javac_options='-g'"
endfunction

function bizeta#gc()
    exec "let g:EclimFileTypeValidate = 0"
    exec "let g:syntastic_java_javac_config_file_enabled=1"
    exec "let g:syntastic_java_javac_config_file='/home/cymon/.vim/custom/gc'"
    exec "let g:syntastic_java_javac_executable='LANG=it_IT GDM_LANG=it_IT LC_ALL=it_IT /home/cymon/local/jdk1.3.1_20/bin/javac'"
    exec "let g:syntastic_java_javac_options='-g'"
endfunction

function bizeta#WebService()
    exec "let g:EclimFileTypeValidate = 0"
    exec "let g:syntastic_java_javac_config_file_enabled=1"
    exec "let g:syntastic_java_javac_config_file='/home/cymon/.vim/custom/WebService'"
    exec "let g:syntastic_java_javac_executable='LANG=it_IT GDM_LANG=it_IT LC_ALL=it_IT /home/cymon/local/jdk1.6.0_45/bin/javac'"
    exec "let g:syntastic_java_javac_options='-g'"
endfunction

function bizeta#eclimOff()
    exec "let g:EclimFileTypeValidate = 0"
endfunction

function bizeta#dmbgui()
    call bizeta#guireset()
    call bizeta#dmb()
    call StartVIMPEX('projects')
endfunction

"Spegne vimpanel_EX
function bizeta#guireset()
    wincmd l
    only
endfunction

"Da inserire in .vimrc
"Crea un nuovo menu projects
function bizeta#GUI()
    tmenu Projects.DMB DMB
    amenu Projects.DMB :cal bizeta#dmbgui()<CR>
endfunction
