# add2deployment


  [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)


R functions for translating R to SQL for deployment.

In the early phase of modeling, the user data is not large, thus the modelers choose to deploy the model they train on Mysql or Impala.

I do such sort of things a lot and think build some defined functions to reduce the translating time (from R code to SQL-like code).

Friendly install `add2deployment` by 

```
devtools::install_github('JiaxiangBU/add2deployment')
```

After successfully installation of `add2deployment`, just library it!

```
library(add2deployment)
```
