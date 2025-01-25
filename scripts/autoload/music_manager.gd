extends Node

var main_menu_stream: AudioStreamMP3 = preload("res://assets/music/The_Old_Tower_Inn.mp3")
var game_stream: AudioStreamMP3 = preload("res://assets/music/battleThemeA.mp3")
var end_stream: AudioStreamMP3 = preload("res://assets/music/Heavy_ConceptB.mp3")

var music_player: AudioStreamPlayer

func _ready() -> void:
	var audio_stream_player: AudioStreamPlayer = AudioStreamPlayer.new()
	music_player = audio_stream_player
	add_child(audio_stream_player)

func switch_to_main():
	switch_to(main_menu_stream)

func switch_to_game():
	switch_to(game_stream)

func switch_to_end():
	switch_to(end_stream)

func switch_to(stream: AudioStreamMP3):
	music_player.stop()
	music_player.stream = stream
	music_player.play()
