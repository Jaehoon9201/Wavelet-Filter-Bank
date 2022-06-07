function [ADCval, P_, K_] = SimpleKalman(z)

    persistent A H R Q
    persistent x P
    persistent firstRun

    if isempty(firstRun)
        A = 1;
        H = 1;

        Q = 0;
        R = 4; 
        
        x = 14;
        P = 6;

        firstRun = 1;
    end

    xp = A*x;
    Pp = A*P*A'+Q;
    
    K = Pp*H'*inv(H*Pp*H'+R);

    x = xp+ K*(z-H*xp);
    P = Pp-K*H*Pp;

    ADCval = x;
    K_ = K;
    P_ = P;