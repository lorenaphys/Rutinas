%Primera prueba, los campos fase se conservan como en las rutinas
%de la dinamica de fi, pero se utilizan los parametros como en las
%rutinas que muestran la distribucion espacial de los campos-fase.
%Para el modelo A.

clear all

Nx = 150;
Ny = 50;
dt = 1e-4;
C = 0.1;
bet = 0.2;
%ep = 1;
ep = 0.01;%Prueba 2
ep1 = sqrt(ep);
sigma = 3.0;
gamma = 1e-4;
ro = 3.5;
or = 0.1;
%Afi = 1;
Afi = 1.5;%Prueba 2
R = 25;
ancho = 2;
ra=.5:Nx-.5;
NF = 400;
step = 500;

r = zeros(Nx,Ny);
fi = zeros(Nx,Ny);
rr = zeros(Nx,Ny);
u = zeros(Nx,Ny);

for i=1:Nx
    for j=1:Ny
      r(i,j)=sqrt((i+.5)^2+(j+.5)^2);
      

          fi(i,j)=-tanh((r(i,j)-R)/ancho);
   
   end
end


fiini=fi;


for i=1:Nx
    for j=1:Ny
        rr(i,j)=ra(1,i);
    end
end

iter=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[stat,struc] = fileattrib;
PathCurrent = struc.Name;

FolderName = 'dinamica1';   
PathFolder = [PathCurrent '/Pruebas/' FolderName];
[status,message,messageid] = mkdir([PathCurrent '/Pruebas'], FolderName);
save([PathFolder ['/iter' num2str(iter)]]);
disp(1)

for iter=1:NF
    for iiter=1:step
        
        
        lapfi = lap0(fi) + grad0p(fi)./rr;
        
        [a, Ri]=min(abs(fi(:,1)));
for i=1:Nx
    for j=1:Ny
u(i,j)=or+ro*exp(-((j)^2+(i-Ri+4)^2)/30);
    end
end


        lapu = lap0(u) + grad0p(u)./rr;
        
        mu=(fi-ep1*C*(1+bet*u)).*(fi.^2-1)-ep*lapfi;
        
        lapmu = lap0(mu) + grad0p(mu)./rr;
        
        F=2*(3*fi.^2-1-2*ep1*C*fi.*(1+bet*u)).*mu-ep*lapmu+gamma*lapu; 
        
        %lapF = lap0(F) + grad0p(F)./rr;
        
        Fs=-sigma*lapfi;

        %lapFs = lap0(Fs) + grad0p(Fs)./rr;
        
        fi = fi - dt*(F + Fs);
        
        %fi(1,:)=fiini(1,:); Asi fi ya no esta sujeto al borde


    end
    
    FolderName = 'dinamica1';   
    PathFolder = [PathCurrent '/Pruebas/' FolderName];
    [status,message,messageid] = mkdir([PathCurrent '/Pruebas'], FolderName);
    save([PathFolder ['/iter' num2str(iter+1)]]);


    h=isnan(fi(Nx/2,Ny/2));
    if h==1;
      break
    end

    disp(iter+1)
   
end