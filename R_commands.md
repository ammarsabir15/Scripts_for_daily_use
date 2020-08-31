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


# Ordering dataframes
    head(mtcars)

                      mpg cyl disp  hp drat    wt  qsec vs am gear carb

    Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4

    Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4

    Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1

    Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1

    Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2

    Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

# sort by mpg
    newdata <- mtcars[order(mpg),]
 
    head(newdata)
                  
                        mpg cyl disp  hp drat    wt  qsec vs am gear carb

    Cadillac Fleetwood  10.4   8  472 205 2.93 5.250 17.98  0  0    3    4

    Lincoln Continental 10.4   8  460 215 3.00 5.424 17.82  0  0    3    4

    Camaro Z28          13.3   8  350 245 3.73 3.840 15.41  0  0    3    4

    Duster 360          14.3   8  360 245 3.21 3.570 15.84  0  0    3    4

    Chrysler Imperial   14.7   8  440 230 3.23 5.345 17.42  0  0    3    4

    Maserati Bora       15.0   8  301 335 3.54 3.570 14.60  0  1    5    8

# Sort by mpg (ascending) and cyl (descending)
    newdata <- mtcars[order(mpg, -cyl),]
 
    head(newdata)

                        mpg cyl disp  hp drat    wt  qsec vs am gear carb

    Cadillac Fleetwood  10.4   8  472 205 2.93 5.250 17.98  0  0    3    4

    Lincoln Continental 10.4   8  460 215 3.00 5.424 17.82  0  0    3    4

    Camaro Z28          13.3   8  350 245 3.73 3.840 15.41  0  0    3    4

    Duster 360          14.3   8  360 245 3.21 3.570 15.84  0  0    3    4

    Chrysler Imperial   14.7   8  440 230 3.23 5.345 17.42  0  0    3    4

    Maserati Bora       15.0   8  301 335 3.54 3.570 14.60  0  1    5    8
    
 # Replace or remove strings in R
    group <- c("12357e", "12575e", "197e18", "e18947")
    group
    [1] "12357e" "12575e" "197e18" "e18947"

    gsub("e", "", group)
    [1] "12357" "12575" "19718" "18947"
    
 # To use python in Rstudio 
    library(reticulate)
    repl_python
 
 
 
 # Other commands to add
    table
    table.prop
    
    
    
    
    
    



