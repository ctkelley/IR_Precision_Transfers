# IR_Precision_Transfers

This repo has the codes to create the table in my paper __Interprecision transfers in iterative refinement__

You must know enough about Julia and GitHub to

   - Use the package manager
   - Know how to load Julia modules with  ```using XXX```
   - Clone a GitHub repo.

The codes in this project produce the table in the paper. To get started

  - Install the packages: BenchmarkTools, MultiPrecisionArrays, Printf
      - [How to install packages](https://datatofish.com/install-package-julia/)
  - Clone this repo to make a directory __IR_Precision_Transfers__
  - Go to that new directory and start Julia
     - Type ```using IR_Paper``` at the Julia prompt. Install missing packages if Julia complains.
     - Type ```maketabir1()``` at the Julia prompt to make the table.

I used v1.11.0-beta2 for this becasue v1.11 seems to have faster matrix-vector products. 

```
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.11.0-beta2 (2024-05-29)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> using IR_Paper
[ Info: Precompiling IR_Paper [top-level] (cache misses: include_dependency fsize change (2))
# The complaint about cache misses should (I think) go away when 1.11 is out of beta

julia> maketabir1()
\begin{tabular}{llllllll} 
        N &       LU &      OTF &       IP &   OTF-IR &      its &    IP-IR &      its \\ 
\hline 
200 & 1.6e-04 & 1.5e-05 & 5.7e-06 & 4.5e-05 & 3 & 3.8e-05 & 3   \\ 
400 & 4.9e-04 & 5.4e-05 & 1.9e-05 & 2.3e-04 & 4 & 2.3e-04 & 5   \\ 
800 & 1.8e-03 & 2.4e-04 & 6.6e-05 & 9.9e-04 & 5 & 7.3e-04 & 5   \\ 
1600 & 7.8e-03 & 1.4e-03 & 2.5e-04 & 2.8e-03 & 4 & 2.1e-03 & 4   \\ 
3200 & 4.2e-02 & 9.2e-03 & 1.3e-03 & 2.0e-02 & 5 & 1.7e-02 & 5   \\ 
6400 & 2.9e-01 & 3.6e-02 & 6.1e-03 & 7.2e-02 & 5 & 5.8e-02 & 5   \\ 
\hline 
\end{tabular} 
```
