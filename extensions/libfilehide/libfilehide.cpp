#include <string>
#include <vector>

#include <cwchar>
#include <cstddef>

#include <windows.h>

#define EXPORTED_FUNCTION extern "C" __declspec(dllexport)

using std::string;
using std::wstring;
using std::vector;
using std::size_t;

static wstring widen(string str) {
  if (str.empty()) return L"";
  size_t wchar_count = str.size() + 1;
  vector<wchar_t> buf(wchar_count);
  return wstring{ buf.data(), (size_t)MultiByteToWideChar(CP_UTF8, 0, str.c_str(), -1, buf.data(), (int)wchar_count) };
}

EXPORTED_FUNCTION double file_hide(const char *fname) {
  wstring wfname = widen(fname);
  DWORD fattr = GetFileAttributesW(wfname.c_str());
  if (fattr != INVALID_FILE_ATTRIBUTES) {
    if (fattr & FILE_ATTRIBUTE_HIDDEN) {
      return true;
	} else if (SetFileAttributesW(wfname.c_str(), fattr | FILE_ATTRIBUTE_HIDDEN)) { 
      return true;
	}
  }
  return false;
}
