Z = peaks;
figure('Renderer','zbuffer');
surf(Z);
axis tight manual;
F = struct('cdata',[],'colormap',[]);
set(gca,'NextPlot','replaceChildren');
for j = 1:20
    surf(sin(2*pi*j/20)*Z,Z)
    F(j) = getframe;
end
movie(F,2) % Play the movie twenty times