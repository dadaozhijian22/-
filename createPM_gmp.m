% calculate the general memory polynomial value matrix of system input 射频功放基带的GMP模型
% x -- input signals of system input
% Nl_order -- nonlinear order 3~7
% M_deepth -- memory deepth 3~7

% PM -- polynomial value matrix
function PM = createPM_gmp( x,  Nl_order, M_deepth )
x_order1 = zeros( length(x), M_deepth );
for i = 1:M_deepth
   x_order1(i:end, i) = x(1:end+1-i);
end
x_order1 = x_order1(M_deepth:end, :);
U = x_order1;
x_orderi = 1;
% for i = 3:2:Nl_order
%     x_orderi = x_orderi.*conj(x_order1).*x_order1;
%     for j = 1:M_deepth
%         for k = 1:M_deepth
%             temp = x_order1(:, j).*x_orderi(:, k);
%             U = [ U temp ];
%         end
%     end
% end
for i = 2:1:Nl_order
    x_orderi = x_orderi.*abs(x_order1);
    for j = 1:M_deepth
        for k = 1:M_deepth
            temp = x_order1(:, j).*x_orderi(:, k);
            U = [ U temp ];
        end
    end
end
PM = U;