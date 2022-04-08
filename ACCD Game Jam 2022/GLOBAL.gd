extends Node


var levels_completed = [false, false, false] #[Door, Spike, Box]
var health = 3
enum Locations {TutorialR, DoorR, SpikeR, BoxR}
var location
