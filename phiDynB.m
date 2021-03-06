clear all

et = 1;
NF = 400;
ep1=1;
ep=ep1^2;
sigma=3;
ro=3.5;
or=.1;
gamma = 0.0001;
Afi = 1;
rr = zeros(150,50);
u = zeros(150,50);
r = zeros(150,50);
fi = zeros(150,50);
Nx = 150;
Ny = 50;
R = 25;
ancho = 2;

for i=1:Nx
    for j=1:Ny
      r(i,j)=sqrt((i+.5)^2+(j+.5)^2);
      

          fi(i,j)=-tanh((r(i,j)-R)/ancho);
   
   end
end


fiini=fi;
bet=0*fi;
ra=.5:Nx-.5;
for i=1:Nx
    for j=1:Ny
        rr(i,j)=ra(1,i);
    end
end

iter=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
step=500;
dt=1e-4;

[stat,struc] = fileattrib;
PathCurrent = struc.Name;

FolderName = 'phiDynB';   
PathFolder = [PathCurrent '/Resultados/' FolderName];
[status,message,messageid] = mkdir([PathCurrent '/Resultados'], FolderName);
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
        
        mu=(fi-ep1*u).*((fi).^2-1)-ep*lapfi;
        
        lapmu = lap0(mu) + grad0p(mu)./rr;
        
        F=Afi*(2*(3*fi.^2-1-2*ep1*fi.*u).*mu-ep*lapmu)+gamma*lapu;
        
        lapF = lap0(F) + grad0p(F)./rr;
        
        Fs=-sigma*lapfi;

        lapFs = lap0(Fs) + grad0p(Fs)./rr;
        
        fi=fi+dt*(lapF+lapFs);
        
        fi(1,:)=fiini(1,:);


    end
    
    FolderName = 'phiDynB';   
    PathFolder = [PathCurrent '/Resultados/' FolderName];
    [status,message,messageid] = mkdir([PathCurrent '/Resultados'], FolderName);
    save([PathFolder ['/iter' num2str(iter+1)]]);


    h=isnan(fi(Nx/2,Ny/2));
    if h==1;
      break
    end

    disp(iter+1)
   
end
