# -*- coding: utf-8 -*-
"""
Created on Thu Sep 26 11:40:30 2019

@author: Owner
"""
import numpy as np
from Jensen_Point_Model import Jensen_Point

def Katic(Turbine1, rnot1, Turbine2, rnot2, PosWind,alpha,u):
    
    WS1 = Jensen_Point(alpha,rnot1,u,Turbine1,PosWind)
    WS2 = Jensen_Point(alpha,rnot2,u,Turbine2,PosWind)
    if WS1 == u and WS2 == u:
        WindSpeed = u
    elif WS1 != u and WS2 == u:
        WindSpeed = WS1
    elif WS1 == u and WS2 != u:
        WindSpeed = WS2
    else:
        WindSpeed = u * (1-((1 - WS1/u)**2 + (1-WS2/u)**2)) 
    
    return WindSpeed