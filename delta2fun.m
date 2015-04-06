function lap = delta2fun(Fun)

%lap = 0*Fun;
N = 50;
unog=ones(N,N);

laNpl=0*unog;
laNpr=0*unog;
laNpu=0*unog;
laNpd=0*unog;

laNpl(2:N-1,2:N-1)=(Fun(3:N,2:N-1)-Fun(2:N-1,2:N-1));
laNpr(2:N-1,2:N-1)=(Fun(1:N-2,2:N-1)-Fun(2:N-1,2:N-1));
laNpu(2:N-1,2:N-1)=(Fun(2:N-1,3:N)-Fun(2:N-1,2:N-1));
laNpd(2:N-1,2:N-1)=(Fun(2:N-1,1:N-2)-Fun(2:N-1,2:N-1));

lap=laNpl+laNpr+laNpu+laNpd;

