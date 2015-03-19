clear all

et=1;
dx=1;
NF=400;
sig=0*(1:NF);
ep1=1;
ep=ep1^2;
sigma=3;
ro=3.5;
or=.1;
gamma = 0.0001;
Afi = 1;

fiini=fi;
bet=0*fi;
ra=.5:Nx-.5;
for i=1:Nx
    for j=1:Ny
        rr(i,j)=abs(ra(1,i));
    end
end

iter=1;
grafs
step=500;
dt=1e-4;
cont=iter;

for iter=cont:NF
    for iiter=1:step
        H=fi;
        lap0
        lapfi=lapH;
        H=fi;
        grad0p;
        lapfi=lapfi+g0H./rr;
        
       [a bb]=min(abs(fi(:,1)));
       Ri=bb;
for i=1:Nx
    for j=1:Ny
u(i,j)=or+ro*exp(-((j)^2+(i-Ri+4)^2)/30);
    end
end


H=u;
        lap0
        lapu=lapH;
        H=u;
        grad0p
        lapu=lapu+g0H./rr;
        
        mu=(fi-ep1*u).*((fi).^2-1)-ep*lapfi;
        
        H=mu;
        lap0
        lapmu=lapH;
        H=mu;
        grad0p
        lapmu=lapmu+g0H./rr;
        
        F=Afi*(2*(3*fi.^2-1-2*ep1*fi.*u).*mu-ep*lapmu)+gamma*lapu;
        
        H=F;
        lap0
        lapF=lapH;
        H=F;

        grad0p
        lapF=lapF+g0H./rr;
        
        
        Fs=-sigma*lapfi;

        
        H=Fs;
        lap0
        lapFs=lapH;
        H=Fs;
        grad0p
        lapFs=lapFs+g0H./rr;
        
        fi=fi+dt*(lapF+lapFs);
        
        fi(1,:)=fiini(1,:);


    end
    
    save(['Bsave-' num2str(iter)])
       
sig(iter)=sigma;

    h=isnan(fi(Nx/2,Ny/2));
    if h==1;
      break
    end
    sigma 
    
    iter
    
    figure(2)
    
    mesh(fi), view(80,20)
    
    figure(4)
    grafs
    
    M(:,:,iter)=getframe;
    Fm(:,:,iter)=fi(:,:);
    
end
