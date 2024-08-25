// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function map_value(_value, _current_lower_bound, _current_upper_bound, _desired_lowered_bound, _desired_upper_bound) {
	
	var toReturn = (((_value - _current_lower_bound) / (_current_upper_bound - _current_lower_bound)) * (_desired_upper_bound - _desired_lowered_bound)) + _desired_lowered_bound;
	
	//db($"((({_value} - {_current_lower_bound}) / ({_current_upper_bound} - {_current_lower_bound})) * ({_desired_upper_bound} - {_desired_lowered_bound})) + {_desired_lowered_bound};");
	//db($"{toReturn}");
	
	return  toReturn;
}

function map_value_round(_value, _current_lower_bound, _current_upper_bound, _desired_lowered_bound, _desired_upper_bound) {
	
	return round( (((_value - _current_lower_bound) / (_current_upper_bound - _current_lower_bound)) * (_desired_upper_bound - _desired_lowered_bound)) + _desired_lowered_bound );
}


function find_ratio( _value, input_high, output_high) {
	//db($"Rolled amount: {_value}");
	//db($"1d{input_high}");
	var percent = _value / input_high;
	//db($"Percent: {percent}");
	var output = round(output_high*percent);
	//db($"Ratio output (maxOut)*(percent) : {output}");
	return output;	
}