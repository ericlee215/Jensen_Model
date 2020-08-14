function Jensen_Point(alpha, rnot, u, Turbine1, PosWind, Model)

    delta = PosWind - Turbine1

    x = delta[1]
    y = delta[2]
    z = delta[3]
    r = y*alpha + rnot

    d = sqrt(x^2 + z^2)

    dtheta = atand(d/y)
    
    Coef = (1 + cosd(9*dtheta))/2

    Loss = (2/3) * (rnot/r)^2

    thetahat = atand(alpha)

    if dtheta >= 20 

        WindSpeedCos = u 

    elseif y <= 0
        WindSpeedCos = u
    else

        WindSpeedCos = u * (1 - Coef*Loss)
    
    end
    if dtheta >= thetahat 

        WindSpeedTH = u 
    elseif y <= 0
        WindSpeedTH = u
    else
    
        WindSpeedTH = u * (1 - Loss)
    end

    if Model == "Cos"
        WindSpeed = WindSpeedCos
    elseif Model == "TH"
        WindSpeed = WindSpeedTH
    end

    return WindSpeed

end