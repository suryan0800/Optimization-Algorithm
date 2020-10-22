function f = fm(x)
        f = 0.0;
        theta = (2 * pi) / 100;
        a1 = x(1);
        w1 = x(2);
        a2 = x(3);
        w2 = x(4);
        a3 = x(5);
        w3 = x(6);

        for i = 1: length(x)
            x1 = x(i);
            if (x1 > 6.3) 
                x(i) = 6.3 * rand;
            elseif (x1 < -6.4) 
                x(i) =  -6.4 * rand;
            end
            
        end 

        for t = 0:99
            y = a1 * sin(w1 * t * theta + a2 * sin(w2 * t * theta + a3 * sin(w3 * t * theta)));
            yn = 1.0 * sin(5.0 * t * theta + 1.5 * sin(4.8 * t * theta + 2.0 * sin(4.9 * t * theta)));
            f = f + (y - yn)^ 2;
        end
end

        