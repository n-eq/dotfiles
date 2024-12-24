# Move this in a custom location and add this line to you .vimrc file:
#  let g:ycm_global_ycm_extra_conf = '<path to this file>'
def Settings( **kwargs ):
  if kwargs[ 'language' ] == 'rust':
    return {
        'ls': {
          'rust-analyzer': {
            'enable': True,
            'checkOnSave': True,
            'procMacro.enable': True,
            'cargo': {
              'buildScripts': {
                'enable': True,
              },
              'features': 'all',
            },
            'diagnostics': {
              'enable': True,
              'disabled': [ 'unlinked-file', 'unresolved-proc-macro', 'inactive-code' ]
            },
            'completion': {
              'callable': {
                'snippets': 'add_parentheses'
              }
            }
          },
        }
      }
