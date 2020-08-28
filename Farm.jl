function go(size,rnot)
    space = 5.05*rnot
    Farm = zeros(size^2,2)
    n2 = 1
    n3 = 1
    for i = 1:size
        n=1
        for j = 1:size
            Farm[n3,1] = n
            Farm[n3,2] = n2
            n=n+space
            n3=n3+1
        end
        n2=n2-space
    end
    
    Farm = Farm[1:end .!= size^2-size+2,:]
    Farm = Farm[1:end .!= size^2-size+1,:]
    Farm = Farm[1:end .!= size^2-size,:]
    Farm = Farm[1:end .!= size^2-2*size+1,:]
    Farm = Farm[1:end .!= 2*size,:]
    Farm = Farm[1:end .!= size+1,:]
    Farm = Farm[1:end .!= size,:]
    Farm = Farm[1:end .!= size-1,:]
    Farm = Farm[3:end-2,:]
    return Farm
    #scatter(Farm[:,1],Farm[:,2])

end
