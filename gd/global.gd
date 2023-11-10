extends Node

#const GAME_SCENES = {
#"Level_one": "res://scene/L1.tscn"
#}

@onready var loadingScreen = preload("res://scene/LoadingScreen/load_screen1.tscn")

var scene_to_load
var load_screen_scean_instance
var loading = false

#func load_scene(current_scene, next_scene):
func load_scene(path):
	var current_scene = get_tree().current_scene
	
	load_screen_scean_instance = loadingScreen.instantiate()
	get_tree().root.call_deferred("add_child", load_screen_scean_instance)
	
	if ResourceLoader.has_cached(path):
		ResourceLoader.load_threaded_get(path)
	else:
		ResourceLoader.load_threaded_request(path)
		
	current_scene.queue_free()
	
	loading = true
	scene_to_load = path
	
func _process(_delta):
	if not loading:
		return
	
	var progress = []
	var status = ResourceLoader.load_threaded_get_status(scene_to_load, progress)
	
	if status == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		var progress_bar = load_screen_scean_instance.get_node("Control/ProgressBar")
		progress_bar.value = progress[0] * 100	
	elif status == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get((scene_to_load)))
		load_screen_scean_instance.queue_free()
		loading = false
	else :
		print("Loading went wrong")
		
