#'@export
extract_block_hours <- function(contracts){
  
  return(suppressWarnings(ifelse(grepl("-",contracts),as.numeric(gsub(".*-","",contracts)),0)))
}

#'@export
extract_contract_hour <- function(contracts){
  
  return(as.numeric(substr(contracts,9,10)))
  
  ### Slightly complicated and prone to time zone failure
  # return(lubridate::hour(readr::parse_datetime(gsub("PH|PB|-.*","",contracts),format="%y%m%d%H")))
}

#'@export
preprocess_transactions_df <- function(raw_df){
  
  return_df <- 
  raw_df %>% 
    mutate(
      block_hours = extract_block_hours(contract), 
      contract_hour = extract_contract_hour(contract),
      contract_end_hour = contract_hour + ifelse(block_hours == 0,0,block_hours-1),
      quantity_in_mwh = quantity/10,
      total_quantity_in_mwh = quantity_in_mwh*ifelse(block_hours == 0,1,block_hours)
    )

  return(return_df)
}