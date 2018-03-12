# Question 1

## 1.1 

I1 -> I2 -> L2 -- L8

common mistakes:

- I3 is visited (note that leaf nodes are doubly-linked)


## 1.2

88* is added to L6 after 82* as there is enough space

## 1.3

- search key 109 is added to I3 with pointers to the two leaf nodes below
- L8 is split into [98*, 99*] and [100*, 105*, 109*]


## 1.4

1. tree height: A, B, C should have the same height as I2 and I3
2. key range: for A $[-\infty, 10)$, for B, [10, 20), for C, [20, 30)]
3. minimum occupancy:
   - each non-leaf node should have at least 2 search key values and 3 pointers.
   - each leaf node should have at least 2 data entries


(Example solution: Tuomo Tanila)

# Question 2

main point: after inserting 68

- Split: Bucket A2 is split into Bucket A2 and Bucket A3
  - A2 contains 4, 20, 36, 68 and 0100 points to it
  - A3 contains 12, and 1100 points to it
- local depth A2 and A3 increment to 4
- for the rest pointers, note that local depth is not changed

# Question 3

## via whole heap file

num. records / num. records per page = 10^6 / 10 = 10^5

## B+ tree index (alternative 2)

- $log_F f 10^5$ + num. of qualifying pages
- $f$ is $\frac{\beta}{\alpha}$
  - $\alpha$: occupancy ratio of B+ tree
  - $\beta$: ratio of (size of one data entry) / (size of one record), for example, in the lecture notes 10%, because of alternative 2

observed mistakes:

- use the ratio (0.15) from the slides without explaining/defining

## hash index (alternative 2)

again using the notation from above, need to use

$\frac{\beta}{\alpha} 10^5$ + num. of qualifying pages

observed mistakes:

- use the ratio (0.15) from the slides without explaining/defining


# question 4

1. ceil(4000000 / 17) =235295
2. 1 + ceil(log_16 235295) = 1 + ceil(4.46) = 6
3. 2 x 4000000 x 6 = 4.8 x 10ˆ7
4. solve the linear equation of `1 + ceil(log_{B-1} \frac{N}{B}) = 2` gives `N ~= 2000.5`. So we need at least 2001 buffer pages

observed mistakes:

- for 2, the base is 2 instead of 16


# question 5

denote:

- M=1000 pages for R
- N=50 pages for S
- B=52 for num. of buffer pages

## page-oriented simple nested loops join

- if R is the outer loop, 1000+1000*50=51000
- if S is the outer loop, 50+50*1000=50050

## block nested loops join

- if R is outer loop, then M+ceil(M / (B-2))*N=2000
- if S is outer loop, then N+ceil(N / (B-2))*M=1050

comment:

- should we choose which relation as outer loop so to minimize the page cost?

## sort-merge join

for sorting on both relations:

- $2 * M * (1 + ceil(\log_{B-1}(ceil(\frac{M}{B})))) = 2 * 1000 * (1 + 1) = 4000$
- $2 * N * (1 + ceil(\log_{B-1}(ceil(\frac{N}{B})))) = 2 * 50 * (1 + 0) = 100$

for merging:

- M + N = 1050

in total: 5150


## hash join

- 3M+3N = 3150

