Nx=150;
Ny=50;
R=25;
dd=ones(Nx,Ny);

% load initial
% u0=uout+ues; v0=vout+ves; w0=wout+wes; x0=xout+xes;


ancho=2;
for i=1:Nx
    for j=1:Ny
      r(i,j)=sqrt((i+.5)^2+(j+.5)^2);
      

          fi(i,j)=-tanh((r(i,j)-R)/ancho);
   
   end
end
% u=u0*dd+ran1;
% v=v0*dd+ran2;
% w=w0*dd+ran3;
% x=x0*dd+ran4;

%mesh(fi) por el momento no es necesario