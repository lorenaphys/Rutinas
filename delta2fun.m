

lap=0*Fun;
M=N;
unog=ones(M,N);

lampl=0*unog;
lampr=0*unog;
lampu=0*unog;
lampd=0*unog;

lampl(2:M-1,2:N-1)=(Fun(3:M,2:N-1)-Fun(2:M-1,2:N-1));
lampr(2:M-1,2:N-1)=(Fun(1:M-2,2:N-1)-Fun(2:M-1,2:N-1));
lampu(2:M-1,2:N-1)=(Fun(2:M-1,3:N)-Fun(2:M-1,2:N-1));
lampd(2:M-1,2:N-1)=(Fun(2:M-1,1:N-2)-Fun(2:M-1,2:N-1));
lap=lampl+lampr+lampu+lampd;

