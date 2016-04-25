#include <ruby.h>

void setup(){

  if (ruby_setup()) {
		fprintf(stderr, "Failed to init Ruby VM\n");
	}
}

void cleanup(){
	ruby_cleanup(0);
}

void require(const char *file_name) {
  rb_require(file_name);
}

void call_function(const char *function_name) {
  rb_funcall(rb_mKernel, rb_intern(function_name), 0, NULL);
}


