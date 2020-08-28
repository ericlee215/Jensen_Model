function Overlap(rnot, alpha, Tin, point)
    # Finds rotor area
    area = pi*rnot^2
    # Height of input matrix
    n = length(Tin)/3
    n = Int(n)
    # initializes input vector
    ovlp = 0
    
    dx = abs(Tin[1] - point[1])
    dy = abs(Tin[2] - point[2])
    # radius of wake at that point
    r1 = alpha*dy + rnot
    if dx >= r1+rnot
        ovlp = 0 # overlap is zero if circles don't touch
    elseif dx <= r1-rnot
        ovlp = 1 # overlap is one if rotor is entirely inside wake
    else
        # Calculates overlap
        d1 = (r1^2-rnot^2+dx^2)/(2*dx) 
        d2 = (dx-d1)
        ovlparea = r1^2*acos(d1/r1)-d1*sqrt(r1^2-d1^2)+rnot^2*acos(d2/rnot)-d2*sqrt(rnot^2-d2^2)
        # converts overlap to a percentage of the total area
        ovlp = ovlparea/area
    end
  
    # for i = 1:n
    #     # finds downwind and crosswind distances
    #     dx = abs(Tin[i,1] - point[1])
    #     dy = abs(Tin[i,2] - point[2])
    #     # radius of wake at that point
    #     r1 = alpha*dy + rnot
    #     if dx >= r1+rnot
    #         ovlp[i] = 0 # overlap is zero if circles don't touch
    #     elseif dx <= r1-rnot
    #         ovlp[i] = 1 # overlap is one if rotor is entirely inside wake
    #     else
    #         # Calculates overlap
    #         d1 = (r1^2-rnot^2+dx^2)/(2*dx) 
    #         d2 = (dx-d1)
    #         ovlparea = r1^2*acos(d1/r1)-d1*sqrt(r1^2-d1^2)+rnot^2*acos(d2/rnot)-d2*sqrt(rnot^2-d2^2)
    #         # converts overlap to a percentage of the total area
    #         ovlp[i] = ovlparea/area
    #     end

    # end
    return ovlp
end