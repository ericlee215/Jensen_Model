# -*- coding: utf-8 -*-
"""
Created on Sat Oct 12 13:10:16 2019

@author: Eric Lee
"""

import numpy as np



def Jensen_Point(alpha,rnot,u,Turbine1,PosWind):
    
    delta = PosWind - Turbine1 
    x = delta[0]
    y = delta[1]
    z = delta[2]
    r = z*alpha + rnot
    d = np.sqrt(x**2 + y**2)
    dtheta = np.arctan(d/z)      #finds the angle
    coef = (1 + np.cos(9*dtheta))/2      #determines distance effect
    Loss = (2/3) * (rnot/r)**2
    
    if dtheta >= 20 or z < 0:
        
        WindSpeedCos = u
        
    else:
        
        WindSpeedCos = u * (1 - coef * Loss)   #Calculates using Cosine Model
        
    if d > r or z < 0:
        
        WindSpeedTH = u
        
    else:
        
        WindSpeedTH = u *(1 - Loss)   #Calculates using TopHat method
        
    WindSpeed = np.array([WindSpeedTH, WindSpeedCos])

    
    return WindSpeed     #Returns a vector with the theoretical wind speed using both Models, tophat then Cosine
