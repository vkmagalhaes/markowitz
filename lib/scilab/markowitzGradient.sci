function r = cov(m)
    r = m' * m / (size(m,1) - 1)
endfunction

mi= fscanfMat("/home/vinicius/Projetos/pnl/lib/scilab/assets_expret_vector.txt")
covMatrix = cov(fscanfMat("/home/vinicius/Projetos/pnl/lib/scilab/historical_quotations_matrix.txt"))
function y = markowitzMeanVariance(w)
    y = w' * covMatrix * w * 0.5 - w' * mi * 0.5 + (sum(w) - 1)^2
endfunction

function y = markowitzMeanVarianceGra(w)
    [nr, nc] = size(w)
    y = covMatrix * w - mi * 0.5 + 2 * (sum(w) - 1) * ones(nr, 1)
endfunction

function y = markowitzMeanVarianceHes(w)
    [nr, nc] = size(w)
    y = covMatrix + 2 * ones(nr, nr)
endfunction

function [xk, k] = markowitzGradient(x0, e)
    xk = x0
    k = 0
    while 1 do
        gradFk = markowitzMeanVarianceGra(xk)
        n = norm(gradFk)
        printf("k:%d, norm(gradFk):%f\n", k, n)
        
        if n < e then 
            break 
        end
        
        dk = -gradFk
        lk = - (dk' * gradFk) / (dk' * markowitzMeanVarianceHes(xk) * dk)
        
        xk = xk + lk * dk
        k = k + 1
    end
    
endfunction

function [xk, k] = markowitzNewton(x0, e)
    xk = x0
    k = 0
    while 1 do
        gradFk = markowitzMeanVarianceGra(xk)
        
        n = norm(gradFk)
        printf("k:%d, norm(gradFk):%f\n", k, n)
        
        if n < e then 
            break 
        end
        
        hessF = markowitzMeanVarianceHes(xk)
        s = linsolve(hessF, gradFk)
        xk = xk + s
        k = k + 1
    end
    
endfunction

function [xk1, k] = markowitzBroyden(x0, B0, e)
    xk = x0
    xk1 = x0
    gradFk = markowitzMeanVarianceGra(xk)
    gradFk1 = gradFk
    tk = linsolve(B0, gradFk)
    k = 1
    w = []
    z = []
    while 1 do
        sk = tk
        // lamdak = - (sk' * gradFk) / (sk' * markowitzMeanVarianceHes(xk) * sk)
        xk = xk1
        xk1 = xk1 + sk
        gradFk = gradFk1
        gradFk1 = markowitzMeanVarianceGra(xk1)
        
        n = norm(gradFk1)
        printf("k:%d, norm(gradFk):%f\n", k, n)
        
        if n < e then 
            break 
        end
        
        yk = gradFk1 - gradFk
        
        w(k,:) = sk
        
        lx = linsolve(B0, gradFk1)
        j = 1
        while j < k do
            lk = lk + z(j,:)' * w(j,:) * lk
        end
        rk = lk + tk
        z(k,:) = (sk - rk) / (w(j,:) * rk)
        
        tk = -lk
        tk = tk + z(k,:)' * w(k,:) * tk
    end
    
endfunction

function [xk1, k] = markowitzSR1(x0, B0, e)
    xk = x0
    xk1 = x0
    gradFk = markowitzMeanVarianceGra(xk)
    gradFk1 = gradFk
    tk = linsolve(B0, gradFk)
    k = 1
    w = []
    z = []
    while 1 do
        sk = tk
        // lamdak = - (sk' * gradFk) / (sk' * markowitzMeanVarianceHes(xk) * sk)
        xk = xk1
        xk1 = xk1 + sk
        gradFk = gradFk1
        gradFk1 = markowitzMeanVarianceGra(xk1)
        
        n = norm(gradFk1)
        printf("k:%d, norm(gradFk):%f\n", k, n)
        
        if n < e then 
            break 
        end
        
        yk = gradFk1 - gradFk
        
        w(k,:) = yk - Bk * sk
        
        lx = linsolve(B0, gradFk1)
        j = 1
        while j < k do
            lk = lk + z(j,:)' * w(j,:) * lk
        end
        rk = lk + tk
        z(k,:) = (sk - rk) / (w(j,:) * rk)
        
        tk = -lk
        tk = tk + z(k,:)' * w(k,:) * tk
    end
    
endfunction