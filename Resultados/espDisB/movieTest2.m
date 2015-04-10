t = 0:.1:2*pi;
a(:,1)=sin(t); a(:,2)=cos(t);
h = plot(a);
set(h,{'DisplayName'},{'Sine','Cosine'}')
legend show