"""
Module with auxiliar functions to solve some problems.
"""
module Euler

"""
Check if a number `d` divides a number `n`.
"""
divides(d::Integer, n::Integer) = n % d == 0

"""
Given a number `n` return a vector with its prime factors
"""
function prime_factors(n::Integer)
    divs = Int64[]
    temp_n = n

    while temp_n > 1
        for d ∈ 2:temp_n
            if divides(d, temp_n) #|| d > isqrt(temp_n)
                temp_n = div(temp_n, d)
                push!(divs, d)
                break
            end

            if d > isqrt(temp_n)
                push!(divs, temp_n)
                temp_n = 1
                break
            end

        end
    end

    return divs
end

"""
Return a vector with all primes up to `n` using the
sieve of Eratosthenes algorithm.
"""
function sieve_of_eratosthenes(n::Integer)
    sieve = trues(n)  # Create a boolean array to mark primes
    
    # Set the multiples of primes as false (not prime)
    for i in 2:isqrt(n)
      if sieve[i]
        for j in i^2:i:n
          sieve[j] = false
        end
      end
    end
    
    primes = filter(x -> sieve[x], 2:n)  # Filter out non-primes
    
    return primes
end

end # end module

import .Euler