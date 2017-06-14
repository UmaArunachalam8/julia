narms=10;
runs=1000;
runmax=2000;
Q=Array{Float64}(narms);
N=Array{Int64}(narms);
qstar=Array{Float64}(narms);
R=Array{Float64}(runmax,runs)
S=Array{Float64}(runs)
for i=1:runmax
  for x=1:narms
    Q[x]=0;
    N[x]=0;
    qstar[x]=randn();
  end
for j=1:runs
  a=rand();
  if(a<0.1)
    p= rand(1:narms);
  else
    (m,p)= findmax(Q);
  end
  R[i,j] = qstar[p]+randn();
  N[p]+=1;
  Q[p]=Q[p]+((1.0/N[p])*(R[i,j]-Q[p]));
end
end
for b=1:runs
    S[b]=0.0;
    for y=1:runmax
        S[b]=S[b]+R[y,b];
    end
end
avr=S/runmax;
