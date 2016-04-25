#include <ruby.h>

uintptr_t call_function(const char *function_name, const char *file_name) {

  if (ruby_setup()) {
		fprintf(stderr, "Failed to init Ruby VM\n");
	}

  rb_require(file_name);
  return rb_funcall(rb_mKernel, rb_intern(function_name), 0, NULL);
}

