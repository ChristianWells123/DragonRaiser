// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Dragon(_name = undefined, 
				_power = undefined,  
				_speed = undefined,
				_flying = undefined, 
				_breath = undefined,
				_color = undefined,
				_pattern = undefined) constructor {
	
	//age of the dragon in years.
	age = 0;
	
	//Age-stage that the dragon is currently in.
	stage = DragonStage.Egg;
	
	//Name of the dragon, as a string.
	name = ""
	if _name == undefined {
		name = "New Dragon"
	}
	else {
		name = _name;	
	}
	
	//The color of the dragon.
	color = undefined;
	if _color == undefined {
		color = randomSolidColor();
	}
	else {
		color = _color;	
	}
	
	//The pattern of the dragon's background texture
	pattern = DragonPattern.Invalid;
	if _pattern == undefined {
		pattern = DragonPattern.Test;
	}
	else {
		color = _color;	
	}
	
	

	//A struct that holds the Stat Genes of the dragon.
	StatGenes = {};
	if (_power == undefined && 
		_speed == undefined &&
		_flying == undefined && 
		_breath == undefined) {
		StatGenes = {
			Power : createRandomStatGene(),
			Speed : createRandomStatGene(),
			Flying : createRandomStatGene(),
			Breath : createRandomStatGene()
		};
	}
	else {
		StatGenes = {
			Power : _power,
			Speed : _speed,
			Flying : _flying,
			Breath : _breath
		};
	}
	
	//A struct that holds the numerical stats of a dragon.
	Stats = {
		Power: 0,
		Speed: 0,
		Flying: 0,
		Breath: 0
	}
	
	//Take another dragons and breeds it's and this dragon's stats together to create a new StatGenes struct.
	static breedStats = function(_dragon) {
		//A list of stat genes that a dragon has, as strings
		genes = variable_struct_get_names(self.StatGenes);
		newStatGenes = {};
		for (i = 0; i < array_length(genes); i++) {
			allele_a = StatAllele.Invalid;
			allele_b = StatAllele.Invalid;
			
			//Decide allele from parent A
			if (irandom(1)) {
				//i.e, allele_a = self.StatGenes.genes[i].a
				allele_a = variable_struct_get(self.StatGenes, genes[i]).a;
			} else {
				//i.e, allele_a = self.StatGenes.genes[i].b
				allele_a = variable_struct_get(self.StatGenes, genes[i]).b;
			}
			
			//Decide allele from parent B
			if (irandom(1)) {
				//i.e, allele_b = _dragon.StatGenes.genes[i].a
				allele_b = variable_struct_get(_dragon.StatGenes, genes[i]).a;
			} else {
				//i.e, allele_b = _dragon.StatGenes.genes[i].b
				allele_b = variable_struct_get(_dragon.StatGenes, genes[i]).b;
			}
			
			newGene = new StatGene(allele_a, allele_b);
			//i.e, newStatGenes.genes[i] = newGene;
			variable_struct_set(newStatGenes, genes[i], newGene);
		}
		return newStatGenes;
	}
	
	static toString = function() {
		//A list of stat genes that a dragon has, as strings
		genes = variable_struct_get_names(self.StatGenes);
		str = name + "\n"
		for (i = 0; i < array_length(genes); i++) {
			str = str + genes[i] + ": " + string(variable_struct_get(self.StatGenes, genes[i])) + "\n";
		}
		return str;
	}
}

enum DragonStage {
	Invalid = -1,
	Egg = 0,
	Hatchling = 1,
	Young = 2,
	Adult = 3
}

enum DragonPattern {
	Invalid = -1,
	None = 0,
	Test = 1
}