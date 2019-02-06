extends Resource

class_name InfoPlayer

var uid : int = 0
var id : String = "InfoPlayer"
var controls : String = "kb1"
var species : String
var cpu: bool = false
var playable : bool = true
var lives : int = 10
var deaths : int = 0
var collectables : int  =0
var score : float = 0.0
var species_template : SpeciesTemplate

func update_death():
	deaths += 1
	return deaths

func update_collectables():
	collectables += 1
	return collectables

func to_dict():
	return {
		"id": uid,
		"name" : id,
		"controls": controls,
		"species" : species,
		"lives" : lives,
		"deaths" : deaths,
		"collectables" : collectables,
		"score" : score,
		"species_template" : species_template
		}