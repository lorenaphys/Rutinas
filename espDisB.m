clear all
N=50;
rad=10;
dt=0.0005;
C=0.1;
bet=0.2;
ep=0.01;
ep1=sqrt(ep);
D=5;
sigma=3.0;
gamma=0.0001;
ro = 2.5e-16;

step=100;
Finaliter=10;

numero=0;

fiin=1;
fiout=-1;
fi = zeros(N,N);
u = zeros(N,N);

for i=1:N
  for j=1:N
       r=sqrt((i-.5*(N+1))^2+(j-.5*(N+1))^2);
       fi(i,j)=.5*(fiout-fiin)*tanh((r-rad)*0.8)+(fiout+fiin)*.8;
       u(i,j) = ro*exp(((j-25)^2+(i-25)^2)/30);
  end
end


fi(1:20,:)=1;
fi(1:15,:)=-1;

%u = 0.0001*(rand(N,N)-.5);

[stat,struc] = fileattrib;
PathCurrent = struc.Name;

for q=1:220


for iter=1:Finaliter
   

    for iiter=1:step
%         
%        [~,Ri] = min(abs(fi(:,1)));
%        
%        for i = 1:N
%            for j = 1:N
%                u(i,j) = exp(((j-Ri)^2 + (i-Ri)^2)/30);
%            end
%        end


        lapfi = delta2fun(fi);
       
        lapu = delta2fun(u);

        mu=(fi-ep1*C*(1+bet*u)).*(fi.^2-1)-ep*lapfi;
                
        lapmu = delta2fun(mu);

        F=2*(3*fi.^2-1-2*ep1*C*fi.*(1+bet*u)).*mu-ep*lapmu+gamma*lapu;
   
        lapF = delta2fun(F);

        Fs=lapfi;
        
        lapFs = delta2fun(Fs);

        G=-2*mu*ep1*C*bet*(fi.^2-1)-D*lapu-gamma*lapfi;
        
        lapG = delta2fun(G);

        u=u+dt*lapG;

        fi=fi+dt*(lapF-sigma*lapFs);
        
        lapF(1,:)=lapF(2,:);
        lapF(N,:)=lapF(N-1,:);
        lapF(:,1)=lapF(:,2);
        lapF(:,N)=lapF(:,N-1);
        
        lapFs(1,:)=lapFs(2,:);
        lapFs(N,:)=lapFs(N-1,:);
        lapFs(:,1)=lapFs(:,2);
        lapFs(:,N)=lapFs(:,N-1);
   
        fi(1,:)=fi(2,:);
        fi(N,:)=fi(N-1,:);
        fi(:,1)=fi(:,2);
        fi(:,N)=fi(:,N-1); 
        
        u(1,:)=u(2,:);
        u(N,:)=u(N-1,:);
        u(:,1)=u(:,2);
        u(:,N)=u(:,N-1);

    end

    numero=numero+1;

    FolderName = 'espDisB';   
    PathFolder = [PathCurrent '/Resultados/' FolderName];
    [status,message,messageid] = mkdir([PathCurrent '/Resultados'], FolderName);
    save([PathFolder ['/iter' num2str(numero)]]);
    
    disp(numero)
  
end

end
