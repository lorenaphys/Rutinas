clear XX YY ZZ ci c hi ci

%colours2
nivel=0.0;
figure(5)
[A h]=contour(fi,[nivel nivel],'k');
hold on
[A0 h0]=contour(fiini,[nivel nivel],'r');
hold off
axis equal

n=size(h);
[s t]=find(A==nivel);
[q r]=size(A);
Y1=A(1,2:r);
X1=A(2,2:r);
[xx yy]=meshgrid(1:Nx,1:Ny);
[hi,ri,ci]=griddata(xx,yy,bet',X1,Y1);
% n0=size(h0);
% [s t0]=find(A0==nivel);
% [q r0]=size(A0);
% Y10=A0(1,2:r0);
% X10=A0(2,2:r0);
% [xx yy]=meshgrid(1:Nx,1:Ny);
% [hi0,ri0,ci0]=griddata(xx,yy,u',X10,Y10);
i=0;
[q r]=size(ri);


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
figure(4)
clf
hold on

p=surf(XX,YY,ZZ,c);
set(p,'FaceColor','interp','EdgeColor','none','Facealpha',0.5)
set(gca,'Projection','perspective')
axis([-Ny Ny -Ny Ny 0 Nx])
axis equal
%caxis([min(ci) max(ci)])
%caxis([0 max(ci)]);
axis off
view(10,15)
%camlight('right')
camlight(20,50,'infinite')
%set(gco,'style','local')
lightangle(70,-20)
lighting gouraud
%colorbar('location','southoutside')
colorbar
%plot3(hi-.5,zeros(size(hi)),ri,'k','linewidth',2)

%plot3(ri0,zeros(size(hi0)),hi0-.5,'r','linewidth',2);

hold off
% axis image
% axis vis3d
%axis equal