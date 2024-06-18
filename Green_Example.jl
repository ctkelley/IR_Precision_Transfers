"""
Green_Example(N=4096, alpha=799.0)
Solve a moderately ill-conditioned single-precison problem with IR and
TR = Float64, TS=TW=Float32, and TF = Float32/Float16
"""
function Green_Example(N=4096, alpha=799.0)
# Example for Copper Mt paper
G=Gmat(N);
AD=I - alpha*G;
xe=ones(N);
be=AD*xe;
b=Float32.(be);
A = Float32.(AD);
TA=[Float32, Float16]
pstr = ["k-", "k-.", "k--", "k-o", "k."]
xlim=1
ylim=1.0
for ifl=1:2
    TF = TA[ifl]
    MPF=mplu(A; TF=TF, onthefly=true)
    solout = \(MPF, b; reporting=true, TR=Float64)
    rhist=solout.rhist/solout.rhist[1]
    lhist=length(rhist)
    xlim=max(xlim,lhist)
    ylim=min(ylim,rhist[end])
    semilogy(0:lhist-1, rhist, pstr[ifl])
end
ylim=min(1.e-15, ylim)
axis([0.0, xlim, ylim, 1.0])
xticks(0:1:xlim-1)
ty=[1.0, 1.e-2, 1.e-4, 1.e-6, 1.e-8, 1.e-10, 1.e-12, 1.e-14, 1.e-16];
yticks(ty)
xlabel("Iteration")
ylabel("Relative residual")
legend(["Float32","Float16"])
end
    

