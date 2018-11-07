trans_inSQL <- function(input,select_else = 'select user_id',from_yourdataset = 'from yourdataset'){

  out_sep <-
    input %>%
    separate(variable,into=c('var','lv'),extra = 'merge',remove = FALSE,sep = '\\.') %>%
    mutate(is_numeric = str_detect(lv,'\\(|\\]'))
  library(glue)
  pt_cont <-
    out_sep %>%
    dplyr::filter(is_numeric == TRUE) %>%
    separate(lv,into=c('left','right'),sep=',') %>%
    mutate_at(vars(left,right),~str_remove(.,'\\(|\\]')) %>%
    mutate_at(vars(left,right),~str_replace(.,'Inf',"cast(\'inf\' as double)")) %>%
    transmute(
      pc1_eq = glue('ifnull(cast(({var}>{left} and {var}<={right}) as double),0)*{PC1}')
      ,pc2_eq = glue('ifnull(cast(({var}>{left} and {var}<={right}) as double),0)*{PC2}')
    )
  pt_cate <-
    out_sep %>%
    dplyr::filter(is_numeric == FALSE) %>%
    transmute(
      pc1_eq = glue('ifnull(cast({var}=\'{lv}\' as double),0)*{PC1}')
      ,pc2_eq = glue('ifnull(cast({var}=\'{lv}\' as double),0)*{PC2}')
    ) %>%
    mutate_at(
      vars(pc1_eq,pc2_eq)
      ,~str_replace(.,'=\'noinfos\'',' is null')
    ) %>%
    # in impala, noinfos is null.
    mutate_at(
      vars(pc1_eq,pc2_eq)
      ,~str_replace(.,'=\'0\'','=0')
    ) %>%
    mutate_at(
      vars(pc1_eq,pc2_eq)
      ,~str_replace(.,'=\'1\'','=1')
    )
  bind_rows(pt_cont,pt_cate) %>%
    summarise(
      pc1 = str_flatten(pc1_eq
                        ,collapse = '+\n')
      ,pc2 = str_flatten(pc2_eq
                         ,collapse = '+\n')
    ) %>%
    gather %>%
    transmute(
      value = glue('{value} as {key}')
    ) %>%
    .$value %>%
    str_flatten(collapse = ',\n\n\n') %>%
    paste(select_else
          ,','
          ,.
          ,from_yourdataset
          ,sep = '\n\n\n'
    ) %>%
    cat
}
