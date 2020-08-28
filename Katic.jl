function Katic(TurbineN, rnot, PosWind, alpha, u, Model)
    
    n = length(TurbineN)/3
    n = Int(n)
    WSN = zeros(1,n)
     
    for i = 1:n

        WSN[i] = Jensen_Point(alpha,rnot,u,TurbineN[i,:],PosWind,Model)

    end


    if count(x->x==u,WSN) == n-1
        
        WS1 = minimum(WSN)
        
    elseif count(x->x==u,WSN) == n
        WS1 = u
        
    else
        tin = 0
        for i = 1:n
            if WSN[i] != u
                tin = ((1 - WSN[i]/u)^2)  + tin
            end
        end
        WS1 = u * (1 - sqrt(tin))
        

    end
    
    return WS1     
     
    
end