#include "terminal_pty.h"

#include "include/dart_api_dl.c"

#if _WIN32
#include "terminal_pty_win.c"
#else
#include "forkpty.c"
#include "terminal_pty_unix.c"
#endif