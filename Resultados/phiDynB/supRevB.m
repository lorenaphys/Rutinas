N = 401;
Nx = 150;
Ny = 50;
nivel=0.0;
    
k = struct('cdata',[],'colormap',[]);

for t = 1:N
    clear {XX YY ZZ ci c hi ci}
    
    load(['iter' num2str(t)])
    
    [A,~]=contour(fi,[nivel nivel],'k');
    
    [~, r]=size(A);
    Y1=A(1,2:r);
    X1=A(2,2:r);
    [xx, yy]=meshgrid(1:Nx,1:Ny);
    [hi,ri,ci]=griddata(xx,yy,bet',X1,Y1);
    i=0;
    [~, r]=size(ri);

    XX = zeros(100,r);
    YY = zeros(100,r);
    ZZ = zeros(100,r);
    c = zeros(100,r);
    for j=1:r
        
        for tet=0:pi/50:2*pi
            i=i+1;
        
            XX(i,j)=(ri(j))*cos(tet);
            YY(i,j)=(ri(j))*sin(tet);
            ZZ(i,j)=hi(j);
            c(i,j)=ci(j);
        end
        i=0;
    end
    
    figure(1)
    clf
    hold on

    p=surf(XX,YY,ZZ,c);
    set(p,'FaceColor','interp','EdgeColor','none','Facealpha',0.5)
    set(gca,'Projection','perspective')
    axis([-Ny Ny -Ny Ny 0 Nx])
    axis equal
    axis off
    view(10,15)
    camlight(20,50,'infinite')
    lightangle(70,-20)
    lighting gouraud
    colorbar

    hold off
    
    k(t) = getframe(gcf);
    disp(t)
end

movie2avi(k,'supRevB','fps',25,'compression','none')