expressions<- function(n){
  answer <- 0
  for(i in 1:n){
    test_sum <- 0
    for (j in i:n){
      test_sum <- test_sum+j
      
      if(test_sum == n){
        answer <- answer + 1
        break
      }
      if(test_sum >n){
        break
      }
    } 
    
  }
  return(answer)
}

expression(15)
