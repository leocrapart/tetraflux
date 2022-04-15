extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func get_player(player_name):
	# fetch player
	var player = {}
	return player
	

func update_player(player_updates):
#	return updated     (green)
#	return updating    (orange)
#	return update error(red)
	pass

func authent_player(username, password):
#	return authent_success
#	return authent error
#	return wrong password
#	return username doesn't exist
	return "success"

func _on_login_pressed():
	var username = $VBoxContainer/VBoxContainer2/username.text
	var password = $VBoxContainer/VBoxContainer2/password.text
	var authent_msg = authent_player(username, password)
	var feedback_node = $VBoxContainer/VBoxContainer3/feedback_msg
	
	if authent_msg == "success":
		feedback_node.text = "success"
		_on_authent_success()
		clean_username()
		clean_password()
	elif authent_msg == "wrong password":
		feedback_node.text = "wrong password"
		clean_password()
	elif authent_msg == "username doesn't exist":
		feedback_node.text = "username doesn't exist"
		clean_username()
		clean_password()


func _on_authent_success():
	print("going to main screen")
	get_tree().change_scene("res://main.tscn")
	
func clean_password():
	var password_node = $VBoxContainer/VBoxContainer2/password
	password_node.text = ""

func clean_username():
	var username_node = $VBoxContainer/VBoxContainer2/username
	username_node.text = ""


func _on_new_account_pressed():
	get_tree().change_scene("res://new_account_screen.tscn")
