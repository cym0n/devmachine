Per configurare un menu da cui gestire i progetti in vim bisogna:

 * Approntare sotto la directory $HOME/.vimpanel tanti file quante le voci di menu. Ogni file conterrà le directory interessanti per il progetto.
 * Sotto $HOME/.vim/autoload creare un file __guiex.vim__. In questo file inserire una funzione guiex#GUI con la seguente coppia di comandi

    function guiex#GUI()
        tmenu Projects.PROGETTO PROGETTO
        amenu Projects.PROGETTO :cal guiex#progettogui()<CR>
    endfunction

 * __progettogui__ è una funzione presente nel medesimo file, contenente tutti i comandi da lanciare per avviare il progetto. Il minimo è l'apertura del corretto vimpanel.

    function bizeta#dmbgui()
        call StartVIMPEX('PROGETTO')
    endfunction

