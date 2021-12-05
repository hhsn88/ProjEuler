#include <iostream>
#include <vector>
#include <set>
#include <math.h>
#include <algorithm>

std::vector<int> ones = {10,100,1000,10000,100000,1000000,10000000};
int last_d[4] = {1,3,7,9};
int num_digits = 8;
int min = std::pow(10, num_digits - 1); //13043123

std::vector<int> primes(int n, int min) {
    std::vector<bool> sieve(n, true);
    for (size_t i = 3; i < std::sqrt(n) + 1; i += 2) {
        if (sieve.at(i)) {
            for (size_t j = i*i; j < sieve.size(); j += 2*i) {
                sieve.at(j) = false;
            }
        }
    }
    std::vector<int> primes;
    if (min <= 2) primes.push_back(2);
    for (int i = 3; i < n; i += 2) {
        if (i > min && sieve.at(i)) primes.push_back(i);
    }
    return primes;
}

long makeBase(long num, int one) {
    return num - one * ((num / one) % 10);
}

bool isJackpot(std::vector<int> primes, long base, int pattern) {
    std::vector<int> m(10);
    for (size_t i = 0; i < 10; i++) { m.at(i) = i * pattern; }
    int nums_count = 0;
    for (size_t i = 0; i < m.size(); i++) { 
        long num = base + m.at(i);
        if (num > min && std::binary_search(primes.begin(), primes.end(), num)) {
            nums_count++;
        }
    }
    if (nums_count == 8) {
        for (size_t i = 0; i < m.size(); i++) { 
            long num = base + m.at(i);
            if (num > min && std::binary_search(primes.begin(), primes.end(), num)) {
                std::cout << num << " ";
            }
        }
    }
    return nums_count == 8;
}

std::set<std::pair<int, int>> checked;
void checkBasePrime(std::vector<int> primes, int p, int num_digits) {
    for (size_t i = 0; i < num_digits - 1; ++i) {
        for (size_t j = 0; j < num_digits - 1; ++j) {
        for (size_t k = 0; k < num_digits - 1; ++k) {
        //
            // if (ones.at(i) != ones.at(j)) {
            if (ones.at(i) != ones.at(j) && ones.at(i) != ones.at(k) && ones.at(j) != ones.at(k)) {
                int base = makeBase(makeBase(p, ones.at(i)), ones.at(j));                
                base = makeBase(base, ones.at(k));
                //
                int sum_ones = ones.at(i) + ones.at(j);
                sum_ones += ones.at(k);
                //
                auto t = std::make_pair(base, sum_ones);
                if (checked.find(t) == checked.end()) {
                    checked.insert(t);
                    if (isJackpot(primes, base, sum_ones)) {
                        return;
                    }
                }
            }
        }
        //
        }
    }            
}

int main () { 
    num_digits = 6;
    min = std::pow(10, num_digits - 1);
    auto primes_to_check = primes(std::pow(10, num_digits), min);
    for (auto p : primes_to_check) {
        checkBasePrime(primes_to_check, p, num_digits);
    }
}