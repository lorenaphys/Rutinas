N = 401;
% Nx = 150;
% Ny = 50;
nivel=0.0;
    
k = struct('cdata',[],'colormap',[]);

for t = 1:N
    
    clear {XX YY ZZ ci c hi ci}
    
    load(['iter' num2str(t)])

    clf 
    a = max(u(1:4));
    contour(fi,[nivel nivel],'k','LineWidth',2);
    hold on
    contour(fiini,[nivel nivel],'r','LineWidth',2);
    contour(u,[a a],'b');
    hold off
    axis equal
    axis([-10 30 0 30])
    grid on
    k(t) = getframe(gcf);
    disp(t)
   
end 

movie2avi(k,'contorno1','fps',50,'compression','none')