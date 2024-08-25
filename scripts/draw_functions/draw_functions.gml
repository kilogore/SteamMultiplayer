
// Sets all draw functions.
function draw_set(color = c_white, halign = fa_left, valign = fa_top, alpha = 1) {
	draw_set_alpha(alpha);
	draw_set_color(color);
	draw_set_halign(halign);
	draw_set_valign(valign);
}


// Resets all draw functions.
function draw_reset(){
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	// draw_set_font(fnt_default);
}