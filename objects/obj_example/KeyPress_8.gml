if (directory_exists(game_save_id + "тест"))
    directory_destroy(game_save_id + "тест");

if (os_type == os_macosx)
{
	if (directory_exists(game_save_id + ".тест"))
		directory_destroy(game_save_id + ".тест");
}

if (os_type == os_linux)
{
	if (directory_exists(game_save_id + ".тест"))
		directory_destroy(game_save_id + ".тест");
}
