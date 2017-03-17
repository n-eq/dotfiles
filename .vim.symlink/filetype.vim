"mon fichier de types
if exists("did_load_filetypes")
	finish
endif
augroup filetypedetec
	au! BufRead,BufNewFile *.deca       setfiletype java
	au! BufRead,BufNewFile *.decah      setfiletype java
	au! BufRead,BufNewFile *.ass        setfiletype asm
augroup END
