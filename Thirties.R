# This function simulates a player's turn
turn <- function() {
    
    # Number of dice still in game
    dice_left = 6
    
    # The number of current throw
    throw_num = 0
    
    # Final result of the turn
    final = c()
    
    while (dice_left>0){
        
        # Enumerate the throw
        throw_num = throw_num + 1
        
        # In a "bad" throw we do not want to keep any dice
        bad = TRUE
        throw = sample.int(6,size = dice_left, replace = TRUE)
        
        # Choose which dice to keep
        for (die in throw){
            
            if (die>=5){
                final = append(final, die)
                dice_left = dice_left - 1
                bad = FALSE
            }
        }
        
        # We are forced to keep 1 die, so we keep the highest value
        if (bad) {
            final = append(final, max(throw))
            dice_left = dice_left - 1
        }
    }
    
    final_sum = sum(final)
    return(final_sum)
}

# Let's move on from sampling to computing probability

# What is the probability, that from n dice there will be at least 1 value m?
# 1-(1-p)**n
# The probability that the max from n will be m means at least 1 m and no higher than m

ex_max <- function(n){
    p_sum = 0
    e = 0
    for (i in 1:6) {
        p = (1-((i-1)/6)**n) * (1-(5/6)**n)
        e = e + value*p
    }
    
    return(e)
}

expected_value(3)
