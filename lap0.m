function lapH = lap0(H) 

Nx=150;
Ny=50;

lapH(2:Nx-1,2:Ny-1)=H(1:Nx-2,2:Ny-1)+H(3:Nx,2:Ny-1)+H(2:Nx-1,1:Ny-2)+H(2:Nx-1,3:Ny)-4*H(2:Nx-1,2:Ny-1);
lapH(1,2:Ny-1)=H(2,2:Ny-1)-H(1,2:Ny-1)+H(1,3:Ny)-H(1,2:Ny-1)+H(1,1:Ny-2)-H(1,2:Ny-1);
lapH(2:Nx-1,1)=H(3:Nx,1)-H(2:Nx-1,1)+H(1:Nx-2,1)-H(2:Nx-1,1)+H(2:Nx-1,2)-H(2:Nx-1,1);
lapH(Nx,2:Ny-1)=H(Nx-1,2:Ny-1)-H(Nx,2:Ny-1)+H(Nx,3:Ny)-H(Nx,2:Ny-1)+H(Nx,1:Ny-2)-H(Nx,2:Ny-1);
lapH(2:Nx-1,Ny)=H(2:Nx-1,Ny-1)-H(2:Nx-1,Ny)+H(3:Nx,Ny)-H(2:Nx-1,Ny)+H(1:Nx-2,Ny)-H(2:Nx-1,Ny);
lapH(1,1)=H(2,1)-H(1,1)+H(1,2)-H(1,1);
lapH(1,Ny)=H(2,Ny)-H(1,Ny)+H(1,Ny-1)-H(1,Ny);
lapH(Nx,1)=H(Nx-1,1)-H(Nx,1)+H(Nx,2)-H(Nx,1);
lapH(Nx,Ny)=H(Nx-1,Ny)-H(Nx,Ny)+H(Nx,Ny-1)-H(Nx,Ny);