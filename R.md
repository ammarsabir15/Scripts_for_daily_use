# Join vectors containing duplicate values R


list1 <- c(1, 2, 3, 4, 5, 6, 7)


list2 <- c(3, 6, 7, 8, 9, 10, 11)


union(list1, list2)


[1]  1  2  3  4  5  6  7  8  9 10 11



# Find common elements
varss <- c(1:8)

varsg <- c(2:9)
 
# Elements of first variable (varss) which are not present in the second variable (varsg)
both <- varss %in% varsg

both

[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 
 
# Elements of second variable (varsg) which are not present in the first variable (varss)
both <- varsg %in% varss

both

[1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
 
# Intersection of both variables

common <- intersect(varss,varsg)

common

[1] 2 3 4 5 6 7 8
 
 
# What is different in varss
difs <- setdiff(varss,varsg)

difs

[1] 1
 
 
# What is different in varsg
difg <- setdiff(varsg,varss)

difg

[1] 9
