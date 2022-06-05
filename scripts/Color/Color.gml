// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ColorRGB(_r, _g, _b, _a) constructor {
	r = _r;
	g = _g;
	b = _b;
	a = _a;
	
	static toGrayscale = function() {
		luminance = r * .299 + g * .587 + b * .114;
		return new ColorRGB(luminance, luminance, luminance, a);
	}
	
	static toString = function() {
			
	}
}

function ColorHSV(_h, _s, _v, _a) constructor {
	h = _h;
	s = _s;
	v = _v;
	a = _a;
	
	static toGrayscale = function() {
		luminance = r * .299 + g * .587 + b * .114;
		return new Color(luminance, luminance, luminance, a);
	}
}


//from https://en.wikipedia.org/wiki/HSL_and_HSV#HSV_to_RGB
function HSVToRGB (_colorHSV) {
	colorRGB = undefined;
	
	var hue_section = _colorHSV.h * 6;
	var chroma = _colorHSV.s * _colorHSV.v;
	var w = ((floor(hue_section) % 2) + frac(hue_section)) - 1;
	var intermediate = chroma * (1 - abs(w));
	var m = _colorHSV.v - chroma;
	
	if      (hue_section <= 1) colorRGB = new ColorRGB(chroma + m, intermediate + m, m, _colorHSV.a);
	else if (hue_section <= 2) colorRGB = new ColorRGB(intermediate + m, chroma + m, m, _colorHSV.a);
	else if (hue_section <= 3) colorRGB = new ColorRGB(m, chroma + m, intermediate + m, _colorHSV.a);
	else if (hue_section <= 4) colorRGB = new ColorRGB(m, intermediate + m, chroma + m, _colorHSV.a);
	else if (hue_section <= 5) colorRGB = new ColorRGB(intermediate + m, m, chroma + m, _colorHSV.a);
	else if (hue_section <= 6) colorRGB = new ColorRGB(chroma + m, m, intermediate + m, _colorHSV.a);
	
	return colorRGB
	
}

function randomSolidColor() {
	
	
	colorHSV = new ColorHSV(random(1), random(.1) + .9, random(.1) + .9, 1);
	
	return HSVToRGB(colorHSV);
}