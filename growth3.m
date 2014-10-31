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
sifiu=0.;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Afi=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% form of fi and initial values
%semielipreg;
%formas4cil
%exsemicirc
semiesf
%semielip2
%formaneg
%formapinching
%parabola
%cilinder4
%cilindersq2
%fi=-fi;
fiini=fi;
bet=0*fi;
ra=.5:Nx-.5;
for i=1:Nx
    for j=1:Ny
        rr(i,j)=abs(ra(1,i));
    end
end



%load Marzo15-1-2013
%sifiu=.5
iter=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
grafs
step=500;
%NF=20;
dt=1e-4;
cont=iter;
%%
for iter=cont:NF
    for iiter=1:step
        
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
u=u+sifiu*lapfi;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

        mu=((fi-ep1*u).*((fi).^2-1)-ep*lapfi);
        
        H=mu;
        lap0
        lapmu=lapH;
        H=mu;
        grad0p
        lapmu=lapmu+g0H./rr;
        
        F=Afi*((3*fi.^2-1-2*ep1*fi.*u).*mu-ep*lapmu);
        

        
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
 %% seccion para el parametro de lagrange
%         H=lapF;
%         grad0circ
%         derilapF=g0iH;
%         derjlapF=g0jH;
%         
%         H=lapFs;
%         grad0circ
%         derilapFs=g0iH;
%         derjlapFs=g0jH;
%         
%         H=fi;
%         grad0circ
%         derifi=g0iH;
%         derjfi=g0jH;
% 
%         
%         I=sum(sum(derifi.*derilapF.*rr+derjfi.*derjlapF.*rr));
%         Is=sum(sum(derifi.*derilapFs.*rr+derjfi.*derjlapFs.*rr));
%         
%          sigma=I/Is;

% 
% %         sigma=15.9;
%               
% %%        

 %       fi=fi+dt*(lapF+lapFs);
 
        H=u;
        lap0
        lapu=lapH;
        H=u;
        grad0p
        lapu=lapu+g0H./rr;
        Fw=sifiu*(lapu);
        

        fi=fi-dt*(F+Fs+Fw);
fi(1,:)=fiini(1,:);


    end
  
       
sig(iter)=sigma;

    h=isnan(fi(Nx/2,Ny/2));
    if h==1;
      break
    end
    sigma  
    

    %%
%     figure(1)
% 
% %     plot(u1,0,'or')
% %     pause(.01)
% %     hold on;
% %     plot(u2,0,'og')
% %     pause(.01)
% %     
% %     plot(uout,1,'ok') 
% %     pause(.01)
% %     plot(u0,-1,'xk') 
%      
% %    pause(.01)
%      plot(ci,(1:length(ci)),'r')
%      pause(.01)
%      line([sum(ci)/length(ci) sum(ci)/length(ci) ],[0 length(ci)]) 
%      axis([0 1.2 0 length(ci)])
%     grid
%     hold off;
    %%
    iter
%%    
 
     figure(2)
%    % colours2
% %     
% %     if max(max(vv))==.2 
     mesh(fi), view(80,20)
% %     pause(.01)
% %     else
% 
%    surf(u);
%    %set(gcf,'Renderer','zbuffer')
%     shading interp
%     %view(2)
%     %axis equal, axis off
%     %caxis ([0 1])
%     %axis([1 Ny 1 Nx])
     pause(.01)
    %end
    
%%
figure(3)
plot(sig)
    
%%    
figure(4)
grafs
pause(.01)
     M(:,:,iter)=getframe;
    Fm(:,:,iter)=fi(:,:);
 %   U(:,:,iter)=u(:,:);
%%
    
end

