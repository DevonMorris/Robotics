A = rand(5, 5);
n = 12;
expAn = exp_mat(A, n)
expA = expm(A)

function expA = exp_mat(A,n)
    expA = eye(size(A));
    for i = 1:n
        expA = expA + (A^i)/factorial(i);
    end
end
