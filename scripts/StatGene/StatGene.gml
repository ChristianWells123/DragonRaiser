// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function StatGene(allele_a, allele_b) constructor{
	a = allele_a;
	b = allele_b;
	
	phenotype = StatAllele.Invalid;
	if (irandom(1) == 0) {
		phenotype = allele_a;
	}
	else {
		phenotype = allele_b;
	}
	
	static toString = function() {
		return "[" + statAlleleToString(a) + statAlleleToString(b) + ", " + statAlleleToString(phenotype) + "]";	
	}
}

enum StatAllele {
	Invalid = -1,
	F = 0,
	D = 1,
	C = 2,
	B = 3,
	A = 4,
	S = 5
}

function createRandomStatGene() {
	rand1 = random(10.0);
	rand2 = random(10.0);
	allele_a = StatAllele.Invalid;
	allele_b = StatAllele.Invalid;
	
	if (rand1 >= 9 && rand1 <= 10) allele_a = StatAllele.A;
	else if (rand1 >= 7) allele_a = StatAllele.B;
	else if (rand1 >= 4) allele_a = StatAllele.C;
	else if (rand1 >= 2) allele_a = StatAllele.D;
	else if (rand1 >= 0) allele_a = StatAllele.F;
	
	if (rand2 >= 9 && rand2 <= 10) allele_b = StatAllele.A;
	else if (rand2 >= 7) allele_b = StatAllele.B;
	else if (rand2 >= 4) allele_b = StatAllele.C;
	else if (rand2 >= 2) allele_b = StatAllele.D;
	else if (rand2 >= 0) allele_b = StatAllele.F;
	
	return new StatGene(allele_a, allele_b);
}

function statAlleleToString(_allele) {
	if (_allele == StatAllele.F) return "F";
	else if (_allele == StatAllele.D) return "D";
	else if (_allele == StatAllele.C) return "C";
	else if (_allele == StatAllele.B) return "B";
	else if (_allele == StatAllele.A) return "A";
	else if (_allele == StatAllele.S) return "S";
	else return "Invalid Stat Allele";
}