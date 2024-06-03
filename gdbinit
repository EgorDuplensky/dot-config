set history filename ~/.gdb_history
set history save on
set print pretty on
set disassembly-flavor intel
set max-completions 10
set startup-quietly on
set breakpoint pending on

# Aliases
alias -a ct = catch throw

# To skip all .h files when stepping into
# skip -gfi /usr/include/c++/9/bits/*.h
# skip -gfi /usr/include/c++/10/bits/*.h
# skip -gfi /usr/include/c++/11/bits/*.h
skip -gfi /usr/include/c++/9/bits/!(shared_ptr.h)
skip -gfi /usr/include/c++/10/bits/!(shared_ptr.h)
skip -gfi /usr/include/c++/11/bits/!(shared_ptr.h)
skip -gfi /usr/include/c++/12/bits/!(shared_ptr.h)

# python
# import sys
# sys.path.insert(0, '/usr/share/gcc-9/python')
# from libstdcxx.v6.printers import register_libstdcxx_printers
# register_libstdcxx_printers (None)
# end

source /home/eduplens/.local/share/GEP/gdbinit-gep.py
