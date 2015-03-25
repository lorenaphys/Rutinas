clear all

et = 1;
%dx = 1;
NF = 4;
%sig=0*(1:NF);
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
%sifiu=0.;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% form of fi and initial values
%semielipreg;
%formas4cil
%exsemicirc
%semiesf
%semielip2
%formaneg
%formapinching
%parabola
%cilinder4
%cilindersq2
%fi=-fi;

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


%load Marzo15-1-2013
%sifiu=.5
iter=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
grafs
step=5;
%NF=20;
dt=1e-4;
%cont=iter;
%%

[stat,struc] = fileattrib;
PathCurrent = struc.Name;

FolderName = 'phiDynA';   
PathFolder = [PathCurrent '/Resultados/' FolderName];
[status,message,messageid] = mkdir([PathCurrent '/Resultados'], FolderName);
save([PathFolder ['/iter' num2str(iter)]]);

for iter=1:NF
    for iiter=1:step
        
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %H=fi;
        %lap0
        %lapfi=lapH;
        %H=fi;
        %grad0p;
        %lapfi=lapfi+g0H./rr;
        
        lapfi = lap0(fi) + grad0p(fi)./rr;
       
        
       [a bb]=min(abs(fi(:,1)));
       Ri=bb;
for i=1:Nx
    for j=1:Ny
u(i,j)=or+ro*exp(-((j)^2+(i-Ri+4)^2)/30);
    end
end 
%u=u+sifiu*lapfi;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%         H=u;
%         lap0
%         lapu=lapH;
%         H=u;
%         grad0p
%         lapu=lapu+g0H./rr;

        lapu = lap0(u) + grad0p(u)./rr;
        
        mu=(fi-ep1*u).*((fi).^2-1)-ep*lapfi;
        
%         H=mu;
%         lap0
%         lapmu=lapH;
%         H=mu;
%         grad0p
%         lapmu=lapmu+g0H./rr;

        lapmu = lap0(mu) + grad0p(mu)./rr;
        
        F=Afi*(2*(3*fi.^2-1-2*ep1*fi.*u).*mu-ep*lapmu)+gamma*lapu;
        

        
        %%H=F;
        %lap0
        %lapF=lapH;
        %H=F;

       %grad0p
        %lapF=lapF+g0H./rr;
        
        
        Fs=-sigma*lapfi;

        
        %H=Fs;
        %lap0
        %lapFs=lapH;
        %H=Fs;
        %grad0p
        %lapFs=lapFs+g0H./rr;
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
 % Correspondencia con el modelo de Allen-Cahn
        %H=u;
        %lap0
        %lapu=lapH;
        %H=u;
        %grad0p
        %lapu=lapu+g0H./rr;
        %Fw=sifiu*(lapu);
        

        fi=fi-dt*(F+Fs);%quite la suma de Fw
        % correspondencia con el modelo de Cahn-Hilliard
fi(1,:)=fiini(1,:);


    end
    
FolderName = 'phiDynA';   
PathFolder = [PathCurrent '/Resultados/' FolderName];
[status,message,messageid] = mkdir([PathCurrent '/Resultados'], FolderName);
save([PathFolder ['/iter' num2str(iter+1)]]);
       
%sig(iter)=sigma;

    h=isnan(fi(Nx/2,Ny/2));
    if h==1;
      break
    end
    %sigma  
    

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
    disp(iter)
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
     %pause(.01)
    %end
    
%%
%figure(3)
%plot(sig)
    
%%    
figure(4)
grafs
%pause(.01)
%       M(:,:,iter)=getframe;
%      Fm(:,:,iter)=fi(:,:);
 %   U(:,:,iter)=u(:,:);
%%
    
end

