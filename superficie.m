function superficie(H)

var = load(H);

clear XX YY ZZ ci c hi ci
Nx = 150;
Ny = 50;
nivel=0.0;

figure(1)
[A,~]=contour(var.fi,[nivel nivel],'k');
hold on
[~, ~]=contour(var.fiini,[nivel nivel],'r');
hold off
axis equal

[~, r]=size(A);
Y1=A(1,2:r);
X1=A(2,2:r);
[xx, yy]=meshgrid(1:Nx,1:Ny);
[hi,ri,ci]=griddata(xx,yy,var.bet',X1,Y1);
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
figure(2)
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