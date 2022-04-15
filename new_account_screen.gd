extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func create_player(player):
	# return player_created
	# return player_in_creation
	# return error { msg : "..." }
	return "password empty"
	return "created"
	return "username already exists"
	



func _on_authent_success():
	print("going to main screen")
	
func clean_password():
	var password_node = $VBoxContainer/VBoxContainer2/password
	password_node.text = ""

func clean_username():
	var username_node = $VBoxContainer/VBoxContainer2/username
	username_node.text = ""

func _on_Button_pressed():
	get_tree().change_scene("res://login_screen.tscn")


func _on_create_account_pressed():
	var username = $VBoxContainer/VBoxContainer2/username.text
	var password = $VBoxContainer/VBoxContainer2/password.text
	var player = {username: username, password: password}
	var create_msg = create_player(player)
	var feedback_node = $VBoxContainer/VBoxContainer3/feedback_msg
	
	if create_msg == "created":
		feedback_node.text = "created"
		_on_create_success()
		clean_username()
		clean_password()
	elif create_msg == "username already exist":
		feedback_node.text = "username" + username + "already exist"
		clean_username()
		clean_password()
	elif create_msg == "password empty":
		feedback_node.text = "password should contain at least one character"
		
func _on_create_success():
	print("go to main scene")
	get_tree().change_scene("res://main.tscn")
