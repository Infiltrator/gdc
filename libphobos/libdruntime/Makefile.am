# GDC -- D front-end for GCC
# Copyright (C) 2012 Iain Buclaw
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

AUTOMAKE_OPTIONS = 1.9.4 foreign no-dependencies

ACLOCAL_AMFLAGS = -I . -I ..

OUR_CFLAGS=@DEFS@ -I ../ -I $(srcdir)/gcc -I $(srcdir)/../zlib
D_EXTRA_DFLAGS=-nostdinc -pipe -Wno-deprecated -I $(srcdir) -I ./$(host_alias) -I .
ALL_DFLAGS = $(DFLAGS) $(D_EXTRA_DFLAGS) $(MULTIFLAGS)
IMPDIR = import

toolexecdir = $(phobos_toolexecdir)
toolexeclibdir = $(phobos_toolexeclibdir)

all-local: libgdruntime.a

SUFFIXES = .d

%.o : %.d
	$(GDC) -o $@ $(ALL_DFLAGS) -c $<

# Used to generate .di headers, now just copy from source.d to import/source.di
$(IMPDIR):
	mkdir -p $(IMPDIR)
	mkdir -p $(IMPDIR)/core/stdc
	mkdir -p $(IMPDIR)/core/sync
	mkdir -p $(IMPDIR)/core/sys/freebsd/sys
	mkdir -p $(IMPDIR)/core/sys/linux/sys
	mkdir -p $(IMPDIR)/core/sys/osx/mach
	mkdir -p $(IMPDIR)/core/sys/posix/arpa
	mkdir -p $(IMPDIR)/core/sys/posix/net
	mkdir -p $(IMPDIR)/core/sys/posix/netinet
	mkdir -p $(IMPDIR)/core/sys/posix/sys
	mkdir -p $(IMPDIR)/core/sys/windows
	mkdir -p $(IMPDIR)/gcc

$(IMPDIR)/%.di: %.d $(IMPDIR)
	cp $< $@

# %.o : %.c
# Use .c.o to override Automake
.c.o:
	$(CC) -o $@ $(OUR_CFLAGS) $(CFLAGS) -c $<

.S.o:
	$(CC) -o $@ $(OUR_CFLAGS) $(CFLAGS) -c $<

%.t.o : %.d
	$(GDC) -o $@ $(DFLAGSX) -fno-invariants $(D_EXTRA_DFLAGS) $(MULTIFLAGS) -c $<

%.t.o : %.o
	cp $< $@


#--------------------------------------#
# GDC Runtime

gcc/cbridge_math.o: gcc/cbridge_math.c
	$(CC) -o $@ $(OUR_CFLAGS) $(CFLAGS) -fno-strict-aliasing -c $<

BASE_OBJS=object_.o

RUNTIME_OBJS=rt/aaA.o rt/aApply.o rt/aApplyR.o rt/adi.o rt/arrayassign.o \
	     rt/arraybyte.o rt/arraycast.o rt/arraycat.o rt/arraydouble.o \
	     rt/arrayfloat.o rt/arrayint.o rt/arrayreal.o rt/arrayshort.o \
	     rt/cast_.o rt/critical_.o rt/deh.o rt/dmain2.o rt/minfo.o \
	     rt/memory.o rt/invariant.o rt/lifetime.o \
	     rt/monitor_.o rt/obj.o rt/qsort.o rt/switch_.o rt/tlsgc.o

CORE_OBJS=core/atomic.o core/bitop.o core/cpuid.o core/demangle.o \
	  core/exception.o core/math.o core/memory.o core/runtime.o \
	  core/simd.o core/thread.o core/time.o core/vararg.o \
	  core/sync/barrier.o core/sync/condition.o core/sync/config.o \
	  core/sync/exception.o core/sync/mutex.o core/sync/rwmutex.o \
	  core/sync/semaphore.o

GCC_OBJS=gcc/atomics.o gcc/backtrace.o gcc/builtins.o gcc/deh.o gcc/emutls.o \
	 gcc/libbacktrace.o gcc/unwind_pe.o

UTIL_OBJS=rt/util/console.o rt/util/container.o rt/util/hash.o \
	  rt/util/string.o rt/util/utf.o

TI=ti_AC.o ti_Acdouble.o ti_Acfloat.o ti_Acreal.o ti_Adouble.o ti_Afloat.o \
   ti_Ag.o ti_Aint.o ti_Along.o ti_Areal.o ti_Ashort.o ti_byte.o ti_C.o \
   ti_cdouble.o ti_cfloat.o ti_char.o ti_creal.o ti_dchar.o ti_delegate.o \
   ti_double.o ti_float.o ti_idouble.o ti_ifloat.o ti_int.o ti_ireal.o \
   ti_long.o ti_ptr.o ti_real.o ti_short.o ti_ubyte.o ti_uint.o ti_ulong.o \
   ti_ushort.o ti_void.o ti_wchar.o

DRUNTIME_OBJS=@DRUNTIME_OBJS@

DRUNTIME_OBJS+=$(BASE_OBJS) $(RUNTIME_OBJS) $(UTIL_OBJS) \
	       $(subst ti_,rt/typeinfo/ti_,$(TI))

# OS specific
RT_STDC_OBJS=core/stdc/config.o core/stdc/ctype.o core/stdc/errno.o \
	     core/stdc/errno_.o core/stdc/math.o core/stdc/signal.o \
	     core/stdc/stdarg.o core/stdc/stdio.o core/stdc/stdlib.o \
	     core/stdc/stdint.o core/stdc/stddef.o core/stdc/string.o \
	     core/stdc/time.o core/stdc/wchar_.o

RT_FREEBSD_OBJS=core/sys/freebsd/execinfo.o core/sys/freebsd/sys/event.o

RT_OSX_OBJS=core/sys/osx/mach/kern_return.o core/sys/osx/mach/port.o \
	    core/sys/osx/mach/semaphore.o core/sys/osx/mach/thread_act.o \
	    core/sys/osx/pthread.o

RT_POSIX_OBJS=core/sys/posix/dirent.o core/sys/posix/netdb.o \
	      core/sys/posix/signal.o core/sys/posix/sys/ioctl.o \
	      core/sys/posix/sys/select.o core/sys/posix/sys/socket.o \
	      core/sys/posix/sys/stat.o core/sys/posix/sys/wait.o \
	      core/sys/posix/sys/un.o core/sys/posix/sys/utsname.o \
	      core/sys/posix/sys/utsname.o core/sys/posix/netinet/in_.o

RT_WINDOWS_OBJS=core/sys/windows/dbghelp.o core/sys/windows/dll.o \
		core/sys/windows/stacktrace.o core/sys/windows/threadaux.o \
		core/sys/windows/windows.o

D_GC_MODULES=@D_GC_MODULES@

# Regardless of OS, all import headers are generated.
CORE_IMPORTS=core/atomic.di core/bitop.di core/cpuid.di core/demangle.di \
	     core/exception.di core/math.di core/memory.di core/runtime.di \
	     core/simd.di core/time.di core/vararg.di \
	     \
	     core/stdc/complex.di core/stdc/config.di core/stdc/ctype.di \
	     core/stdc/errno.di core/stdc/fenv.di core/stdc/float_.di \
	     core/stdc/inttypes.di core/stdc/limits.di core/stdc/locale.di \
	     core/stdc/math.di core/stdc/signal.di core/stdc/stdarg.di \
	     core/stdc/stddef.di core/stdc/stdint.di core/stdc/stdio.di \
	     core/stdc/stdlib.di core/stdc/string.di core/stdc/tgmath.di \
	     core/stdc/time.di core/stdc/wchar_.di core/stdc/wctype.di \
	     \
	     core/sync/barrier.di core/sync/condition.di core/sync/config.di \
	     core/sync/exception.di core/sync/mutex.di core/sync/rwmutex.di \
	     core/sync/semaphore.di \
	     \
	     core/sys/freebsd/dlfcn.di core/sys/freebsd/execinfo.di \
	     core/sys/freebsd/sys/elf32.di core/sys/freebsd/sys/elf64.di \
	     core/sys/freebsd/sys/elf_common.di core/sys/freebsd/sys/elf.di \
	     core/sys/freebsd/sys/event.di core/sys/freebsd/sys/link_elf.di \
	     \
	     core/sys/linux/config.di core/sys/linux/dlfcn.di \
	     core/sys/linux/elf.di core/sys/linux/epoll.di \
	     core/sys/linux/errno.di core/sys/linux/execinfo.di \
	     core/sys/linux/link.di core/sys/linux/sys/inotify.di \
	     core/sys/linux/sys/mman.di core/sys/linux/sys/signalfd.di \
	     core/sys/linux/sys/xattr.di \
	     \
	     core/sys/osx/execinfo.di core/sys/osx/mach/dyld.di \
	     core/sys/osx/mach/getsect.di core/sys/osx/mach/kern_return.di \
	     core/sys/osx/mach/loader.di core/sys/osx/mach/port.di \
	     core/sys/osx/mach/semaphore.di core/sys/osx/mach/thread_act.di \
	     core/sys/osx/pthread.di \
	     \
	     core/sys/posix/arpa/inet.di core/sys/posix/config.di \
	     core/sys/posix/dirent.di core/sys/posix/dlfcn.di \
	     core/sys/posix/fcntl.di core/sys/posix/grp.di \
	     core/sys/posix/inttypes.di core/sys/posix/netdb.di \
	     core/sys/posix/poll.di core/sys/posix/pthread.di \
	     core/sys/posix/pwd.di core/sys/posix/sched.di \
	     core/sys/posix/semaphore.di core/sys/posix/setjmp.di \
	     core/sys/posix/signal.di core/sys/posix/stdio.di \
	     core/sys/posix/stdlib.di core/sys/posix/syslog.di \
	     core/sys/posix/termios.di core/sys/posix/time.di \
	     core/sys/posix/ucontext.di core/sys/posix/unistd.di \
	     core/sys/posix/utime.di core/sys/posix/net/if_.di \
	     core/sys/posix/netinet/in_.di core/sys/posix/netinet/tcp.di \
	     core/sys/posix/sys/ioctl.di core/sys/posix/sys/ipc.di \
	     core/sys/posix/sys/mman.di core/sys/posix/sys/resource.di \
	     core/sys/posix/sys/select.di core/sys/posix/sys/shm.di \
	     core/sys/posix/sys/socket.di core/sys/posix/sys/stat.di \
	     core/sys/posix/sys/statvfs.di core/sys/posix/sys/time.di \
	     core/sys/posix/sys/types.di core/sys/posix/sys/uio.di \
	     core/sys/posix/sys/un.di core/sys/posix/sys/utsname.di \
	     core/sys/posix/sys/wait.di \
	     \
	     core/sys/windows/dbghelp.di core/sys/windows/dll.di \
	     core/sys/windows/stacktrace.di core/sys/windows/threadaux.di \
	     core/sys/windows/windows.di

GCC_IMPORTS=gcc/atomics.di gcc/attribute.di gcc/backtrace.di \
	    gcc/builtins.di gcc/libbacktrace.di

ALL_DRUNTIME_OBJS = $(DRUNTIME_OBJS) $(CORE_OBJS) $(D_GC_MODULES) $(GCC_OBJS)

libgdruntime.a : $(ALL_DRUNTIME_OBJS) \
		 $(subst core/,$(IMPDIR)/core/,$(CORE_IMPORTS)) \
		 $(subst gcc/,$(IMPDIR)/gcc/,$(GCC_IMPORTS))
if BACKTRACE_SUPPORTED
	cp -f $(LIBBACKTRACE_LIB) $@
	$(AR) -q $@ $(ALL_DRUNTIME_OBJS)
else
	$(AR) -r $@ $(ALL_DRUNTIME_OBJS)
endif
	$(RANLIB) $@

libgdruntime_t.a : $(ALL_DRUNTIME_OBJS:.o=.t.o)
if BACKTRACE_SUPPORTED
	cp -f $(LIBBACKTRACE_LIB) $@
	$(AR) -q $@ $(ALL_DRUNTIME_OBJS:.o=.t.o)
else
	$(AR) -r $@ $(ALL_DRUNTIME_OBJS:.o=.t.o)
endif
	$(RANLIB) $@

unittest: libgdruntime.a libgdruntime_t.a unittest.o
	$(GDC) -o $@ $(CFLAGS) unittest.o -nophoboslib -L./ -lgdruntime_t $(LIBS) -ldl

#--------------------------------------#
# Install, doc, etc targets

install-exec-local: libgdruntime.a
	$(mkinstalldirs) $(DESTDIR)$(toolexeclibdir)
	$(INSTALL) libgdruntime.a $(DESTDIR)$(toolexeclibdir)
	$(RANLIB) $(DESTDIR)$(toolexeclibdir)/libgdruntime.a

install-data-local: libgdruntime.a
	$(mkinstalldirs) $(DESTDIR)$(gdc_include_dir)
	for i in __entrypoint.di object.di; do \
	    $(INSTALL_HEADER) $(srcdir)/$$i $(DESTDIR)$(gdc_include_dir); \
	done
	for i in core; do \
	    $(mkinstalldirs) $(DESTDIR)$(gdc_include_dir)/$$i; \
	    for f in $(srcdir)/$$i/*.di; do \
		$(INSTALL_HEADER) $$f $(DESTDIR)$(gdc_include_dir)/$$i; \
	    done; \
	done
	for i in core core/stdc core/sync core/sys/freebsd \
	    core/sys/freebsd/sys core/sys/linux core/sys/linux/sys \
	    core/sys/osx core/sys/osx/mach core/sys/posix \
	    core/sys/posix/arpa core/sys/posix/net \
	    core/sys/posix/netinet core/sys/posix/sys \
	    core/sys/windows; do \
	    $(mkinstalldirs) $(DESTDIR)$(gdc_include_dir)/$$i; \
	    for f in $(IMPDIR)/$$i/*.di; do \
		$(INSTALL_HEADER) $$f $(DESTDIR)$(gdc_include_dir)/$$i; \
	    done; \
	done
	for i in gcc; do \
	    $(mkinstalldirs) $(DESTDIR)$(gdc_include_dir)/$$i; \
	    for f in $(IMPDIR)/$$i/*.di; do \
		$(INSTALL_HEADER) $$f $(DESTDIR)$(gdc_include_dir)/$$i; \
	    done; \
	done
	for i in phobos-ver-syms; do \
	    $(mkinstalldirs) $(DESTDIR)$(gdc_include_dir)/$(host_alias)/$(MULTISUBDIR); \
	    $(INSTALL_HEADER) $$i $(DESTDIR)$(gdc_include_dir)/$(host_alias)/$(MULTISUBDIR); \
	done

clean-local:
	rm -f $(ALL_DRUNTIME_OBJS)
	rm -f $(ALL_DRUNTIME_OBJS:.o=.t.o)
	rm -f $(CORE_IMPORTS)
	rm -f $(GCC_IMPORTS)
	rm -rf $(IMPDIR)
	rm -f libgdruntime.a

check-local: unittest
	./unittest

# Work around what appears to be a GNU make bug handling MAKEFLAGS
# values defined in terms of make variables, as is the case for CC and
# friends when we are called from the top level Makefile.
AM_MAKEFLAGS = \
	"AR_FLAGS=$(AR_FLAGS)" \
	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
	"CC_FOR_TARGET=$(CC_FOR_TARGET)" \
	"CFLAGS=$(CFLAGS)" \
	"CXXFLAGS=$(CXXFLAGS)" \
	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
	"CFLAGS_FOR_TARGET=$(CFLAGS_FOR_TARGET)" \
	"INSTALL=$(INSTALL)" \
	"INSTALL_DATA=$(INSTALL_DATA)" \
	"INSTALL_PROGRAM=$(INSTALL_PROGRAM)" \
	"INSTALL_SCRIPT=$(INSTALL_SCRIPT)" \
	"LDFLAGS=$(LDFLAGS)" \
	"LIBCFLAGS=$(LIBCFLAGS)" \
	"LIBCFLAGS_FOR_TARGET=$(LIBCFLAGS_FOR_TARGET)" \
	"MAKE=$(MAKE)" \
	"MAKEINFO=$(MAKEINFO) $(MAKEINFOFLAGS)" \
	"PICFLAG=$(PICFLAG)" \
	"PICFLAG_FOR_TARGET=$(PICFLAG_FOR_TARGET)" \
	"SHELL=$(SHELL)" \
	"RUNTESTFLAGS=$(RUNTESTFLAGS)" \
	"exec_prefix=$(exec_prefix)" \
	"infodir=$(infodir)" \
	"libdir=$(libdir)" \
	"includedir=$(includedir)" \
	"prefix=$(prefix)" \
	"tooldir=$(tooldir)" \
	"gdc_include_dir=$(gdc_include_dir)" \
	"AR=$(AR)" \
	"AS=$(AS)" \
	"LD=$(LD)" \
	"RANLIB=$(RANLIB)" \
	"NM=$(NM)" \
	"NM_FOR_BUILD=$(NM_FOR_BUILD)" \
	"NM_FOR_TARGET=$(NM_FOR_TARGET)" \
	"DESTDIR=$(DESTDIR)" \
	"WERROR=$(WERROR)"

# Subdir rules rely on $(FLAGS_TO_PASS)
FLAGS_TO_PASS = $(AM_MAKEFLAGS)
