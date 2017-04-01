hi javaTypedef term=italic cterm=NONE ctermfg=LightGreen ctermbg=NONE gui=bold guifg=#60ff60 guibg=NONE
hi javaOperator term=italic cterm=NONE ctermfg=White ctermbg=NONE gui=bold guifg=#000000 guibg=NONE
hi javaClassDecl term=italic cterm=NONE ctermfg=Grey ctermbg=NONE gui=bold guifg=#000000 guibg=NONE
hi javaScopeDecl term=italic cterm=NONE ctermfg=LightBlue ctermbg=NONE guifg=#000000 guibg=NONE
hi javaConstant cterm=NONE ctermfg=Brown ctermbg=NONE guifg=#000000 guibg=NONE

syn keyword javaExternal	native package
syn match javaExternal		"\<import\>\(\s\+static\>\)\?"
syn keyword javaError		goto const
syn keyword javaConditional	if else switch
syn keyword javaRepeat		while for do
syn keyword javaBoolean		true false
syn keyword javaConstant	null
syn keyword javaTypedef		this super
syn keyword javaOperator	new instanceof
syn keyword javaType		boolean char byte short int long float double Thread System Integer String Double Byte Float Long Boolean Char Short
syn keyword javaType		void
syn keyword javaStatement	return
syn keyword javaStorageClass	static synchronized transient volatile final strictfp serializable
syn keyword javaExceptions	throw try catch finally
syn keyword javaAssert		assert
syn keyword javaMethodDecl	synchronized throws
syn keyword javaClassDecl	extends implements interface
syn keyword javaScopeDecl	public protected private abstract
