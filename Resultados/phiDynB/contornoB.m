N = 401;
Nx = 150;
Ny = 50;
nivel=0.0;
    
k = struct('cdata',[],'colormap',[]);

for t = 1:N
    
    clear {XX YY ZZ ci c hi ci}
    
    load(['iter' num2str(t)])

    clf 
    contour(fi,[nivel nivel],'k','LineWidth',2);
    hold on
    contour(fiini,[nivel nivel],'r','LineWidth',2);
    hold off
    axis equal
    axis([-5 30 0 30])
    grid on
    k(t) = getframe(gcf);
    disp(t)
   
end 

movie2avi(k,'contornoB','fps',50,'compression','none')