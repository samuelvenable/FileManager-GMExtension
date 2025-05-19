#define file_hide
var fname = environment_expand_variables(argument0);
if (os_type == os_windows) {
  while (string_pos_ext("/", fname, string_length(fname)) == string_length(fname) || 
    string_pos_ext("\\", fname, string_length(fname)) == string_length(fname)) {
    fname = string_copy(fname, 1, string_length(fname) - 1);
  }
  return _file_hide(fname);
} else {
  while (string_pos_ext("/", fname, string_length(fname)) == string_length(fname)) {
    fname = string_copy(fname, 1, string_length(fname) - 1);
  }
  fname = filename_name(fname);
  if (string_pos(".", fname) != 1) {
    if (file_rename(fname, "." + fname)) {
	  return true;
	}
  } else {
    return true;
  }
  return false;
}
