function [no_rounds] = simulate_network(start_a, start_b, eps)
    prev_a = start_a; prev_b = start_b;
    no_rounds = 0;
    while 1
        no_rounds = no_rounds + 1;
        if ( prev_a + prev_b ) > 100
            a = prev_a / 2;
            b = prev_b / 2;
        else
            a = prev_a + 2;
            b = prev_b + 2;
        end
        if ((abs(a-50) + abs(b-50)) < eps )
            break;
        else
            prev_a = a;
            prev_b = b;
        end        
    end
end