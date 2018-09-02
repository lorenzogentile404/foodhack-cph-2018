# camelCase

This repository contains a simple linear optimization model to find an optimal diet that satisfies certain nutrional requirements, while minimizing its cost.
The model has been tested using foods that are available in Ethiopia, like camel whey.  
This algorithm is part of a project developed in the context of [Foodhack CPH 2018](https://www.foodhack.nu/).

The parameters that we considered to represent a food are the following:

| Parameter |
|---------------|
| Energy |
| Carbohydrates |
| Fats |
| Proteins |
| Nitrogen |
| Phosphorus |
| Calcium |
| Zinc |
| Magnesium |
| Vitamin A |
| Vitamin C |
| N-6FA |
| N-3FA |
| Cysteine |
| Histidine |
| Isoleucine |
| Leucine |
| Lysine |
| Methionine |
| Tryptophane |

### How to use it?

In order to use this model you need to convert the .zpl script into a .lp script using [ZIMPL](http://zimpl.zib.de/). Then an optimal solution can be found using [SCIP](http://scip.zib.de/).