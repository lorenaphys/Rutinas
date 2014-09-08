% Program to calculate phase fiels in 3 dimensions

clear all


%%Programa para ver la visualizacion del programa phase3d1



for iter=1:120 
   %% 
    load(['zdatas-' numstr(iter)]);
    iter
 
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
