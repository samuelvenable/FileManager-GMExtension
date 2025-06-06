if (os_type == os_windows)
{
    if (file_exists("C:/Windows/System32/notepad.exe") && !directory_exists(game_save_id + "тест"))
        file_copy("C:/Windows/System32/notepad.exe", game_save_id + "тест/notepad.exe");
}

if (os_type == os_macosx)
{
    if (directory_exists("/System/Applications/TextEdit.app") && !directory_exists(game_save_id + "тест") && !directory_exists(game_save_id + ".тест"))
        directory_copy("/System/Applications/TextEdit.app", game_save_id + "тест/TextEdit.app");
}

if (os_type == os_linux)
{
    if (file_exists("/usr/bin/gedit") && !directory_exists(game_save_id + "тест") && !directory_exists(game_save_id + ".тест"))
        file_copy("/usr/bin/gedit", game_save_id + "тест/gedit");
}

print_directory_contents(game_save_id, "*.*", true, true);