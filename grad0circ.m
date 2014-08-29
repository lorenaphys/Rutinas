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
%rhop=mrho;
%*******************************************
%         Contadores del programa
step=100;
iniciogenes=60;
Finaliter=10;
pent=iniciogenes;
%timecount=int8(Finaliter/radf);
%fotosgenes=int8((iniciogenes)*0.2);
%fotosgenes=25;
count=0;
countiter=0;
numer=0;
numero=0;
%**********************************************

%****************************************************************
%%  Condiciones iniciales para el campo fase
fiin=1;
fiout=-1


for i=1:N
  for j=1:N
       r=sqrt((i-.5*(N+1))^2+(j-.5*(N+1))^2);
       fi(i,j)=.5*(fiout-fiin)*tanh((r-rad)*0.8)+(fiout+fiin)*.8;
       %u(i,j)=(-0.3+0.3*tanh((r-rad)*0.1));
       fi1(i,j)=.5*(fiout-fiin)*tanh((r-radm)*.8)+(fiout+fiin)*.5;
       line(i,j)=-0.1;
       line1(i,j)=0.1; 
       %if fi(i,j)>=1
        % fi(i,j)=1;
       %end
  end
end



fi(1:20,:)=1;
fi(1:15,:)=-1;
fi1(1:20,:)=1;
fi1(1:15,:)=-1;
%% Condiciones iniciales para el campo u
%fi=1.0*(rand(N,N)-0.5);
u=0.0*(rand(N,N)-.5);
%figure(3)
%surf(u),axis square,shading flat, colorbar; 
%u=0.00*(rand(N,N)-.5);

%******************************************************************

%***************************************************************
u0=sign(u-.5);
fi0=sign(fi);
w=(fi0+1)/2;
a=ones(N,N);
b=a;
c=w;
%***************************************************************

%load 8
pa=-10.4;
pb=22.5;
pc=1/3.6;
%load 3

%% Dinamica del campo fase
for q=1:220


for iter=1:Finaliter
   
            
    count=count+1;
  
     
    %*************dynamic ********************
    for iiter=1:step
     
     
       esc=1.0;
       %*************************************
                    
        R1=s*(u+1).^2; %son los pozos del potencial u
        Ru1=s*2*(u+1);

        R2=s*(u-1).^2;
        Ru2=s*2*(u-1);  
        
      
        R=R1.*(1-b)+R2.*b;
        Ru=Ru1.*(1-b)+Ru2.*b;
      
        Fun=fi;
        delta2fun
        lapfi=lap;
        
        
       
        mu=(fi-ep1*C*(1+bet*u)).*(fi.^2-1)-ep*lapfi;
                

        Fun=mu;      
        delta2fun
        lapmu=lap;
       
        F=2*(3*fi.^2-1-2*ep1*C*fi.*(1+bet*u)).*mu-ep*lapmu+4*R.*fi.*(fi.^2-1);
   

        Fun=F;
        delta2fun
        lapF=lap;
        
        
        Fs=lapfi;
        Fun=Fs;
        delta2fun
        lapFs=lap;
    %*********************************************************************************** 

       Fun=u;
       delta2fun
       lapu=lap;
        
       G=Ru.*(fi.^2-1).^2-2*ep1*C*bet*mu.*(fi.^2-1)-D*lapu;
     
       
       Fun=G;
       delta2fun
       lapG=lap;
    %*******************************************************************************

       FFF=F-sigma*Fs;
       
       u=u+dt*lapG;
       
      
       
       fi=fi+dt*(lapF-sigma*lapFs);
            
 
   
        %************ sigma calculation ***********
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
        

       %Is=sum(sum(derifi.*(invrho*derilapFs)+derjfi.*(invrho*derjlapFs)));
        
        
        %sigma=-I/(Is); %(descomenter si se quiere que la tension se
        %autocalcule
        
        %********************************************************
        
       
       u(1,:)=u(2,:);
       u(N,:)=u(N-1,:);
       u(:,1)=u(:,2);
       u(:,N)=u(:,N-1); 
       
       rho=rhos;
    
    end
    
%% Para hacer figuras    
    %********************************************
    countiter=countiter +1;
   
    %if countiter == fotosgenes
     %  countiter=0;
       numero=numero+1;
        
   
        %figure(1)
        %mesh(qq),view(0,90)
        %qqmovie(numer)=getframe;
        
        %figure(2)
        %hold on
        %plot(fi(N/2,:)),grid, axis square
        %hold off
        %surf(fi),view(0,90)
        %fimovie(numer)=getframe;
        
        %figure(3)
        
        %mesh(u),view(0,90)
        %hold on
        %surf(fi), alpha(0.6),view(45,10),axis      square,axis off
        %surf(u,'facecolor','red'),alpha(0.4),view(0,1)
        %umovie(numer)=getframe;
        %fisurf(numero)=getframe; 
        %hold off
        %figure(2)
        %surf(u), alpha(0.4),axis([0 50 0 50 -1 1]),axis off,view(45,10)
        %mesh(u),view(0,90)
        %surf(u),  shading flat,axis square,ais off
        %usurf(numero)=getframe; 
        %figure(1)
        %plot(u(N/2,:),'r'), grid
        %hold on
        %plot(fi(N/2,:)),axis square 
        %hold off
        %fimovie(numer)=getframe; 
        
        
    %end
    %*********************************************
    
    sig(countiter)=sigma;
    rhoplot(countiter)=rho;
    rhoploti(countiter)=dt*100*countiter;
    figure(1)
    plot(u(N/2,:),'r'),axis square
    hold on
    plot(fi(N/2,:)),grid
    %hold off
    %plot(line(N/2,:),'g');
    %plot(line1(N/2,:),'y');
    %plot(a(N/2,:),'r.')
    %plot(b(N/2,:),'g+')
    %plot(c(N/2,:),'rd')
    %plot(w(N/2,:),'yo')
    hold off
    %uyf(numero)=getframe;
    %pause(.01)
    %figure(2)
    %surf(fi), view(0,90), colorbar, axis square 
    %-figure(3)
    %-plot(sig), grid
   
   Run=[num2str(q) '.' num2str(iter) '-' num2str(rho)]
  
end

%save([num2str(q)])

end
