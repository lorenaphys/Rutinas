function g0H = grad0p(H) 

Nx=150;
Ny=50;

g0H(2:Nx-1,2:Ny-1)=(H(3:Nx,2:Ny-1))-H(2:Nx-1,2:Ny-1);
g0H(1,2:Ny-1)=(H(2,2:Ny-1)-H(1,2:Ny-1));
g0H(Nx,2:Ny-1)=(H(Nx-1,2:Ny-1)-H(Nx,2:Ny-1));
g0H(2:Nx-1,Ny)=(H(3:Nx,Ny)-H(2:Nx-1,Ny));
g0H(1,1)=(H(2,1)-H(1,1));
g0H(1,Ny)=(H(2,Ny)-H(1,Ny));
g0H(Nx,1)=(H(Nx-1,1)-H(Nx,1));
g0H(Nx,Ny)=(H(Nx-1,Ny)-H(Nx,Ny));
g0H(Nx-1,:)=0;
g0H(Nx,:)=0;
g0H(1,:)=0;
g0H(2,:)=0;