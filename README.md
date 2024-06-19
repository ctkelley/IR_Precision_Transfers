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

```
julia> using IR_Paper

julia> maketabir1()
\begin{tabular}{llllllll} 
        N &       LU &      OTF &       IP &   OTF-IR &      its &    IP-IR &      its \\ 
\hline 
200 & 1.58e-04 & 1.55e-05 & 5.66e-06 & 4.42e-05 & 3 & 3.84e-05 & 3   \\ 
400 & 4.87e-04 & 5.01e-05 & 1.90e-05 & 2.36e-04 & 4 & 2.28e-04 & 5   \\ 
800 & 1.78e-03 & 3.88e-04 & 6.57e-05 & 9.64e-04 & 5 & 7.14e-04 & 5   \\ 
1600 & 8.27e-03 & 1.39e-03 & 2.44e-04 & 3.08e-03 & 4 & 2.13e-03 & 4   \\ 
3200 & 4.22e-02 & 9.45e-03 & 1.29e-03 & 1.95e-02 & 5 & 1.63e-02 & 5   \\ 
6400 & 2.85e-01 & 3.79e-02 & 6.19e-03 & 7.20e-02 & 5 & 5.63e-02 & 5   \\ 
\hline 
\end{tabular}
```
