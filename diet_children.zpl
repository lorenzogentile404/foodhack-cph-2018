set Food      := { "CamelWhey", "Teff", "Lentil" };

set NutritionalFeature := { 
"Energy",
"Carbohydrates",
"Fats",
"Proteins",
"Nitrogen",
"Phosphorus",
"Calcium",
"Zinc",
"Magnesium",
"A",
"C",
"N6FA",
"N3FA",
"Cysteine",
"Histidine",
"Isoleucine",
"Leucine",
"Lysine",
"Methionine",
"Tryptophane" 
};

set Attr      := NutritionalFeature + { "Price" };

param needed[NutritionalFeature] := <"Energy"> 673, <"Carbohydrates"> 75, <"Fats"> 26, <"Proteins"> 17, <"Nitrogen"> 2.8, <"Phosphorus"> 0.0006, <"Calcium"> 0.00056, <"Zinc"> 0.000013, <"Magnesium"> 0.0002, <"A"> 0, <"C"> 0.06, <"N6FA"> 3.6, <"N3FA"> 0.6, <"Cysteine"> 0.2, <"Histidine"> 0.29, <"Isoleucine"> 0.386, <"Leucine"> 0.837, <"Lysine"> 0.8, <"Methionine"> 0.8, <"Tryptophane"> 0.117;

# Energy (kcal), Nn (g)

# Vitamin A requirement would be 0.00128 g, but it would require too much camel whey to be satasfied. We should add to the mix something with vitamin A.
# The solution provided by the model has too much calories for a child (about 2000 kcal). We should add to the mix something in order to fix this problem. 

param minAmountDesired[Food] := <"CamelWhey"> 0, <"Teff"> 0, <"Lentil"> 50;

param data[Food * Attr] :=
             | "Energy", "Carbohydrates", "Fats", "Proteins", "Nitrogen", "Phosphorus", "Calcium",  "Zinc", "Magnesium",       "A",    "C", "N6FA", "N3FA", "Cysteine", "Histidine", "Isoleucine", "Leucine", "Lysine", "Methionine", "Tryptophane",         "Price" |
|"CamelWhey" |     65.6,             4.4,      4,          3,       0.48,        0.063,     0.106, 0.00044,       0.012, 0.0000125, 0.0237,      0,      0,          1,         2.5,          5.4,      10.4,        7,          2.5,           1.2,         0.00015 |
|"Teff"      |    358.5,              73,    2.5,         11,       1.76,        0.429,      0.18, 0.00363,       0.184,         0,      0,    0.6,    0.6,          0,         2.2,         2.81,       5.8,     2.54,            0,             0,         0.00044 |
|"Lentil"    |    361.5,            63.3,    1.1,       24.6,      3.936,        0.281,     0.035, 0.00327,       0.047,  0.000002, 0.0045,   0.25,   0.25,          0,         2.5,          4.5,         5,        0,            1,           0.5,         0.00044 |;

# Energy (kcal per 100 g), Nutrient (g per 100 g), Price (euro/g)

var x[<f> in Food] real >= 0; #(g)

minimize cost: sum <f> in Food : data[f, "Price"] * x[f];

subto need :
  forall <n> in NutritionalFeature do
    sum <f> in Food : (data[f, n] / 100) * x[f] >= needed[n];

subto minAmount:
  forall <f> in Food : x[f] >= minAmountDesired[f];  

