globals [ max-turtles ]

breed [ genes a-gene ]
breed [ class1_TEs class1_TE ]
breed [ class2_TEs class2_TE ]

patches-own [
  control-potential  ; Likelihood of methylating TEs on this patch
]

to setup
  clear-all
  reset-ticks
  ifelse netlogo-web? [ set max-turtles 80000 ] [ set max-turtles 150000 ]
  ask patches [
    set control-potential (control_rate_prob)  ; methylation/RNAi potential controlled by slider
    set pcolor grey
  ]

  create-genes #genes [  ; Create # of genes based on slider
    setxy random-xcor random-ycor ; set insertion point randomly
    set shape "squaregenes" ; custom square with green color
  ]

  create-class1_TEs #te_class1 [  ; Create # of Class 1 TEs based on slider
    setxy random-xcor random-ycor ; set insertion point randomly
    set shape "square1" ; custom square with light blue color
  ]

  create-class2_TEs #te_class2 [  ; Create # of Class 2 TEs based on slider
    setxy random-xcor random-ycor ; set insertion point randomly
    set shape "square2"  ; custom square with orange color
  ]
end

to go
  if not any? turtles [ stop ]
  if count turtles > max-turtles [ user-message "Model is becoming unstable with too many agents." stop ]

  ask class1_TEs [
    ifelse ((random-float 100 < control-potential) and (not any? genes in-radius gene_proximity_control)) [ die ] [
      if ((random-float 100 < te_class1_movement_rate_prob) and ((random-float 100 > te_class1_hiding_prob) and (any? genes in-radius gene_proximity_teclass1))) [ copy-and-paste ]
      ; these conditions must be met for a TE to copy and paste or cut and paste. move and ~hide logically
  ]
 ]
  ask class2_TEs [
    ifelse ((random-float 100 < control-potential) and (not any? genes in-radius gene_proximity_control)) [ die ] [
    if ((random-float 100 < te_class2_movement_rate_prob) and ((random-float 100 > te_class2_hiding_prob) and (any? genes in-radius gene_proximity_teclass2))) [ cut-and-paste ]
    ; these conditions must be met for a TE to copy and paste or cut and paste. move and ~hide logically
  ]
 ]
  if te_invasion = TRUE [
  if (random-float 100 < te_class1_invasion_prob) [
    create-class1_TEs (random-float (#te_class1_invasion)) [  ; Create # of Class 1 TEs based on invasion sliders
      setxy random-xcor random-ycor ; set insertion point randomly
      set shape "square1" ; custom square with green colour
  ]
]
]
 if te_invasion = TRUE [
 if (random-float 100 < te_class2_invasion_prob) [
  create-class2_TEs (random-float (#te_class2_invasion)) [  ; Create # of Class 2 TEs based on invasion sliders
    setxy random-xcor random-ycor ; set insertion point randomly
    set shape "square2" ; custom square with orange colour
  ]
]
]
if gene_development = TRUE [
 if (random-float 100 < gene_development_prob) [
  create-genes (random-float (#genes_development)) [  ; Create # of Class 1 TEs based on invasion sliders
    setxy random-xcor random-ycor ; set insertion point randomly
    set shape "squaregenes" ; custom square with green colour
  ]
]
]

  tick-advance 1

end

to copy-and-paste  ; class1_TE procedure
   hatch 1 [ rt random-float 360
    jump ((1 / random-float 100) * te_class1_movement_distance) ] ; jump is used instead of fd (move) to avoid methylation while in transit, however this fails to account for RNAi controls
end

to cut-and-paste  ; class2_TE procedure
  rt random-float 360
  jump ((1 / random-float 100) * te_class2_movement_distance) ; jump is used instead of fd (move) to avoid methylation while in transit, however this fails to account for RNAi controls
end
@#$#@#$#@
GRAPHICS-WINDOW
53
12
971
731
-1
-1
10.0
1
10
1
1
1
0
1
1
1
-45
45
-35
35
1
1
1
ticks
30.0

SLIDER
1305
51
1515
84
te_class1_movement_rate_prob
te_class1_movement_rate_prob
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
1306
95
1516
128
te_class2_movement_rate_prob
te_class2_movement_rate_prob
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
1543
51
1720
84
control_rate_prob
control_rate_prob
0
100
0.0
1
1
NIL
HORIZONTAL

TEXTBOX
1310
27
1460
45
TE Movement Rates
11
0.0
1

TEXTBOX
1548
30
1698
48
Genomic Control Rates
11
0.0
1

BUTTON
998
85
1087
118
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
1106
49
1278
82
#te_class1
#te_class1
0
8000
0.0
1
1
NIL
HORIZONTAL

SLIDER
1106
160
1278
193
#te_class2
#te_class2
0
8000
0.0
1
1
NIL
HORIZONTAL

TEXTBOX
1111
29
1261
47
TE Start Numbers
11
0.0
1

SLIDER
1106
291
1278
324
#genes
#genes
0
1000
0.0
1
1
NIL
HORIZONTAL

TEXTBOX
1110
270
1260
288
Gene Start Numbers
11
0.0
1

BUTTON
1010
41
1073
74
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
1306
160
1515
193
te_class1_movement_distance
te_class1_movement_distance
1
100
1.0
1
1
NIL
HORIZONTAL

TEXTBOX
1308
139
1458
157
TE Movement Distances
11
0.0
1

SLIDER
1306
207
1514
240
te_class2_movement_distance
te_class2_movement_distance
1
100
1.0
1
1
NIL
HORIZONTAL

SLIDER
1302
362
1475
395
te_class1_hiding_prob
te_class1_hiding_prob
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
1301
408
1474
441
te_class2_hiding_prob
te_class2_hiding_prob
0
100
0.0
1
1
NIL
HORIZONTAL

TEXTBOX
1306
253
1456
281
TE Hiding Behaviour
11
0.0
1

SLIDER
1304
276
1496
309
gene_proximity_teclass1
gene_proximity_teclass1
0
5
0.0
0.25
1
NIL
HORIZONTAL

MONITOR
997
136
1085
181
# Class 1 TEs
count class1_TEs
2
1
11

MONITOR
997
193
1085
238
# Class 2 TEs
count class2_TEs
2
1
11

SLIDER
1538
370
1724
403
te_class1_invasion_prob
te_class1_invasion_prob
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
1538
418
1724
451
te_class2_invasion_prob
te_class2_invasion_prob
0
100
0.0
1
1
NIL
HORIZONTAL

TEXTBOX
1542
303
1692
331
TE Invasion
11
0.0
1

SLIDER
1537
464
1709
497
#te_class1_invasion
#te_class1_invasion
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
1537
508
1709
541
#te_class2_invasion
#te_class2_invasion
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
1542
96
1733
129
gene_proximity_control
gene_proximity_control
0
5
0.0
0.25
1
NIL
HORIZONTAL

SLIDER
1302
319
1494
352
gene_proximity_teclass2
gene_proximity_teclass2
0
5
0.0
0.25
1
NIL
HORIZONTAL

SLIDER
1541
211
1729
244
gene_development_prob
gene_development_prob
0
100
0.0
1
1
NIL
HORIZONTAL

TEXTBOX
1544
143
1694
161
Gene Development
11
0.0
1

SLIDER
1541
255
1713
288
#genes_development
#genes_development
0
5
0.0
1
1
NIL
HORIZONTAL

INPUTBOX
1105
334
1260
394
#genes
0.0
1
0
Number

INPUTBOX
1106
91
1261
151
#te_class1
0.0
1
0
Number

INPUTBOX
1107
201
1262
261
#te_class2
0.0
1
0
Number

MONITOR
1009
251
1069
296
# Genes
count genes
2
1
11

SWITCH
1538
326
1657
359
te_invasion
te_invasion
1
1
-1000

SWITCH
1542
165
1704
198
gene_development
gene_development
1
1
-1000

@#$#@#$#@
## WHAT IS IT?

This is a simple model of the genome with variables that allow the modeling of Transposable Element 'behaviour' in the genome as an ecosystem. The model should be thought of as acting over evolutionary time though at certain settings and speeds it could represent a much shorter period of time.

## HOW IT WORKS

The rules of the model are relatively simple and few are fixed. Most rules can be adjusted by sliders. Gene count, as well as TE counts, movement rates, movement distance, and propensity to hide in 'safe zones' around genes are all determined by the user. Genomic controls are controlled by the user as well. Finally, the user can control rates of gene development, and TE invasion.

## HOW TO USE IT

### TE Start Numbers

Set the model start numbers for TEs here. This can be zero if you wish to simulate invasion only.

**#te_class1**

Set the starting number of Class 1 (RNA) Transposons. These transposons move around the genome by copying and pasting themselves. Class 1 TEs are represented by light blue squares.

**#te_class2**

Set the starting number of Class 2 (DNA) Transposons. These transposons move around the genome by cutting and pasting themselves. Class 2 TEs are represented by orange squares.

### Gene Start Numbers
Set the model start numbers for genes here. (This can be zero if you wish to simulate gene development only, but the model will not run if there are no TEs or genes. At least one is required to run the model, though it could be one gene or one TE.)  Genes are represented by green squares.

**#genes**

Set the starting number of genes.

### TE Movement Rates

Set the probability that TEs will move by either copy and pasting or cut and pasting behaviours.

**te_class1_movement_rate_prob**

Set the probability that a Class 1 TE will copy and paste at any given moment.

**te_class2_movement_rate_prob**

Set the probability that a Class 2 TE will cut and paste at any given moment.

### TE Movement Distances

Set the distance that a TE will move during any given movement. Distance actually moved by a TE is a random value within the range set by the slider. This number represents an actual patch distance in the model world and will need to be adjusted if the size of the model is adjusted.

**te_class1_movement_distance**

Set the distance that a Class 1 TE will move during any given copy and paste. 

**te_class2_movement_distance**

Set the distance that a Class 2 TE will move during any given cut and paste. 

### TE Hiding Behaviour

Set the behavioural parameters that would cause a TE to “hide” or “shelter” near a gene, representing a strategy of taking advantage of the difficulty of genomic methylation in this area. The value can be adjusted both in terms of “safe” distance from a gene as well as the probability that a TE will remain sheltered or try to move through copying and pasting or cutting and pasting. Since this distance is different from the actual genomic control rates the user can adjust the accuracy of a TE’s “judgement” of “safety.”

**gene_proximity_teclass1**

Set the distance between a gene and TE at which a Class 1 TE will stop copying and pasting (given the probability of hiding).

**gene_proximity_teclass2**

Set the distance between a gene and TE at which a Class 2 TE will stop cutting and pasting (given the probability of hiding).

**te_class1_hiding_prob**

Set the probability that (given a certain distance between a gene and TE) a Class 1 TE will stop copying and pasting.

**te_class2_hiding_prob**

Set the probability that (given a certain distance between a gene and TE) a Class 2 TE will stop cutting and pasting.

### Genomic Control Rates

Set the parameters for genomic controls such as DNA methylation and RNAi controls. (Please note that since TE movement is represented by jumps from one location to another, and not slow movement through the space of the model, this is arguably a flawed representation of RNAi controls.)

**control_rate_prob**

Set the probability that on any given patch a TE will be methylated at any given moment.

**gene_proximity_control**

Set the distance between a gene and a TE at which methylation will no longer occur and a TE will effectively be safe.

### Gene Development

Set the parameters of gene development. This represents the development of genes over evolutionary time.

**gene_development**

Turn the entire process of gene development on or off.

**gene_development_prob**

Set the probability that at any given moment some number of genes will appear in the model semi-randomly.

**#genes_development**

Set the range within which a random number of genes will develop if they do develop (given the probability of gene development.)

### TE Invasion

Set the parameters TE invasion. This represents the invasion of parasitic and viral TEs over evolutionary time.

**te_invasion**

Turn the entire process of TE invasion on or off.

**te_class1_invasion_prob**

Set the probability that at any given moment (tick) a number of Class 1 TEs will invade.

**te_class2_invasion_prob**

Set the probability that at any given moment (tick) a number of Class 2 TEs will invade.

**#te_class1_invasion**

Set the range within which a random number of Class 1 TEs will invade if they do invade (given the probability of TE invasion.)

**#te_class2_invasion**

Set the range within which a random number of Class 2 TEs will invade if they do invade (given the probability of TE invasion.)

## THINGS TO NOTICE

Notice that Class 1 TEs are generally extremely successful at replication and it takes specific measures to ensure that the simulation is not overwhelmed by their copying and pasting. Class 2 TEs on the other hand require careful slider settings to have a fighting chance. 

## THINGS TO TRY

Try to see if you can get Class 2 TEs to outcompete Class 1 TEs in counts. Try to see when patterns emerge that resemble known facts about certain genomes.

## EXTENDING THE MODEL

Genes currently do not die and the model does not stop if genes are overcrowded by TEs. Think about adding conditions under which genes are damaged or die and the model stops or a fitness cost is calculated.

## NETLOGO FEATURES


## RELATED MODELS

I could find no NetLogo models of the interior of the gene but I benefitted greatly from studying various relatively simple models.

## CREDITS AND REFERENCES

@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

square1
false
15
Rectangle -7500403 true false 30 30 270 270
Rectangle -11221820 true false 30 30 270 270

square2
false
15
Rectangle -7500403 true false 30 30 270 270
Rectangle -955883 true false 30 30 270 270

squaregenes
false
15
Rectangle -7500403 true false 30 30 270 270
Rectangle -10899396 true false 30 30 270 270

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.4.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
