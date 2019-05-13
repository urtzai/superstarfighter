extends Node

onready var containerPlayer = $MarginContainer/HBoxContainer
onready var label = $MarginContainer/HBoxContainer/Label
onready var container = $MarginContainer/HBoxContainer
onready var animator = $Animator
onready var session = $Session

signal rematch
signal back_to_menu


func initialize(winner:String, scores:Dictionary):
	# let's remove the losers node, if they exists
	for i in range (2, container.get_child_count()):
		container.get_child(i).queue_free()
	
	var array_scores = scores.values()
	
	var loser_ref = container.get_node("winner")
	var template
	if winner == "noone":
		label.text = "NOONE WON"
		container.get_node("winner").visible = false
	else:
		var uid_winner = scores[winner]["id"]
		label.text = scores[winner]["species"].to_upper() + " WON"
		template = scores[winner]["species_template"]
		container.get_node("winner").set_species(scores[winner], false)
		scores[winner]["session_score"] += 1
		container.get_node("winner").set_score(scores[winner]["session_score"])
		
	var stats_array = []
	for player in scores:
		if player == winner:
			continue
		
		var loser = loser_ref.duplicate()
		loser.visible = true
		template = scores[player]["species_template"]
		container.add_child(loser)
		loser.set_species(scores[player])
	
	yield(get_tree().create_timer(3), "timeout")
	animator.play("transition")
	yield(animator, "animation_finished")
	session.initialize(array_scores)
	
	$VBoxContainer.get_child(0).grab_focus()

func _on_Rematch_pressed():
	print("rematcho")
	emit_signal("rematch")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Menu_pressed():
	# TODO: It will be whoever receive the signal to unpause
	print("backo")
	emit_signal("back_to_menu")