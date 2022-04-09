extends Node

const start = 3
var levels_completed = [false, false, false] #[Door, Spike, Box]
var health = start #iffy on this
enum Locations {TutorialR, DoorR, SpikeR, BoxR}
var location
