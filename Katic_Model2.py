# -*- coding: utf-8 -*-
"""
Created on Thu Sep 26 11:40:30 2019

@author: Owner
"""
import numpy as np
from Jensen_Point_Model import Jensen_Point
#from Tester import rotation_matrix as rm

def Katic(TurbineN, rnot, PosWind,alpha,u):
    TurbineN, PosWind = np.asarray(TurbineN), np.asarray(PosWind)
    n = len(TurbineN)
    WSN = np.zeros([n,2])
    
    

    for i in range(n):
        
        WSN[i,:] = Jensen_Point(alpha,rnot,u,TurbineN[i,:],PosWind)
    
    
    WSNT = WSN[:,0]
    WSNC = WSN[:,1]
    

        
    if sum(WSNT == u) == n-1:
        
        WS1 = WSNT[WSNT.argmin()]
        
    elif sum(WSNT == u) == n:
        WS1 = u
        
    else:
        tin =0
        for i in range(n):
            tin = (1 - WSNT[i]/u)**2  + tin
            
        WS1 = u * (1 - np.sqrt(tin))
        
     
    if sum(WSNC == u) == n-1:
        
        WS2 = WSNC[WSNC.argmin()]
        
    elif sum(WSNC == u) == n:
        WS2 = u
        
    else:
        tin = 0
        for i in range(n):
            tin = (1 - WSNC[i]/u)**2  + tin
        WS2 = u * (1 - np.sqrt(tin))
        
    WindSpeed = np.array([WS1,WS2])
    
    return WindSpeed