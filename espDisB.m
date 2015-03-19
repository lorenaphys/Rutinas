clear all
N=50;
rad=10;
radm=2.5*rad;
dx=1;
dt=0.0005;
C=0.1;
bet=0.2;
dx=1;
ep=0.01;
ep1=sqrt(ep);
D=5;
s=1;          %radio
sigma=3.0;
rho=1;
rhos=1;
mrho=10;
gamma=0.0001;

step=100;
iniciogenes=60;
Finaliter=10;
pent=iniciogenes;

count=0;
countiter=0;
numer=0;
numero=0

fiin=1;
fiout=-1

for i=1:N
  for j=1:N
       r=sqrt((i-.5*(N+1))^2+(j-.5*(N+1))^2);
       fi(i,j)=.5*(fiout-fiin)*tanh((r-rad)*0.8)+(fiout+fiin)*.8;
       fi1(i,j)=.5*(fiout-fiin)*tanh((r-radm)*.8)+(fiout+fiin)*.5;
       line(i,j)=-0.1;
       line1(i,j)=0.1;
  end
end

fi(1:20,:)=1;
fi(1:15,:)=-1;
fi1(1:20,:)=1;
fi1(1:15,:)=-1;

u=0.0*(rand(N,N)-.5);

u0=sign(u-.5);
fi0=sign(fi);
w=(fi0+1)/2;
a=ones(N,N);
b=a;
c=w;

pa=-10.4;
pb=22.5;
pc=1/3.6;

for q=1:220


for iter=1:Finaliter
   
            
    count=count+1;
    
    for iiter=1:step
     
     
       esc=1.0;
       
        Fun=fi;
        delta2fun
        lapfi=lap;
        
        
       
        mu=(fi-ep1*C*(1+bet*u)).*(fi.^2-1)-ep*lapfi;
                

        Fun=mu;      
        delta2fun
        lapmu=lap;
        
        Fun=u;
        delta2fun
        lapu=lap;
       
        F=2*(3*fi.^2-1-2*ep1*C*fi.*(1+bet*u)).*mu-ep*lapmu+gamma*lapu;
   

        Fun=F;
        delta2fun
        lapF=lap;
        
        
        Fs=lapfi;
        Fun=Fs;
        delta2fun
        lapFs=lap;
        
        G=-2*mu*ep1*C*bet*(fi.^2-1)-D*lapu-gamma*lapfi;
        
        Fun=G;
        delta2fun
        lapG=lap;
        
        FFF=F-sigma*Fs;
       
        u=u+dt*lapG;
       
      
       
        fi=fi+dt*(lapF-sigma*lapFs);
        
        lapF(1,:)=lapF(2,:);
        lapF(N,:)=lapF(N-1,:);
        lapF(:,1)=lapF(:,2);
        lapF(:,N)=lapF(:,N-1);
        [derilapF,derjlapF]=gradient(lapF);
        
        lapFs(1,:)=lapFs(2,:);
        lapFs(N,:)=lapFs(N-1,:);
        lapFs(:,1)=lapFs(:,2);
        lapFs(:,N)=lapFs(:,N-1);
        [derilapFs,derjlapFs]=gradient(lapFs);
   
        fi(1,:)=fi(2,:);
        fi(N,:)=fi(N-1,:);
        fi(:,1)=fi(:,2);
        fi(:,N)=fi(:,N-1);
        [derifi,derjfi]=gradient(fi);

        
       

         I=sum(sum(derifi.*(derilapF-derifi)+derjfi.*(derjlapF-derjfi)));
         Is=sum(sum(derifi.*(derilapFs)+derjfi.*(derjlapFs)));
        
         
         u(1,:)=u(2,:);
         u(N,:)=u(N-1,:);
         u(:,1)=u(:,2);
         u(:,N)=u(:,N-1); 
       
       rho=rhos;
    
    end
    
    countiter=countiter +1;
    
    numero=numero+1;
    
    sig(countiter)=sigma;
    rhoplot(countiter)=rho;
    rhoploti(countiter)=dt*100*countiter;
    figure(1)
    plot(u(N/2,:),'r'),axis square
    hold on
    plot(fi(N/2,:)),grid
    
    hold off
    
    Run=[num2str(q) '.' num2str(iter) '-' num2str(rho)]
  
end

end
