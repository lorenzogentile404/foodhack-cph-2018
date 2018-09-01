set Food      := { "F1", "F2", "F3" };
set Nutrients := { "N1", "N2", "N3" };
set Attr      := Nutrients + {"Price"};

param needed[Nutrients] := <"N1"> 200, <"N2"> 50, <"N3"> 150; #g

param data[Food * Attr] :=
      |      "N1",      "N2" ,      "N3"  , "Price" |
|"F1" |      0.1 ,       0.1 ,       0.8  ,      1  |
|"F2" |      0.5 ,       0.3 ,       0.2  ,      2  |
|"F3" |      0.4 ,       0.5 ,       0.55 ,      3  |;
#             (%)         (%)          (%)  (euro/g)

var x[<f> in Food] real >= 0; #g

minimize cost: sum <f> in Food : data[f, "Price"] * x[f];

subto need :
  forall <n> in Nutrients do
    sum <f> in Food : data[f, n] * x[f] >= needed[n];

