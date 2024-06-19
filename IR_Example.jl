function time_example(N=5000; printout=true, alpha=10.0)
G=Gmat(N);
A=I - alpha*G;
xe=ones(N)
b=A*xe
AL = Float32.(A)
timelu=@belapsed lu!(AG)  setup = (AG = copy($AL))
AF = lu(AL)
timesl=@belapsed $AF\$b 
bs = b/norm(b,Inf)
bl = Float32.(bs)
timesll=@belapsed $AF\$bl 
MFO=mplu(A; onthefly=true)
MFI=mplu(A; onthefly=false)
otfir = @belapsed $MFO\$b
ipir = @belapsed $MFI\$b
outO = \(MFO, b; reporting=true);
Oitc = length(outO.rhist) - 1
outI = \(MFI, b; reporting=true);
Iitc = length(outI.rhist) - 1
if printout
println("N = $N, LU time = $timelu, OTFtime= $timesl, 
LOWtime=$timesll, OTFIR = $otfir, IPIR = $ipir")
end
DataOut = [N,  timelu,  timesl, timesll, otfir, Oitc, ipir, Iitc]
return DataOut
end

function maketabir1(idim=[200, 400, 800, 1600, 3200, 6400]; alpha=800.0)
ld=length(idim)
DTAB=zeros(ld,8)
for ix = 1:ld
    DTAB[ix,:] .= time_example(idim[ix]; printout=false, alpha=alpha)
end
formats="%d & %7.2e & %7.2e & %7.2e & %7.2e & %d & %7.2e & %d" 
headers=["N", "LU", "OTF", "IP", "OTF-IR", "its", "IP-IR","its"]
fprintTeX(headers,formats,DTAB)
#DTAB
end

"""
fprintTeX(headers,formats,data)

Print a LaTeX table from a Julia array.

Inputs:
headers: the titles for the columns
          example: headers=["foo", "bar"]
formats: c-style formatting for the columns.
          fprintTeX will add the carriage returns for you.
          example: formats="%d & %7.2e";
"""
function fprintTeX(headers, formats, data)
    (mr, mc) = size(data)
    @printf("\\begin{tabular}{")
    for i = 1:mc
        @printf("l")
    end
    @printf("} \n")
    for i = 1:mc-1
        @printf("%9s &", headers[i])
    end
    @printf("%9s \\\\ \n", headers[mc])
    @printf("\\hline \n")
    #
    # I am not sure why @printf needs this, but it does.
    # See https://github.com/JuliaLang/julia/issues/4248
    #
    printf(fmt::String, args...) = @eval @printf($fmt, $(args...))
    #
    bigform = string(formats, "   \\\\ \n")
    for i = 1:mr
        printf(bigform, data[i, :]...)
    end
    @printf("\\hline \n")
    @printf("\\end{tabular} \n")
end

