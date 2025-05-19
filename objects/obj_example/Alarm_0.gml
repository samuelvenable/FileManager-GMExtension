get_string_async("Current Working Directory: ", directory_get_current_working());
get_string_async("Executable Directory Path: ", executable_get_directory());
get_string_async("Executable File Name Spec: ", executable_get_filename());
get_string_async("Executable File Path Name: ", executable_get_pathname());
get_string_async("Temporary Directory Path: ", directory_get_temporary_path());
get_string_async("Desktop Directory Path: ", filename_absolute(directory_get_desktop_path()));
get_string_async("Documents Directory Path: ", filename_absolute(directory_get_documents_path()));
get_string_async("Downloads Directory Path: ", filename_absolute(directory_get_downloads_path()));
get_string_async("Music Directory Path: ", filename_absolute(directory_get_music_path()));
get_string_async("Pictures Directory Path: ", filename_absolute(directory_get_pictures_path()));
get_string_async("Videos Directory Path: ", filename_absolute(directory_get_videos_path()));

if (!directory_exists(game_save_id))
    directory_create(game_save_id);

if (os_type == os_windows)
    get_string_async("enter the following text into command prompt to see your sandbox directory:", "start \"\" \"" + game_save_id + "\"");

if (os_type == os_macosx)
    get_string_async("enter the following text into the terminal to see your sandbox directory:", "open \"" + game_save_id + "\"");

if (os_type == os_linux)
    get_string_async("enter the following text into the terminal to see your sandbox directory:", "xdg-open \"" + game_save_id + "\"");

