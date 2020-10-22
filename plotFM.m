function plotFM(x)
        theta = (2 * pi) / 100;
        a1 = x(1);
        w1 = x(2);
        a2 = x(3);
        w2 = x(4);
        a3 = x(5);
        w3 = x(6);
        %t = -2*pi:0.001:2*pi
        t = -10:0.1:10;
        y = a1 * sin(w1 * t * theta + a2 * sin(w2 * t * theta + a3 * sin(w3 * t * theta)));
        %x = [1.0,5.0,1.5,4.8,2.0,4.9];
        %yn = 1.0 * sin((5.0 * t * theta + 1.5 * sin((4.8 * t * theta + 2.0 * sin((4.9 * t * theta))))));
        %xx = [0.974 -0.241 -4.3160 -0.0193 -0.5701 4.937] ;
        %yfdo = xx(1) * sin(xx(2) * t * theta + xx(3) * sin(xx(4) * t * theta + xx(5) * sin(xx(6) * t * theta)));
        %plot(t,yn)
        %hold on
        %plot(t,yfdo)
        %yn = sin(t)
        plot(t,y)
        %hold off
end

