function rotation_matrix(theta,Farm)
    
    n = length(Farm)/3
    n = Int(n)
    theta = deg2rad(theta)
    axis = [0,0,20]
    axis = axis/sqrt(dot(axis,axis))
    a = cos(theta/2)
    b, c, d = -axis * sin(theta/2)
    aa, bb, cc, dd = a^2, b^2, c^2, d^2
    bc, ad, ac, ab, bd, cd = b * c, a * d, a * c, a * b, b * d, c * d
    rm = [(aa + bb - cc - dd) (2 * (bc + ad)) (2 * (bd - ac));
    (2 * (bc - ad)) (aa + cc - bb - dd) (2 * (cd + ab));
    (2 * (bd + ac)) (2 * (cd - ab)) (aa + dd - bb - cc)]

    for j = 1:n
        Farmn[j,:] = [dot(rm[1,:],Farm[j,:]) dot(rm[2,:],Farm[j,:]) dot(rm[3,:],Farm[j,:])]
    end
    return Farmn
end