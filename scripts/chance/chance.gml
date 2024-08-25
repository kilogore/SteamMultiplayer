// Returns a random number between 0 and 1. Used to calculate chance of things happening.
// if chance(0.9) = 90% chance.
function chance(luck){
	
	var pull = random(1);
	return luck > pull;
	
}