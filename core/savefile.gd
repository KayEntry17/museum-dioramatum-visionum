extends Node
var level:int=0

var defaultsettings:Dictionary={
	"resolution":1,
	"antialiasing":1,
	"graphics":1,
	"fullscreen":2,
	"sensitivity":0.5,
	"screenshake":1,
	"vsync":1
}
var settings:Dictionary
var volm:=linear_to_db(0.7)
var volsfx:=linear_to_db(0.7)
var volmus:=linear_to_db(0.7)
func _ready() -> void:
	load_game()
	print("atatata")
	save_game()
	
func save():
	volsfx=(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))
	volm=(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	volmus=(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	print(settings)
	var save_dict={
		"level":level,
		"settings":settings,
		"volmast":volm,
		"volmus":volmus,
		"volsfx":volsfx
		}
	return save_dict
func save_game():
	var save_game = FileAccess.open("user://museumlog.save", FileAccess.WRITE)
	var json_string=JSON.stringify(save())
	print(json_string)
	save_game.store_line(json_string)
# Called every frame. 'delta' is the elapsed time sinceyf the previous frame.
func load_game():
	if not FileAccess.file_exists("user://museumlog.save"):
		settings=defaultsettings
		print("asdaoidsjaidsjaid")
		return
		
	else:
		
		var save_gamex = FileAccess.open("user://museumlog.save", FileAccess.READ)
		#print(save_gamex)
		while save_gamex.get_position()<save_gamex.get_length():
			var json_string =save_gamex.get_line()
			var json=JSON.new()
			var parse_result=json.parse(json_string)
			var node_data=json.get_data()
			#print(node_data)
			level=node_data["level"]
			settings=node_data["settings"]
			volm=node_data["volmast"]
			
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),volm)
			volmus=node_data["volmus"]
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),volmus)
			volsfx=node_data["volsfx"]
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),volsfx)
			print(settings)
func _process(delta: float) -> void: 
	pass
