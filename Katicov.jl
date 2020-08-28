function Katicov(TurbineN, rnot, PosWind, alpha, u, Model)
    
    n = length(TurbineN)/3
    n = Int(n)
    WSN = zeros(1,n)
    ovlp = Overlap(rnot, alpha, TurbineN, PosWind) 
    z = 20
    for i = 1:n
        if ovlp[i] == 0
            WSN[i] = u
        else
            x = PosWind[1]
            y = TurbineN[i,2]
            WSN[i] = Jensen_Point(alpha,rnot,u,[x,y,z],PosWind,Model)
        end
    end

    if count(x->x==u,WSN) == n-1
        
        WS1 = minimum(WSN)
        
    elseif count(x->x==u,WSN) == n
        WS1 = u
        
    else
        tin = 0
        for i = 1:n
            if WSN[i] != u
                tin = (u - (WSN[i]))^2  + tin
            end
        end
        WS1 = u * (1 - sqrt(tin))
        

    end
    return WS1
end