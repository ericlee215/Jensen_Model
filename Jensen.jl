function Jensen_Point(alpha, rnot, u, Turbine1, PosWind, Model)

    # finds coordinates relative to each other
    delta = Turbine1 - PosWind  
    x = delta[1]
    y = delta[2]
    z = delta[3]

    #Calculates Overlap
    ovlp = Overlap(rnot, alpha, Turbine1, PosWind)

    # calculates wake radius
    r = y*alpha + rnot

    d = sqrt(x^2 + z^2)  # finds distance between center rotor and wake

    dtheta = atand(d/y)  # finds the angle between rotors
    
    Coef = (1 + cosd(9*dtheta))/2  # finds the coeficient of the loss of the cosine method

    Loss = (2/3) * (rnot/r)^2   # finds the speed loss of the wind

    thetahat = atand(alpha)  # finds the angle where the wake reaches

    if dtheta >= 20 

        WindSpeedCos = u   # if the turbine is outside of the wake the wind speed is free stream

    elseif y <= 0
        WindSpeedCos = u  # if tubine is upwind wind speed is free stream
    else

        WindSpeedCos = u * (1 - Coef*Loss)   # calculates cosine method for all turbines in wake
    
    end

    if y <= 0
        WindSpeedTH = u  # if tubine is upwind wind speed is free stream
    else
    
        WindSpeedTH = u * (1 - ovlp*Loss)  # calculates Top Hat method for all turbines in wake
    end

    # returns the desired wind speed corresponding with method selected

    if Model == "Cos"
        WindSpeed = WindSpeedCos  
    elseif Model == "TH"
        WindSpeed = WindSpeedTH
    end

    return WindSpeed

end