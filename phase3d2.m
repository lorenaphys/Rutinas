% Program to calculate phase fiels in 3 dimensions

clear all

et=1;
dx=1;
NF=300;
sig=0*(1:NF);
ep1=1;
ep=ep1^2;
sigma=2;
Nx=80;
Ny=80;
Nz=80;
Afi=1;
I=0;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% form of fi and initial values
%semielipreg;
%formas4cil
%exsemiesf
semiesf3D
%semielip2
%formaneg
%formapinching
%parabola
%cilinder4
%cilindersq2
%formas2
%formas3D
fiini=fi;
% bet=0*fi;
% ra=.5:Nx-.5;
% for i=1:Nx
%     for j=1:Ny
%         rr(i,j)=abs(ra(1,i));
%     end
% end
%%
figure(1)
clf
fi = smooth3(fi,'box',5);
isosurface(fi,0)
view(64,26),
axis equal
axis([1 Nx 1 Ny 1 Nz])
%%
step=300;
iter=1;
dt=1e-4;
cont=iter;
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bet=0*fi;
%%
[a bb]=min(abs(fi(Nx/2,Ny/2,:)));
R1=bb;

for i=1:Nx
    for j=1:Ny
        for k=1:Nz
            bet(i,j,k)=1+5*exp(-((i-Nx/2)^2+(j-Ny/2)^2+(k-R1+8)^2)/100);
            %  bet(i,j,k)=50*k/Nz;
            %bet(:,:,i)=-3*sin(10*pi*i/Nx-pi)^2+1;
            % % ee=10;
        end
    end
end
%bet=14-bet;

%load betu
%bet=10*u;
%bet(1:Nx,1:Ny)=3000*u(1:Nx,1:Ny);
%%


 %bet(fi<0)=0;
 figure(3)
 clf
 %cdata = smooth3((bet-min(min(min(bet))))./(max(max(max(bet)))-min(min(min(bet)))),'box',5);
 cdata=bet;
 %
 %      p3=patch(isosurface(bet,0));
 %      isonormals(bet,p3);
 %      isocolors(cdata,p3);
 %      hold
 [x,y,z] = meshgrid(1:1:Nx,1:1:Ny,1:1:Nz);
 xslice = Nx/2;yslice = [Ny/2]; zslice = [0,2];
 p3=slice(x,y,z,bet,xslice,yslice,zslice);
 set(p3,'FaceColor','interp','EdgeColor','none'),
 axis equal, view(-60,8)
 %pause(.01)
 fix0(:,:)=fi(Nx/2,:,:);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xf=linspace(1,Nx,Nx);
for i=1:length(xf)
    for j=1:length(xf)
yf(i,j)=((1/(Nx/4))*(sqrt((xf(i)-Nx/2)^2+(xf(j)-Ny/2)^2))).^2;
zf(i,j)=1*(2/(sqrt(3*Nx/4)*pi^0.25)) * exp(-yf(i,j)/2) .* (1-yf(i,j));

    end
end


%plot(rf)


%%
%load phase3d-2
for iter=cont:NF
    for iiter=1:step
        %%
        [a bb]=min(abs(fi(Nx/2,Ny/2,:)));
        R1=bb;
        
        for i=1:Nx
            for j=1:Ny
                for k=1:Nz

                    %bet(i,j,k)=10*exp(-(35-k)/15)*zf(i,j);
                    bet(i,j,k)=10*exp(-(35-k)/15)*exp(-((i-Nx/2)^2+(j-Ny/2)^2)/100);
                   
%                     bet(i,j,k)=1+3.5*exp(-((i-Nx/2)^2+(j-Ny/2)^2+(k-R1+8)^2)/200);
%                     if R1>15 & k<(R1-15)
%                     bet(i,j,k)=max(max(bet(:,:,R1)))*(-(R1-15)*.1)/k;
%                     end
                    %  bet(i,j,k)=50*k/Nz;
                    %bet(:,:,i)=-3*sin(10*pi*i/Nx-pi)^2+1;
                     % % ee=10;
                end
            end
        end
        
        %%
        %bet=14-bet;
        %bet(fi<=-.9);
        %load betu
        %bet=10*u;
        %bet(1:Nx,1:Ny)=3000*u(1:Nx,1:Ny);
        
        bet(fi<0)=0;
        bet=5*bet/(max(max(max(bet))));
%         figure(3)
%         clf

%         %
%         %      p3=patch(isosurface(bet,0));
%         %      isonormals(bet,p3);
%         %      isocolors(cdata,p3);
%         %      hold
%         [x,y,z] = meshgrid(1:1:Nx,1:1:Ny,1:1:Nz);
%         xslice = [Nx/2,Ny/2];yslice = Ny/2; zslice = [0,10];
%         p3=slice(x,y,z,bet,xslice,yslice,zslice);
%         set(p3,'FaceColor','interp','EdgeColor','none'),
%         axis equal, view(-88,8)
%         pause(.01)
%         fix0(:,:)=fi(Nx/2,:,:);
        %%
        
        
        
        
        H=fi;
        lap3D
        lapfi=lapH;
        
        
        
        mu=((fi-ep1.*bet).*((fi).^2-1)-ep*lapfi);
        
        H=mu;
        lap3D
        lapmu=lapH;
        
        
        F=Afi*((3*fi.^2-1-2*ep1*fi.*bet).*mu-ep*lapmu);
        
        
        
        H=F;
        lap3D
        lapF=lapH;
        
        
        Fs=-sigma*lapfi;
        
        
        H=Fs;
        lap3D
        lapFs=lapH;
        
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
        %         mesh
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
        
        %       fi=fi-dt*(F+Fs);
        %I=10*sum(sum(sum((fi>=0))))/Nx/Ny/Nz*(F);
        %II=I;
        I=I+((sum(sum(sum((fi>=0))))-I)/Nx/Ny/Nz);
        II=gradient(fi*I*dt);
        
        [stx,sty,stz]=gradient(mu);
        stx=-fi.*stx;
        sty=-fi.*sty;
        stz=-fi.*stz;
        
        
        fi=fi-dt*(F+Fs-II);
        %fi(:,:,1)=fiini(:,:,1);
    end
    
    %%
    sig(iter)=sigma;
    
    h=isnan(fi(Nx/2,Ny/2,Nz/2));
    if h==1;
        break
    end
    sigma;
    
    
    
    iter
    %%
    figure(5)
    argbet(1:Nz)=bet(Nx/2,Ny/2,1:Nz);
    plot(argbet)

    %%
    
    figure(2)
    clf
    cdata = smooth3((bet-min(min(min(bet))))./(max(max(max(bet)))-min(min(min(bet)))),'box',5);
    %cdata=bet;
    fi = smooth3(fi,'box',5);
    p4=patch(isosurface(fi,0));
    isonormals(fi,p4);
    isocolors(cdata,p4);
    set(p4,'FaceColor','interp','EdgeColor','none'),
    camlight, lighting phong
    axis equal, view(-88,-4), axis off
    
    %[X,Y,Z]=meshgrid(1:Nx,1:Ny,1:Nz);
    %fi = smooth3(fi,'box',5);
    %p1=isosurface(fi,0);
    % p1 = patch(isosurface(bet,.5));%,'FaceColor','blue','EdgeColor','none');
    % %p2 = patch(isocaps(fi,0),'FaceColor','interp','EdgeColor','none');
    % isonormals(bet,p1)
    % isocolors(bet,cdata,p3);
    % %set(p1,'FaceColor','interp','EdgeColor','none')
    % view(64,26),
    % camlight, lighting phong
    % axis equal
    % axis([1 Nx 1 Ny 1 Nz])
    %
    M=getframe(gcf);
    MN(iter)=M;
    %pause(.01)
    %      M(:,:,iter)=getframe;
    %     Fm(:,:,:,iter)=fi(:,:,:);
    %U(:,:,iter)=bet(:,:);
    %%
    figure(3)
    fix(:,:)=fi(Nx/2,:,:);
    contour(fix,[0 0],'k')
    hold on
    contour(fix0,[0 0],'r')
    hold off
    M1=getframe(gcf);
    MN1(iter)=M1;
    
    %%
    figure(4)
clf
%cdata = smooth3((bet-min(min(min(bet))))./(max(max(max(bet)))-min(min(min(bet)))),'box',5);
%
%      p3=patch(isosurface(bet,0));
%      isonormals(bet,p3);
%      isocolors(cdata,p3);
%      hold
[x,y,z] = meshgrid(1:1:Nx,1:1:Ny,1:1:Nz);
xslice = Nx/2;yslice = []; zslice = [1];
p3=slice(x,y,z,bet,xslice,yslice,zslice);
set(p3,'FaceColor','interp','EdgeColor','none'),
axis equal, view(90,0)
xs = Nx/2;ys = []; zs = [];
    streamslice(x,y,z,stx,sty,stz,xs,ys,zs,'arrowsmode')
    M2=getframe(gcf);
    MN2(iter)=M2;
%     %%
%     figure(6)
%     clf
%     xs = Nx/2;ys = []; zs = [R1-5];
%     streamslice(x,y,z,stx,sty,stz,xs,ys,zs,'arrowsmode')
%     
end
