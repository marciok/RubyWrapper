SRCDIR = CWrapper
SHAREDLIB = libRubyWrapper.so

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	SHAREDLIBPATH = /usr/lib
endif
ifeq ($(UNAME_S),Darwin)
	SHAREDLIBPATH = /usr/local/lib
endif

Wrapper: $(SRCDIR)/Wrapper.c
	clang -shared $(SRCDIR)/Wrapper.c  -o $(SHAREDLIB) -I/opt/rubies/2.1.0/include/ruby-2.1.0  -I/opt/rubies/2.1.0/include/ruby-2.1.0/x86_64-darwin14.0 -lruby
	cp libRubyWrapper.so $(SHAREDLIBPATH)

clean:
	-rm -f $(SHAREDLIB)
	-rm -f $(SHAREDLIBPATH)/$(SHAREDLIB)

