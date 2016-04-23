# en.wikipedia.org offers the following definition:
# The knapsack problem or rucksack problem is a problem in combinatorial optimization:
# Given a set of items, each with a weight and a value, determine the number of each
# item to include in a collection so that the total weight is less than a given limit
# and the total value is as large as possible.
#
# This file shows how to model a knapsack problem in GMPL.

# Size of knapsack
param c;

# Items: index, size, profit
set I, dimen 3;

# Indices
set J := setof{(i,s,p) in I} i;

# Assignment
var a{J}, binary;

maximize obj :
  sum{(i,s,p) in I} p*a[i];

s.t. size :
  sum{(i,s,p) in I} s*a[i] <= c;

solve;

printf "The knapsack contains:\n";
printf {(i,s,p) in I: a[i] == 1} " %i", i;
printf "\n";

data;

# Size of the knapsack
param c := 100;

# Items: index, size, profit
set I :=
  1 10 10
  2 10 10
  3 15 15
  4 20 20
  5 20 20
  6 24 24
  7 24 24
  8 50 50;

end;
