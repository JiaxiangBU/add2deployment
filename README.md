# add2deployment

R functions for translating R to SQL for deployment.

In the early phase of modeling, the user data is not large, thus the modelers choose to deploy the model they train on Mysql or Impala.

I do such sort of things a lot and think build some defined functions to reduce the translating time (from R code to SQL-like code).

There are three kind of variables

1. factor variable
1. continous variable
1. binary variable
: data type is `dbl` in `data.frame` but there are only two distinct value (like 1,0).

